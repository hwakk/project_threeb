package com.threeb.house.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.threeb.house.payment.dao.PaymentDAO;
import com.threeb.house.vo.HouseVO;
import com.threeb.member.dao.MemberDAO;
import com.threeb.member.vo.MemberVO;
import com.threeb.mypage.vo.BookingVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired private PaymentDAO paymentDAO;

	@Override
	public int addNewBooking(BookingVO booking) throws DataAccessException {
		return paymentDAO.addNewBooking(booking);
	}
	
}
