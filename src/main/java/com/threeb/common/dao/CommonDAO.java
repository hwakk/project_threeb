package com.threeb.common.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;

public interface CommonDAO {
	
	public List<List<ImageVO>> selectHouseImageList(List<Integer> houseIdList) throws DataAccessException;
	public List<ImageVO> selectHouseImage(int house_id) throws DataAccessException;
	public ImageVO selectHouseImageOne(int house_id) throws DataAccessException;
	public HouseVO selectHouse(int house_id) throws DataAccessException;
	
}
