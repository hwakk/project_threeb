package com.threeb.mypage.host.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface HostController {
	
	public ModelAndView uploadForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewHouse(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ResponseEntity deleteHouse(@RequestParam("id") int house_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity cancelBooking(@RequestParam("id") int booking_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
