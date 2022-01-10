package com.threeb.mypage.guest.service;

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
import com.threeb.house.vo.ImageVO;
import com.threeb.mypage.guest.dao.GuestDAO;
import com.threeb.mypage.vo.BookingVO;
import com.threeb.mypage.vo.ReviewVO;

@Service("guestService")
@Transactional(propagation = Propagation.REQUIRED)
public class GuestServiceImpl implements GuestService {
	
	@Autowired GuestDAO guestDAO;
	@Autowired CommonService commonService;
	
	//나의 예약 페이지
	@Override
	public Map listGuest(String member_id) throws Exception {
		Map listGuest=new HashMap();
		List<BookingVO> listBookingFuture=guestDAO.selectListBookingFuture(member_id);
		List<BookingVO> listBookingPast=guestDAO.selectListBookingPast(member_id);
		List<ReviewVO> listReview=guestDAO.selectListReview(member_id);
		
		List<ImageVO> listBookingFutureImg=new ArrayList();
		List<ImageVO> listBookingPastImg=new ArrayList();
		List<ImageVO> listReviewImg=new ArrayList();
		//숙소 평점, 해당 후기 여부
		for(BookingVO booking:listBookingPast) {
			listBookingPastImg.add(commonService.selectHouseImageOne(booking.getHouse_id()));
			for(ReviewVO review:listReview) {
				listReviewImg.add(commonService.selectHouseImageOne(review.getHouse_id()));
				if(booking.getBooking_id()==review.getBooking_id()) {
					booking.setReviewCheck(1);
				}
			}
		}
		for(BookingVO booking:listBookingFuture) {
			listBookingFutureImg.add(commonService.selectHouseImageOne(booking.getHouse_id()));
		}
		
		int reviewCnt=reviewCnt(member_id);
		listGuest.put("reviewCnt", reviewCnt);
		listGuest.put("listBookingFuture", listBookingFuture);
		listGuest.put("listBookingFutureImg", listBookingFutureImg);
		listGuest.put("listBookingPast", listBookingPast);
		listGuest.put("listBookingPastImg", listBookingPastImg);
		listGuest.put("listReview", listReview);
		listGuest.put("listReviewImg", listReviewImg);
		return listGuest;
	}
	
	//선택 예약
	@Override
	public BookingVO bookingInfo(int booking_id) throws Exception {
		BookingVO bookingInfo=guestDAO.selectBookingInfo(booking_id);
		return bookingInfo;
	}
	
	@Override
	public Map bookingReceipt(int booking_id) throws Exception {
		Map listInfo=guestDAO.selectBookingReceipt(booking_id);
		return listInfo;
	}
	
	//예약 취소
	@Override
	public void cancelBooking(int booking_id) throws DataAccessException {
		guestDAO.deleteBooking(booking_id);
	}
	
	//나의후기 갯수
	@Override
	public int reviewCnt(String member_id) throws DataAccessException {
		return guestDAO.selectReviewCnt(member_id);
	}
	
	//후기 작성
	@Override
	public void writeReview(ReviewVO review) throws DataAccessException {
		guestDAO.insertReview(review);
	}
	
	//후기 보기
	@Override
	public ReviewVO reviewInfo(int review_id) throws Exception {
		ReviewVO reviewVO=guestDAO.selectReviewInfo(review_id);
		return reviewVO;
	}
	
	//후기 수정
	@Override
	public void modReview(ReviewVO review) throws DataAccessException {
		guestDAO.updateReview(review);
	}

	//후기 삭제
	@Override
	public void deleteReview(int review_id) throws DataAccessException {
		guestDAO.deleteReview(review_id);
	}
	
}
