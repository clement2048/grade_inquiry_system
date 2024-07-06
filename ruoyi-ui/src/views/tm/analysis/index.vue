<template>

  <div class="container">
    <div>
      <el-select v-model="selectedYear" placeholder="Select Year" @change="filterData">
        <el-option v-for="year in uniqueYears" :key="year" :label="year" :value="year"></el-option>
      </el-select>
      <el-select v-model="selectedTerm" placeholder="Select Term" @change="filterData">
        <el-option v-for="term in uniqueTerms" :key="term" :label="term" :value="term"></el-option>
      </el-select>
      <score-bar-chart ref="data" :score-data="filteredCoursesAndScores"/>
    </div>
    <div>
      <grade-score-line-chart :chart-data="charData"/>
    </div>
  </div>
</template>
<script>
import PieChart2 from "@/views/dashboard/PieChart2.vue";
import LineChart from "@/views/dashboard/LineChart.vue";
import {data} from "@/api/tm/user";
import ScoreBarChart from "@/views/dashboard/ScoreBarChart.vue";
import {score} from "@/api/tm/score";
import gradeScoreLineChart from "@/views/dashboard/gradeScoreLineChart.vue";
import {listScore} from "@/api/tm/score";

export  default {
  components: {
    ScoreBarChart,
    PieChart2,
    LineChart,
    gradeScoreLineChart
  },
  data() {
    return{
      charData: {
        cType:[],
        score:[],
      },
      id: 1,
      filteredCoursesAndScores: [],
      scoreList: [],
      courseId: null,
      selectedYear: null,
      selectedTerm: null,
    }
  },
  mounted(){
    this.handleSetLineChartData();
    this.handleScoreBar();
    this.filterData();
  },
  computed: {
    uniqueYears() {
      return [...new Set(this.scoreList.map(item => item.year))];
    },
    uniqueTerms() {
      return [...new Set(this.scoreList.map(item => item.term))];
    }
  },
  methods: {
    async handleSetLineChartData() {
      await data(this.id).then(response=>{
        this.listdata = response.data;
        for(let i=0;i<this.listdata.length;i++){
          this.charData.cType.push(this.listdata[i].ctype);
          this.charData.score.push(this.listdata[i].score);
        }
      })
      // 重新渲染，否则数据不会生效
      this.$refs.child.initChart();
    },
    handleYearChange() {

    },
    handleScoreBar() {
      listScore(this.courseId).then(response=>{
        this.scoreList = response.rows;
      })
    },
    filterData() {
      if (this.selectedYear && this.selectedTerm) {
        this.filteredCoursesAndScores = this.scoreList
          .filter(item => item.year === this.selectedYear && item.term === this.selectedTerm)
          .map(item => ({ courseName: item.courseName, finalSco: item.finalSco }));
        console.log(this.filteredCoursesAndScores)
      }
    }
  }
}
</script>
<style scoped>
.chart-wrapper {
  background: #fff;
  padding: 16px 16px 0;
  margin-bottom: 32px;
  border-radius: 5px;
}
.credit{
  background-color: #00afff;
}
</style>
