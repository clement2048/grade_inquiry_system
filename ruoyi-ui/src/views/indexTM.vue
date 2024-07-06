<template>
  <div class="container">
    <div class="welcome">欢迎回来！</div>
    <div class="infoShow">
      <el-row :gutter="40">
        <el-col :span="8">
          <div class="data-container">
            <i class="el-icon-user"></i>
            <div class="text-container">
              <span class="text-top">学生人数</span>
              <span class="text-bottom">1000</span>
            </div>
          </div>
        </el-col>
        <el-col :span="8">
          <div class="data-container">
            <i class="el-icon-user-solid"></i>
            <div class="text-container">
              <span class="text-top">教师总数</span>
              <span class="text-bottom">30</span>
            </div>
          </div>
        </el-col >
        <el-col :span="8">
          <div class="data-container">
            <i class="el-icon-warning-outline"></i>
            <div class="text-container">
              <span class="text-top">挂科提醒</span>
              <span class="text-bottom">4</span>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
    <el-row>
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
      options:[{
        value: 0,
        label: '饼状图'
      }, {
        value: 1,
        label: '折线图'
      }, {
        value: 2,
        label: '柱状图'
      }],
      value:0,
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
.infoShow {
  margin-top: 20px;
  margin-bottom: 20px;
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
.data-container {
  display: flex;
  align-items: center;
  background-color: white;
  border-radius: 5px;
  height: 100px;
}

.data-container i {
  font-size: 48px;
  margin-right: 16px;
  margin-left: 40px;
}

.text-container {
  display: flex;
  flex-direction: column;
  margin-left: auto;
  margin-right: 48px;
}

.text-container .text-top {
  font-size: 18px;
  color: #333;
}

.text-container .text-bottom {
  font-size: 24px;
  color: #666;
}
</style>
