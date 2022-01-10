package com.threeb.common.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;

@Repository("commonDAO")
public class CommonDAOImpl implements CommonDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<List<ImageVO>> selectHouseImageList(List<Integer> houseIdList) throws DataAccessException {
		List<List<ImageVO>> houseImgList = new ArrayList<List<ImageVO>>();	
		for(int i : houseIdList) {
			List<ImageVO> list = sqlSession.selectList("mapper.image.selectHouseImage", i);		
			houseImgList.add(list);
			for(ImageVO img : list) {
				System.out.println("img house id : " + img.getHouse_id());
				System.out.println("img filename : " + img.getFilename());
			}
		}
		
		return houseImgList;
	}

	@Override
	public List<ImageVO> selectHouseImage(int house_id) throws DataAccessException {
		return sqlSession.selectList("mapper.image.selectHouseImage", house_id);
	}
	
	@Override
	public ImageVO selectHouseImageOne(int house_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.image.selectHouseImageOne", house_id);
	}
	
	@Override
	public HouseVO selectHouse(int house_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.house.selectHouse", house_id);
	}
	
}
