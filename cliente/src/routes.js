import search from './components/Search.vue';
import project from './components/Project.vue';

const routes = [
  { path: '/', component: search, name: 'search' },
  { path: '/estadisticas', component: search, name: 'search' },
  { path: '/textual', component: search, name: 'search' },
  { path: '/proyecto/:id', component: project, name: 'detail' },
];

export default routes;
