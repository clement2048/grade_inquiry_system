<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="重修次数" prop="numRebuild">
        <el-input
          v-model="queryParams.numRebuild"
          placeholder="请输入重修次数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="补考次数" prop="numMakeup">
        <el-input
          v-model="queryParams.numMakeup"
          placeholder="请输入补考次数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="缓考标志" prop="deferSign">
        <el-input
          v-model="queryParams.deferSign"
          placeholder="请输入缓考标志"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="通过标志(0为通过，1为不通过)" prop="pass">
        <el-input
          v-model="queryParams.pass"
          placeholder="请输入通过标志(0为通过，1为不通过)"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生id" prop="stuId">
        <el-input
          v-model="queryParams.stuId"
          placeholder="请输入学生id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="课程id" prop="courseId">
        <el-input
          v-model="queryParams.courseId"
          placeholder="请输入课程id"
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
          v-hasPermi="['tm:choose:add']"
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
          v-hasPermi="['tm:choose:edit']"
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
          v-hasPermi="['tm:choose:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['tm:choose:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="chooseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="选课id" align="center" prop="id" />
      <el-table-column label="重修次数" align="center" prop="numRebuild" />
      <el-table-column label="补考次数" align="center" prop="numMakeup" />
      <el-table-column label="缓考标志" align="center" prop="deferSign" />
      <el-table-column label="通过标志(0为通过，1为不通过)" align="center" prop="pass" />
      <el-table-column label="学生id" align="center" prop="stuId" />
      <el-table-column label="课程id" align="center" prop="courseId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['tm:choose:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['tm:choose:remove']"
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

    <!-- 添加或修改选课对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="重修次数" prop="numRebuild">
          <el-input v-model="form.numRebuild" placeholder="请输入重修次数" />
        </el-form-item>
        <el-form-item label="补考次数" prop="numMakeup">
          <el-input v-model="form.numMakeup" placeholder="请输入补考次数" />
        </el-form-item>
        <el-form-item label="缓考标志" prop="deferSign">
          <el-input v-model="form.deferSign" placeholder="请输入缓考标志" />
        </el-form-item>
        <el-form-item label="通过标志(0为通过，1为不通过)" prop="pass">
          <el-input v-model="form.pass" placeholder="请输入通过标志(0为通过，1为不通过)" />
        </el-form-item>
        <el-form-item label="学生id" prop="stuId">
          <el-input v-model="form.stuId" placeholder="请输入学生id" />
        </el-form-item>
        <el-form-item label="课程id" prop="courseId">
          <el-input v-model="form.courseId" placeholder="请输入课程id" />
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
import { listChoose, getChoose, delChoose, addChoose, updateChoose } from "@/api/tm/choose";

export default {
  name: "Choose",
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
      // 选课表格数据
      chooseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        numRebuild: null,
        numMakeup: null,
        deferSign: null,
        pass: null,
        stuId: null,
        courseId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        numRebuild: [
          { required: true, message: "重修次数不能为空", trigger: "blur" }
        ],
        numMakeup: [
          { required: true, message: "补考次数不能为空", trigger: "blur" }
        ],
        deferSign: [
          { required: true, message: "缓考标志不能为空", trigger: "blur" }
        ],
        pass: [
          { required: true, message: "通过标志(0为通过，1为不通过)不能为空", trigger: "blur" }
        ],
        stuId: [
          { required: true, message: "学生id不能为空", trigger: "blur" }
        ],
        courseId: [
          { required: true, message: "课程id不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询选课列表 */
    getList() {
      this.loading = true;
      listChoose(this.queryParams).then(response => {
        this.chooseList = response.rows;
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
        numRebuild: null,
        numMakeup: null,
        deferSign: null,
        pass: null,
        stuId: null,
        courseId: null
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
      this.title = "添加选课";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getChoose(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改选课";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateChoose(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addChoose(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除选课编号为"' + ids + '"的数据项？').then(function() {
        return delChoose(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('tm/choose/export', {
        ...this.queryParams
      }, `choose_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
