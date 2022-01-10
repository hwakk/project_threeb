package com.threeb.house.info.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.threeb.mypage.vo.ReviewVO;

@Repository("infoDAO")
public class InfoDAOImpl implements InfoDAO {
	
	@Autowired SqlSession sqlsession;

	@Override
	public List<ReviewVO> listReview(int house_id) throws DataAccessException {
		return sqlsession.selectList("mapper.review.selectHouseReview", house_id);
	}

}
