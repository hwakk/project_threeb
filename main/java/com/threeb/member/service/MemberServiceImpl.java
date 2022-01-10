package com.threeb.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.threeb.member.dao.MemberDAO;
import com.threeb.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	
	@Autowired private MemberDAO memberDAO;
	
	//회원가입
	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	
	//아이디 중복 체크
	@Override
	public String overlapped(String member_id) throws Exception {
		return memberDAO.selectOverlappedID(member_id);
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO member) throws DataAccessException {
		return memberDAO.loginById(member);
	}

}
