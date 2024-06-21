package com.ruoyi.tm.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 成绩管理对象 score_info
 * 
 * @author clement
 * @date 2024-06-21
 */
public class ScoreInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 成绩id */
    private Long id;

    /** 平时成绩占比 */
    @Excel(name = "平时成绩占比")
    private Long usualPor;

    /** 平时成绩 */
    @Excel(name = "平时成绩")
    private Long usualSco;

    /** 期中成绩占比 */
    @Excel(name = "期中成绩占比")
    private Long midPor;

    /** 期中成绩 */
    @Excel(name = "期中成绩")
    private Long midSco;

    /** 期末成绩占比 */
    @Excel(name = "期末成绩占比")
    private Long finalPor;

    /** 期末成绩 */
    @Excel(name = "期末成绩")
    private Long finalSco;

    /** 其他备注 */
    @Excel(name = "其他备注")
    private String others;

    /** 选课id */
    @Excel(name = "选课id")
    private Long chooseId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUsualPor(Long usualPor) 
    {
        this.usualPor = usualPor;
    }

    public Long getUsualPor() 
    {
        return usualPor;
    }
    public void setUsualSco(Long usualSco) 
    {
        this.usualSco = usualSco;
    }

    public Long getUsualSco() 
    {
        return usualSco;
    }
    public void setMidPor(Long midPor) 
    {
        this.midPor = midPor;
    }

    public Long getMidPor() 
    {
        return midPor;
    }
    public void setMidSco(Long midSco) 
    {
        this.midSco = midSco;
    }

    public Long getMidSco() 
    {
        return midSco;
    }
    public void setFinalPor(Long finalPor) 
    {
        this.finalPor = finalPor;
    }

    public Long getFinalPor() 
    {
        return finalPor;
    }
    public void setFinalSco(Long finalSco) 
    {
        this.finalSco = finalSco;
    }

    public Long getFinalSco() 
    {
        return finalSco;
    }
    public void setOthers(String others) 
    {
        this.others = others;
    }

    public String getOthers() 
    {
        return others;
    }
    public void setChooseId(Long chooseId) 
    {
        this.chooseId = chooseId;
    }

    public Long getChooseId() 
    {
        return chooseId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("usualPor", getUsualPor())
            .append("usualSco", getUsualSco())
            .append("midPor", getMidPor())
            .append("midSco", getMidSco())
            .append("finalPor", getFinalPor())
            .append("finalSco", getFinalSco())
            .append("others", getOthers())
            .append("chooseId", getChooseId())
            .toString();
    }
}
