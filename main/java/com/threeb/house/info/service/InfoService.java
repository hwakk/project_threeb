package com.threeb.house.info.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.threeb.mypage.vo.ReviewVO;

public interface InfoService {

	public List<ReviewVO> listReview(int house_id) throws DataAccessException;

}
