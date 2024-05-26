<template>
  <div class="dashboard-editor-container">
    <el-row>
      <el-col>
        <div class="welcome">欢迎回来！</div>
      </el-col>

    </el-row>
    <el-row :gutter="32">
      <el-col :span="12">
        <div ref="child" class="chart-wrapper">
          <pie-chart :chartData="chartData"/>
        </div>
      </el-col>
      <el-col :span="12">
        <div class="chart-wrapper">
          <pie-chart2 />
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>

import PieChart from './dashboard/PieChart1'
import {data} from '@/api/system/config'
import PieChart2 from "@/views/dashboard/PieChart2.vue";

export default {
  name: 'Index',
  components: {
    PieChart2,
    PieChart
  },
  data() {
    return {
      chartData:[]
    }
  },
  mounted(){
    this.handleSetLineChartData()
  },
  methods: {
    async handleSetLineChartData() {
      await data().then(response=>{
        this.chartData = response.data.data
      })
      // 重新渲染，否则数据不会生效
      this.$refs.child.initChart();
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
</style>
