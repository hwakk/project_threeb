package com.threeb.mypage.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	
	private int review_id; //리뷰번호
	private int parent_id; //답글부모번호
	private int house_id; //숙소게시물번호
	private int booking_id; //예약번호
	private String member_id; //리뷰작성자
	private int review_score; //리뷰평점
	private String review_content; //리뷰내용
	private Date review_writedate; //작성일자
	private String house_title; //숙소명
	private String house_location; //숙소위치
	private Date checkin; //체크인
	private Date checkout; //체크아웃
	
	public ReviewVO() {
		super();
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getParent_id() {
		return parent_id;
	}

	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	public int getHouse_id() {
		return house_id;
	}

	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getReview_score() {
		return review_score;
	}

	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_writedate() {
		return review_writedate;
	}

	public void setReview_writedate(Date review_writedate) {
		this.review_writedate = review_writedate;
	}

	public String getHouse_title() {
		return house_title;
	}

	public void setHouse_title(String house_title) {
		this.house_title = house_title;
	}

	public String getHouse_location() {
		return house_location;
	}

	public void setHouse_location(String house_location) {
		this.house_location = house_location;
	}

	public Date getCheckin() {
		return checkin;
	}

	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}

	public Date getCheckout() {
		return checkout;
	}

	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}
	
}
