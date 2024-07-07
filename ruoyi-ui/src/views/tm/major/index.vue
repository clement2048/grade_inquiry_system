<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="专业姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入专业姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="专业开设时间" prop="dura">
        <el-input
          v-model="queryParams.dura"
          placeholder="请输入专业开设时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="毕业所需专必学分" prop="majMust">
        <el-input
          v-model="queryParams.majMust"
          placeholder="请输入毕业所需专必学分"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所需专选学分" prop="majChoose">
        <el-input
          v-model="queryParams.majChoose"
          placeholder="请输入所需专选学分"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所需公必学分" prop="pubMust">
        <el-input
          v-model="queryParams.pubMust"
          placeholder="请输入所需公必学分"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所需公选学分" prop="pubChoose">
        <el-input
          v-model="queryParams.pubChoose"
          placeholder="请输入所需公选学分"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="毕业所需学分" prop="graScore">
        <el-input
          v-model="queryParams.graScore"
          placeholder="请输入毕业所需学分"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属学院id" prop="facId">
        <el-input
          v-model="queryParams.facId"
          placeholder="请输入所属学院id"
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
          v-hasPermi="['tm:major:add']"
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
          v-hasPermi="['tm:major:edit']"
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
          v-hasPermi="['tm:major:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['tm:major:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-upload"
          size="mini"
          @click="handleImport"
          v-hasPermi="['tm:score:import']"
        >导入</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="majorList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="专业id" align="center" prop="id" />
      <el-table-column label="专业姓名" align="center" prop="name" />
      <el-table-column label="专业开设时间" align="center" prop="dura" />
      <el-table-column label="毕业所需专必学分" align="center" prop="majMust" />
      <el-table-column label="所需专选学分" align="center" prop="majChoose" />
      <el-table-column label="所需公必学分" align="center" prop="pubMust" />
      <el-table-column label="所需公选学分" align="center" prop="pubChoose" />
      <el-table-column label="毕业所需学分" align="center" prop="graScore" />
      <el-table-column label="所属学院id" align="center" prop="facId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['tm:major:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['tm:major:remove']"
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

    <!-- 添加或修改专业对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="专业姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入专业姓名" />
        </el-form-item>
        <el-form-item label="专业开设时间" prop="dura">
          <el-input v-model="form.dura" placeholder="请输入专业开设时间" />
        </el-form-item>
        <el-form-item label="毕业所需专必学分" prop="majMust">
          <el-input v-model="form.majMust" placeholder="请输入毕业所需专必学分" />
        </el-form-item>
        <el-form-item label="所需专选学分" prop="majChoose">
          <el-input v-model="form.majChoose" placeholder="请输入所需专选学分" />
        </el-form-item>
        <el-form-item label="所需公必学分" prop="pubMust">
          <el-input v-model="form.pubMust" placeholder="请输入所需公必学分" />
        </el-form-item>
        <el-form-item label="所需公选学分" prop="pubChoose">
          <el-input v-model="form.pubChoose" placeholder="请输入所需公选学分" />
        </el-form-item>
        <el-form-item label="毕业所需学分" prop="graScore">
          <el-input v-model="form.graScore" placeholder="请输入毕业所需学分" />
        </el-form-item>
        <el-form-item label="所属学院id" prop="facId">
          <el-input v-model="form.facId" placeholder="请输入所属学院id" />
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
import { listMajor, getMajor, delMajor, addMajor, updateMajor } from "@/api/tm/major";
import {getToken} from "@/utils/auth";

export default {
  name: "Major",
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
      // 专业表格数据
      majorList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        dura: null,
        majMust: null,
        majChoose: null,
        pubMust: null,
        pubChoose: null,
        graScore: null,
        facId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "专业姓名不能为空", trigger: "blur" }
        ],
        dura: [
          { required: true, message: "专业开设时间不能为空", trigger: "blur" }
        ],
        majMust: [
          { required: true, message: "毕业所需专必学分不能为空", trigger: "blur" }
        ],
        majChoose: [
          { required: true, message: "所需专选学分不能为空", trigger: "blur" }
        ],
        pubMust: [
          { required: true, message: "所需公必学分不能为空", trigger: "blur" }
        ],
        pubChoose: [
          { required: true, message: "所需公选学分不能为空", trigger: "blur" }
        ],
        graScore: [
          { required: true, message: "毕业所需学分不能为空", trigger: "blur" }
        ],
        facId: [
          { required: true, message: "所属学院id不能为空", trigger: "blur" }
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
        url: process.env.VUE_APP_BASE_API + "/tm/major/importData"
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询专业列表 */
    getList() {
      this.loading = true;
      listMajor(this.queryParams).then(response => {
        this.majorList = response.rows;
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
        dura: null,
        majMust: null,
        majChoose: null,
        pubMust: null,
        pubChoose: null,
        graScore: null,
        facId: null
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
      this.title = "添加专业";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getMajor(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改专业";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateMajor(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMajor(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除专业编号为"' + ids + '"的数据项？').then(function() {
        return delMajor(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('tm/major/export', {
        ...this.queryParams
      }, `major_${new Date().getTime()}.xlsx`)
    },
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = "用户导入";
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      this.download('/system/info/importTemplate', {
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
