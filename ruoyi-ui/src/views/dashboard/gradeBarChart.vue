<template>
  <div :class="className" :style="{height:height,width:width}" />
</template>

<script>
import * as echarts from 'echarts'
require('echarts/theme/macarons') // echarts theme
import resize from './mixins/resize'

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
      default: '350px'
    },
    autoResize: {
      type: Boolean,
      default: true
    },
    chartData: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      chart: null,
      rawData : [
        [20, 21, 30, 17, 60, 70, 70],
        [30, 40, 80, 38, 90, 100, 100],
        [30, 32, 60, 50, 100, 80, 88],
        [15, 10, 20, 11, 40, 60, 60],
        [5, 2, 6, 1, 10, 10, 15]
      ],
      totalData: [],

    }
  },
  watch: {
    chartData: {
      deep: true,
      handler(val) {
        this.setOptions(val)
      }
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart()
    });
    this.handledData();
  },
  beforeDestroy() {
    if (!this.chart) {
      return
    }
    this.chart.dispose()
    this.chart = null
  },
  methods: {
    initChart() {
      this.chart = echarts.init(this.$el, 'macarons')
      this.setOptions(this.chartData)
    },
    setOptions(data) {
      this.chart.setOption({
        title:{
          text:'各班级成绩等级分布',
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross'
          },
          padding: [5, 10]
        },
          legend: {
            selectedMode: false
          },
          grid:{
            left: 100,
            right: 100,
            top: 50,
            bottom: 50
          },
          yAxis: {
            type: 'value'
          },
          xAxis: {
            type: 'category',
            data: ['1班', '2班', '3班', '4班', '5班', '6班', '7班']
          },
        series: [
          '优秀',
          '良好',
          '中等',
          '及格',
          '不及格'
        ].map((name, sid) => {
          return {
            name,
            type: 'bar',
            stack: 'total',
            barWidth: '60%',
            label: {
              show: true,
              formatter: (params) => Math.round(params.value * 1000) / 10 + '%'
            },
            data: this.rawData[sid].map((d, did) =>
              this.totalData[did] <= 0 ? 0 : d / this.totalData[did]
            )
          };
        })

      })
    },
    handledData(){
      for (let i = 0; i < this.rawData[0].length; ++i) {
        let sum = 0;
        for (let j = 0; j < this.rawData.length; ++j) {
          sum += this.rawData[j][i];
        }
        this.totalData.push(sum);
      }
    }
  }
}
</script>
