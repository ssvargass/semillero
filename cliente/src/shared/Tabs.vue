<template lang="pug">
  .su-tabs.su-tabs-style-default
    .su-tabs-nav
      span(v-for="(item, index) in config.headers" @click="tab(index)" :class="index === config.current ? 'su-tabs-current' : ''") {{ item }}
    .su-tabs-panes
      .su-tabs-pane.su-clearfix(v-for="(item, index) in config.data" v-show="index === config.current" v-html="item")
</template>

<script>
export default {
  name: 'tabs',
  props: ['config'],
  methods: {
    tab(current) {
      this.config.current = current;
    },
  },
};
</script>

<style>

</style>
