package com.threeb.mypage.host.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.threeb.house.vo.HouseVO;
import com.threeb.mypage.vo.BookingVO;
import com.threeb.mypage.vo.ReviewVO;

public interface HostDAO {

	public List<HouseVO> selectListHouse(String member_id) throws DataAccessException;
	public List<BookingVO> selectListBooking(String member_id) throws DataAccessException;
	public int insertNewHouse(Map houseMap) throws DataAccessException;
	public void insertNewImage(Map houseMap, int house_id) throws DataAccessException;
	public void deleteHouse(int house_id) throws DataAccessException;
	public void deleteBooking(int booking_id) throws DataAccessException;
	
}
