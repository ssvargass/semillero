<template lang="pug">
  .content
    router-link(to="/") Volver
    loader(v-show="loading")
    .space(v-show="!loading && project.name")
      h2 {{ project.name }}
      p  
      .column.dt-sc-one-fourth.space.first
        .dt-sc-team
          .image
            img(:src='project.principal.photo', alt='', title='')
          .team-details
            h5 {{ project.principal.name }}
            h6 Investigador principal
        .dt-sc-titled-box
          h6.dt-sc-titled-box-title(style='background-color:#004d47;border-color:#004d47;')
            span.fa.fa-info
            |  Info
          progress-bar(v-if="project.percentage" :percentage="project.percentage")
          .dt-sc-titled-box-content
            p
              b Linea de investigación:
              |  {{ project.linea }}
            p
              b Facultad:
              |  {{ project.facultad.map(facultad => facultad.name).join(",")}}
            p
              b Grupo:
              |  {{ project.grupo }}
        .dt-sc-titled-box
          h6.dt-sc-titled-box-title(style='background-color:#004d47;border-color:#004d47;')
            span.fa.fa-book
            |  Publicaciones
          .dt-sc-titled-box-content
            ul
              li(v-for="documento in project.documento")
                a(:href='documento.file' target='_blank') {{documento.title}}
      .column.dt-sc-three-fourth.space
        .description(v-html="project.resumen")
        h3 Abstract
        .description(v-html="project.abstract")
        p
        tabs(v-if="tab" :config="tab")
        .timeline
          h3 Cronograma
          vc-timeline(@story="onStory($event)" :data="timeline")
        p  
        div(v-show="project.investigadores && project.investigadores.length > 0")
          h3 Investigadores
          ul
            li(v-for="investigador in project.investigadores") {{ investigador.name }}
    .empty(v-show="!loading && !project.name")
      h4  El documento solicitado no se encuentra publicado

</template>

<script>
import semilleroService from '../services/semilleros';
import Loader from '../shared/Loader.vue';
import ProgressBar from '../shared/Progress.vue';
import Tabs from '../shared/Tabs.vue';

export default {
  data() {
    return {
      project: {
        principal: {},
        facultad: [],
      },
      tab: null,
      loading: true,
      hitos: [],
      timeline: [],
    };
  },
  components: {
    Loader,
    ProgressBar,
    Tabs,
  },
  methods: {
    initData() {
      const { id } = this.$route.params;
      semilleroService.getProject(id)
        .then((projects) => {
          if (projects.length >= 1) {
            Object.assign(this.project, projects[0]);
            const compromisos = this.project.compromiso.length;
            const cumplidos = this.project.compromiso
              .filter(compromiso => compromiso.finalizado).length;
            let percentage = (cumplidos * 100) / compromisos;
            percentage = !percentage ? 1 : percentage;
            Object.assign(this.project, { percentage });
          }
          this.tab = {
            headers: ['Justificación', 'Objetivos', 'Metas'],
            data: [this.project.justificacion, this.project.objetivos, this.project.metas],
            current: 0,
          };
          this.mapHitos(this.project.hito);
          this.loading = false;
        });
    },
    mapHitos(hitos) {
      const timeline = [];
      let existsBreak = false;
      let breakpoint = '';
      let hitoMapped = {};
      hitos.forEach((hito) => {
        breakpoint = hito.fecha.split('-')[0];
        hitoMapped = {
          date: new Date(hito.fecha).toLocaleDateString('es-CO', { month: 'long', day: 'numeric' }),
          fecha: hito.fecha.replace(/-/g, ''),
          color: hito.color,
          story: hito.descripcion,
          icon: hito.icon,
          title: hito.name,
          importance: 1,
        };
        existsBreak = (timeline.find(item => item.breakpoint === breakpoint));
        if (!existsBreak) {
          timeline.push({
            breakpoint,
            history: [hitoMapped],
          });
        } else {
          existsBreak.history.push(hitoMapped);
          existsBreak.history.sort((a, b) => a.fecha - b.fecha);
        }
      });
      timeline.sort((a, b) => a.breakpoint - b.breakpoint);
      this.timeline = timeline;
    },
    onStory(data) {
      console.log('timeline story event data', data);
    },
  },
  created() {
    this.initData();
  },
};
</script>

<style>
  @import '../../node_modules/vuecidity/dist/lib/vuecidity.min.css';
  @import url("https://fonts.googleapis.com/css?family=Roboto|Material+Icons");
  @import url("https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/2.0.46/css/materialdesignicons.min.css");
  .material-icons {
    font-family: 'Material Icons' !important;
    font-weight: normal !important;
    font-style: normal;
    font-size: 24px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    display: inline-block;
    white-space: nowrap;
    word-wrap: normal;
    direction: ltr;
    -webkit-font-feature-settings: 'liga';
    -webkit-font-smoothing: antialiased;
  }
  .vc-button{
    float: none;
  }
  .vc-timeline td {
    background: none !important;
    border-bottom: none !important;
  }
</style>
