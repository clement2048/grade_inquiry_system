<template>
  <div class="dashboard-editor-container">
    <el-row>
      <el-col>
        <div class="welcome">欢迎回来！</div>
      </el-col>

    </el-row>
    <el-row :gutter="32">
      <el-col :span="12">
        <div class="chart-wrapper">
          <line-chart ref="child" :chart-data="chartData" />
        </div>
      </el-col>
      <el-col :span="12">
        <div class="chart-wrapper">
          <el-select v-model="value"
                     placeholder="请选择"
                     @change="changeSelect"
                     size="small">
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
          <div v-if="activePieChart" class="pieChart"><pie-chart2 /></div>
          <div v-if="activeLineChart"><line-chart ref="child" :chart-data="chartData" /></div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>

import PieChart2 from "@/views/dashboard/PieChart2.vue";
import LineChart from "@/views/dashboard/LineChart.vue";
import {data} from "@/api/tm/user";

export default {
  name: 'Index',
  components: {
    LineChart,
    PieChart2,
  },
  data() {
    return {
      chartData:{
        cType:[],
        score:[],
      },
      id: 1,
      options: [{
        value: 0,
        label: '饼状图'
      }, {
        value: 1,
        label: '折线图'
      }],
      value: '',
      activePieChart: true,
      activeLineChart: false
    }
  },
  mounted(){
    this.handleSetLineChartData()
  },
  methods: {
    async handleSetLineChartData() {
      await data(this.id).then(response=>{
        this.listdata = response.data;
        for(let i=0;i<this.listdata.length;i++){
          this.chartData.cType.push(this.listdata[i].ctype);
          this.chartData.score.push(this.listdata[i].score);
        }
      })
      // 重新渲染，否则数据不会生效
      this.$refs.child.initChart();
    },
    changeSelect(val) {
      // console.log(val)
      // console.log(this.value)
      if(this.value === 0){
        this.activePieChart = true;
        this.activeLineChart = false;
      }else if(this.value === 1){
        this.activePieChart = false;
        this.activeLineChart = true;
      }
    }
  }
}
</script>

<style scoped>

.dashboard-editor-container {
  padding: 32px;
  position: relative;
  height: 100%;
  background-color: rgb(240, 242, 245);

  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
    border-radius: 5px;
    height: 400px;
  }
}

.welcome{
  text-align: center;
  background-color:white ;
  font-size: 30px;
  padding-top: 20px ;
  padding-bottom: 20px ;
  border-radius: 5px;
}
.el-row {
  margin-bottom: 20px;
  &:last-child {
    margin-bottom: 0;
  }
}
.pieChart{
  margin: 10px auto;
}
</style>
