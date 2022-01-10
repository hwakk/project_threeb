package com.threeb.mypage.host.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface HostService {

	public Map listHost(String member_id) throws Exception;
	public int addNewHouse(Map houseMap) throws Exception;
	public void deleteHouse(int house_id) throws Exception;
	public void cancelBooking(int booking_id) throws DataAccessException;
	
}
