package com.xiaolu.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.xiaolu.util.Logger;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	protected Logger logger = Logger.getLogger(this.getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Class<?> clazz = handlerMethod.getBeanType();
			Method method = handlerMethod.getMethod();
			AuthPassport annotationT = clazz.getAnnotation(AuthPassport.class);
			AuthPassport annotationM = method.getAnnotation(AuthPassport.class);
			// 在类或者方法上标记注解
			if (annotationT != null || annotationM != null) {
			}
		}
		return true;
	}

}
