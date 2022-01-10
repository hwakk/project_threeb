package com.threeb.house.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("houseVO")
public class HouseVO {
	
	private int house_id; //숙소게시물번호
	private String member_id; //등록자
	private String house_type; //숙소유형
	private String house_type_detail; //숙소유형
	private int house_person; //숙박최대인원
	private int house_room; //침실개수
	private int house_bed; //침대개수
	private int house_bath; //욕실개수
	private String house_location; //숙소위치
	private String house_location_etc; //숙소위치
	private String house_comfort_facility; //숙소편의시설
	private String house_secure_facility; //숙소안전시설
	private String house_use_facility; //숙소사용시설
	private String house_content; //숙소소개
	private String house_title; //숙소명
	private int house_charge; //1박요금
	private Date house_writedate; //등록일자
	private double review_score; //평점
	private int review_count; //후기갯수
	private int reviewCheck; //후기여부
	
	public HouseVO() {
		super();
	}

	public int getHouse_id() {
		return house_id;
	}

	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getHouse_type() {
		return house_type;
	}

	public void setHouse_type(String house_type) {
		this.house_type = house_type;
	}

	public String getHouse_type_detail() {
		return house_type_detail;
	}

	public void setHouse_type_detail(String house_type_detail) {
		this.house_type_detail = house_type_detail;
	}

	public int getHouse_person() {
		return house_person;
	}

	public void setHouse_person(int house_person) {
		this.house_person = house_person;
	}

	public int getHouse_room() {
		return house_room;
	}

	public void setHouse_room(int house_room) {
		this.house_room = house_room;
	}

	public int getHouse_bed() {
		return house_bed;
	}

	public void setHouse_bed(int house_bed) {
		this.house_bed = house_bed;
	}

	public int getHouse_bath() {
		return house_bath;
	}

	public void setHouse_bath(int house_bath) {
		this.house_bath = house_bath;
	}

	public String getHouse_location() {
		return house_location;
	}

	public void setHouse_location(String house_location) {
		this.house_location = house_location;
	}

	public String getHouse_location_etc() {
		return house_location_etc;
	}

	public void setHouse_location_etc(String house_location_etc) {
		this.house_location_etc = house_location_etc;
	}

	public String getHouse_comfort_facility() {
		return house_comfort_facility;
	}

	public void setHouse_comfort_facility(String house_comfort_facility) {
		this.house_comfort_facility = house_comfort_facility;
	}

	public String getHouse_secure_facility() {
		return house_secure_facility;
	}

	public void setHouse_secure_facility(String house_secure_facility) {
		this.house_secure_facility = house_secure_facility;
	}

	public String getHouse_use_facility() {
		return house_use_facility;
	}

	public void setHouse_use_facility(String house_use_facility) {
		this.house_use_facility = house_use_facility;
	}

	public String getHouse_content() {
		return house_content;
	}

	public void setHouse_content(String house_content) {
		this.house_content = house_content;
	}

	public String getHouse_title() {
		return house_title;
	}

	public void setHouse_title(String house_title) {
		this.house_title = house_title;
	}

	public int getHouse_charge() {
		return house_charge;
	}

	public void setHouse_charge(int house_charge) {
		this.house_charge = house_charge;
	}

	public Date getHouse_writedate() {
		return house_writedate;
	}

	public void setHouse_writedate(Date house_writedate) {
		this.house_writedate = house_writedate;
	}

	public double getReview_score() {
		return review_score;
	}

	public void setReview_score(double review_score) {
		this.review_score = review_score;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public int getReviewCheck() {
		return reviewCheck;
	}

	public void setReviewCheck(int reviewCheck) {
		this.reviewCheck = reviewCheck;
	}
	
}
