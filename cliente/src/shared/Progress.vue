<template lang="pug">
  .widget
    b.p-label Progreso
    #chart.chart-container
</template>

<script>
import * as d3 from 'd3';

export default {
  name: 'progress-bar',
  data() {
    return { };
  },
  props: ['percentage'],
  methods: {
    renderChart() {
      const percent = this.percentage;
      const oldValue = 0;
      const w = 212;
      const h = 160;
      const color = ['#FDFDFD', '#F0C543'];
      const outerRadius = 100;
      const innerRadius = 60;

      const arc = d3.svg.arc()
        .innerRadius(innerRadius)
        .outerRadius(outerRadius)
        .startAngle(0)
        .endAngle(Math.PI);

      const arcLine = d3.svg.arc()
        .innerRadius(innerRadius)
        .outerRadius(outerRadius)
        .startAngle(0);

      const svg = d3.select('#chart')
        .append('svg')
        .attr('width', w)
        .attr('height', h)
        .append('g')
        .attr('transform', `translate(${w / 2}, 110)`);

      svg.append('path')
        .attr('d', arc)
        .attr('transform', 'rotate(-90)')
        .style('fill', color[0]);

      const pathForeground = svg.append('path')
        .datum({ endAngle: 0 })
        .attr('d', arcLine)
        .attr('transform', 'rotate(-90)')
        .style('fill', function () { return color[1]; });

      const middleCount = svg.append('text')
        .datum(0)
        .text(function (d) {
          return d;
        })
        .attr('class', 'middleText')
        .attr('text-anchor', 'middle')
        .attr('dy', 0)
        .attr('dx', 5);

      const arcTween = function (transition, newValue, oldVal) {
        transition.attrTween('d', function (d) {
          const myD = d;
          const interpolate = d3.interpolate(d.endAngle, ((Math.PI)) * (newValue / 100));
          const interpolateCount = d3.interpolate(oldVal, newValue);
          return function (t) {
            myD.endAngle = interpolate(t);
            middleCount.text(`${Math.floor(interpolateCount(t))}%`);
            return arcLine(d);
          };
        });
      };

      pathForeground.transition()
        .duration(2000)
        .call(arcTween, percent, oldValue);
    },
  },
  mounted() {
    this.renderChart();
  },
};
</script>

<style>
  .widget {
    width: 100%;
    background-color: #FDFDFD;
    padding-top: 1em !important;
  }

  .middleText{
    font-size: 1.2em;
  }

  .p-label {
    padding-left: 1em;
  }
</style>
