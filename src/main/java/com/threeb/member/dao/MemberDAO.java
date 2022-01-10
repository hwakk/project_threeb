package com.threeb.member.dao;

import org.springframework.dao.DataAccessException;

import com.threeb.member.vo.MemberVO;

public interface MemberDAO {

	public int insertMember(MemberVO member) throws DataAccessException;
	public String selectOverlappedID(String member_id) throws DataAccessException;
	public MemberVO loginById(MemberVO member)throws DataAccessException;
	
}
