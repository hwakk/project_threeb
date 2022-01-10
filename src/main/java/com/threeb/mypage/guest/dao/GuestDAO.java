package com.threeb.mypage.guest.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.threeb.mypage.vo.BookingVO;
import com.threeb.mypage.vo.ReviewVO;

public interface GuestDAO {

	public List<BookingVO> selectListBookingFuture(String member_id) throws Exception;
	public List<BookingVO> selectListBookingPast(String member_id) throws Exception;
	public List<ReviewVO> selectListReview(String member_id) throws Exception;
	public int selectReviewCnt(String member_id) throws DataAccessException;
	public BookingVO selectBookingInfo(int booking_id) throws Exception;
	public Map selectBookingReceipt(int booking_id) throws Exception;
	public void deleteBooking(int booking_id) throws DataAccessException;
	public void insertReview(ReviewVO review) throws DataAccessException;
	public ReviewVO selectReviewInfo(int review_id) throws Exception;
	public void updateReview(ReviewVO review) throws DataAccessException;
	public void deleteReview(int review_id) throws DataAccessException;
	
}
