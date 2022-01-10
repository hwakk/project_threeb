package com.threeb.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.threeb.member.vo.MemberVO;

public class ViewNameInterceptor extends HandlerInterceptorAdapter {
	
	protected Log log=LogFactory.getLog(ViewNameInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try {
			String viewName=getViewName(request);
			System.out.println("viewName:"+viewName);
			request.setAttribute("viewName", viewName);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
	}
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath=request.getContextPath();
		String uri=(String)request.getAttribute("javax.servlet.include.request_uri");
		if(uri==null||uri.trim().equals("")) {
			uri=request.getRequestURI();
		}
		
		int begin=0;
		if(!((contextPath==null)||("".equals(contextPath)))) {
			begin=contextPath.length();
		}
		
		int end;
		if(uri.indexOf(";")!=-1) {
			end=uri.indexOf(";");
		}else if(uri.indexOf("?")!=-1) {
			end=uri.indexOf("?");
		}else {
			end=uri.length();
		}
		
		String fileName=uri.substring(begin, end);
		if(fileName.indexOf(".")!=-1) {
			fileName=fileName.substring(0, fileName.lastIndexOf("."));
		}
		if(fileName.lastIndexOf("/")!=-1) {
			fileName=fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());
		}
		return fileName;
	}
	
	

}
