package com.threeb.mypage.guest.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.threeb.house.vo.HouseVO;
import com.threeb.house.vo.ImageVO;
import com.threeb.mypage.vo.BookingVO;
import com.threeb.mypage.vo.ReviewVO;

@Repository("guestDAO")
public class GuestDAOImpl implements GuestDAO {
	
	@Autowired private SqlSession sqlSession;
	
	//예정예약 리스트(게스트)
	@Override
	public List<BookingVO> selectListBookingFuture(String member_id) throws Exception {
		List<BookingVO> listBooking=sqlSession.selectList("mapper.booking.selectGuestBookingFuture", member_id);
		return listBooking;
	}
	
	//지난예약 리스트(게스트)
	@Override
	public List<BookingVO> selectListBookingPast(String member_id) throws Exception {
		List<BookingVO> listBooking=sqlSession.selectList("mapper.booking.selectGuestBookingPast", member_id);
		return listBooking;
	}
	
	//후기 리스트(게스트)
	@Override
	public List<ReviewVO> selectListReview(String member_id) throws Exception {
		List<ReviewVO> listReview=sqlSession.selectList("mapper.review.selectGuestReview", member_id);
		return listReview;
	}
	
	//나의후기 갯수
	@Override
	public int selectReviewCnt(String member_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.selectReviewCnt", member_id);
	}
	
	//예약리스트 1개
	@Override
	public BookingVO selectBookingInfo(int booking_id) throws Exception {
		BookingVO bookingVO=sqlSession.selectOne("mapper.booking.selectBookingInfo", booking_id);
		return bookingVO;
	}
	
	@Override
	public Map selectBookingReceipt(int booking_id) throws Exception {
		BookingVO bookingVO=sqlSession.selectOne("mapper.booking.selectBookingInfo", booking_id);
		HouseVO houseVO=sqlSession.selectOne("mapper.house.selectHouseInfo", bookingVO.getHouse_id());
		ImageVO imageVO=sqlSession.selectOne("mapper.image.selectHouseImageOne", bookingVO.getHouse_id());
		Map listInfo=new HashMap();
		listInfo.put("booking", bookingVO);
		listInfo.put("house", houseVO);
		listInfo.put("image", imageVO);
		return listInfo;
	}
	
	//예약 취소
	@Override
	public void deleteBooking(int booking_id) throws DataAccessException {
		sqlSession.delete("mapper.booking.deleteBooking", booking_id);
	}
	
	//후기 작성
	@Override
	public void insertReview(ReviewVO review) throws DataAccessException {
		int review_id=selectNewReview_id();
		review.setReview_id(review_id);
		sqlSession.insert("mapper.review.insertReview", review);
	}
	
	//후기 보기
	@Override
	public ReviewVO selectReviewInfo(int review_id) throws Exception {
		ReviewVO reviewVO=sqlSession.selectOne("mapper.review.selectReviewInfo", review_id);
		return reviewVO;
	}
	
	//후기 수정
	@Override
	public void updateReview(ReviewVO review) throws DataAccessException {
		sqlSession.update("mapper.review.updateReview", review);
	}
	
	//후기 삭제
	@Override
	public void deleteReview(int review_id) throws DataAccessException {
		sqlSession.delete("mapper.review.deleteReview", review_id);
	}
	
	//예약 번호
	private int selectNewBooking_id() throws DataAccessException {
		return sqlSession.selectOne("mapper.booking.selectNewBookingId");
	}
	
	//후기 번호
	private int selectNewReview_id() throws DataAccessException {
		return sqlSession.selectOne("mapper.review.selectNewReviewId");
	}

}
