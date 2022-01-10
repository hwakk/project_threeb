package com.threeb.mypage.host.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.threeb.common.service.CommonService;
import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;
import com.threeb.mypage.host.dao.HostDAO;
import com.threeb.mypage.vo.BookingVO;
import com.threeb.mypage.vo.ReviewVO;

@Service("hostService")
@Transactional(propagation = Propagation.REQUIRED)
public class HostServiceImpl implements HostService{
	
	@Autowired HostDAO hostDAO;
	@Autowired CommonService commonService;
	
	//숙소 관리 페이지
	@Override
	public Map listHost(String member_id) throws Exception {
		Map listHost=new HashMap();
		List<HouseVO> listHouse=hostDAO.selectListHouse(member_id);
		List<BookingVO> listBooking=hostDAO.selectListBooking(member_id);
		List<ImageVO> listBookingImg=new ArrayList();
		for(BookingVO booking:listBooking) {
			listBookingImg.add(commonService.selectHouseImageOne(booking.getHouse_id()));
		}
		listHost.put("listHouse", listHouse);
		listHost.put("listBooking", listBooking);
		listHost.put("listBookingImg", listBookingImg);
		return listHost;
	}
	
	//숙소 등록
	@Override
	public int addNewHouse(Map houseMap) throws Exception {
		int house_id = hostDAO.insertNewHouse(houseMap);
		hostDAO.insertNewImage(houseMap, house_id);
		return house_id;
	}
	
	//숙소 삭제
	@Override
	public void deleteHouse(int house_id) throws Exception {
		hostDAO.deleteHouse(house_id);
	}
	
	//예약 취소
	@Override
	public void cancelBooking(int booking_id) throws DataAccessException {
		hostDAO.deleteBooking(booking_id);
	}

}
