<template>
  <div class="teacher-welcome">
    <div class="infoShow">
      <el-row :gutter="40">
        <el-col :span="6">
          <div class="data-container">
            <i class="el-icon-user"></i>
            <div class="text-container">
              <span class="text-top">学生人数</span>
              <span class="text-bottom">{{ studentCount }}</span>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="data-container">
            <i class="el-icon-trophy"></i>
            <div class="text-container">
              <span class="text-top">平均GPA</span>
              <span class="text-bottom">{{ averageGPA }}</span>
            </div>
          </div>
        </el-col >
        <el-col :span="6">
          <div class="data-container">
            <i class="el-icon-warning-outline"></i>
            <div class="text-container">
              <span class="text-top">挂科提醒</span>
              <span class="text-bottom">{{ failingStudents.length }}</span>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="data-container">
            <i class="el-icon-coffee-cup"></i>
            <div class="text-container">
              <span class="text-top">优秀学生人数</span>
              <span class="text-bottom">{{ excellentStudentCount }}</span>

            </div>
          </div>
        </el-col>
      </el-row>
    </div>

    <el-row>
      <el-col>
        <div class="data-analysis">
          <h2>数据分析</h2>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-card>
                <div slot="header">数据分析图表</div>
                <pie-chart3 :chart-data="pieChartData" v-if="activePieChart" />
              </el-card>
            </el-col>
            <el-col :span="6">
              <el-card>
                <div slot="header">平均分</div>
                <div>{{ average }}</div>
              </el-card>
            </el-col><el-col :span="6">
            <el-card>
              <div slot="header">优秀率</div>
              <div>{{ excellentRate  }}%</div>
            </el-card>
          </el-col>
            <el-col :span="6">
              <el-card>
                <div slot="header">良好率</div>
                <div>{{ goodRate }}%</div>
              </el-card>
            </el-col>
            <el-col :span="6">
              <el-card>
                <div slot="header">预警率</div>
                <div>{{ fallingRate }}%</div>
              </el-card>
            </el-col>
          </el-row>
        </div>

        <div class="class-scores">
          <h2>班级成员成绩</h2>
          <el-input
            v-model="searchText"
            placeholder="请输入学生姓名进行搜索"
            style="width: 300px; margin-bottom: 10px;"
            clearable
          ></el-input>

          <!-- 表格展示 -->
          <el-table :data="displayedClassScores" style="width: 100%" row-key="name">
            <el-table-column prop="name" label="姓名" width="180"></el-table-column>
            <el-table-column prop="gpa" label="GPA" width="180"></el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button @click="handleExpand(scope.$index, scope.row)">查看详情</el-button>
              </template>
            </el-table-column>
          </el-table>

          <!-- 展开详情 -->
          <el-table :data="expandedScores" style="width: 100%" v-if="expandedScores.length">
            <el-table-column prop="courseName" label="科目" width="180"></el-table-column>
            <el-table-column prop="average" label="成绩" width="180"></el-table-column>
            <el-table-column prop="pass" label="是否通过" width="180"></el-table-column>
          </el-table>
        </div>
        <el-row>
          <el-col>
            <div class="rankings">
              <h2>挂科名单</h2>
              <el-table :data="failingStudents" style="width: 100%" v-if="failingStudents.length">
                <el-table-column prop="name" label="名字" width="180"></el-table-column>
                <el-table-column prop="subject" label="科目" width="180"></el-table-column>
              </el-table>
            </div>
          </el-col>
        </el-row>
      </el-col>
    </el-row>

  </div>
</template>

<script>
import LineChart from "@/views/dashboard/LineChart.vue";
import PieChart3 from "@/views/dashboard/PieChart3.vue";
import {
  getCourseInfo,
  getClassInfo,
  getStuInfo, getStuScoreInfoByStuId
} from "@/api/tm/teacher";

