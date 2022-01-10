package com.threeb.house.payment.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.threeb.common.service.CommonService;
import com.threeb.house.payment.service.PaymentService;
import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;
import com.threeb.member.vo.MemberVO;
import com.threeb.mypage.vo.BookingVO;

@Controller("paymentController")
public class PaymentControllerImpl implements PaymentController {	
	
	@Autowired CommonService commonService;
	@Autowired PaymentService paymentService;
	@Autowired HouseVO house;
	@Autowired MemberVO member;
	@Autowired ImageVO image;
		
	//결제페이지
	@Override
	@RequestMapping(value="/house/payment.do", method = RequestMethod.GET)
	public ModelAndView getPayment(@RequestParam("id") int house_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		// 로그인 시 세션에 저장된 회원 정보에서 글쓴이 아이디를 얻어와서 Map에 저장합니다.
		HttpSession session = request.getSession();
		member = (MemberVO) session.getAttribute("member");
		
		house = commonService.selectHouse(house_id);
		image = commonService.selectHouseImageOne(house_id);
		mav.addObject("house", house);
		mav.addObject("image", image);
			
		Map<String, Object> map = new HashMap<String, Object>();
			
		String member_id = member.getMember_id();
		map.put("member_id", member_id);
		map.put("checkin", request.getParameter("checkin"));
		map.put("checkout", request.getParameter("checkout"));
		map.put("gap", request.getParameter("gap"));
		map.put("person", request.getParameter("person"));
		map.put("detail", request.getParameter("detail"));
		mav.addObject("payMap", map);
		
		return mav;
	}
	
	//숙소예약
	@Override
	@RequestMapping(value = "/house/payment/addNewBooking.do", method = RequestMethod.POST)
	public ResponseEntity addNewBooking(@ModelAttribute("booking") BookingVO booking,
									HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		member=(MemberVO)session.getAttribute("member");
		booking.setMember_id(member.getMember_id());
		
		String card_num=request.getParameter("card_num").substring(15,19);
		booking.setCard_num(card_num);
		
		Date date=Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());
		booking.setPaydate(date.toString());
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			paymentService.addNewBooking(booking);
			message = "<script>";
			message += "	alert('예약되었습니다.');";
			message += "	location.href='"+request.getContextPath()+"/mypage/guest.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch (Exception e) {
			message = "<script>";
			message += "	alert('오류가 발생했습니다. 다시 시도해주세요.');";
			message += "	history.back();";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
}
