<template>
  <div :class="className" :style="{ height: height, width: width }" />
</template>

<script>
import * as echarts from 'echarts'
require('echarts/theme/macarons') // echarts theme
import resize from './mixins/resize'
import { getClassSco } from "@/api/tm/Class"

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
  },
  data() {
    return {
      chart: null,
      rawData: [],
      totalData: [],
      xName: [],
      yName: [],
      gradeList: []
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
    doTest() {
      getClassSco().then(res => {
        this.gradeList = res.data
        this.handleGrade()
        this.handleNum()
        this.handledData()
        this.setOptions()
      })
    },

    initChart() {
      this.chart = echarts.init(this.$el, 'macarons')
      this.doTest()
    },
    setOptions() {
      this.chart.setOption({
        title: {
          text: '各班级成绩等级分布',
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
        grid: {
          left: 50,
          right: 50,
          top: 50,
          bottom: 50
        },
        yAxis: {
          type: 'value'
        },
        xAxis: {
          type: 'category',
          data: this.xName
        },
        series: this.yName.map((name, sid) => {
          return {
            name,
            type: 'bar',
            stack: 'total',
            barWidth: '60%',
            label: {
              show: false,
              formatter: (params) => Math.round(params.value * 1000) / 10 + '%'
            },
            data: this.rawData[sid].map((d, did) =>
              this.totalData[did] <= 0 ? 0 : d / this.totalData[did]
            )
          }
        })
      })
    },
    handledData() {
      this.totalData = []
      for (let i = 0; i < this.rawData[0].length; ++i) {
        let sum = 0
        for (let j = 0; j < this.rawData.length; ++j) {
          sum += this.rawData[j][i]
        }
        this.totalData.push(sum)
      }
    },
    handleGrade() {
      this.xName = []
      this.yName = []
      this.gradeList.forEach(item => {
        const newName = `${item.grade}级${item.classNum}班`
        if (!this.xName.includes(newName)) {
          this.xName.push(newName)
        }
        if (!this.yName.includes(item.level)) {
          this.yName.push(item.level)
        }
      })
    },
    handleNum() {
      this.rawData = Array.from({length: this.yName.length}, () => Array(this.xName.length).fill(0))
      this.gradeList.forEach(item => {
        const xIndex = this.xName.indexOf(`${item.grade}级${item.classNum}班`)
        const yIndex = this.yName.indexOf(item.level)
        if (xIndex !== -1 && yIndex !== -1) {
          this.rawData[yIndex][xIndex] = +item.levelNum // 确保数字转换
        }
      })
    }
  }
}
</script>
