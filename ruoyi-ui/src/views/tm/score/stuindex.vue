<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="选课ID" prop="courseId">
        <el-input
          v-model="queryParams.chooseId"
          placeholder="选课ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="课程名" prop="courseName">
        <el-input
          v-model="queryParams.courseName"
          placeholder="课程名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学年" prop="year">
        <el-input
          v-model="queryParams.year"
          placeholder="学年"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学期" prop="term">
        <el-input
          v-model="queryParams.term"
          placeholder="学期"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="scoreList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="选课ID" align="center" prop="chooseId" />
      <el-table-column label="课程名" align="center" prop="courseName" />
      <el-table-column label="学年" align="center" prop="year" />
      <el-table-column label="学期" align="center" prop="term" />
      <el-table-column label="总成绩" align="center" prop="average" />
      <el-table-column label="是否通过" align="center" prop="pass">
        <template slot-scope="scope">
          {{ scope.row.pass === 1 ? '通过' : '未通过' }}
        </template>
      </el-table-column>
      <el-table-column label="排名" align="center" prop="rank" />

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-position"
            @click="handleDetails(scope.row)"
            v-hasPermi="['tm:score:details']"
          >详情</el-button>
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
        <el-form-item label="选课ID" prop="chooseId">
          <el-input v-model="form.chooseId" placeholder="请输入课程ID" />
        </el-form-item>
        <el-form-item label="学期" prop="term">
          <el-input v-model="form.term" placeholder="请输入学期" />
        </el-form-item>
        <el-form-item label="学年" prop="year">
          <el-input v-model="form.year" placeholder="请输入学年" />
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
    <!-- 用户导入对话框 -->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px">
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将文件拖到此处，或
          <em>点击上传</em>
        </div>
        <div class="el-upload__tip" slot="tip">
          <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的用户数据
          <el-link type="info" style="font-size:12px" @click="importTemplate">下载模板</el-link>
        </div>
        <div class="el-upload__tip" style="color:red" slot="tip">提示：仅允许导入“xls”或“xlsx”格式文件！</div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listScore, getScore, delScore, addScore, updateScore, listStuScore } from "@/api/tm/score";
import {getToken} from "@/utils/auth";
import store from '@/store'

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
        chooseId: null,
        year: null,
        term: null,
        courseName: null,
        studentId: store.getters.userId,
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
        chooseId: [
          { required: true, message: "选课ID不能为空", trigger: "blur" }
        ],
        year: [
          { required: true, message: "学年不能为空", trigger: "blur" }
        ],
        term: [
          { required: true, message: "学期不能为空", trigger: "blur" }
        ]
      },
      // 用户导入参数
      upload: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的用户数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/tm/score/importData"
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询课程成绩列表 */
    getList() {
      this.loading = true;
      listStuScore(this.queryParams).then(response => {
        this.scoreList = response.rows;
        this.total = response.total;
        for(let i = 0; i < this.total; i++) {  // 将 是否通过 转换为中文
          if(this.scoreList[i]) {
            this.scoreList[i].pass = (this.scoreList[i].pass === 1 ? "通过" : "未通过");
          }
        }
        console.log(response.rows);
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
        chooseId: null,
        midPor: null,
        midScore: null,
        usualPor: null,
        usualScore: null,
        finalPor: null,
        finalScore: null,
        year: null,
        term: null
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
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = "用户导入";
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      this.download('/tm/score/importTemplate', {
      }, `user_template_${new Date().getTime()}.xlsx`)
    },
    /** 文件上传中处理 */
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    /** 文件上传成功处理 */
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      this.$refs.upload.clearFiles();
      this.$alert(response.msg, "导入结果", { dangerouslyUseHTMLString: true });
      this.getList();
    },
    /** 提交上传文件 */
    submitFileForm() {
      this.$refs.upload.submit();
    }

  }
};
</script>
