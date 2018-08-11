<template lang="pug">
  main
    p Usted puede realizar búsquedas textuales o filtrar por las diferentes carácteristicas del proyecto de investigación
    p
    div.dt-sc-tabs-container
      ul.dt-sc-tabs-frame
        li(@click="tabChange(0)" :class="tab === 0 ? 'active' : ''")
          a(:class="tab === 0 ? 'current' : ''") Textual
        li(@click="tabChange(1)" :class="tab === 1 ? 'active' : ''")
          a(:class="tab === 1 ? 'current' : ''") Atributos - Estadísticas
      div.dt-sc-tabs-frame-content(v-show="tab === 0")
        input(type="text" v-model="searchText" placeholder="Buscar por texto")
      div.dt-sc-tabs-frame-content(v-show="tab === 1")
        .column.dt-sc-one-third.first.facultad
          PieChart(v-if="facultades" :title="'Facultades'" :data="facultades" :property="'facultad'" @select="filter")
        .column.dt-sc-one-third.grupo
          PieChart(v-if="grupos" :title="'Grupos'" :data="grupos" :property="'grupo'" @select="filter")
        .column.dt-sc-one-third.linea
          PieChart(v-if="lineas" :title="'Lineas'" :data="lineas" :property="'linea'" @select="filter")
    div.result-wrapper
      ProjectList(:projects="projects" :loading="loading")
</template>

<script>
import semilleroService from '../services/semilleros';
import PieChart from '../shared/PieChart.vue';
import ProjectList from './ProjectList.vue';

export default {
  data() {
    return {
      projects: [],
      searchText: '',
      facultades: null,
      grupos: null,
      lineas: null,
      tab: 0,
      loading: true,
    };
  },
  components: {
    PieChart,
    ProjectList,
  },
  methods: {
    refreshProjects() {
      const self = this;
      self.loading = true;
      semilleroService.getProjectsByText(this.searchText)
        .then(function (projects) {
          self.projects = projects;
          self.loading = false;
        });
    },
    filter(fil) {
      const self = this;
      self.loading = true;
      semilleroService.getProjectsByProperty(fil.property, fil.id)
        .then(function (projects) {
          self.projects = projects;
          self.loading = false;
        });
    },
    mapCounters(response) {
      return response.map(result => Object({
        name: result.name,
        id: result.id,
        size: result.proyectos.length,
      }));
    },
    getCounters() {
      const self = this;
      semilleroService.getCounter('facultad')
        .then(function (response) {
          const children = self.mapCounters(response);
          self.facultades = {
            name: 'facultades',
            children,
          };
        });

      semilleroService.getCounter('grupo')
        .then(function (response) {
          const children = self.mapCounters(response);
          self.grupos = {
            name: 'grupos',
            children,
          };
        });

      semilleroService.getCounter('linea')
        .then(function (response) {
          const children = self.mapCounters(response);
          self.lineas = {
            name: 'lineas',
            children,
          };
        });
    },
    tabChange(current) {
      this.tab = current;
    },
  },
  mounted() {
    this.getCounters();
    this.refreshProjects();
  },
  watch: {
    searchText() {
      this.refreshProjects();
    },
  },
};
</script>

<style lang="stylus">
  .sv-hidden
    display: none
  circle,
  path
    cursor: pointer
  circle
    fill: none
    pointer-events: all
  .result-wrapper
    clear: both
  a
    cursor: pointer
</style>
