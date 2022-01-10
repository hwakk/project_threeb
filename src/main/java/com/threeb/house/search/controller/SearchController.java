package com.threeb.house.search.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public interface SearchController {
	
	//숙소 검색
	public ModelAndView searchHouse(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//리스트 표시
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
