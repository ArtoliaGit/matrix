package com.bsoft.template.entity.system;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("dic_details")
public class DicDetails {
    /**
     * 字典编码
     */
    private String code;

    /**
     * 字典项编码
     */
    private String key;

    /**
     * 字典项名称
     */
    private String label;

    /**
     * 排序
     */
    private Integer sort;
}

