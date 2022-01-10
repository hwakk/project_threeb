<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="reviewCnt" value="${listGuest.reviewCnt }"/>
<c:set var="listBookingFuture" value="${listGuest.listBookingFuture }"/>
<c:set var="listBookingFutureImg" value="${listGuest.listBookingFutureImg }"/>
<c:set var="listBookingPast" value="${listGuest.listBookingPast }"/>
<c:set var="listBookingPastImg" value="${listGuest.listBookingPastImg }"/>
<c:set var="listReview" value="${listGuest.listReview }"/>
<c:set var="listReviewImg" value="${listGuest.listReviewImg }"/>
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
<link rel="stylesheet" href="${contextPath }/resources/css/mypage/guest.css"/>
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
<title>나의 예약</title>
</head>
<body>
<div class="list-box">
<div class="list-booking">
	<div class="list-booking future">
		<h3 class="list-title">예정된 예약</h3>
		<div class="scrollbar-dynamic list-content">
<c:choose>
<c:when test="${listBookingFuture=='[]' }">
			<div class="list-none">
				<p class="message" align="center">
					<b><span style="font-size: 12pt">예정된 예약이 없습니다.</span></b>
				</p>
			</div>
</c:when>
<c:otherwise>
<c:forEach var="booking" items="${listBookingFuture }" varStatus="status">
			<div class="card mb-3">
				<div class="row no-gutters">
					<div class="col-md-4 float-left img">
						<img class="rounded" src="${contextPath}/download.do?house_id=${booking.house_id}&imageFileName=${listBookingFutureImg[status.index].filename}" alt="house-img">
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
								<a href="javascript:cancelBooking(${booking.booking_id })" class="btn btn-outline-danger btn-sm btn-cancel">
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
	<div class="list-booking past">
		<h3 class="list-title">지난 예약</h3>
		<div class="scrollbar-dynamic list-content">
<c:choose>
<c:when test="${listBookingPast=='[]' }">
		<div class="list-none">
			<p class="message" align="center">
				<b><span style="font-size: 12pt">지난 예약이 없습니다.</span></b>
			</p>
		</div>
</c:when>
<c:otherwise>
<c:forEach var="booking" items="${listBookingPast }" varStatus="status">
		<div class="card mb-3">
			<div class="row no-gutters">
				<div class="col-md-4 float-left img">
					<img class="rounded" src="${contextPath}/download.do?house_id=${booking.house_id}&imageFileName=${listBookingPastImg[status.index].filename}" alt="house-img">
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
<c:choose>
<c:when test="${booking.reviewCheck!=0 }">
							<button type="button" class="btn btn-light disabled btn-sm btn-done">작성완료</button>
</c:when>
<c:otherwise>
							<a href="javascript:reviewForm(${booking.booking_id })" class="btn btn-outline-dark btn-sm btn-review">후기작성</a>
</c:otherwise>
</c:choose>
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
<div class="list-booking">
	<div class="list-review">
		<h3 class="list-title">나의 후기</h3>
		<p class="list-cnt">${reviewCnt }개의 후기</p>
<c:choose>
<c:when test="${listReview=='[]' }">
			<div class="list-none">
				<p class="message" align="center">
					<b><span style="font-size: 12pt">작성된 후기가 없습니다.</span></b>
				</p>
			</div>
</c:when>
<c:otherwise>
		<div class="scrollbar-dynamic list-content">
<c:forEach var="review" items="${listReview }" varStatus="status">
			<div class="card">
				<div class="card-img">
					<img src="${contextPath}/download.do?house_id=${review.house_id}&imageFileName=${listReviewImg[status.index].filename}" class="card-img-top" alt="reviewImage">
				</div>
				<div class="card-body">
					<p class="card-score">
<c:forEach begin="1" end="${review.review_score }">
					⭐
</c:forEach>
					</p>
					<h5 class="card-title">${review.house_title }</h5>
					<p class="card-location">${review.house_location }</p>
					<p class="card-date"><i class="far fa-calendar"></i> ${review.checkin } ~ ${review.checkout }</p>
					<p class="card-text">${review.review_content }</p>
					<div class="card-button">
						<a href="javascript:viewReview(${review.review_id })" class="btn btn-outline-info btn-detail">
						<i class="fas fa-bars"></i>
						</a>
						<a href="javascript:deleteReview(${review.review_id })" class="btn btn-outline-danger btn-cancel">
						<i class="far fa-trash-alt"></i>
						</a>
					</div>
				</div>
			</div>
</c:forEach>
		</div>
</c:otherwise>
</c:choose>	
	</div>
