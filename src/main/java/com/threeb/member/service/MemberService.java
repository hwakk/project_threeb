package com.threeb.member.service;

import org.springframework.dao.DataAccessException;

import com.threeb.member.vo.MemberVO;

public interface MemberService {

	public int addMember(MemberVO member) throws DataAccessException;
	public String overlapped(String member_id) throws Exception;
	public MemberVO login(MemberVO member) throws DataAccessException;

}
