package com.threeb.house.search.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.threeb.common.service.CommonService;
import com.threeb.house.search.service.SearchService;
import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;

import net.sf.json.JSONArray;

@Controller("searchController")
@EnableAspectJAutoProxy
public class SearchControllerImpl implements SearchController {
	
	@Autowired SearchService searchService;
	@Autowired CommonService commonService;
	@Autowired HouseVO houseVO;
	
	@Override
	@RequestMapping(value="/house/search.do", method=RequestMethod.GET)
	public ModelAndView searchHouse(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		String address = request.getParameter("address");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		int person = Integer.parseInt(request.getParameter("person"));
		String detail = request.getParameter("detail");
		int gap = (int) ChronoUnit.DAYS.between(LocalDate.parse(start, DateTimeFormatter.ISO_DATE), LocalDate.parse(end, DateTimeFormatter.ISO_DATE));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 페이징 추가코드
		int page = 1; // 현재 쪽 번호
		int limit = 4; // 한 페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			// get으로 전달된 페이지 번호가 있는 경우 실행
			page = Integer.parseInt(request.getParameter("page"));
			// 페이지 번호값을 정수 숫자로 바꿔서 저장
		}
		int startNum = (page-1)*limit;
		map.put("startNum", startNum);
		map.put("location", address);
		map.put("start", start);
		map.put("end", end);
		map.put("gap", gap);
		map.put("person", person);
		map.put("detail", detail);
		
		int cnt = searchService.houseCnt(map);
		// 페이징 쪽 나누기 추가 코드
		int maxpage = (int)((double)cnt/limit + 0.95);
		System.out.println("맥스 페이지: " + maxpage);
		
		map.put("searched", cnt);
		map.put("page", page);
		map.put("maxpage", maxpage);		
		mav.addObject("searchMap", map);
		
		System.out.println("날짜차이 : " + gap);
		List<HouseVO> houseList = searchService.selectHouseList(map);
		List<Integer> houseIdList = new ArrayList<Integer>();
		for(HouseVO i : houseList) {
			houseIdList.add(i.getHouse_id());
		}
		ObjectMapper objMapper = new ObjectMapper();
		JSONArray jsonArray = new JSONArray();
		String jsonList = null;
		for(HouseVO house : houseList) {
			jsonList = objMapper.writeValueAsString(house);
			System.out.println(jsonList);
			jsonArray.add(jsonList);
		}	
		mav.addObject("houseList", jsonArray);
		
		List<List<ImageVO>> houseImgList = commonService.selectHouseImageList(houseIdList);
		mav.addObject("houseImgList", houseImgList);
		
		return mav;
	}

	@Override
	@RequestMapping(value="/house/listArticles.do", method=RequestMethod.GET)
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	
}
