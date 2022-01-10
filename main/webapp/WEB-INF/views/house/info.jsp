<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>	
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${contextPath }/resources/js/jquery.scrollbar.min.js"></script>
<script src="${contextPath }/resources/js/jquery.scrollbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/css/jquery.scrollbar.css"/>
<link rel="stylesheet" href="${contextPath }/resources/css/house/info.css"/>
</head>
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
<script>
	var house_id=${house.house_id};
	var checkin="${infoMap.checkin}";
	var checkout="${infoMap.checkout}";
	var gap=${infoMap.gap};
	var person=${infoMap.person};
	var detail="${infoMap.detail}";
	
	function sendtoPayment(){
		var member="<%=session.getAttribute("member")%>";
		if(member=='null') {
			const result=confirm('로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?');
			if(result) {
				location.href="${contextPath}/member/loginForm.do";
			}
		}else {
			location.href="${contextPath}/house/payment.do?id=" + house_id
					+ "&checkin=" + checkin
					+ "&checkout=" + checkout
					+ "&gap=" + gap
					+ "&person=" + person
					+ "&detail=" + detail
		}
	}
	
	jQuery(document).ready(function(){
	    jQuery('.scrollbar-dynamic').scrollbar();
	});
</script>
<body>
<div>
	<div class="content">
		<div class="body">
			<div class="div-title">
				 <h3 class="text-left">${house.house_title }</h3>
				 <p class="text-left">후기 ${house.review_count }개 · ${house.house_location }</p>
			</div>
			<div class="div-img">
					<div id="carousel" class="carousel slide" data-interval="false" data-ride="carousel">
						<ol class="carousel-indicators">
							<c:set var="end" value="${fn:length(listImage)}" />
							<c:forEach var="i" begin="0" end="${end - 1}">
								<c:choose>
									<c:when test="${i eq 0}">
										<li data-target="carousel${status.index }" data-slide-to="0" class="active"></li>
									</c:when>
									<c:otherwise>
										<li data-target="carousel${status.index }" data-slide-to="${i }"></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ol>
						<div class="carousel-inner">
							<c:forEach var="i" begin="0" end="${end - 1}">
								<c:choose>
									<c:when test="${i eq 0}">
										<div class="carousel-item active">
											<img src="${contextPath}/download.do?house_id=${listImage[i].house_id}&imageFileName=${listImage[i].filename}" class="d-block w-100" alt="">
										</div>
									</c:when>
									<c:otherwise>
										<div class="carousel-item">
											<img src="${contextPath}/download.do?house_id=${listImage[i].house_id}&imageFileName=${listImage[i].filename}" class="d-block w-100" alt="">
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev"> 
							<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
							<span class="sr-only">Previous</span>
						</a> 
						<a class="carousel-control-next" href="#carousel" role="button" data-slide="next"> 
							<span class="carousel-control-next-icon" aria-hidden="true"></span> 
							<span class="sr-only">Next</span>
						</a>
					</div>
			</div>
			<div class="div-content">
				<div class="div-info">
					<div class="form-group">
						<h4 class="text-left">${house.member_id }님이 호스팅하는 ${house.house_type}의 ${house.house_type_detail }</h4>
						<p class="text-left">최대 인원 ${infoMap.person }명 · 침실 ${house.house_room }개 · 침대 ${house.house_bed }개 · 욕실 ${house.house_bath }개</p>
					</div>
					<hr class="my-4">
					<div class="form-group">
						<div class="icon-group">
							<div class="icon"><i class="fas fa-hand-sparkles"></i>
							</div>
							<div class="icon-s">
								<p class="text-left">청결 강화</p>
								<p class="small text-left">에어비앤비의 강화된 5단계 청소 절차를 준수하겠다고 동의한 호스트입니다.</p>
							</div>
						</div>
						<div class="icon-group">
							<div class="icon"><i class="fas fa-door-open"></i></div>
							<div class="icon-s">
								<p class="text-left">셀프 체크인</p>
								<p class="small text-left">키패드를 이용해 체크인하세요.</p>
							</div>
						</div>
						<div class="icon-group">
							<div class="icon"><i class="far fa-calendar-minus"></i></div>
							<div class="icon-s">
								<p class="text-left">환불 정책</p>
								<p class="small text-left">결제일 12:00 PM 전에 예약을 취소하면 총 숙박 요금의 50% 및 서비스 수수료 전액이 환불됩니다.</p>
							</div>
						</div>
						<div class="icon-group">
							<div class="icon"><i class="far fa-file-alt"></i></div>
							<div class="icon-s">
								<p class="text-left">숙소 이용규칙</p>
								<p class="small text-left">반려동물 동반, 파티, 흡연이 금지되는 숙소입니다.</p>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="text-left">${house.house_content }</label>
					</div>
					<div class="form-group">
						<h4 class="text-left">편의시설</h4>
						<div class="house-facility">
							<div id="comfort1">• 필수 품목</div>
							<div id="comfort2">• 무선인터넷</div>
							<div id="comfort3">• TV</div>
							<div id="comfort4">• 난방</div>
							<div id="comfort5">• 에어컨</div>
							<div id="comfort6">• 다리미</div>
							<div id="comfort7">• 샴푸</div>
							<div id="comfort8">• 헤어드라이어</div>
							<div id="comfort9">• 조식, 커피, 차</div>
							<div id="comfort10">• 업무 가능 공간/책상</div>
							<div id="comfort11">• 벽난로</div>
							<div id="comfort12">• 옷장/서랍장</div>
							<div id="comfort13">• 게스트 전용 출입문</div>
						</div>
						<div class="house-facility">
							<div id="secure1">• 화재감지기</div>
							<div id="secure2">• 일산화탄소 감지기</div>
							<div id="secure3">• 구급상자</div>
							<div id="secure4">• 소화기</div>
							<div id="secure5">• 침실문 잠금장치</div>
						</div>
						<div class="house-facility">
							<div id="use1">• 주방</div>
							<div id="use2">• 세탁기</div>
							<div id="use3">• 건조기</div>
							<div id="use4">• 주차</div>
							<div id="use5">• 헬스장</div>
							<div id="use6">• 수영장</div>
							<div id="use7">• 자쿠지</div>
						</div>
					</div>
				</div>
				<div class="div-booking">
					<div class="booking-group">
						<div class="booking1">
							<label class="charge"><b>₩${house.house_charge }</b>/박</label>
							<label class="score">⭐&nbsp;${house.review_score }&nbsp;${house.review_count }</label>
						</div>
						<div class="booking2">
							<div class="checkin">
								<p class="small text-left">체크인</p>
								<p class="text-left">${infoMap.checkin }</p>
							</div>
							<div class="checkout">
								<p class="small text-left">체크아웃</p>
								<p class="text-left">${infoMap.checkout }</p>
							</div>
							<div class="person">
								<p class="small text-left">인원</p>
								<p class="text-left">${infoMap.person}</p>
							</div>
						</div>
						<div class="booking3">
							<button type="button" class="btn btn-primary btn-lg" onclick="sendtoPayment()">결제하기</button>
						</div>
						<div class="booking4">
							<label class="text-left">₩${house.house_charge } X ${infoMap.gap }박</label>
							<label class="text-right">₩${house.house_charge*infoMap.gap }</label>
						</div>
						<hr class="my-3">
						<div class="booking5">
							<label class="text-left">총 합계</label>
							<label class="text-right">₩${house.house_charge*infoMap.gap }</label>
						</div>
					</div>
				</div>
			</div>
			<div class="div-review">
<c:choose>
<c:when test="${listReview=='[]' }">
				<h4 class="text-left">후기 (아직)없음</h4>
</c:when>
<c:otherwise>
				<h4 class="text-left">후기 ${house.review_count }개</h4>
				<div class="house-review">
<c:forEach var="review" items="${listReview }">
					<div class="review-body">
						<div class="review-member">
							<p class="text-left">${review.member_id }</p>
							<p class="small text-left">${review.review_writedate }</p>
						</div>
						<div class="review-content">
							<p class="text-left">${review.review_content }</p>
						</div>
					</div>
</c:forEach>				
				</div>
</c:otherwise>
</c:choose>
			</div>
			<div class="div-location">
				<div class="map"></div>
				<p class="text-left">${house.house_location } ${house.house_location_etc }</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>