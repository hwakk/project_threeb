package com.threeb.house.payment.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.threeb.house.vo.HouseVO;
import com.threeb.member.vo.MemberVO;
import com.threeb.mypage.vo.BookingVO;

@Repository("paymentDAO")
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired private SqlSession sqlSession;

	@Override
	public int addNewBooking(BookingVO booking) throws DataAccessException {
		int booking_id=selectNewBooking_id();
		booking.setBooking_id(booking_id);
		return sqlSession.insert("mapper.booking.insertBooking", booking);
	}
	
	private int selectNewBooking_id() throws DataAccessException {
		return sqlSession.selectOne("mapper.booking.selectNewBookingId");
	}

}