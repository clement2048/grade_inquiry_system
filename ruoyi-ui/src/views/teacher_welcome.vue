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
              <div>{{ analysisData.excellentRate }}%</div>
            </el-card>
          </el-col>
            <el-col :span="6">
              <el-card>
                <div slot="header">良好率</div>
                <div>{{ analysisData.goodRate }}%</div>
              </el-card>
            </el-col>
            <el-col :span="6">
              <el-card>
                <div slot="header">挂科率</div>
                <div>{{ analysisData.failingRate }}%</div>
              </el-card>
            </el-col>
          </el-row>
        </div>
        <el-row>
          <el-col>
            <div class="rankings">
              <h2>排名</h2>
              <el-table :data="rankings" style="width: 100%">
                <el-table-column prop="semester" label="学期" width="180"></el-table-column>
                <el-table-column prop="grade" label="年级" width="180"></el-table-column>
                <el-table-column prop="class" label="班级" width="180"></el-table-column>
                <el-table-column prop="rank" label="排名" width="180"></el-table-column>
              </el-table>
            </div>
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
            <el-table-column prop="subject" label="科目" width="180"></el-table-column>
            <el-table-column prop="score" label="成绩" width="180"></el-table-column>
          </el-table>
        </div>
        <div class="failing-students" v-if="isHeadTeacher">
          <h2>挂科学生名单</h2>
          <el-table :data="failingStudents" style="width: 100%">
            <el-table-column prop="name" label="姓名" width="180"></el-table-column>
            <el-table-column prop="subject" label="科目" width="180"></el-table-column>
            <el-table-column prop="score" label="成绩" width="180"></el-table-column>
          </el-table>
        </div>

      </el-col>
    </el-row>

  </div>
</template>

<script>
import LineChart from "@/views/dashboard/LineChart.vue";
import PieChart3 from "@/views/dashboard/PieChart3.vue";
import { fetchClassScores, fetchClassComparisonData, fetchFailingStudents, fetchDataAnalysis, fetchRankings } from "@/api/teacher";

