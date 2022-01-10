<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="booking" value="${listInfo.booking }"/>
<c:set var="house" value="${listInfo.house }"/>
<c:set var="image" value="${listInfo.image }"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/css/house/viewBooking.css"/>
<style>
html, body {
	font-family: 'Varela Round', 'Nanum Gothic';
}
input:focus {
	outline: none;
}
textarea:focus {
	outline: none;
}
button:focus {
	outline: none;
}
.navbar {
	box-shadow: 0 1px 15px rgba(0,0,0,.08);
}
</style>
<title>예약내역</title>
</head>
<body>
	<div class="content">
		<div class="body">
			<div class="div-title">
				<div class="clearfix btn-box">
					<div class="float-left btn-back" onclick="history.back()"><i class="fas fa-chevron-left"></i></div>
				</div>
				<div class="clearfix title-box">
					<h3 class="float-left"><i class="fas fa-bold"></i>.<i class="fas fa-bold"></i>.<i class="fas fa-bold"></i> 영수증</h3>
				</div>
			</div>
			<div class="form-group">
				<div class="div-booking">
					<h4 class="text-left">${house.house_location }</h4>
					<p class="text-left location-etc">${house.house_location }에서 ${booking.gap }박</p>
					<hr class="my-4">
					<div class="clearfix div-house">
						<div class="float-left house-info">
							<p class="text-left"><i class="far fa-calendar"></i> ${booking.checkin }&nbsp;→&nbsp;${booking.checkout }</p>
							<p class="text-left">${house.house_type_detail } · 침대 ${house.house_bed }개 · 게스트 ${house.house_person }명</p>·
							<p class="small text-left">${house.house_location }&nbsp;${house.house_location_etc }</p>
							<p class="small text-left">호스트 : ${house.member_id }님</p>
						</div>
						<div class="float-right house-image">
							<img src="${contextPath}/download.do?house_id=${image.house_id}&imageFileName=${image.filename}" alt="house_img">
						</div>
					</div>
					<hr class="my-4">
					<p class="small text-left guest">게스트 : ${booking.member_id }님</p>
					<p class="small text-left refund">환불 정책 : 일반</p>
					<label class="small text-left">체크인 5일 전까지 예약을 취소하면 요금 전액이 환불됩니다. 그 이후 체크인 전에 취소하면 첫 1박 요금은 환불되지 않으나, 나머지 숙박 요금의 50%가 환불됩니다.</label>
				</div>
			</div>
			<div class="form-group">
				<div class="div-charge">
					<h4 class="text-left">요금 내역</h4>
					<div class="clearfix charge">
						<label class="float-left text-left">₩${house.house_charge } x ${booking.gap }박</label>
						<label class="float-right text-right">₩${house.house_charge * booking.gap }</label>
					</div>
					<hr class="my-4">
					<div class="clearfix amount">
						<label class="float-left text-left">총 합계(KRW)</label>
						<label class="float-right text-right">₩${house.house_charge * booking.gap }</label>
					</div>
				</div>
				<div class="div-payment">
					<h4 class="text-left">결제</h4>
					<div class="clearfix cardinfo">
						<label class="float-left text-left">${booking.card_type } **** ${booking.card_num }</label>
						<label class="float-right text-right">₩${house.house_charge * booking.gap }</label>
					</div>
					<div class="clearfix paydate">
						<small class="float-left text-left">${booking.paydate }</small>
					</div>
					<hr class="my-4">
					<div class="clearfix payment">
						<label class="float-left text-left">결제 금액(KRW)</label>
						<label class="float-right text-right">₩${house.house_charge * booking.gap }</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>