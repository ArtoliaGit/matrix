package com.bsoft.template.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bsoft.template.entity.system.Dic;
import com.bsoft.template.entity.system.DicDetails;

import java.util.List;
import java.util.Map;

public interface DicMapper extends BaseMapper<Dic> {

    int saveDicDetails(DicDetails dicDetails);

    List<DicDetails> getDicDetails(String code);

    int removeDicDetails(String code);

    int count(String code);

    IPage<Dic> getDicList(Page<Dic> page, Map<String, String> params);

    Dic getDic(String code);
}
