package com.framework.demo.interceptor;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface DuplicateSubmissionChecker {
	public static final String TOKEN_NAME = "Token";
	
	boolean generateToken() default false;

	boolean checkToken() default false;
}
