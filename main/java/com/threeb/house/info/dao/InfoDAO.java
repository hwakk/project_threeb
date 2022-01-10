package com.threeb.house.info.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.threeb.mypage.vo.ReviewVO;

public interface InfoDAO {

	public List<ReviewVO> listReview(int house_id) throws DataAccessException;

}
