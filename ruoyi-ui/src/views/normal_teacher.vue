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
              <span class="text-top">评教</span>
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
        <el-col :span="12">
          <el-card>
            <div slot="header">课程成绩分布</div>
            <pie-chart3 :chart-data="courseScoreDistribution" v-if="activePieChart" />
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card>
            <div slot="header">课程平均分</div>
            <div>{{ courseAverageScore }}</div>
          </el-card>
        </el-col>
      </el-row>
      <div class="teaching-history">
        <h2>教学历史记录</h2>
        <el-table :data="teachingHistory" style="width: 100%">
          <el-table-column prop="year" label="年度"></el-table-column>
          <el-table-column prop="semester" label="学期"></el-table-column>
          <el-table-column prop="courses" label="任教课程"></el-table-column>
        </el-table>
      </div>

    </div>

  </div>

</template>

<script>
import PieChart3 from "@/views/dashboard/PieChart3.vue";

export default {
  components: {
    PieChart3,
  },
  data() {
    return {
      selectedYear: '',
      selectedSemester: '',
      years: [2020, 2021, 2022, 2023, 2024],
      semesters: ['春季', '秋季'],
      courseCount: 3,
      studentTotalCount: 74,
      totalClassHours: 120,
      serveScore: 95,
      courseAverageScore: 78,
      classScores: [],
      expandedScores: [],
      courses: [
        { id: '1', name: '高等数学' },
        { id: '2', name: '大学英语' },
        { id: '3', name: '计算机基础' },
        { id: '4', name: '线性代数' },
        { id: '5', name: '大学物理' },
      ],
      teachingHistory: [
        { year: 2020, semester: '春季', courses: ['高等数学', '大学英语'] },
        { year: 2020, semester: '秋季', courses: ['线性代数', '计算机基础'] },
        { year: 2021, semester: '春季', courses: ['高等数学', '大学物理'] },
        { year: 2021, semester: '秋季', courses: ['线性代数', '计算机基础'] },
        { year: 2022, semester: '春季', courses: ['高等数学', '大学英语'] },
        { year: 2022, semester: '秋季', courses: ['线性代数', '计算机基础'] },
        { year: 2023, semester: '春季', courses: ['高等数学', '大学英语'] },
        { year: 2023, semester: '秋季', courses: ['线性代数', '计算机基础'] },
        { year: 2024, semester: '春季', courses: ['高等数学', '大学物理'] },
        { year: 2024, semester: '秋季', courses: ['线性代数', '计算机基础'] }
      ],
      searchText: '',
      activePieChart: true,
      courseScoreDistribution: {
        labels: ['优秀', '良好', '及格', '不及格'],
        datasets: [{
          data: [10, 25, 10, 5],
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
  methods: {
    async fetchData() {
      if (this.selectedYear && this.selectedSemester) {
        // 模拟数据
        this.classScores = [
          { name: '李明', gpa: 3.5, details: [
              {subject: '高等数学', score: 85},
              {subject: '大学英语', score: 78},
              {subject: '线性代数', score: 92},
              {subject: '计算机基础', score: 66},
              {subject: '大学物理', score: 80}
            ]
          },
          {name: '张华', gpa: 3.0, details: []},
          {name: '王强', gpa: 3.8, details: []},
          {name: '赵敏', gpa: 2.7, details: []},
          {name: '陈杰', gpa: 3.2, details: []}
        ];
        this.courseCount = 3;
        this.studentTotalCount = 50;
        this.totalClassHours = 120;
        this.averageScore = 75;
        this.courseAverageScore = 78;
      }
    },
    handleExpand(index, row) {
      this.expandedScores = row.details;
    }
  },
  created() {
    this.fetchData();
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
