<template>
  <div :class="className" :style="{height:height,width:width}" />
</template>

<script>
import * as echarts from 'echarts'
require('echarts/theme/macarons') // echarts theme
import resize from './mixins/resize'
import {data} from '@/api/tm/user'

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
    chartData:{
      type: Object,
      require: true,
    }
  },
  data() {
    return {
      chart: null,
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
    })
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
    setOptions(credit) {
      this.chart.setOption({
        title: {
          text: '学分分布',
          left: 'center'
        },
        tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
          left: 'center',
          bottom: '10',
          data: credit.cType
        },

        color: [
          '#c23531',
          '#f4cd49',
          '#7313c6',
          '#d48265',
          '#91c7ae',
          '#749f83',
          '#ca8622',
          '#bda29a',
          '#6e7074',
          '#546570',
          '#c4ccd3'
        ],
        series: [
          {
            name: '学分',
            type: 'pie',
            center: ['50%', '45%'],
            radius: ['20%', '60%'],
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2
            },
            data: (function(){
              let res = [];
              let len = credit.cType.length;
              for(let i=0;i<len;i++) {
                res.push({
                  //通过把credit进行遍历循环来获取数据并放入Echarts中
                  name: credit.cType[i],
                  value: credit.score[i]
                });
              }
              return res;
            })(),
            animationEasing: 'cubicInOut',
            animationDuration: 2600
          }
        ]
      })
    }
    }
}
</script>
