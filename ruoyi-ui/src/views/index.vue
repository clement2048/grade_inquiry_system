<template>
  <div class="dashboard-editor-container">
    <el-row>
      <el-col>
        <div class="welcome">欢迎回来！</div>
        <div class="infoShow">
          <el-row :gutter="40">
            <el-col :span="6">
              <div class="data-container">
                <i class="el-icon-user"></i>
                <div class="text-container">
                  <span class="text-top">排名</span>
                  <span class="text-bottom">{{ rank }}/{{rankTotal}}</span>
                </div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="data-container">
                <i class="el-icon-trophy"></i>
                <div class="text-container">
                  <span class="text-top">平均分</span>
                  <span class="text-bottom">{{ average }}</span>
                </div>
              </div>
            </el-col >
            <el-col :span="6">
              <div class="data-container">
                <i class="el-icon-warning-outline"></i>
                <div class="text-container">
                  <span class="text-top">挂科提醒</span>
                  <span class="text-bottom">{{ noPass }}</span>
                </div>
              </div>
            </el-col>
            <el-col :span="6">
              <div class="data-container">
                <i class="el-icon-coffee-cup"></i>
                <div class="text-container">
                  <span class="text-top">学分</span>
                  <span class="text-bottom">{{ creditCurrent }}/{{creditTotal}}</span>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>
    </el-row>
    <el-row :gutter="32">
      <el-col :span="12">
        <div class="chart-wrapper">
          <StuIndexScore :score-list="scoreList"/>
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
          <div v-if="activePieChart" class="pieChart"><pie-chart2 ref="pie" :chart-data="chartData"/></div>
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
import StuIndexScore from "@/views/tm/score/StuIndexScore.vue";
import {getScoreInfo,getGPA,getCreditInfo,getAvgScore} from "@/api/tm/info";

export default {
  name: 'Index',
  components: {
    LineChart,
    PieChart2,
    StuIndexScore
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
      activeLineChart: false,
      noPass: 1,
      rank: 50,
      rankTotal: 150,
      average: 0,
      creditCurrent: 0,
      creditTotal: 0,
      infoList: [],
      scoreList:[]
    }
  },
  mounted(){
    this.handleSetLineChartData();
    this.doTest();
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
    },
    changeSelect() {
      if(this.value === 0){
        this.activePieChart = true;
        this.activeLineChart = false;
      }else if(this.value === 1){
        this.activePieChart = false;
        this.activeLineChart = true;
      }
    },
    handleNoPass(){
      let len =this.scoreList.length;
      let count = 0;
      for(let i=0; i<len; i++){
        if(this.scoreList[i].pass === "0"){
          count++;
        }
      }
      this.noPass = count;
    },
    doTest(){
      // 学分获取
      getCreditInfo(this.id).then(response=> {
        // console.log(response);
        this.infoList = response.data;
        this.creditTotal = this.infoList.graCredit;
        this.creditCurrent = this.infoList.curCredit ;
      })
      // 平均分获取
      getAvgScore(this.id).then(response=>{
        // console.log(response)
        this.average = response.data.average;
      })
      // 获取课程名与课程成绩
      getScoreInfo(this.id).then(response=>{
        // console.log(response.data)
        this.scoreList = response.data;
        this.handleNoPass();
      })
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
.infoShow{

  margin-top: 20px;
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