</div>
</div>
<!-- 후기 작성 모달 -->
<div id="reviewModal" class="modal fade">
	<div class="modal-dialog modal-review">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">후기작성</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form id="writeReview">
					<div class="form-group house-title">
						<p class="text-left font-weight-bold" id="r_house_title"><p>
					</div>
					<div class="form-group clearfix info">
						<div class="form-group float-left info-title">
							<p class="small text-left font-weight-bold">체크인:</p>
							<p class="small text-left font-weight-bold">체크아웃:</p>
							<p class="small text-left font-weight-bold">예약번호:</p>
							<p class="small text-left font-weight-bold">평점:</p>
						</div>
						<div class="form-group float-left info-value">
							<p class="small text-left" id="r_checkin"></p>
							<p class="small text-left" id="r_checkout"></p>
							<p class="small text-left" id="r_booking_id"></p>
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-outline-light btn-sm"><input type="radio" name="review_score" value="1">⭐</label>
								<label class="btn btn-outline-light btn-sm"><input type="radio" name="review_score" value="2">⭐⭐</label>
								<label class="btn btn-outline-light btn-sm"><input type="radio" name="review_score" value="3">⭐⭐⭐</label>
								<label class="btn btn-outline-light btn-sm"><input type="radio" name="review_score" value="4">⭐⭐⭐⭐</label>
								<label class="btn btn-outline-light btn-sm"><input type="radio" name="review_score" value="5" checked>⭐⭐⭐⭐⭐</label>
							</div>
						</div>
					</div>
					<div class="form-group textarea">
						<textarea class="form-control" name="review_content" id="review_content" placeholder="숙소에 대한 자세한 후기를 남겨주세요." required="required"></textarea>
						<p class="small text-right text-muted" id="counter">(0 / 최대 500자)</p>
					</div>
					<div class="form-group btn-write">
						<button type="submit" class="btn btn-primary btn-sm btn-block btn-review">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 후기 모달 -->
