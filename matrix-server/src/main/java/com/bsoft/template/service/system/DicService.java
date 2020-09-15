package com.bsoft.template.service.system;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bsoft.template.common.Result;
import com.bsoft.template.common.ResultCodeEnum;
import com.bsoft.template.entity.system.Dic;
import com.bsoft.template.mapper.system.DicMapper;
import com.bsoft.template.service.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service
public class DicService extends BaseServiceImpl<DicMapper, Dic> {

    @Transactional
    public Result saveDic(Dic dic) {
        if (dic.getId() == null) {
            if (baseMapper.count(dic.getCode()) > 0) {
                return new Result().fail().message("字典编码已经存在");
            }
            baseMapper.insert(dic);
            if (dic.getDicDetails() != null) {
                dic.getDicDetails().forEach(item -> baseMapper.saveDicDetails(item));
            }
        } else {
            baseMapper.updateById(dic);
            baseMapper.removeDicDetails(dic.getCode());
            if (dic.getDicDetails() != null) {
                dic.getDicDetails().forEach(item -> baseMapper.saveDicDetails(item));
            }
        }

        return new Result().ok().message("保存成功").data(dic);
    }

    public Result getList(Map<String, String> params) {
        Result result = new Result();

        Page<Dic> page = new Page<>(
                Long.parseLong(params.getOrDefault("page", "1")),
                Long.parseLong(params.getOrDefault("pageSize", "10"))
        );

        IPage<Dic> iPage = baseMapper.getDicList(page, params);

        result.code(ResultCodeEnum.OK.getCode())
                .message("查询成功")
                .data(iPage.getRecords())
                .total(iPage.getTotal());
        return result;
    }

    public Result getDic(String code) {
        Dic dic = baseMapper.getDic(code);
        return new Result().ok().data(dic);
    }

}
