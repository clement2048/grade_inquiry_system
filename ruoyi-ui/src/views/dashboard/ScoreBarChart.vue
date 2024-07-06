<template>
  <div :class="className" :style="{height:height,width:width}" />
</template>

<script>
import * as echarts from 'echarts'
require('echarts/theme/macarons') // echarts theme
import resize from './mixins/resize'

const animationDuration = 6000

export default {
  mixins: [resize],
  props: {
    className: {
      type: String,
      default: 'chart'
    },
    width: {
      type: String,
      default: '100%'
    },
    height: {
      type: String,
      default: '300px'
    },
    scoreData:{
      type: Array,
      required: true
    }
  },
  data() {
    return {
      chart: null
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart()
    })
  },
  beforeDestroy() {
    if (!this.chart) {
      return
    }
    this.chart.dispose()
    this.chart = null
  },
  watch: {
    scoreData: {
      deep: true,
      handler() {
        this.setOptions();
      }
    }
  },
  methods: {
    initChart() {
      this.chart = echarts.init(this.$el, 'macarons')
      // this.setOptions(this.scoreData)
      this.setOptions()
    },
    setOptions(){
      this.chart.setOption({
        tooltip: {
          trigger: 'axis',
          axisPointer: { // 坐标轴指示器，坐标轴触发有效
            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        grid: {
          top: 10,
          left: '2%',
          right: '2%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: [{
          type: 'category',
          data: this.scoreData.map(item => item.courseName),
        }],
        yAxis: [{
          type: 'value',
        }],
        series: [{
          type: 'bar',
          data: this.scoreData.map(item => item.finalSco),
        },
        ]
      })
    }
  }
}
</script>
