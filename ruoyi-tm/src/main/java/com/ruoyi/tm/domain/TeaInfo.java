package com.ruoyi.tm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 教师信息对象 tea_info
 * 
 * @author clement
 * @date 2024-07-06
 */
public class TeaInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 教师id */
    @Excel(name = "教师id")
    private Long id;

    /** 教师姓名 */
    @Excel(name = "教师姓名")
    private String name;

    /** 教师类型 */
    @Excel(name = "教师类型")
    private String type;

    /** 学生数量 */
    private Long StudentNum;

    public Long getStudentNum() {
		return StudentNum;
	}

    public void setStudentNum(Long studentNum) {
		StudentNum = studentNum;
	}

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
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("type", getType())
            .toString();
    }
}
