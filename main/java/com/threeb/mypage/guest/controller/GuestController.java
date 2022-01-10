package com.threeb.mypage.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.threeb.mypage.vo.ReviewVO;

public interface GuestController {
	
	public ModelAndView viewBooking(@RequestParam("id") int booking_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity cancelBooking(@RequestParam("id") int booking_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity reviewForm(@RequestParam("id") int booking_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity writeReview(@ModelAttribute("review") ReviewVO review, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity viewReview(@RequestParam("id") int review_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modReview(@ModelAttribute("review") ReviewVO review, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity deleteReview(@RequestParam("id") int review_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
