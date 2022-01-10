package com.threeb.house.payment.service;

import org.springframework.dao.DataAccessException;

import com.threeb.mypage.vo.BookingVO;

public interface PaymentService {

	public int addNewBooking(BookingVO booking) throws DataAccessException;

}
