<template>
  <div class="container">
    <div class="title">
      <el-row type="flex" align="middle" >
        <el-col :span="12" :offset="6">
          <div class="center">成绩</div>
        </el-col>
        <el-col :span="6">
          <div class="right"><el-button type="text">更多</el-button></div>
        </el-col>
      </el-row>
    </div>
    <el-table v-loading="loading" :data="scoreList" >
      <el-table-column label="课程名" align="center" prop="courseName" />
      <el-table-column label="总成绩" align="center" prop="average" />
    </el-table>
  </div>

</template>

<script>
import { listScore, getScore, delScore, addScore, updateScore } from "@/api/tm/score";

export default {
  name: "ScoreIndex",
  data() {
    return {
      // 遮罩层
      loading: false,
      // 总条数
      total: 0,
      // 课程成绩表格数据
      scoreList: [
        {courseName:"计算机组成原理",average:"100"},
        {courseName:"云计算",average:"93"},
        {courseName:"大学英语",average:"87"},
      ],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        courseId: null
      },
      // 表单参数
      form: {},
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询课程成绩列表 */
    getList() {
      // this.loading = true;
      // listScore(this.queryParams).then(response => {
      //   this.scoreList = response.rows;
      //   console.log(response.rows);
      //   this.handleScore();
      //   this.total = response.total;
      //   this.loading = false;
      // });
    },
  }
};
</script>

<style scoped>
.container{
  display: flex;
  flex-direction: column;
}
.center{
  font-size: 24px;
  margin-left: 120px;
}
.right{
  margin-left: 80px;
  font-size: 18px;
}

</style>
