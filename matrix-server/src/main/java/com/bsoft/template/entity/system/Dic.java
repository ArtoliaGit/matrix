package com.bsoft.template.entity.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.List;

/**
 * 字典
 */
@Data
@TableName("dic")
public class Dic {

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 字典编码
     */
    private String code;

    /**
     * 字典名称
     */
    private String name;

    /**
     * 字典描述
     */
    private String description;

    /**
     * 字典项
     */
    @TableField(exist = false)
    private List<DicDetails> dicDetails;
}

