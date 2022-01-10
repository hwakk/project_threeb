package com.threeb.mypage.guest.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.threeb.mypage.vo.BookingVO;
import com.threeb.mypage.vo.ReviewVO;

public interface GuestService {

	public Map listGuest(String member_id) throws Exception;
	public BookingVO bookingInfo(int booking_id) throws Exception;
	public Map bookingReceipt(int booking_id) throws Exception;
	public void cancelBooking(int booking_id) throws DataAccessException;
	public int reviewCnt(String member_id) throws DataAccessException;
	public void writeReview(ReviewVO review) throws DataAccessException;
	public ReviewVO reviewInfo(int review_id) throws Exception;
	public void modReview(ReviewVO review) throws DataAccessException;
	public void deleteReview(int review_id) throws DataAccessException;

}
