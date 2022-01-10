package com.threeb.house.payment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.threeb.mypage.vo.BookingVO;

public interface PaymentController {
	
	public ModelAndView getPayment(@RequestParam("id") int house_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewBooking(@ModelAttribute("booking") BookingVO booking, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
