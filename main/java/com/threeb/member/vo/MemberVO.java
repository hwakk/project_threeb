package com.threeb.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	
	private String member_id; //아이디
	private String member_pwd; //비밀번호
	private String member_name; //이름
	private String tel; //연락처
	private String email; //이메일
	private Date joinDate; //가입날짜
	private int host; //호스트여부
	
	public MemberVO() {
		super();
	}
	
	public MemberVO(String member_id, String member_pwd, String member_name, String tel, String email) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.tel = tel;
		this.email = email;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public int getHost() {
		return host;
	}

	public void setHost(int host) {
		this.host = host;
	}

}
