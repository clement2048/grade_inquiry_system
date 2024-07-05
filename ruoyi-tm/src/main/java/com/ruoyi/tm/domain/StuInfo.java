package com.ruoyi.tm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * Student对象 stu_info
 * 
 * @author clement
 * @date 2024-06-18
 */
public class StuInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户id */
    private Long id;

    /** 学生id(学号)*/
    @Excel(name = "学生id")
    private String user_name;

    /** 密码*/
    private String password;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String name;

    /** 学生性别 */
    @Excel(name = "学生性别")
    private String sex;

    /** 学生类型 */
    @Excel(name = "学生类型")
    private String type;

    /** 入学方法 */
    @Excel(name = "入学方法")
    private String admMethod;

    /** 是否在校 */
    @Excel(name = "是否在校")
    private Long inSchool;

    /** 学生状态 */
    @Excel(name = "学生状态")
    private Long stuStatus;

    /** 班级id */
    @Excel(name = "班级id")
    private Long classId;

    /** 专业id */
    @Excel(name = "专业id")
    private Long majorId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getSex()
    {
        return sex;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getType() 
    {
        return type;
    }
    public void setAdmMethod(String admMethod) 
    {
        this.admMethod = admMethod;
    }

    public String getAdmMethod() 
    {
        return admMethod;
    }
    public void setInSchool(Long inSchool) 
    {
        this.inSchool = inSchool;
    }

    public Long getInSchool() 
    {
        return inSchool;
    }
    public void setStuStatus(Long stuStatus) 
    {
        this.stuStatus = stuStatus;
    }

    public Long getStuStatus() 
    {
        return stuStatus;
    }
    public void setClassId(Long classId) 
    {
        this.classId = classId;
    }

    public Long getClassId() 
    {
        return classId;
    }
    public void setMajorId(Long majorId) 
    {
        this.majorId = majorId;
    }

    public Long getMajorId() 
    {
        return majorId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("sex", getSex())
            .append("type", getType())
            .append("admMethod", getAdmMethod())
            .append("inSchool", getInSchool())
            .append("stuStatus", getStuStatus())
            .append("classId", getClassId())
            .append("majorId", getMajorId())
            .toString();
    }
}
