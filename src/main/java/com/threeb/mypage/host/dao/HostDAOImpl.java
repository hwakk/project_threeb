package com.threeb.mypage.host.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;
import com.threeb.mypage.vo.BookingVO;
import com.threeb.mypage.vo.ReviewVO;

@Repository("hostDAO")
public class HostDAOImpl implements HostDAO{
	@Autowired
	private SqlSession sqlSession;
	
	//숙소 리스트
	@Override
	public List<HouseVO> selectListHouse(String member_id) throws DataAccessException {
		List<HouseVO> listHouse=sqlSession.selectList("mapper.house.selectListHouse", member_id);
		return listHouse;
	}
	
	//예약 리스트
	@Override
	public List<BookingVO> selectListBooking(String member_id) throws DataAccessException {
		List<BookingVO> listBooking=sqlSession.selectList("mapper.booking.selectHostBooking", member_id);
		return listBooking;
	}
	
	//숙소 등록
	@Override
	public int insertNewHouse(Map houseMap) throws DataAccessException {
		int house_id = selectNewHouse_id();
		houseMap.put("house_id", house_id);
		sqlSession.insert("mapper.house.insertNewHouse", houseMap);
		return house_id;
	}
	
	//숙소 이미지 등록
	@Override
	public void insertNewImage(Map houseMap, int house_id) throws DataAccessException {
		List<ImageVO> imageFileList = (ArrayList)houseMap.get("imageFileList");
		int img_id=selectNewImage_id();
		for(ImageVO imageVO : imageFileList) {
			imageVO.setImg_id(++img_id);
			imageVO.setHouse_id(house_id);
		}
		sqlSession.insert("mapper.house.insertNewImage", imageFileList);
	}
	
	//새 숙소 번호
	private int selectNewHouse_id() throws DataAccessException {
		return sqlSession.selectOne("mapper.house.selectNewHouseId");
	}
	
	//새 이미지 번호
	private int selectNewImage_id() throws DataAccessException {
		return sqlSession.selectOne("mapper.house.selectNewImgId");
	}
	
	//숙소 삭제
	@Override
	public void deleteHouse(int house_id) throws DataAccessException {
		sqlSession.delete("mapper.house.deleteHouse", house_id);
	}
	
	//예약 취소
	@Override
	public void deleteBooking(int booking_id) throws DataAccessException {
		sqlSession.delete("mapper.booking.deleteBooking", booking_id);
	}
	
}
