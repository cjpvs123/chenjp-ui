<template>
<div>
    <router-view />
</div>
</template>

<script lang="ts">
import {
    provide,
    reactive,
    ref
} from 'vue';
import {
    router
} from './router';
export default {
    name: "App",
    setup(props) {
        const width = document.documentElement.clientWidth
        const menuVisible = ref(width <= 500 ? false : true)
        provide('menuVisible', menuVisible)
        router.afterEach(() => {
            if (width <= 500) {
                menuVisible.value = false
            }
        })

    },

};
</script>

<style lang="scss" scoped>
  
</style>
