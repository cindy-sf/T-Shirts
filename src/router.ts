import Vue from 'vue';
import Router from 'vue-router';
import Home from './views/Home.vue';
import ProductDetail from '../src/components/T-shirts/ProductDetail.vue';
import Admin from '../src/components/Admin/Admin.vue';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/T-shirt/:id/:reference',
      name: 'product-detail-component',
      props: true,
      component: ProductDetail,
    },
    {
      path: '/Admin',
      name: 'Admin-component',
      props: true,
      component: Admin,
    },
  ],
});
