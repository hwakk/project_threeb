package com.threeb.house.payment.dao;

import org.springframework.dao.DataAccessException;

import com.threeb.mypage.vo.BookingVO;

public interface PaymentDAO {

	public int addNewBooking(BookingVO booking) throws DataAccessException;
	
}


