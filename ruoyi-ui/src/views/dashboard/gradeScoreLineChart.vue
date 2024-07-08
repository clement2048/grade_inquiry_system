<template>
    <div >
      <el-button @click="download" icon="el-icon-download">下载</el-button>
      <div id="download" :class="className" :style="{height:height,width:width}" ref="chart"/>
    </div>

</template>

<script>
import * as echarts from 'echarts'
require('echarts/theme/macarons') // echarts theme
import resize from './mixins/resize'
import html2canvas from 'html2canvas'

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
      chart: null
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
      this.chart = echarts.init(this.$refs.chart, 'macarons')
      this.setOptions(this.chartData)
    },
    setOptions(data) {
      this.chart.setOption({
        title:{
          text:'各年级成绩平均分对比'
        },
        xAxis: {
          data: ['大一上','大一下','大二上','大二下','大三上','大三下'],
          boundaryGap: false,
          axisTick: {
            show: false
          }
        },
        grid: {
          left: 10,
          right: 10,
          bottom: 20,
          top: 30,
          containLabel: true
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross'
          },
          padding: [5, 10]
        },
        yAxis: {
          axisTick: {
            show: false
          },
          type: 'value',
          scale:true
        },
        legend: {
          data: ['21级','22级','23级']
        },
        series: [{
          name: '23级',
          type: 'line',
          data: [86, 90],
        },{
          name: '22级',
          type: 'line',
          data: [83, 85, 82, 90]
        },{
          name: '21级',
          type: 'line',
          data: [86, 88, 87, 90, 91, 92]
        }
        ]
      })
    },
  // 将echarts图表转换为canvas,并将canvas下载为图片
    download() {
      // 图表转换成canvas
      html2canvas(document.getElementById("download")).then(function (canvas) {
        let img = canvas
          .toDataURL("image/png")
          .replace("image/png", "image/octet-stream");
        // 创建a标签，实现下载
        let creatIMg = document.createElement("a");
        creatIMg.download = "图表.png"; // 设置下载的文件名，
        creatIMg.href = img; // 下载url
        document.body.appendChild(creatIMg);
        creatIMg.click();
        creatIMg.remove(); // 下载之后把创建的元素删除
      });
    },
  }
}
</script>
