package com.threeb.house.search.service;

import java.util.List;
import java.util.Map;

import com.threeb.house.vo.HouseVO;

public interface SearchService {
	
	public int houseCnt(Map<String, Object> searchMap) throws Exception;
	public List<HouseVO> selectHouseList(Map<String, Object> searchMap) throws Exception;
	public HouseVO selectHouse(int house_id) throws Exception;
	
}
