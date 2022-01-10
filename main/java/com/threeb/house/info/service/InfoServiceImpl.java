package com.threeb.house.info.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.threeb.house.info.dao.InfoDAO;
import com.threeb.mypage.vo.ReviewVO;

@Service("infoService")
public class InfoServiceImpl implements InfoService {
	
	@Autowired InfoDAO infoDAO;

	@Override
	public List<ReviewVO> listReview(int house_id) throws DataAccessException {
		return infoDAO.listReview(house_id);
	}

}
