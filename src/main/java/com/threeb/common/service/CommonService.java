package com.threeb.common.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;

public interface CommonService {
	
	public List<List<ImageVO>> selectHouseImageList(List<Integer> houseIdList) throws Exception;
	public List<ImageVO> selectHouseImage(int house_id) throws DataAccessException;
	public ImageVO selectHouseImageOne(int house_id) throws Exception;
	public HouseVO selectHouse(int house_id) throws DataAccessException;
	
}
