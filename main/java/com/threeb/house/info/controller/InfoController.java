package com.threeb.house.info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface InfoController {
	//숙소 상세 정보 표시
	public ModelAndView infoHouse(@RequestParam("id") int house_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
