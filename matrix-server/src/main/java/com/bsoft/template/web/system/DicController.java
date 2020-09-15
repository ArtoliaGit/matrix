package com.bsoft.template.web.system;

import com.bsoft.template.common.Result;
import com.bsoft.template.entity.system.Dic;
import com.bsoft.template.service.system.DicService;
import com.bsoft.template.util.RequestParamPaser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("dic")
public class DicController {

    @Autowired
    private DicService dicService;

    @PostMapping("/save")
    public Result save(@RequestBody Dic dic) {
        return dicService.saveDic(dic);
    }

    @GetMapping("/getList")
    public Result getList(HttpServletRequest request) {
        return dicService.getList(RequestParamPaser.getParameters(request));
    }

    @GetMapping("/remove")
    public Result remove(int id) {
        return dicService.removeById(id);
    }

    @GetMapping("/getDicByCode")
    public Result getDicByCode(String code) {
        return dicService.getDic(code);
    }
}
