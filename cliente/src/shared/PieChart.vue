<template lang="pug">
  .content
    h3 {{ title }}
    .myChart
    .valueList
      ul
        li(v-for="item in data.children" @click="selectItem(item)") {{ item.name }}
          .bullet(:style="colorStyle(item.name)")
</template>

<script>
import * as d3 from 'd3';

export default {
  name: 'PieChart',
  props: ['title', 'data', 'property'],
  data() {
    return {
      color: d3.scale.category20c(),
    };
  },
  methods: {
    renderChart() {
      const self = this;
      const width = 250;
      const height = 250;
      const radius = (Math.min(width, height) / 2) - 10;
      const formatNumber = d3.format(',d');

      const x = d3.scale.linear()
        .range([0, 2 * Math.PI]);

      const y = d3.scale.sqrt()
        .range([0, radius]);

      const partition = d3.layout.partition()
        .value(function (d) { return d.size; });

      const arc = d3.svg.arc()
        .startAngle(function (d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x))); })
        .endAngle(function (d) { return Math.max(0, Math.min(2 * Math.PI, x(d.x + d.dx))); })
        .innerRadius(0)
        .outerRadius(function (d) { return Math.max(0, y(d.y + d.dy)); });
      const svg = d3.select(`.${self.property} .myChart`).append('svg')
        .attr('width', width)
        .attr('height', height)
        .append('g')
        .attr('transform', `translate(${width / 2}, ${height / 2})`);

      function draw(root) {
        svg.selectAll('path')
          .data(partition.nodes(root))
          .enter().append('path')
          .attr('d', arc)
          .style('fill', function (d) { return self.color(d.name); })
          .on('click', self.selectItem)
          .append('title')
          .text(function (d) { return `${d.name} \n ${formatNumber(d.value)}`; });
      }
      draw(this.data);
    },
    selectItem(d) {
      console.log(d);
      this.$emit('select', { id: d.id, property: this.property });
    },
    colorStyle(name) {
      return { backgroundColor: this.color(name) };
    },
  },
  mounted() {
    this.renderChart();
  },
};
</script>

<style lang="stylus">
  path
    stroke: #fff
  #myChart
    float: left
  .valueList
    li
      list-style: none
      cursor: pointer
      position: relative
      padding-left: 1.5em
      line-height: 1em
      margin: 0.5em 0
    .bullet
      width: 1em
      height: 1em
      float: left
      margin-right: 5px
      position: absolute
      top: 0
      left: 0
</style>