import {getScoreInfo,getGPA,getCreditInfo,getAvgScore, getScoreRank} from "@/api/tm/info";
export default {
  components: {
    LineChart,
    PieChart3,
  },
  data() {
    return {
      stuList:[],
      scoreList :[],
      noPass:'',
      average: 0,
      pieChartData: {
        labels: ['优秀率', '良好率', '预警率'],
        datasets: [{
          data: [ 5, 50, 25],
          backgroundColor: [ '#36A2EB', '#FFCE56', '#4BC0C0'],
          hoverBackgroundColor: ['#36A2EB', '#FFCE56', '#4BC0C0'],
        }],
      },
      id: 100,
      excellentStudentCount: 0,
      classScores: [],
      excellentRate:0,
      studentCount: 0,
      goodRate:0,
      fallingRate:0,
      expandedScores: [],
      allStudentScores: [], // 存储所有学生的成绩数据
      failingStudents: [],
      activePieChart: true,
      activeLineChart: false,
      averageGPA: 0,
      analysisData: [],
      searchText: '',

      chartData: {
        cType: [],
        score: [],
      },
      value: '',
      isHeadTeacher: false
    }
  },
  created() {
    this.handleSetLineChartData();
    this.getRankings();

  },
  mounted(){
    this.doTest();
  },
  computed: {
    // 根据搜索文本过滤显示的成绩数据
    displayedClassScores() {
      if (!this.searchText.trim()) {
        return this.classScores;
      } else {
        // 否则根据姓名进行搜索过滤
        return this.classScores.filter(student =>
          student.name.includes(this.searchText.trim())
        );
      }
    }
  },
  methods: {
    doTest(){
      getClassInfo(this.id).then(res => {
        console.log(res);
      });
      getStuInfo(this.id).then(res => {
        console.log(res);
        this.stuList = res.data;
        this.studentCount = this.stuList.length;
        this.classScores = this.stuList.map(item => ({
          name: item.studentName,
          gpa: item.average, // 假设你想用 average 作为 gpa
          studentId: item.studentId,
        }));
        let totalGpa = 0;
        let goodCount = 0;
        let failingCount = 0;
        const totalCount = this.classScores.length;
        this.classScores.forEach(student => {
          totalGpa += student.gpa;
          if (student.gpa >= 85) {
            this.excellentStudentCount++;
          } else if (student.gpa >= 60 && student.gpa < 85) {
            goodCount++;
          } else {
            failingCount++;
          }
        });
        this.average = totalGpa / totalCount;
        //GPA应该如何计算？
        this.averageGPA = (this.average -50)/10;
        this.excellentRate = (this.excellentStudentCount / totalCount) * 100;
        this.goodRate = (goodCount / totalCount) * 100;
        this.fallingRate = (failingCount / totalCount) * 100;

        this.pieChartData = {
          labels: ['优秀率', '良好率', '预警率'],
          datasets: [{
            data: [
              this.excellentRate,
              this.goodRate,
              this.fallingRate,
            ],
            backgroundColor: ['#36A2EB', '#FFCE56', '#4BC0C0'],
            hoverBackgroundColor: ['#36A2EB', '#FFCE56', '#4BC0C0'],
          }],
        };

        // 获取所有学生的课程及成绩
        this.fetchAllScores().then(() => {
          this.handleNoPass(); // 确保在获取所有成绩后再调用 handleNoPass
        });
      });
    },
    fetchAllScores() {
      const scorePromises = this.stuList.map(student =>
        getScoreInfo(student.studentId).then(response => ({
          studentId: student.studentId,
          scores: response.data.map(item => ({
            average: item.average,
            courseName: item.courseName,
            pass: parseInt(item.pass, 10)
          }))
        }))
      );

      return Promise.all(scorePromises).then(allScores => {
        console.log(allScores);
        // 处理所有学生的成绩数据
        this.allStudentScores = allScores;
      }).catch(error => {
        console.error('Error fetching all scores:', error);
      });
    },
    handleExpand(index, row) {
      // 根据学生ID查找相应的成绩
      const studentScores = this.allStudentScores.find(scores => scores.studentId === this.stuList[index].studentId);
      if (studentScores) {
        this.expandedScores = studentScores.scores;
      } else {
        console.error('No scores found for student:', this.stuList[index].studentId);
      }
    },
    handleNoPass() {
      this.failingStudents = []; // 确保每次调用时清空挂科学生名单
      this.allStudentScores.forEach(student => {
        student.scores.forEach(score => {
          if (score.pass === 0) { // 判断课程是否挂科
            const studentInfo = this.stuList.find(item => item.studentId === student.studentId);
            if (studentInfo) {
              this.failingStudents.push({
                name: studentInfo.studentName,
                subject: score.courseName,
                score: score.average
              });
            }
          }
        });
      });
    },

  }
};
</script>

<style scoped>
.teacher-welcome {
  padding: 32px;
  position: relative;
  height: 100%;
  background-color: rgb(240, 242, 245);
}

.chart-wrapper {
  background: #fff;
  padding: 16px 16px 0;
  margin-bottom: 32px;
  border-radius: 5px;
  height: 400px;
}

.welcome {
  text-align: center;
  background-color: white;
  font-size: 30px;
  padding-top: 20px;
  padding-bottom: 20px;
  border-radius: 5px;
}

.el-row {
  margin-bottom: 20px;
  &:last-child {
    margin-bottom: 0;
  }
}

.pieChart {
  margin: 10px auto;
}

.infoShow {
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

.class-scores, .failing-students, .data-analysis, .rankings {
  margin-top: 20px;
}
</style>
