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
    >
      <!-- <div style="heiht:80px"></div> -->
      <el-submenu
        v-for="(item,index) in menuList"
        :key="index"
        :index="index+''"
        style="text-align:left"
      >
        <!-- <template slot="title"> -->
        <span slot="title" style="font-size:16px">
          <icon :name="item.iconCls" :w="16" :h="16"></icon>
          <span style="margin-left:8px">{{item.nameZh}}</span>
        </span>
        <!-- </template> -->
        <!-- 二级菜单 -->
        <template v-for="child in item.children">
          <!-- 如果二级菜单还有子菜单，继续循环该二级菜单-->
          <el-submenu
            :key="child.path"
            :index="child.path"
            v-if="child.children&&child.children.length>0"
          >
            <template slot="title">
              <icon :name="child.iconCls" :w="16" :h="16"></icon>
              <span style="margin-left:8px">{{child.nameZh}}</span>
            </template>
            <!-- 三级菜单 -->
            <template v-for="grChild in child.children">
              <el-menu-item :index="grChild.path" :key="grChild.path">
                <icon :name="grChild.iconCls" :w="16" :h="16"></icon>
                <span style="margin-left:8px">{{grChild.nameZh}}</span>
              </el-menu-item>
            </template>
          </el-submenu>
          <!-- 二级菜单没有子菜单的直接显示 -->
          <el-menu-item v-else :index="child.path" :key="child.path">
            <icon :name="child.iconCls&&child.iconCls" :w="16" :h="16"></icon>
            <span style="margin-left:8px">{{child.nameZh}}</span>
          </el-menu-item>
        </template>
      </el-submenu>
    </el-menu>
  </transition>
</template>

<script>
export default {
  data() {
    return {};
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