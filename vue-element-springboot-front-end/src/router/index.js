import Vue from "vue";
import VueRouter from "vue-router";
import store from '../store/index'
import menuListApi from '../api/menuList'
import Index from '../components/mgt/index.vue'
import EleBk from '../components/mgt/bkMgt/eleBkMgt/eleBk.vue'
Vue.use(VueRouter);

const routes = [{
    path: '/login',
    name: 'Login',
    hidden: true,
    component: () => import('@/components/login'),
    meta: {
      title: '登录页面'
    }
  },
  {
    path: '/register',
    name: 'Register',
    hidden: true,
    component: () => import('@/components/register'),
    meta: {
      title: '注册页面'
    }
  },
  {
    path: '/mgt',
    name: 'Mgt',
    component: Index,
    meta: {
      requireAuth: false
    },
    children: [{
      path: '/mgt/bkmgt/elemgt',
      name: 'EleMgt',
      meta: {
        requireAuth: false,
        title: '电子图书管理'
      },
      children: [{
        path: '/mgt/bkmgt/elemgt/eleBk',
        name: 'EleBk',
        component: EleBk,
        meta: {
          requireAuth: false,
          title: '电子图书'
        }
      }]
    }]
  }, {
    path: '*',
    redirect: '/login',
    hidden: true
  }
];

//格式化返回的路由信息
const formatRoutes = routes => {
  let resultRoutes = [];
  routes.forEach(item => {
    //如果有孩子，继续对孩子格式化
    item.children = !!item.children ?
      formatRoutes(item.children) :
      null;
    let resRoutes = {
      path: item.path,
      component: resolve => {
        require([
          `../components/mgt/${item.component}.vue`
        ], resolve);
      },
      name: item.name,
      nameZh: item.nameZh,
      iconCls: item.iconCls,
      meta: {
        requireAuth: true,
        title: item.nameZh
      },
      children: item.children
    };
    resultRoutes.push(resRoutes);
  });
  return resultRoutes;
};
//初始化菜单 采用箭头函数来实现
const initMenuList = (router, store) => {
  if (store.state.menuList.length > 0) {
    return;
  } else {
    menuListApi.getMenuList()
      .then(res => {
        if (res && res.status == 200) {
          let result = formatRoutes(res.data.data);
          router.addRoutes(result);
          // router.options.routes = router.options.routes.concat(
          //   result
          // );
          //如果菜单中有数据才去添加到store中,否则为空数组
          result.length > 0 ? store.dispatch("initMenuLists", result) : [];
        }
      })
      .catch(error => {
        console.log(error);
      });
  }
};

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

//路由跳转判断vuex有菜单数据，没有则取获取菜单数据，再动态渲染，否则不去获取。
router.beforeEach((to, from, next) => {
  if (store.state.username && to.path.startsWith("/mgt")) {
    initMenuList(router, store)
    // console.log(to)
  }
  //将to的title赋值给document
  if (to.meta.title) {
    document.title = to.meta.title
  }
  //如果刷新了，重新渲染菜单
  if (store.state.menuList.length === 0) {
    console.log(to.fullPath)
    //如果是去登录页，则不再初始化菜单
    if (to.fullPath == '/login') {

    } else {
      initMenuList(router, store)
    }
  } else {
    next()
  }
  next()
});
export default router;