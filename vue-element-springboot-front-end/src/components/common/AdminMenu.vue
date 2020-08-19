<template>
  <transition name="el-fade-in">
    <el-menu
      :default-active="currentPath"
      class="el-menu-vertical"
      router
      model="vertical"
      background-color="#242f42"
      text-color="#fff"
      active-text-color="#ffd04b"
      :collapse="isCollpase"
      :unique-opened="true"
    >
      <SiderItem :menuList="menuList"></SiderItem>
    </el-menu>
  </transition>
</template>

<script>
import SiderItem from "./siderItem";
export default {
  data() {
    return {};
  },
  components: {
    SiderItem
  },
  props: {
    isCollpase: Boolean
  },
  computed: {
    menuList() {
      return this.$store.state.menuList.length > 0
        ? this.$store.state.menuList
        : null;
    },
    currentPath() {
      return this.$route.path;
    }
  },
  //生命周期 - 创建完成（访问当前this实例）
  created() {},
  //生命周期 - 挂载完成（访问DOM元素）
  mounted() {}
};
</script>
<style scoped>
/* @import url(); 引入css类 */
.el-menu-vertical:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
  height: 100%;
}
</style>