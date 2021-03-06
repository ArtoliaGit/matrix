package com.bsoft.template.common.exception;

import com.bsoft.template.common.Result;
import com.bsoft.template.common.ResultCodeEnum;
import com.bsoft.template.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
@Component
public class CustomHttp403ForbiddenEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        if ("/".equals(request.getRequestURI())) {
            response.sendRedirect("/index.html");
        } else {
            log.info("访问被拒绝，没有权限");
            response.setStatus(HttpStatus.FORBIDDEN.value());
            response.setContentType("application/json;charset=UTF-8");
            Result result = new Result();
            result.code(ResultCodeEnum.FORBIDDEN.getCode()).message("访问被拒绝，没有权限");
            response.getWriter().write(GsonUtil.objectToJson(result));
        }
    }
}
