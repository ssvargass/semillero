import Vue from 'vue';
import VueRouter from 'vue-router';
import Vuecidity from 'vuecidity';
import VuePaginate from 'vue-paginate';
import App from './App.vue';
import routes from './routes';

Vue.use(VueRouter);
Vue.use(Vuecidity);
Vue.use(VuePaginate);

const router = new VueRouter({ routes });

new Vue({
  el: '#app',
  render: h => h(App),
  router,
});
