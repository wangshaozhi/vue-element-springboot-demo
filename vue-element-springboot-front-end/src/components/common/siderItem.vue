<template>
  <div>
    <template v-for="item in menuList">
      <el-submenu
        :key="item.nameZh"
        :index="item.nameZh"
        v-if="item.children&&item.children.length>0"
      >
        <template slot="title">
          <icon :name="item.iconCls" :w="16" :h="16"></icon>
          <span style="margin-left:8px">{{item.nameZh}}</span>
        </template>
        <siderItem :menuList="item.children"></siderItem>
      </el-submenu>
      <!-- 没有孩子直接显示菜单信息 -->
      <el-menu-item v-else :index="item.path" :key="item.path">
        <icon :name="item.iconCls&&item.iconCls" :w="16" :h="16"></icon>
        <span style="margin-left:8px">{{item.nameZh}}</span>
      </el-menu-item>
    </template>
  </div>
</template>

<script>
export default {
  name: "siderItem",
  props: ["menuList"]
};
</script>

<style>
</style>