package com.threeb.house.search.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.threeb.house.vo.HouseVO;

@Repository("searchDAO")
public class SearchDAOImpl implements SearchDAO {
	
	@Autowired private SqlSession sqlSession;

	@Override
	public int houseCnt(Map<String, Object> searchMap) {
		int cnt = sqlSession.selectOne("mapper.search.selectedCnt", searchMap);
		if(cnt == 0) {
			cnt = sqlSession.selectOne("mapper.search.allCnt", searchMap);
		}
		return cnt;
	}
	
	@Override
	public List<HouseVO> selectHouseList(Map<String, Object> searchMap) throws DataAccessException {
		List<HouseVO> list = sqlSession.selectList("mapper.search.selectHouse", searchMap);

		if(list.size() == 0) { list =
			sqlSession.selectList("mapper.search.selectAllHouse", searchMap); 
		}
		return list;
	}

	@Override
	public HouseVO selectHouse(int house_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.search.selectOne", house_id);
	}


}
