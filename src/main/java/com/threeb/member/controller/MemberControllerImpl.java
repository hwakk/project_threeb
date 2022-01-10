package com.threeb.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.threeb.member.service.MemberService;
import com.threeb.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value = "/member")
public class MemberControllerImpl implements MemberController {
	
	@Autowired private MemberService memberService;
	@Autowired MemberVO memberVO;
	
	//회원가입, 로그인페이지
	@RequestMapping(value = "/*Form.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value = "result", required = false) String result,
							 HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		ModelAndView mav=new ModelAndView(viewName);
		mav.addObject("result", result);
		
		String referer=request.getHeader("Referer");
		session.setAttribute("refUrl", referer.substring(21));
		return mav;
	}
	
	//회원가입
	@Override
	@RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("member") MemberVO member,
								  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEnt=null;
		String id_check=memberService.overlapped(member.getMember_id());
		if(id_check.equals("false")) {
			try {
				memberService.addMember(member);
				String result="true";
				resEnt=new ResponseEntity(result, HttpStatus.OK);
			}catch (Exception e) {
				String result="false";
				resEnt=new ResponseEntity(result, HttpStatus.OK);
				e.printStackTrace();
			}
		}else {
			String result="id_false";
			resEnt=new ResponseEntity(result, HttpStatus.OK);
		}
		return resEnt;
	}
	
	//로그인
	@RequestMapping(value="/login.do", method= RequestMethod.POST)
	public ResponseEntity login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
							  HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEnt=null;
		memberVO=memberService.login(member);
		if(memberVO!=null&&memberVO.getMember_id()!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("member", memberVO);
			String result="true";
			resEnt=new ResponseEntity(result, HttpStatus.OK);
		}else {
			String result="false";
			resEnt=new ResponseEntity(result, HttpStatus.OK);
		}
		return resEnt;
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav=new ModelAndView();
		
		String referer=request.getHeader("Referer").substring(21);
		if(referer.length()>16) {
			if(referer.substring(8,14).equals("mypage")||referer.substring(14,21).equals("payment")) {
				mav.setViewName("redirect:/main.do");
			}else {
				mav.setViewName("redirect:/"+referer.substring(8));
			}
		}else {
			mav.setViewName("redirect:/"+referer.substring(8));
			
		}
		return mav;
	}
}
