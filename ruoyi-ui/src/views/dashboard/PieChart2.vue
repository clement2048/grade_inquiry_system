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
  },
  data() {
    return {
      chart: null,
      dataset:[],
      name:[]
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
      const id = 1;
      data(id) .then(response => {
        // console.log(response);
        this.listdata = response.data;
        // console.log(response.data);
        for(let i=0;i<this.listdata.length;i++){
          let info = {
            name: this.listdata[i].ctype,
            value: this.listdata[i].score
          };
          this.name.push(this.listdata[i].ctype)
          this.dataset.push(info);
      }
        // console.log(this.dataset)
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
            // data: ['一级预警', '二级预警', '三级预警']
            data: this.name
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
              data: this.dataset,
              animationEasing: 'cubicInOut',
              animationDuration: 2600
            }
          ]
        })
      })
    }
  }
}
</script>
