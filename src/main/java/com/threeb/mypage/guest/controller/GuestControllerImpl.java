package com.threeb.mypage.guest.controller;

import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.threeb.member.vo.MemberVO;
import com.threeb.mypage.guest.service.GuestService;
import com.threeb.mypage.vo.BookingVO;
import com.threeb.mypage.vo.ReviewVO;

@Controller("guestController")
@RequestMapping(value = "/mypage/guest")
public class GuestControllerImpl implements GuestController {
	
	@Autowired GuestService guestService;
	@Autowired MemberVO loginMember;
	@Autowired BookingVO bookingVO;
	@Autowired ReviewVO reviewVO;
	
	//나의 예약 페이지
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView guestPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView(viewName);
		//세션에 저장된 로그인 회원정보 가져오기
		HttpSession session=request.getSession();
		loginMember=(MemberVO)session.getAttribute("member");
		//로그인 회원 예약,후기정보 가져오기
		Map listGuest=guestService.listGuest(loginMember.getMember_id());
		mav.addObject("listGuest", listGuest);
		return mav;
	}
	
	//예약 보기
	@Override
	@RequestMapping(value = "/viewBooking.do", method = RequestMethod.GET)
	public ModelAndView viewBooking(@RequestParam("id") int booking_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		Map listInfo=guestService.bookingReceipt(booking_id);
		ModelAndView mav=new ModelAndView(viewName);
		mav.addObject("listInfo", listInfo);
		return mav;
	}
	
	//예약 취소
	@Override
	@RequestMapping(value = "/cancelBooking.do", method = RequestMethod.GET)
	public ResponseEntity cancelBooking(@RequestParam("id") int booking_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			guestService.cancelBooking(booking_id);
			message="<script>";
			message+="	alert('예약이 취소되었습니다.');";
			message+="	location.href='"+request.getContextPath()+"/mypage/guest.do';";
			message+="</script>";
			resEnt=new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch (Exception e) {
			message="<script>";
			message+="	alert('오류가 발생했습니다. 다시 시도해주세요.');";
			message+="	location.href='"+request.getContextPath()+"/mypage/guest.do';";
			message+="</script>";
			resEnt=new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt; 
	}
	
	//후기 작성 페이지
	@Override
	@RequestMapping(value = "/reviewForm.do", method = RequestMethod.POST)
	public ResponseEntity reviewForm(@RequestParam("id") int booking_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		bookingVO=guestService.bookingInfo(booking_id);
		Gson gson=new Gson();
		String json=gson.toJson(bookingVO);
		resEnt=new ResponseEntity(json, responseHeaders, HttpStatus.OK);
		return resEnt;
	}
	
	//후기 작성
	@Override
	@RequestMapping(value = "/writeReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity writeReview(@ModelAttribute ReviewVO review,HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		review.setHouse_id(bookingVO.getHouse_id());
		review.setMember_id(loginMember.getMember_id());
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			guestService.writeReview(review);
			String result="후기가 작성되었습니다.";
			resEnt=new ResponseEntity(result, responseHeaders, HttpStatus.OK);
		}catch (Exception e) {
			String result="오류가 발생했습니다. 다시 시도해주세요.";
			resEnt=new ResponseEntity(result,responseHeaders, HttpStatus.OK);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	//후기 보기
	@Override
	@RequestMapping(value = "/viewReview.do", method = RequestMethod.GET)
	public ResponseEntity viewReview(@RequestParam("id") int review_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		reviewVO=guestService.reviewInfo(review_id);
		Gson gson=new Gson();
		String json=gson.toJson(reviewVO);
		resEnt=new ResponseEntity(json, responseHeaders, HttpStatus.OK);
		return resEnt;
	}
	
	//후기 수정
	@Override
	@RequestMapping(value = "/modReview.do", method = RequestMethod.POST)
	public ResponseEntity modReview(@ModelAttribute ReviewVO review, HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			guestService.modReview(review);
			String result="후기가 수정되었습니다.";
			resEnt=new ResponseEntity(result, responseHeaders, HttpStatus.OK);
		}catch (Exception e) {
			String result="오류가 발생했습니다. 다시 시도해주세요.";
			resEnt=new ResponseEntity(result,responseHeaders, HttpStatus.OK);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	//후기 삭제
	@Override
	@RequestMapping(value = "/deleteReview.do", method = RequestMethod.GET)
	public ResponseEntity deleteReview(@RequestParam("id") int review_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			guestService.deleteReview(review_id);
			message="<script>";
			message+="	alert('후기가 삭제되었습니다.');";
			message+="	location.href='"+request.getContextPath()+"/mypage/guest.do';";
			message+="</script>";
			resEnt=new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch (Exception e) {
			message="<script>";
			message+="	alert('오류가 발생했습니다. 다시 시도해주세요.');";
			message+="	location.href='"+request.getContextPath()+"/mypage/guest.do';";
			message+="</script>";
			resEnt=new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt; 
	}
	
}
