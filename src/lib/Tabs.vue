<template>
  <div class="chen-tabs">
    <div class="chen-tabs-nav" ref="container">
      <div
        class="chen-tabs-nav-item"
        v-for="(t, index) in titles"
        :key="index"
        :class="{ selected: t === selected }"
        @click="select(t)"
        :ref="
          (el) => {
            if (t === selected) {
              selectedItem = el;
            }
          }
        "
      >
        {{ t }}
      </div>
      <div class="chen-tabs-nav-indicator" ref="indicator" />
    </div>
    <div class="chen-tabs-content">
      <component :is="current" :key="current.props.title" />
    </div>
  </div>
</template>

<script lang="ts">
import { onMounted, ref, computed, onUpdated, watchEffect } from "vue";
import Tab from "./Tab.vue";
export default {
  props: {
    selected: {
      type: String,
    },
  },
  setup(props, context) {
    const selectedItem = ref<HTMLDivElement>(null);
    const indicator = ref<HTMLDivElement>(null);
    const container = ref<HTMLDivElement>(null);
    const x = () => {
      const { width } = selectedItem.value.getBoundingClientRect();
      indicator.value.style.width = width + "px";
      const { left: left1 } = container.value.getBoundingClientRect();
      const { left: left2 } = selectedItem.value.getBoundingClientRect();
      const left = left2 - left1;
      indicator.value.style.left = left + "px";
    };
    onMounted(x);
    onUpdated(x);

    const defaults = context.slots.default();
    defaults.forEach((tag) => {
      //@ts-ignore
      if (tag.type.name !== Tab.name) {
        throw new Error("Tabs 子标签必须是Tab");
      }
    });
    const titles = defaults.map((tag) => {
      return tag.props.title;
    });
    const select = (title: string) => {
      context.emit("update:selected", title);
    };
    const current = computed(() => {
      return defaults.find((tag) => tag.props.title === props.selected);
    });
    return {
      defaults,
      titles,
      select,
      indicator,
      container,
      selectedItem,
      current,
    };
  },
};
</script>

<style lang="scss">
$blue: #40a9ff;
$color: #333;
$border-color: #d9d9d9;

.chen-tabs {
  &-nav {
    display: flex;
    color: $color;
    border-bottom: 1px solid $border-color;
    position: relative;

    &-item {
      padding: 8px 0;
      margin: 0 16px;
      cursor: pointer;

      &:first-child {
        margin-left: 0;
      }

      &.selected {
        color: $blue;
      }
    }

    &-indicator {
      position: absolute;
      height: 3px;
      background: $blue;
      left: 0;
      bottom: -1px;
      width: 100px;
      transition: all 250ms;
    }
  }

  &-content {
    padding: 8px 0;
  }
}
</style>
