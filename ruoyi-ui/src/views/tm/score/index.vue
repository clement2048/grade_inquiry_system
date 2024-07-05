<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="课程ID" prop="courseId">
        <el-input
          v-model="queryParams.courseId"
          placeholder="请输入课程ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['tm:score:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['tm:score:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['tm:score:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['tm:score:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="scoreList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="课程名" align="center" prop="courseName" />
      <el-table-column label="总成绩" align="center" prop="totalSco" />


      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-position"
            @click="handleDetails(scope.row)"
            v-hasPermi="['tm:score:details']"
          >详情</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['tm:score:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['tm:score:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改课程成绩对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" :disabled="isDisabled">
        <el-form-item label="课程名" prop="courseName">
        <el-input v-model="form.courseName" placeholder="请输入课程名" />
        </el-form-item>
        <el-form-item label="平时占比" prop="usualPor">
          <el-input v-model="form.usualPor" placeholder="输入平时成绩占比" />
        </el-form-item>
        <el-form-item label="平时成绩" prop="usualSco">
          <el-input v-model="form.usualSco" placeholder="请输入平时成绩" />
        </el-form-item>
        <el-form-item label="期中占比" prop="midPor">
          <el-input v-model="form.midPor" placeholder="请输入期中成绩占比" />
        </el-form-item>
        <el-form-item label="期中成绩" prop="midSco">
          <el-input v-model="form.midSco" placeholder="请输入期中成绩" />
        </el-form-item>
        <el-form-item label="期末占比" prop="finalPor">
          <el-input v-model="form.finalPor" placeholder="请输入期末成绩占比" />
        </el-form-item>
        <el-form-item label="期末成绩" prop="finalSco">
          <el-input v-model="form.finalSco" placeholder="请输入期末成绩" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listScore, getScore, delScore, addScore, updateScore } from "@/api/tm/score";

export default {
  name: "Score",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 课程成绩表格数据
      scoreList: [],
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
      // 表单是否可修改
      isDisabled: false,
      // 表单校验
      rules: {
        usualSco: [
          { required: true, message: "平时成绩不能为空", trigger: "blur" }
        ],
        usualPor: [
          { required: true, message: "平时成绩占比不能为空", trigger: "blur" }
        ],
        midSco: [
          { required: true, message: "期中成绩不能为空", trigger: "blur" }
        ],
        midPor: [
          { required: true, message: "期中成绩占比不能为空", trigger: "blur" }
        ],
        finalSco: [
          { required: true, message: "期末成绩不能为空", trigger: "blur" }
        ],
        finalPor: [
          { required: true, message: "期末成绩占比不能为空", trigger: "blur" }
        ],
        courseName: [
          { required: true, message: "课程名不能为空", trigger: "blur" }
        ]
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询课程成绩列表 */
    getList() {
      this.loading = true;
      listScore(this.queryParams).then(response => {
        this.scoreList = response.rows;
        // console.log(response);
        this.handleScore();
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        courseName: null,
        midPor: null,
        midScore: null,
        usualPor: null,
        usualScore: null,
        finalPor: null,
        finalScore: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加课程成绩";
      this.isDisabled = false;
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getScore(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改课程成绩";
        this.isDisabled = false;
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.title === "查看课程成绩"){
            this.open = false;
          } else if (this.form.id != null) {
            updateScore(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addScore(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除课程成绩编号为"' + ids + '"的数据项？').then(function() {
        return delScore(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('tm/score/export', {
        ...this.queryParams
      }, `score_${new Date().getTime()}.xlsx`)
    },
    handleScore(){
      for(let i=0;i<this.scoreList.length;i++){
        let totalSco = 0;
        let usual_sco = this.scoreList[i].usualSco;
        let mid_sco = this.scoreList[i].midSco;
        let final_sco = this.scoreList[i].finalSco;
        let usual_por = this.scoreList[i].usualPor / 100;
        let mid_por = this.scoreList[i].midPor /100;
        let final_por = this.scoreList[i].finalPor /100;
        totalSco = usual_por*usual_sco + mid_por*mid_sco + final_por*final_sco;
        this.scoreList[i].totalSco=totalSco;
      }
    },
    /** 详情按钮操作 */
    handleDetails(row) {
      this.reset();
      const id = row.id || this.ids
      getScore(id).then(response => {
      this.form = response.data;
      this.open = true;
      this.title = "查看课程成绩";
      this.isDisabled = true;
      })
    },
  }
};
</script>
