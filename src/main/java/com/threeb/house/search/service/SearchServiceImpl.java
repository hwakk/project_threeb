package com.threeb.house.search.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.threeb.house.search.dao.SearchDAO;
import com.threeb.house.vo.HouseVO;

@Service("searchService")
@Transactional(propagation = Propagation.REQUIRED) 
public class SearchServiceImpl implements SearchService {
	
	@Autowired SearchDAO searchDAO;
	
	@Override
	public int houseCnt(Map<String, Object> searchMap) throws Exception {
		return searchDAO.houseCnt(searchMap);
	}
	
	@Override
	public List<HouseVO> selectHouseList(Map<String, Object> searchMap) throws Exception {
		return searchDAO.selectHouseList(searchMap);
	}

	@Override
	public HouseVO selectHouse(int house_id) throws Exception {
		return searchDAO.selectHouse(house_id);
	}
	
}
