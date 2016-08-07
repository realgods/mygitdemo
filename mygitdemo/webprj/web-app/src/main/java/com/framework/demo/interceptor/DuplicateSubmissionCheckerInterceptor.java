package com.framework.demo.interceptor;

import java.lang.reflect.Method;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class DuplicateSubmissionCheckerInterceptor extends HandlerInterceptorAdapter {

	public DuplicateSubmissionCheckerInterceptor() {
    }
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
    throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();
			DuplicateSubmissionChecker annotation = (DuplicateSubmissionChecker)method.getAnnotation(DuplicateSubmissionChecker.class);
			if (annotation != null) {
				boolean generateToken = annotation.generateToken();
				if (generateToken) {
                    request.getSession(false).setAttribute(DuplicateSubmissionChecker.TOKEN_NAME, UUID.randomUUID().toString());
				}

				boolean checkToken = annotation.checkToken();
				if (checkToken) {
					if (isRepeatSubmit(request)) {
						return false;
					}
					request.getSession(false).removeAttribute(DuplicateSubmissionChecker.TOKEN_NAME);
				}
			}
		}
		return true;
	}

	private boolean isRepeatSubmit(HttpServletRequest request) {
		String serverToken = (String) request.getSession(false).getAttribute(DuplicateSubmissionChecker.TOKEN_NAME);
		if (serverToken == null) {
			return true;
		}
		String clinetToken = request.getParameter(DuplicateSubmissionChecker.TOKEN_NAME);
		if (clinetToken == null) {
			return true;
		}
		if (!serverToken.equals(clinetToken)) {
			return true;
		}
		return false;
	}

}