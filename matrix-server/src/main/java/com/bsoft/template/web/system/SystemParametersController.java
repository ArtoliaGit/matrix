package com.bsoft.template.web.system;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bsoft.template.common.Result;
import com.bsoft.template.entity.system.SystemParameters;
import com.bsoft.template.service.system.SystemParametersService;
import com.bsoft.template.util.RequestParamPaser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("systemParameters")
public class SystemParametersController {

    @Autowired
    private SystemParametersService systemParametersService;

    @PostMapping("/save")
    public Result save(@RequestBody SystemParameters systemParameters) {
        if (systemParameters.getId() == null) {
            QueryWrapper<SystemParameters> wrapper = new QueryWrapper<>();
            wrapper.eq("code", systemParameters.getCode());
            if (systemParametersService.count(wrapper) > 0) {
                return new Result().fail().message("参数编码已经存在");
            }
        }
        return systemParametersService.saveOrUpdate(systemParameters);
    }

    @GetMapping("/getList")
    public Result getList(HttpServletRequest request) {
        Map<String, String> params = RequestParamPaser.getParameters(request);
        IPage<SystemParameters> page = new Page<>(
                Long.parseLong(params.getOrDefault("page", "1")),
                Long.parseLong(params.getOrDefault("pageSize", "10"))
        );
        QueryWrapper<SystemParameters> wrapper = new QueryWrapper<>();
        if (StringUtils.isNotBlank(params.get("code"))) {
            wrapper.like("code", params.get("code"))
                    .or().like("description", params.get("code"));
        }
        return systemParametersService.getListByPage(page, wrapper);
    }

    @GetMapping("remove")
    public Result remove(int id) {
        return systemParametersService.removeById(id);
    }

    @GetMapping("/getSystemParameter")
    public Result getSystemParameter(String code) {
        QueryWrapper<SystemParameters> wrapper = new QueryWrapper<>();
        wrapper.eq("code", code);
        return systemParametersService.getOne(wrapper);
    }
}