export default {
  components: {
    LineChart,
    PieChart3,
  },
  data() {
    return {
      chartData: {
        cType: [],
        score: [],
      },
      pieChartData: {
        labels: ['优秀率', '良好率', '挂科率'],
        datasets: [{
          data: [ 15, 20, 10],
          backgroundColor: [ '#36A2EB', '#FFCE56', '#4BC0C0'],
          hoverBackgroundColor: ['#36A2EB', '#FFCE56', '#4BC0C0'],
        }],
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
      passNum: 1,
      rank: 50,
      rankTotal: 150,
      average: 82,
      scoreCurrent: 60,
      scoreTotal: 160,
      studentCount: 30,
      averageGPA: 3.2,
      excellentStudentCount: 6,
      classScores: [
        { name: '李明', gpa: 3.5, details: [
            { subject: '高等数学', score: 85 },
            { subject: '大学英语', score: 78 },
            { subject: '线性代数', score: 92 },
            { subject: '计算机基础', score: 66 },
            { subject: '大学物理', score: 80 }
          ] },
        { name: '张华', gpa: 3.0, details: [] },
        { name: '王强', gpa: 3.8, details: [] },
        { name: '赵敏', gpa: 2.7, details: [] },
        { name: '陈杰', gpa: 3.2, details: [] },
        { name: '孙丽', gpa: 3.1, details: [] },
        { name: '周勇', gpa: 2.9, details: [] },
        { name: '吴涛', gpa: 2.5, details: [] },
        { name: '郑飞', gpa: 3.4, details: [] },
        { name: '朱娜', gpa: 3.0, details: [] },
        { name: '冯雷', gpa: 3.7, details: [] },
        { name: '何艳', gpa: 3.2, details: [] },
        { name: '吕刚', gpa: 2.8, details: [] },
        { name: '韩梅', gpa: 3.3, details: [] },
        { name: '沈强', gpa: 2.6, details: [] },
        { name: '姚欣', gpa: 3.1, details: [] },
        { name: '郭伟', gpa: 3.5, details: [] },
        { name: '陶静', gpa: 2.9, details: [] },
        { name: '蒋磊', gpa: 3.2, details: [] },
        { name: '戴勇', gpa: 3.0, details: [] },
        { name: '魏鑫', gpa: 3.6, details: [] },
        { name: '蔡霞', gpa: 3.3, details: [] },
        { name: '宋云', gpa: 2.7, details: [] },
        { name: '钟成', gpa: 3.4, details: [] },
        { name: '庞波', gpa: 2.8, details: [] },
        { name: '梁慧', gpa: 3.1, details: [] },
        { name: '段飞', gpa: 3.5, details: [] },
        { name: '谭晓', gpa: 2.9, details: [] },
        { name: '贾宁', gpa: 3.2, details: [] },
        { name: '彭宇', gpa: 2.6, details: [] },
      ],
      failingStudents: [
        { name: '赵敏', subject: '计算机基础', score: 66 },
        { name: '吴涛', subject: '概率论', score: 69 }
      ],
      analysisData: {
        average: 85,
        excellentRate: 20,
        goodRate: 50,
        failingRate: 10
      },
      rankings: [
        { semester: '2023-2024', grade: '大一', class: '一班', rank: 5 },
        { semester: '2023-2024', grade: '大一', class: '二班', rank: 3 },
        { semester: '2023-2024', grade: '大一', class: '三班', rank: 8 },
      ],
      expandedScores: [],
      searchText: '',
      isHeadTeacher: false
    }
  },
  created() {
    this.checkUserRole();
    this.handleSetLineChartData();
    this.getClassScores();
    this.getClassComparisonData();
    this.getDataAnalysis();
    this.getRankings();
    if (this.isHeadTeacher) {
      this.getFailingStudents();
    }
  },
  computed: {
    // 根据搜索文本过滤显示的成绩数据
    displayedClassScores() {
      if (!this.searchText.trim()) {
        // 如果搜索文本为空，则显示前5条数据
        return this.classScores.slice(0, 5);
      } else {
        // 否则根据姓名进行搜索过滤
        return this.classScores.filter(student =>
          student.name.includes(this.searchText.trim())
        );
      }
    }
  },
  methods: {
    checkUserRole() {
      // 检查用户角色，设置 isHeadTeacher 标志
      const userRole = this.$store.getters.roles;
      this.isHeadTeacher = userRole.includes('班主任');
    },
    async getClassScores() {
      // 模拟数据
      // const response = await fetchClassScores();
      // this.classScores = response.data;
    },
    async getClassComparisonData() {
      // 模拟数据
      // const response = await fetchClassComparisonData();
      // this.chartData = response.data;
    },
    async getFailingStudents() {
      // 模拟数据
      // const response = await fetchFailingStudents();
      this.failingStudents = [
        { name: '赵六', subject: '计算机基础', score: 66 },
        { name: '吴十', subject: '概率论', score: 69 }
      ];
    },
    handleExpand(index, row) {
      this.expandedScores = row.details;
    },
    async getDataAnalysis() {
      const response = await fetchDataAnalysis();
      this.analysisData = response.data;

      // 构建饼状图数据
      this.pieChartData = {
        labels: ['平均分', '优秀率', '良好率', '挂科率'],
        datasets: [{
          data: [
            this.analysisData.average,
            this.analysisData.excellentRate,
            this.analysisData.goodRate,
            this.analysisData.failingRate,
          ],
          backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'],
          hoverBackgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'],
        }],
      };
    },
    async getRankings() {
      const response = await fetchRankings();
      this.rankings = response.data;
    },
    changeSelect(val) {
      if (this.value === 0) {
        this.activePieChart = true;
        this.activeLineChart = false;
      } else if (this.value === 1) {
        this.activePieChart = false;
        this.activeLineChart = true;
      }
    }
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
