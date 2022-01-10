<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="listHouse" value="${listHost.listHouse }"/>
<c:set var="listBooking" value="${listHost.listBooking }"/>
<c:set var="listBookingImg" value="${listHost.listBookingImg }"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${contextPath }/resources/js/jquery.scrollbar.min.js"></script>
<script src="${contextPath }/resources/js/jquery.scrollbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/css/jquery.scrollbar.css"/>
<link rel="stylesheet" href="${contextPath }/resources/css/mypage/host.css"/>
<style>
html, body {
	font-family: 'Varela Round', 'Nanum Gothic';
	background-color: #fff;
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
<title>숙소 관리</title>
</head>
<body>
<div class="list-box">
<div class="list-booking">
	<div class="list-booking future">
		<div class="list-title">
			<label class="title">등록된 숙소</label>
			<a href="${contextPath }/mypage/host/uploadForm.do" class="btn btn-outline-primary btn-md float-right btn-upload">숙소 등록하기</a>
		</div>
		<div class="scrollbar-dynamic list-content">
<c:choose>
<c:when test="${listHouse=='[]' }">
			<div class="list-none">
				<p class="message" align="center">
					<b><span style="font-size: 12pt">등록된 숙소가 없습니다.</span></b>
				</p>
			</div>
</c:when>
<c:otherwise>
		<ul class="list-group">
<c:forEach var="house" items="${listHouse }">
			<li class="list-group-item">
				<div class="clearfix house-body">
					<div class="float-left house-id">
						<p>${house.house_id }</p>
					</div>
					<div class="float-left house-title">
						<a href="javascript:infoHouse(${house.house_id })">${house.house_title }</a>
					</div>
					<a href="javascript:deleteHouse(${house.house_id })" class="btn btn-outline-danger btn-sm float-right btn-cancel"><i class="far fa-trash-alt"></i></a>
				</div>
			</li>  
</c:forEach>
		</ul>
</c:otherwise>
</c:choose>
		</div>
	</div>
	<div class="list-booking past">
		<div class="list-title">
			<label class="title">예약</label>
		</div>
		<div class="scrollbar-dynamic list-content">
<c:choose>
<c:when test="${listBooking=='[]' }">
		<div class="list-none">
			<p class="message" align="center">
				<b><span style="font-size: 12pt">예정된 예약이 없습니다.</span></b>
			</p>
		</div>
</c:when>
<c:otherwise>
<c:forEach var="booking" items="${listBooking }" varStatus="status">
		<div class="card mb-3">
			<div class="row no-gutters">
				<div class="col-md-4 float-left img">
					<img class="rounded" src="${contextPath}/download.do?house_id=${booking.house_id}&imageFileName=${listBookingImg[status.index].filename}" alt="house-img">
				</div>
				<div class="col-md-9 float-right">
					<div class="card-body">
						<h5 class="card-title">${booking.house_title }</h5>
						<hr class="my-3">
					</div>
					<div class="card-body">
						<div class="card-body location">
							<p class="card-text location">${booking.house_location }</p>
							<p class="card-text score">
								⭐&nbsp;&nbsp;${booking.review_score }&nbsp;(${booking.review_count })
							</p>
						</div>
						<div class="card-body button">
							<a href="${contextPath }/mypage/guest/viewBooking.do?id=${booking.booking_id}" class="btn btn-outline-info btn-sm btn-detail">
							세부사항
							</a>
							<a href="javascript:cancelBooking(${booking.booking_id })" class="btn btn-outline-danger btn-sm btn-review">
							예약취소
							</a>
						</div>
					</div>
					<div class="card-body">
						<div class="card-body d-title">
							<p class="card-text">예약번호:</p>
							<p class="card-text">예약인원:</p>
							<p class="card-text">체크인:</p>
							<p class="card-text">체크아웃:</p>
							<p class="card-text">결제금액:</p>
						</div>
						<div class="card-body d-value">
							<p class="card-text">${booking.booking_id }</p>
							<p class="card-text">${booking.booking_total }</p>
							<p class="card-text">${booking.checkin }</p>
							<p class="card-text">${booking.checkout }</p>
							<p class="card-text"><b>KRW</b> ${booking.booking_amount }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
</c:forEach>
</c:otherwise>
</c:choose>
		</div>
	</div>
</div>
</div>
<script>
	jQuery(document).ready(function(){
	    jQuery('.scrollbar-dynamic').scrollbar();
	});
	
	function infoHouse(house_id) {
		location.href='${contextPath }/house/info.do?id='+house_id
			 + "&checkin=-"
	         + "&checkout=-"
	         + "&gap=0"
	         + "&person=0"
	         + "&detail=-"
	         + "&host=1";
	}
	
	//숙소삭제
	function deleteHouse(house_id) {
		const result=confirm('숙소를 삭제하시겠습니까?');
		if(result) {
			location.href='${contextPath}/mypage/host/deleteHouse.do?id='+house_id;
		}
	}
	
	//예약취소
	function cancelBooking(booking_id) {
		const result=confirm('예약을 취소하시겠습니까?');
		if(result) {
			location.href='${contextPath}/mypage/host/cancelBooking.do?id='+booking_id;
		}
	}
</script>
</body>
</html>