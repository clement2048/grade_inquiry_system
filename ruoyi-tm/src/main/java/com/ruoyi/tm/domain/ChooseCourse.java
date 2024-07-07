package com.ruoyi.tm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 选课对象 choose_course
 * 
 * @author clement
 * @date 2024-07-06
 */
public class ChooseCourse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 选课id */
    private Long id;

    /** 重修次数 */
    @Excel(name = "重修次数")
    private Long numRebuild;

    /** 补考次数 */
    @Excel(name = "补考次数")
    private Long numMakeup;

    /** 缓考标志 */
    @Excel(name = "缓考标志")
    private Long deferSign;

    /** 通过标志(0为通过，1为不通过) */
    @Excel(name = "通过标志(0为通过，1为不通过)")
    private Long pass;

    /** 学生id */
    @Excel(name = "学生id")
    private Long stuId;

    /** 课程id */
    @Excel(name = "课程id")
    private Long courseId;

    /** 通过人数 */
    private Long passNum;

    public Long getPassNum() {
		return passNum;
	}

    public void setPassNum(Long passNum) {
		this.passNum = passNum;
	}


    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setNumRebuild(Long numRebuild) 
    {
        this.numRebuild = numRebuild;
    }

    public Long getNumRebuild() 
    {
        return numRebuild;
    }
    public void setNumMakeup(Long numMakeup) 
    {
        this.numMakeup = numMakeup;
    }

    public Long getNumMakeup() 
    {
        return numMakeup;
    }
    public void setDeferSign(Long deferSign) 
    {
        this.deferSign = deferSign;
    }

    public Long getDeferSign() 
    {
        return deferSign;
    }
    public void setPass(Long pass) 
    {
        this.pass = pass;
    }

    public Long getPass() 
    {
        return pass;
    }
    public void setStuId(Long stuId) 
    {
        this.stuId = stuId;
    }

    public Long getStuId() 
    {
        return stuId;
    }
    public void setCourseId(Long courseId) 
    {
        this.courseId = courseId;
    }

    public Long getCourseId() 
    {
        return courseId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("numRebuild", getNumRebuild())
            .append("numMakeup", getNumMakeup())
            .append("deferSign", getDeferSign())
            .append("pass", getPass())
            .append("stuId", getStuId())
            .append("courseId", getCourseId())
            .toString();
    }
}
