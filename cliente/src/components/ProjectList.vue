<template lang="pug">
  .container
    loader(v-show="loading")
    .no-results(v-show="!loading && projects.length === 0")
      h4 No hay resultados, por favor complete la frase de búsqueda
    table(v-show="!loading && projects.length !== 0")
      thead
        tr
          th Nombre del proyecto
          th Linea de investigacion
          th Facultad/Centro
          th Grupo de investigacion
          th Investigador principal
      paginate(name="projects" :list="projects" :per="2")
      tbody
        tr(v-for="project in paginated('projects')")
          td
            router-link(:to="{ name: 'detail', params: { id: project.id } }") {{project.name}}
          td
            router-link(:to="{ name: 'detail', params: { id: project.id } }") {{project.linea}}
          td
            router-link(:to="{ name: 'detail', params: { id: project.id } }") {{project.facultad.map(facultad => facultad.name).join(",")}}
          td
            router-link(:to="{ name: 'detail', params: { id: project.id } }") {{project.grupo}}
          td
            router-link(:to="{ name: 'detail', params: { id: project.id } }") {{project.principal.name}}
    paginate-links(for="projects" :limit="2" :show-step-links="true")
</template>

<script>
import Loader from '../shared/Loader.vue';

export default {
  props: ['projects', 'loading'],
  components: {
    Loader,
  },
  data() {
    return {
      paginate: ['projects'],
    };
  },
};
</script>

<style lang="stylus">
  table
    ul
      display: none;
  .paginate-links
    user-select: none;
    list-style-type: none;
    padding: 0;
    text-align: center;
    li
      display: inline-block;
      margin: 0 10px;
    a
      cursor: pointer;
      color: #048592;
    li.active a
      font-weight: bold;
    li.next:before
      content: ' | ';
      margin-right: 13px;
      color: #ddd;
    li.disabled a
      color: #ccc;
      cursor: no-drop;

</style>