<div id="viewReviewModal" class="modal fade">
	<div class="modal-dialog modal-viewReview">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">후기</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form id="modReview">
					<div class="form-group house-title">
						<p class="text-left font-weight-bold" id="v_house_title"><p>
					</div>
					<div class="form-group clearfix info">
						<div class="form-group float-left info-title">
							<p class="small text-left font-weight-bold">체크인:</p>
							<p class="small text-left font-weight-bold">체크아웃:</p>
							<p class="small text-left font-weight-bold">예약번호:</p>
							<p class="small text-left font-weight-bold">평점:</p>
							<input type="hidden" name="review_id"/>
						</div>
						<div class="form-group float-left info-value">
							<p class="small text-left" id="v_checkin"></p>
							<p class="small text-left" id="v_checkout"></p>
							<p class="small text-left" id="v_booking_id"></p>
							<p class="small text-left" id="v_review_score"></p>
							<div class="btn-group btn-group-toggle btn-mod-group" data-toggle="buttons" style="display: none">
								<label class="btn btn-outline-light btn-sm"><input type="radio" name="v_review_score" value="1">⭐</label>
								<label class="btn btn-outline-light btn-sm"><input type="radio" name="v_review_score" value="2">⭐⭐</label>
								<label class="btn btn-outline-light btn-sm"><input type="radio" name="v_review_score" value="3">⭐⭐⭐</label>
								<label class="btn btn-outline-light btn-sm"><input type="radio" name="v_review_score" value="4">⭐⭐⭐⭐</label>
								<label class="btn btn-outline-light btn-sm"><input type="radio" name="v_review_score" value="5" checked>⭐⭐⭐⭐⭐</label>
							</div>
						</div>
						<div class="form-group float-right info-mod">
							<a href="javascript:modReviewForm()" class="btn btn-outline-secondary btn-mod">
							<i class="fas fa-pen"></i>
							</a>
						</div>
					</div>
					<div class="form-group textarea">
						<textarea class="form-control" name="review_content" id="v_review_content" readonly></textarea>
						<p class="small text-right text-muted" id="v_counter" style="display: none">(0 / 최대 500자)</p>
					</div>
					<div class="form-group btn-mod-write" style="display: none">
						<button type="submit" class="btn btn-primary btn-block btn-sm btn-mod-review">수정 </button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	jQuery(document).ready(function(){
	    jQuery('.scrollbar-dynamic').scrollbar();
	});
	
	//예약취소
	function cancelBooking(booking_id) {
		const result=confirm('예약을 취소하시겠습니까?');
		if(result) {
			location.href='${contextPath}/mypage/guest/cancelBooking.do?id='+booking_id;
		}
	}
	
	//모달 초기화
	$('.modal').on('hidden.bs.modal', function (e) {
	    $(this).find('form')[0].reset();
	    $('#counter').html("(0 / 최대 500자)");
	    $('label').removeClass('active');
	    $('label:nth-child(5)').addClass('active');
	    $('.info-mod').prop('style','display: block');
	    $('#v_review_score').prop('style','display: block');
		$('#v_review_content').prop('readonly', true);
		$('#v_counter').prop('style','display: none');
		$('.btn-mod-write').prop('style', 'display: none');
		$('.btn-mod-group').prop('style', 'display: none');
	});
	
	//후기모달
	function reviewForm(booking_id) {
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/mypage/guest/reviewForm.do",
			dataType : "json",
			data : {
				id : booking_id
			},
			success : function(data, textStatus) {
				$("#r_house_title").text(data.house_title);
				$("#r_checkin").text(data.checkin);
				$("#r_checkout").text(data.checkout);
				$("#r_booking_id").text(data.booking_id);
				$("#booking_id").val(data.booking_id);
				$('#reviewModal').modal('show');
			},
			error : function(data, textStatus) {
				alert("오류가 발생했습니다.");
			},
			complete : function(data, textStatus) {
	
			}
		});
	}

	//textarea 글자수 제한
	$('#review_content').keyup(function(e) {
		var content = $(this).val();
		$('#counter').html("(" + content.length + " / 최대 500자)");
		if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 500));
			$('#counter').html("(500 / 최대 500자)");
		}
	})
	
	$('#v_review_content').keyup(function(e) {
		var content = $(this).val();
		$('#v_counter').html("(" + content.length + " / 최대 500자)");
		if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 500));
			$('#v_counter').html("(500 / 최대 500자)");
		}
	})
	
	//후기작성
	$('#writeReview').submit(function () {
		$.ajax({
			type : "post",
			async : true,
			url : "${contextPath}/mypage/guest/writeReview.do",
			dataType : "text",
			data : {
				booking_id: $('#r_booking_id').text(),
				review_score: $('input[name="review_score"]:checked').val(),
				review_content: $('textarea[name="review_content"]').val()
			},
			success : function(data, textStatus) {
				alert(data);
				window.location.href="${contextPath}/mypage/guest.do";
			},
			error : function(data, textStatus) {
				alert("오류가 발생했습니다.");
			},
			complete : function(data, textStatus) {
				
			}
		});
	})
	
	//후기삭제
	function deleteReview(review_id) {
		const result=confirm('후기를 삭제하시겠습니까?');
		if(result) {
			location.href='${contextPath}/mypage/guest/deleteReview.do?id='+review_id;
		}
	}
	
	//후기보기
	function viewReview(review_id) {
		$.ajax({
			type : "get",
			async : false,
			url : "${contextPath}/mypage/guest/viewReview.do",
			dataType : "json",
			data : {
				id : review_id
			},
			success : function(data, textStatus) {
				$("#v_house_title").text(data.house_title);
				$("#v_checkin").text(data.checkin);
				$("#v_checkout").text(data.checkout);
				$("#v_booking_id").text(data.booking_id);
				$('input[name="review_id"]').val(data.review_id);
				var review_score = "";
				for (var i = 0; i < data.review_score; i++) {
					review_score += "⭐";
				}
				$("#v_review_score").text(review_score);
				$("#v_review_content").text(data.review_content);
				$('#viewReviewModal').modal('show');
			},
			error : function(data, textStatus) {
				alert("오류가 발생했습니다.");
			},
			complete : function(data, textStatus) {

			}
		});
	}
	
	//후기수정 전환
	function modReviewForm() {
		$('.info-mod').prop('style','display: none');
		$('#v_review_score').prop('style','display: none');
		$('#v_review_content').prop('readonly', false);
		$('#v_counter').prop('style','display: block');
		$('.btn-mod-write').prop('style', 'display: block');
		$('.btn-mod-group').prop('style', 'display: block');
	}
	
	//후기수정
	$('#modReview').submit(function () {
		$.ajax({
			type : "post",
			async : true,
			url : "${contextPath}/mypage/guest/modReview.do",
			dataType : "text",
			data : {
				review_id: $('input[name="review_id"]').val(),
				review_score: $('input[name="v_review_score"]:checked').val(),
				review_content: $('#v_review_content').val()
			},
			success : function(data, textStatus) {
				alert(data);
				window.location.href="${contextPath}/mypage/guest.do";
			},
			error : function(data, textStatus) {
				alert("오류가 발생했습니다.");
			},
			complete : function(data, textStatus) {
				
			}
		});
	});
</script>
</body>
</html>