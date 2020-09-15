package com.bsoft.template.entity.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 系统参数表
 */
@Data
@TableName("system_parameters")
public class SystemParameters {

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 参数编码
     */
    private String code;

    /**
     * 参数值
     */
    private String value;

    /**
     * 参数描述
     */
    private String description;
}

