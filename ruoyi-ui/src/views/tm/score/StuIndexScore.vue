<template>
  <div class="container">
    <div class="title">
      <el-row type="flex" align="middle" >
        <el-col :span="12" :offset="6">
          <div class="center"><span>成绩</span></div>
        </el-col>
        <el-col :span="6">
          <div class="right">
            <router-link to="/tm/score">
              <el-button type="text">更多</el-button>
            </router-link >
          </div>
        </el-col>
      </el-row>
    </div>
    <el-table  :data="scoreList" >
      <el-table-column label="课程名" align="center" prop="courseName" />
      <el-table-column label="总成绩" align="center" prop="average" />
      <el-table-column label="排名" align="center" prop="rank" />
    </el-table>
  </div>

</template>

<script>


export default {
  name: "ScoreIndex",
  data() {
    return {

    };
  },
  props:{
    scoreList:{
      type: Array,
      require: true
    }
  }
};
</script>

<style scoped>
.container{
  display: flex;
  flex-direction: column;
}
.container .center{
  font-size: 24px;
  margin-left: 120px;
}
.container .right{
  margin-left: 80px;
  font-size: 18px;
}

</style>
