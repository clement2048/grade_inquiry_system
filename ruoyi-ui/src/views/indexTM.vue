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
              <span class="text-bottom">{{peoNum}}</span>
            </div>
          </div>
        </el-col>
        <el-col :span="8">
          <div class="data-container">
            <i class="el-icon-user-solid"></i>
            <div class="text-container">
              <span class="text-top">教师总数</span>
              <span class="text-bottom">{{teaNum}}</span>
            </div>
          </div>
        </el-col >
        <el-col :span="8">
          <div class="data-container">
            <i class="el-icon-warning-outline"></i>
            <div class="text-container">
              <span class="text-top">挂科提醒</span>
              <span class="text-bottom">{{passNum}}</span>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
    <el-row>
      <div class="chart-wrapper1">
        <grade-score-line-chart/>
      </div>
    </el-row>
    <el-row>
      <div class="chart-wrapper">
        <grade-bar-chart/>
      </div>
    </el-row>
  </div>
</template>

<script>
import gradeScoreLineChart from "@/views/dashboard/gradeScoreLineChart.vue";
import gradeBarChart from "@/views/dashboard/gradeBarChart.vue";
import {getPeoNum, getTeacherNum} from "@/api/tm/major";
import {getPassNum} from "@/api/tm/choose";
import {getStuRank} from "@/api/tm/score";

export default {
  name: "ScoreIndex",
  data() {
    return {
      gradeList:[],
      teaNum:'',
      passNum:'',
      peoNum:'',
    };
  },
  components: {
    gradeScoreLineChart,
    gradeBarChart
  },
  mounted() {
    this.getAll();
  },
  methods: {
    getAll(){
      getPeoNum().then(res=>{
        // console.log(res)
        this.peoNum = res.data.peopleNum
      });
      getTeacherNum().then(res=>{
        // console.log(res)
        this.teaNum = res.data.teacherNum
      });
      getPassNum().then(res=>{
        // console.log(res)
        this.passNum = res.data.passNum
      })

    },
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
  .chart-wrapper1{
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
    border-radius: 5px;
    height: 400px;
  }
  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
    border-radius: 5px;
    height: 350px;
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
