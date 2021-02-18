<template>
<div>
    <h1>Switch 组件示例 </h1>
    <Demo :component="Switchdemo1" />
    <Demo :component="Switchdemo2" />
    <hr>
</div>
</template>

<script lang="ts">
import Switchdemo1 from './Switch1demo.vue'
import Switchdemo2 from './Switch2demo.vue'
import Demo from './Demo.vue'
export default {
    components: {
        Demo
    },
    setup(props) {
        return {
            Switchdemo1,
            Switchdemo2,
        }
    }
}
</script>
