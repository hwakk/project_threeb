package com.threeb.main.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("mainController")
public class MainControllerImpl implements MainController {
	
	//메인페이지
	@RequestMapping(value = {"/", "/main.do"}, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView(viewName);
		return mav;
	}

}
