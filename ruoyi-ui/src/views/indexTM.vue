<template>
  <div class="container">
    <div class="welcome">欢迎回来！</div>
    <el-row>
      <div class="chart-wrapper">
        <grade-score-line-chart :chart-data="lineData"/>
      </div>
    </el-row>
    <el-row>
      <div class="chart-wrapper">
        <grade-bar-chart :chart-data="gradeData"/>
      </div>
    </el-row>
  </div>
</template>

<script>
import gradeScoreLineChart from "@/views/dashboard/gradeScoreLineChart.vue";
import gradeBarChart from "@/views/dashboard/gradeBarChart.vue";
export default {
  name: "ScoreIndex",
  data() {
    return {
      lineData:[],
      gradeData:[],
    };
  },
  components: {
    gradeScoreLineChart,
    gradeBarChart
  },
  created() {
    this.getList();
  },
  methods: {

  }
};
</script>

<style scoped>
.welcome{
  text-align: center;
  background-color:white ;
  font-size: 30px;
  padding-top: 20px ;
  padding-bottom: 20px ;
  border-radius: 5px;
  margin-bottom: 10px;
}
.container {
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
</style>
