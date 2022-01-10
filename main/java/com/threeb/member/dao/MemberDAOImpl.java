package com.threeb.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.threeb.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired private SqlSession sqlSession;
	
	//회원가입
	@Override
	public int insertMember(MemberVO member) throws DataAccessException {
		return sqlSession.insert("mapper.member.insertMember", member);
	}
	
	//아이디 중복 체크
	@Override
	public String selectOverlappedID(String member_id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID", member_id);
		return result;
	}
	
	//로그인
	@Override
	public MemberVO loginById(MemberVO member) throws DataAccessException {
		MemberVO vo=sqlSession.selectOne("mapper.member.loginById", member);
		return vo;
	}

}
