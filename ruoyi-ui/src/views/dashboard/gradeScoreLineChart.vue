<template>
  <div>
    <el-button @click="download" icon="el-icon-download">下载</el-button>
    <div id="download" :class="className" :style="{ height: height, width: width }" ref="chart" />
  </div>
</template>

<script>
import * as echarts from 'echarts';
require('echarts/theme/macarons'); // echarts theme
import resize from './mixins/resize';
import html2canvas from 'html2canvas';
import { getStuRank } from "@/api/tm/score";

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
    }
  },
  data() {
    return {
      chart: null,
      xName: ['第一学期', '第二学期', '第三学期'],
      dataList: [],
      year: [],
      term: [],
      yearLabel: [],
      average: []
    };
  },
  watch: {
    chartData: {
      deep: true,
      handler(val) {
        this.setOptions(val);
      }
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart();
    });
  },
  beforeDestroy() {
    if (!this.chart) {
      return;
    }
    this.chart.dispose();
    this.chart = null;
  },
  methods: {
    initChart() {
      getStuRank().then(res => {
        this.dataList = res.data;
        this.year = Array.from(new Set(this.dataList.map(item => item.year))).sort();
        this.term = Array.from(new Set(this.dataList.map(item => item.term))).sort();
        this.yearLabel = this.year.map(year => `${year}级`);
        this.average = this.year.map(year => {
          const avg = this.term.map(term => {
            const record = this.dataList.find(item => item.year === year && item.term === term);
            return record ? record.average : 0;
          });
          return avg;
        });
        console.log(this.average);
        this.setOptions(); // 初始化数据后设置图表
      });
      this.chart = echarts.init(this.$refs.chart, 'macarons');
    },
    setOptions() {
      const seriesData = this.yearLabel.map((label, index) => {
        return {
          name: label,
          type: 'line',
          data: this.average[index]
        };
      });

      this.chart.setOption({
        title: {
          text: '各年级成绩平均分对比'
        },
        xAxis: {
          data: this.xName,
          boundaryGap: false,
          axisTick: {
            show: false
          }
        },
        grid: {
          left: 10,
          right: 10,
          bottom: 20,
          top: 60,
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
          scale: true
        },
        legend: {
          data: this.yearLabel,
          top: '25px'
        },
        series: seriesData
      });
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
    }
  }
};
</script>
