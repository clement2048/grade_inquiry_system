<template>
  <div class="teacher-page">
    <div class="infoShow">
      <el-row :gutter="40">
        <el-col :span="6">
          <div class="data-container">
            <i class="el-icon-document"></i>
            <div class="text-container">
              <span class="text-top">任教课程数</span>
              <span class="text-bottom">{{ courseCount }}</span>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="data-container">
            <i class="el-icon-user"></i>
            <div class="text-container">
              <span class="text-top">学生总人数</span>
              <span class="text-bottom">{{ studentTotalCount }}</span>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="data-container">
            <i class="el-icon-time"></i>
            <div class="text-container">
              <span class="text-top">总课时数</span>
              <span class="text-bottom">{{ totalClassHours }}</span>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="data-container">
            <i class="el-icon-trophy"></i>
            <div class="text-container">
              <span class="text-top">课程通过率</span>
              <span class="text-bottom">{{ serveScore }}</span>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>

    <div class="data-analysis">
      <h2>数据分析</h2>
      <el-row :gutter="40"> <!-- 增加间隔为40px -->
        <el-col :span="8">
          <el-card>
            <div slot="header">年度和学期选择</div>
            <div class="filters">
              <el-select v-model="selectedYear" placeholder="选择年度" @change="fetchData">
                <el-option v-for="year in years" :key="year" :label="year" :value="year"></el-option>
              </el-select>
              <el-select v-model="selectedSemester" placeholder="选择学期" @change="fetchData">
                <el-option v-for="semester in semesters" :key="semester" :label="semester" :value="semester"></el-option>
              </el-select>
              <el-select v-model="selectedCourse" placeholder="选择课程" @change="fetchCourseData">
                <el-option v-for="course in courses" :key="course.id" :label="course.name" :value="course.id"></el-option>
              </el-select>
            </div>
          </el-card>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="24">
          <el-card>
            <div slot="header">课程成绩分布</div>
            <pie-chart3 :chart-data="courseScoreDistribution" v-if="activePieChart" />
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card>
            <div slot="header">平均分</div>
            <div>{{ this.average }}</div>
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
            <div slot="header">挂科率</div>
            <div>{{ failingRate }}%</div>
          </el-card>
        </el-col>
      </el-row>
      <div class="class-scores">
        <h2>班级成员成绩</h2>
        <el-input
          v-model="searchText"
          placeholder="请输入学生姓名进行搜索"
          style="width: 300px; margin-bottom: 10px;"
          clearable
        ></el-input>

        <!-- 表格展示 -->
        <el-table :data="courseScores" style="width: 100%" row-key="name">
          <el-table-column prop="name" label="姓名" width="180"></el-table-column>
          <el-table-column prop="gpa" label="得分" width="180"></el-table-column>
          <el-table-column prop="pass" label="是否通过" width="180"></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button @click="handleExpand(scope.$index, scope.row)">查看详情</el-button>
            </template>
          </el-table-column>
        </el-table>

      </div>
      <div class="teaching-history">
        <h2>教学历史记录</h2>
        <el-table :data="teachingHistory" style="width: 100%">
          <el-table-column prop="name" label="任教课程"></el-table-column>
          <el-table-column prop="type" label="课程类型"></el-table-column>
          <el-table-column prop="credit" label="学分"></el-table-column>
        </el-table>
      </div>

    </div>

  </div>

</template>

<script>
import {
  getCourseInfo,
  getScoreInfoBycId,
  getScoreByCourse,
  getClassInfo,
  getStuInfo, getStuScoreInfoByStuId
} from "@/api/tm/teacher";

import PieChart3 from "@/views/dashboard/PieChart3.vue";


export default {
  components: {
    PieChart3,
  },
  data() {
    return {
      courseList:[],
      average:0,
      id:100,
      selectedYear: '',
      selectedSemester: '',
      courses: [],
      selectedCourse :'',
      excellentRate :0,
      goodRate :0,
      failingRate:0,

      years: [2020, 2021, 2022, 2023, 2024],
      semesters: ['春季', '秋季'],
      courseCount: 0,
      studentTotalCount: 74,
      totalClassHours: 0,
      serveScore: '95%',
      courseAverageScore: 78,
      classScores: [],
      expandedScores: [],
      teachingHistory: [],
      searchText: '',
      activePieChart: true,
      courseScores: [],
      courseScoreDistribution: {
        labels: ['优秀', '良好', '挂科'],
        datasets: [{
          data: [66, 24, 10],
          backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#FF0000'],
          hoverBackgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#FF0000']
        }]
      },
    };
  },
  computed: {
    displayedClassScores() {
      if (!this.searchText.trim()) {
        return this.classScores.slice(0, 5);
      } else {
        return this.classScores.filter(student =>
          student.name.includes(this.searchText.trim())
        );
      }
    }
  },
  created() {
    this.fetchData();
  },
  mounted(){
    this.doTest();
  },
  methods: {
    fetchCourseData() {
      // 根据选择的课程ID获取得分信息
      getScoreInfoBycId(this.selectedCourse).then(res => {
        console.log(res);
        this.courseScores = res.data.map(course => ({
          name: course.studentName,
          gpa: course.average,
          pass: course.pass,
        }));
        let excellentCount = 0;
        let goodCount = 0;
        let failingCount = 0;
        const totalCount = this.courseScores.length;
        let totalGpa = 0;

        this.courseScores.forEach(course => {
          totalGpa += course.gpa;
          if (course.gpa >= 85) {
            excellentCount++;
          } else if (course.gpa >= 60 && course.gpa < 85) {
            goodCount++;
          } else if (course.gpa < 60) {
            failingCount++;
          }
        });
        this.average = totalGpa / totalCount;
        this.excellentRate = (excellentCount / totalCount) * 100;
        this.goodRate = (goodCount / totalCount) * 100;
        this.failingRate = (failingCount / totalCount) * 100;
        this.courseScoreDistribution={
          labels: ['优秀', '良好', '挂科'],
            datasets: [{
            data: [this.excellentRate, this.goodRate, this.failingRate],
            backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#FF0000'],
            hoverBackgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#FF0000']
          }]
        }
      }).catch(error => {
        console.error('Error fetching course scores:', error);
      });
    },

    handleExpand(index, row) {
      this.expandedScores = row.details;
    },
    doTest(){
      getCourseInfo(this.id).then(res=>{
          console.log(res);
          this.courseList = res.data;
          this.courseCount = this.courseList.length;
          // 将课程信息的name、type和credit字段赋值给teachingHistory
          this.teachingHistory = this.courseList.map(course => ({
            name: course.name,
            type: course.type,
            credit: course.credit
          }));
          this.courses= this.courseList.map(course => ({
            id:course.id,
            name: course.name,
          }));
        this.teachingHistory.forEach(course => {
          this.totalClassHours += course.credit*18;
        });
        }).catch(error => {
          console.error('Error fetching course info:', error);
        });
    },

  }

};
</script>

<style scoped>
.teacher-page {
  padding: 32px;
  position: relative;
  height: 100%;
  background-color: rgb(240, 242, 245);
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

.class-scores, .data-analysis, .teaching-history {
  margin-top: 20px;
}

.filters {
  display: flex;
  justify-content: space-between;
}

.filters .el-select {
  width: 45%;
}
</style>
