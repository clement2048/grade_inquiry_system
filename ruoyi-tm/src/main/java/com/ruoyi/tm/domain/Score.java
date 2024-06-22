package com.ruoyi.tm.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


// 注意，这个弃用了，但是暂时先放这里以备不时之需
// 最新的成绩信息请看score_info表单
public class Score extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    @Excel(name = "得分id")
    private Long id;

    /** 课程学分 */
    private int score;

    /** 课程类别 */
    @Excel(name = "课程类型")
    private String ctype;

    public void setId(Long id){
        this.id = id;
    }

    public Long getId(){
        return id;
    }

    public void setScore(int score)
    {
        this.score = score;
    }

    public int getScore()
    {
        return score;
    }

    public void setCtype(String ctype)
    {
        this.ctype = ctype;
    }

    public String getCtype()
    {
        return ctype;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("score", getScore())
                .append("ctype", getCtype())
                .toString();
    }
}

