package com.threeb.house.info.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.threeb.common.service.CommonService;
import com.threeb.house.info.service.InfoService;
import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;
import com.threeb.member.vo.MemberVO;
import com.threeb.mypage.vo.ReviewVO;

@Controller("infoController")
@EnableAspectJAutoProxy
public class InfoControllerImpl implements InfoController {
	
	@Autowired CommonService commonService;
	@Autowired InfoService infoService;
	@Autowired HouseVO house;
	
	//상세페이지
	@Override
	@RequestMapping(value="/house/info.do", method=RequestMethod.GET)
	public ModelAndView infoHouse(@RequestParam("id") int house_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		house = commonService.selectHouse(house_id);
		List<ReviewVO> listReview=infoService.listReview(house_id);
		List<ImageVO> listImage=commonService.selectHouseImage(house_id);
		mav.addObject("house", house);
		mav.addObject("listReview", listReview);
		mav.addObject("listImage", listImage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("house_id", house_id);
		map.put("checkin", request.getParameter("checkin"));
		map.put("checkout", request.getParameter("checkout"));
		map.put("gap", request.getParameter("gap"));
		map.put("person", request.getParameter("person"));
		map.put("detail", request.getParameter("detail"));
		map.put("host", request.getParameter("host"));
		mav.addObject("infoMap", map);
		return mav;
	}
	
}
