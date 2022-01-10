<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
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
<link rel="stylesheet" href="${contextPath }/resources/css/house/payment.css"/>
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
<title>숙소 결제</title>
</head>
<body>
	<div class="content">
		<div class="body">
			<form action="${contextPath }/house/payment/addNewBooking.do" method="post" id="payment-form">
				<div class="form-group">
					<div class="booking-form">
						<div class="float-left btn-box">
							<div class="btn-back" onclick="history.back()"><i class="fas fa-chevron-left"></i></div>
						</div>
						<div class="booking-info">
							<h3 class="text-left">확인 및 결제</h3>
							<h4 class="text-left">예약 정보</h4>
							<p class="text-left">날짜</p>
							<p class="small text-left date"><i class="far fa-calendar"></i> ${payMap.checkin } - ${payMap.checkout }</p>
							<p class="text-left">게스트</p>
							<p class="small text-left">게스트 ${payMap.person }명 (${payMap.detail })</p>
							<input type="hidden" name="house_id" value="${house.house_id }"/>
							<input type="hidden" name="checkin" value="${payMap.checkin }"/>
							<input type="hidden" name="checkout" value="${payMap.checkout }"/>
							<input type="hidden" name="booking_total" value="${payMap.person }"/>
							<input type="hidden" name="booking_detail" value="${payMap.detail }"/>
						</div>
						<hr class="my-5">
						<div class="booking-payment">
							<h4 class="text-left">결제 수단</h4>
							<select class="custom-select custom-select-lg" id="card_type" name="card_type">
								<option value="VISA" selected>신용카드 또는 체크카드</option>
								<option value="페이팔">페이팔</option>
								<option value="Google Pay">Google Pay</option>
							</select>
							<div class="col">
								<p class="text-left">카드 번호</p>
								<input type="text" id="cr_no" name="card_num" class="form-control" placeholder="0000 0000 0000 0000" size="19" minlength="19" maxlength="19" required>
							</div>
							<div class="form-row">
								<div class="col">
									<p class="text-left">만료일</p>
									<input type="text" id="exp" class="form-control" placeholder="MM/YY" size="5" minlength="4" maxlength="5" required>
								</div>
								<div class="col">
									<p class="text-left">CVV/CVC</p>
									<input type="password" id="cvv" class="form-control" placeholder="000" size="2" minlength="3" maxlength="3" required>
								</div>
							</div>
						</div>
						<hr class="my-5">
						<div class="booking-memo">
							<p class="text-left">호스트에게 메시지 보내기</p>
							<p class="small text-left">호스트에게 여행 목적과 도착 예정 시간을 알려주세요.</p>
							<textarea class="form-control" name="memo" id="memo"></textarea>
							<p class="small text-right" id="memo_cnt">(0 / 최대 200자)</p>
						</div>
						<hr class="my-5">
						<div class="clearfix booking-refund">
							<h4 class="text-left">환불 정책</h4>
							<label class="float-left text-left" id="refund">결제일 부터 7일 이내 예약을 취소하면 총 숙박 요금의 50% 및 서비스 수수료 전액이 환불됩니다.</label>
							<label class="float-left text-left">호스트가 제공하는 환불 정책이 내게 적합한지 확인하세요. 3월 15일 혹은 그 이후 확정된 예약에는 코로나19 확산 사태에 따른 정상참작이 가능한 상황 정책이 적용되지 않습니다.</label>
						</div>
						<hr class="my-5">
						<div class="booking-agree">
							<p class="small text-muted text-left" id="agree">
								아래 버튼을 선택하면, 숙소 이용규칙, 안전 정보 공개, 환불 정책, 에어비앤비의 사회적 거리 두기 및 기타 코로나19 관련 가이드라인, 
								및 게스트 환불 정책에 동의하는 것입니다. 또한 표시된 총 금액에 동의합니다. 에어비앤비는 이제 이 지역에서 정부가 부과한 숙박세를 징수하여 납부합니다.
							</p>
						</div>
						<div class="booking-btn">
							<button type="submit" class="btn btn-primary btn-lg float-left">예약 등록하기</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="booking-charge">
						<div class="booking-house">
							<div class="house-img">
								<img src="${contextPath}/download.do?house_id=${image.house_id}&imageFileName=${image.filename}" alt="house_img">
							</div>
							<div class="house-info">
								<p class="small text-left">${house.house_location }의 ${house.house_type_detail }</p>
								<h5 class="text-left">${house.house_title }</h5>
								<p class="small text-left">침실 ${house.house_room }개·침대 ${house.house_bed }·욕실 ${house.house_bath }개</p>
						<c:choose>
							<c:when test="${house.review_count==0 }">
								<p class="text-left" id="score">⭐&nbsp;후기 없음</p>	
							</c:when>
							<c:otherwise>
								<p class="text-left" id="score">⭐&nbsp;${house.review_score }&nbsp;(${house.review_count })</p>
							</c:otherwise>
						</c:choose>
							</div>
						</div>
						<hr class="my-5">
						<div class="booking-charge-detail">
							<h4 class="text-left">요금 세부 정보</h4>
							<label class="float-left">₩<small id="charge">${house.house_charge }</small>&nbsp;x&nbsp;${payMap.gap }박</label>
							<label class="float-right">₩<small id="amount">${house.house_charge * payMap.gap }</small></label>
						</div>
						<hr class="my-5">
						<div class="booking-total">
							<label class="float-left"><b>총 합계(KRW)</b></label>
							<label class="float-right"><b>₩<small id="amount_total">${house.house_charge * payMap.gap }</small></b></label>
							<input type="hidden" name="booking_amount" value="${house.house_charge * payMap.gap }"/>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
	//submit
	$('#payment-form').submit(function () {
		const result=check_cvv();
		if(!result) {
			return false;
		}
	});
	
	//메시지 keyup
	$('#memo').keyup(function(e) {
		var content = $(this).val();
		$('#memo_cnt').html("(" + content.length + " / 최대 200자)");
		if (content.length > 200) {
			alert("최대 200자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 200));
			$('#memo_cnt').html("(200 / 최대 200자)");
		}
	});
	
	function check_cvv() {
		var cvv=parseInt($('#cvv').val());
		if(isNaN(cvv)) {
			alert("CVV/CVC는 숫자만 가능합니다.");
			$('#cvv').val("");
			$('#cvv').focus();
			return false;
		}
		return true;
	}
	
	/* *********************여기서 부터 카드결제 ********************* */ 
	$(document).ready(function(){
	//For Card Number formatted input
		var cardNum = document.getElementById('cr_no');
		cardNum.onkeyup = function (e) {
			if (this.value == this.lastValue) return;
			var caretPosition = this.selectionStart;
			var sanitizedValue = this.value.replace(/[^0-9]/gi, '');
			var parts = [];
		
			for (var i = 0, len = sanitizedValue.length; i < len; i +=4) { 
				parts.push(sanitizedValue.substring(i, i + 4)); 
			} 
			for (var i=caretPosition - 1; i>= 0; i--) {
				var c = this.value[i];
				if (c < '0' || c > '9') {
					caretPosition--;
				}
			}
			caretPosition += Math.floor(caretPosition / 4);
			this.value = this.lastValue = parts.join(' ');
			this.selectionStart = this.selectionEnd = caretPosition;
		}

		//For Date formatted input
		var expDate = document.getElementById('exp');
		expDate.onkeyup = function (e) {
			if (this.value == this.lastValue) return;
			var caretPosition = this.selectionStart;
			var sanitizedValue = this.value.replace(/[^0-9]/gi, '');
			var parts = [];
					
			for (var i = 0, len = sanitizedValue.length; i < len; i +=2) { 
				parts.push(sanitizedValue.substring(i, i + 2)); 
			} 
			for (var i=caretPosition - 1; i>= 0; i--) {
				var c = this.value[i];
				if (c < '0' || c > '9') {
					caretPosition--;
				}
			}
			caretPosition += Math.floor(caretPosition / 2);
			this.value = this.lastValue = parts.join('/');
			this.selectionStart = this.selectionEnd = caretPosition;
		}
	});
	
	// ----------------------------숫자 천 단위마다  콤마 찍기 ---------------------------------
	// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
	Number.prototype.format = function(){
		if(this==0) return 0;

		var reg = /(^[+-]?\d+)(\d{3})/;
		var n = (this + '');

		while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		return n;
	};

	// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
	String.prototype.format = function(){
		var num = parseFloat(this);
		if( isNaN(num) ) return "0";

		return num.format();
	};

	jQuery('#amount').text(function() {
		jQuery(this).text(
			jQuery(this).text().format()
		);
	});
	
	jQuery('#charge').text(function() {
		jQuery(this).text(
			jQuery(this).text().format()
		);
	});
	
	jQuery('#amount_total').text(function() {
		jQuery(this).text(
			jQuery(this).text().format()
		);
	});

	function numberFormat(inputNumber) {
		return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	</script>
</body>
</html>