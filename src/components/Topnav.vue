<template>
<div>
    <div class="topnav">
        <router-link to="/" class="logo"><svg class="icon">
                <use xlink:href="#icon-king"></use>
            </svg></router-link>
        <ul class="menu">
            <li>菜单1</li>
            <li>菜单2</li>
        </ul>
        <svg class="icon toggleAside" @click="toggleMenu" v-if="toggleMenuButtonVisible">
            <use xlink:href="#icon-menu-p"></use>
        </svg>
    </div>
</div>
</template>

<script lang="ts">
import {
    inject,
    Ref
} from 'vue'
export default {
    props: {
        toggleMenuButtonVisible: {
            type: Boolean,
            default: false
        }
    },
    setup(props) {
        const menuVisible = inject < Ref < boolean >> ('menuVisible')
        const toggleMenu = () => {
            menuVisible.value = !menuVisible.value
        }
        return {
            toggleMenu
        }
    }
}
</script>

<style lang="scss" scoped>
$color: #007974;

.topnav {
    color: $color;
    display: flex;
    padding: 16px;
    z-index: 20;
    justify-content: center;
    align-items: center;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;

    >.logo {
        max-width: 6em;
        margin-right: auto;

        >svg {
            width: 32px;
            height: 32px;
        }
    }

    >.menu {
        display: flex;
        white-space: nowrap;
        flex-wrap: nowrap;

        >li {
            margin: 0 1em;
        }

    }

    >.toggleAside {
        width: 32px;
        height: 32px;
        position: absolute;
        left: 16px;
        top: 50%;
        transform: translateY(-50%);
        display: none;
        background: fade-out(black, 0.9);
    }

    @media (max-width: 500px) {
        >.menu {
            display: none;
        }

        >.logo {
            margin: 0 auto;
        }

        >.toggleAside {
            display: inline-block;
        }
    }
}
</style>
