package com.threeb.house.search.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.threeb.house.vo.HouseVO;

public interface SearchDAO {
	
	public List<HouseVO> selectHouseList(Map<String, Object> searchMap) throws DataAccessException;
	public HouseVO selectHouse(int house_id) throws DataAccessException;
	public int houseCnt(Map<String, Object> searchMap);

}
