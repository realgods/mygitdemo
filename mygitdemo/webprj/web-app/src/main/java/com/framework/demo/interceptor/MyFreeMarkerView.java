package com.framework.demo.interceptor;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

public class MyFreeMarkerView extends FreeMarkerView {

    protected void exposeHelpers(Map<String, Object> model, HttpServletRequest request)
    throws Exception {
        model.put("base", request.getContextPath());
        model.put("jsVersion", UUID.randomUUID().toString());
        model.put("cssVersion", UUID.randomUUID().toString());
        super.exposeHelpers(model, request);
    }

}