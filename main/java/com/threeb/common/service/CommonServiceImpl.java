package com.threeb.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.threeb.common.dao.CommonDAO;
import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;

@Service("commonService")
@Transactional(propagation = Propagation.REQUIRED) 
public class CommonServiceImpl implements CommonService {
	@Autowired
	CommonDAO commonDAO;
	
	@Override
	public List<List<ImageVO>> selectHouseImageList(List<Integer> houseIdList) throws Exception {
		return commonDAO.selectHouseImageList(houseIdList);
	}

	@Override
	public List<ImageVO> selectHouseImage(int house_id) throws DataAccessException {
		return commonDAO.selectHouseImage(house_id);
	}
	
	@Override
	public ImageVO selectHouseImageOne(int house_id) throws Exception {
		return commonDAO.selectHouseImageOne(house_id);
	}
	
	@Override
	public HouseVO selectHouse(int house_id) throws DataAccessException {
		HouseVO house=commonDAO.selectHouse(house_id);
		return house;
	}
	
}
