<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="课程名字" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入课程名字"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="人数限制" prop="peoLimit">
        <el-input
          v-model="queryParams.peoLimit"
          placeholder="请输入人数限制"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学分" prop="credit">
        <el-input
          v-model="queryParams.credit"
          placeholder="请输入学分"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="总学时" prop="totTime">
        <el-input
          v-model="queryParams.totTime"
          placeholder="请输入总学时"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开办学年" prop="startYear">
        <el-input
          v-model="queryParams.startYear"
          placeholder="请输入开办学年"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开办学期" prop="startSem">
        <el-input
          v-model="queryParams.startSem"
          placeholder="请输入开办学期"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="开办学院id" prop="facId">
        <el-input
          v-model="queryParams.facId"
          placeholder="请输入开办学院id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="授课老师id" prop="teachId">
        <el-input
          v-model="queryParams.teachId"
          placeholder="请输入授课老师id"
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
          v-hasPermi="['tm:Course:add']"
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
          v-hasPermi="['tm:Course:edit']"
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
          v-hasPermi="['tm:Course:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['tm:Course:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-upload"
          size="mini"
          @click="handleImport"
          v-hasPermi="['tm:Course:import']"
        >导入</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="CourseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="课程id" align="center" prop="id" />
      <el-table-column label="课程名字" align="center" prop="name" />
      <el-table-column label="课程类型" align="center" prop="type" />
      <el-table-column label="人数限制" align="center" prop="peoLimit" />
      <el-table-column label="学分" align="center" prop="credit" />
      <el-table-column label="总学时" align="center" prop="totTime" />
      <el-table-column label="期末考试方法" align="center" prop="finalMethod" />
      <el-table-column label="开办学年" align="center" prop="startYear" />
      <el-table-column label="开办学期" align="center" prop="startSem" />
      <el-table-column label="开办学院id" align="center" prop="facId" />
      <el-table-column label="授课老师id" align="center" prop="teachId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['tm:Course:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['tm:Course:remove']"
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

    <!-- 添加或修改课程信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="课程名字" prop="name">
          <el-input v-model="form.name" placeholder="请输入课程名字" />
        </el-form-item>
        <el-form-item label="课程类型" prop="type">
          <el-radio-group v-model="form.type">
            <el-radio :label="'专必'">专必</el-radio>
            <el-radio :label="'专选'">专选</el-radio>
            <el-radio :label="'公必'">公必</el-radio>
            <el-radio :label="'公选'">公选</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="人数限制" prop="peoLimit">
          <el-input v-model="form.peoLimit" placeholder="请输入人数限制" />
        </el-form-item>
        <el-form-item label="学分" prop="credit">
          <el-input v-model="form.credit" placeholder="请输入学分" />
        </el-form-item>
        <el-form-item label="总学时" prop="totTime">
          <el-input v-model="form.totTime" placeholder="请输入总学时" />
        </el-form-item>
        <el-form-item label="期末考试方法" prop="totTime">
          <el-radio-group v-model="form.finalMethod">
            <el-radio :label="'考试'">考试</el-radio>
            <el-radio :label="'考察'">考察</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="开办学年" prop="startYear">
          <el-input v-model="form.startYear" placeholder="请输入开办学年" />
        </el-form-item>
        <el-form-item label="开办学期" prop="startSem">
          <el-input v-model="form.startSem" placeholder="请输入开办学期" />
        </el-form-item>
        <el-form-item label="开办学院id" prop="facId">
          <el-input v-model="form.facId" placeholder="请输入开办学院id" />
        </el-form-item>
        <el-form-item label="授课老师id" prop="teachId">
          <el-input v-model="form.teachId" placeholder="请输入授课老师id" />
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
import { listCourse, getCourse, delCourse, addCourse, updateCourse } from "@/api/tm/Course";
import {getToken} from "@/utils/auth";

export default {
  name: "Course",
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
      // 课程信息表格数据
      CourseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        type: null,
        peoLimit: null,
        credit: null,
        totTime: null,
        finalMethod: null,
        startYear: null,
        startSem: null,
        facId: null,
        teachId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "课程名字不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "课程类型不能为空", trigger: "change" }
        ],
        peoLimit: [
          { required: true, message: "人数限制不能为空", trigger: "blur" }
        ],
        credit: [
          { required: true, message: "学分不能为空", trigger: "blur" }
        ],
        totTime: [
          { required: true, message: "总学时不能为空", trigger: "blur" }
        ],
        finalMethod: [
          { required: true, message: "期末考试方法不能为空", trigger: "change" }
        ],
        startYear: [
          { required: true, message: "开办学年不能为空", trigger: "blur" }
        ],
        startSem: [
          { required: true, message: "开办学期不能为空", trigger: "blur" }
        ],
        facId: [
          { required: true, message: "开办学院id不能为空", trigger: "blur" }
        ],
        teachId: [
          { required: true, message: "授课老师id不能为空", trigger: "blur" }
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
        url: process.env.VUE_APP_BASE_API + "/tm/Course/importData"
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询课程信息列表 */
    getList() {
      this.loading = true;
      listCourse(this.queryParams).then(response => {
        this.CourseList = response.rows;
        // console.log(this.CourseList)
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
        name: null,
        type: "",
        peoLimit: null,
        credit: null,
        totTime: null,
        finalMethod: null,
        startYear: null,
        startSem: null,
        facId: null,
        teachId: null,

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
      this.title = "添加课程信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCourse(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改课程信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCourse(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCourse(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除课程信息编号为"' + ids + '"的数据项？').then(function() {
        return delCourse(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('tm/Course/export', {
        ...this.queryParams
      }, `Course_${new Date().getTime()}.xlsx`)
    },
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = "用户导入";
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      this.download('/tm/Course/importTemplate', {
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
