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
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath }/resources/css/mypage/uploadForm.css"/>
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
<title>숙소 등록하기</title>
</head>
<body>
	<div class="content">
		<div class="body">
			<form action="${contextPath }/mypage/host/addNewHouse.do" method="post" enctype="multipart/form-data" id="house-form">
				<div class="form-group">
					<h3 class="text-left">숙소 등록하기</h3>
					<hr class="my-5">
				</div>
				<div class="form-group">
					<div class="house-type">
						<h4 class="text-left">등록하실 숙소 종류는 무엇인가요?</h4>
						<p class="small text-left">숙소 유형을 선택하세요.</p>
						<select class="custom-select custom-select-lg" id="house_type" name="house_type" required>
							<option value="" selected>하나를 선택해주세요.</option>
							<option value="아파트">아파트</option>
							<option value="주택">주택</option>
							<option value="별채">별채</option>
							<option value="호텔">호텔</option>
						</select>
					</div>
					<div class="house-type">
						<p class="text-left">게스트가 묵게 될 숙소 유형을 골라주세요.</p>
						<div class="float-left house-type-radio">
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio1" name="house_type_detail" class="custom-control-input" value="집 전체" checked>
								<label class="custom-control-label" for="customRadio1">집 전체</label>
								<div class="small text-left">게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로 이용합니다.<br>일반적으로 침실, 욕실, 부엌이 포함됩니다.</div>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio2" name="house_type_detail" class="custom-control-input" value="개인실">
								<label class="custom-control-label" for="customRadio2">개인실</label>
								<div class="small text-left">게스트에게 개인 침실이 제공됩니다. 침실 이외의 공간은 공용일 수 있습니다.</div>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio3" name="house_type_detail" class="custom-control-input" value="다인실">
								<label class="custom-control-label" for="customRadio3">다인실</label>
								<div class="small text-left">게스트는 개인 공간 없이, 다른 사람과 함께 쓰는 침실이나 공용 공간에서 숙박합니다.</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="house-option">
						<h4 class="text-left">숙소에 얼마나 많은 인원이 숙박할 수 있나요?</h4>
						<p class="small text-left">모든 게스트가 편안하게 숙박할 수 있도록 침대가 충분히 구비되어 있는지 확인하세요.</p>
						<div class="float-left house-options">
							<div class="option-title">최대 숙박 인원</div>
							<div class="float-right option-value">
								<div class="btn btn-outline-info btn-minus" onclick="personNum('minus')">-</div>
								<label class="house-value" id="house_person">0</label>
								<input type="hidden" name="house_person" value="0">
								<div class="btn btn-outline-info btn-plus" onclick="personNum('plus')">+</div>
							</div>
						</div>
					</div>
					<div class="house-option">
						<h4 class="text-left">게스트가 사용할 수 있는 침실은 몇 개인가요?</h4>
						<select class="custom-select custom-select-lg" id="house_room" name="house_room">
							<option value="0" selected>침실 0개</option>
							<option value="1">침실 1개</option>
							<option value="2">침실 2개</option>
							<option value="3">침실 3개</option>
							<option value="4">침실 4개</option>
							<option value="5">침실 5개</option>
							<option value="6">침실 6개</option>
							<option value="7">침실 7개</option>
							<option value="8">침실 8개</option>
							<option value="9">침실 9개</option>
							<option value="10">침실 10개</option>
						</select>
					</div>
					<div class="house-option">
						<h4 class="text-left">게스트가 사용할 수 있는 침대는 몇 개인가요?</h4>
						<div class="float-left house-options">
							<div class="option-title">침대</div>
							<div class="float-right option-value">
								<div class="btn btn-outline-info btn-minus" onclick="bedNum('minus')">-</div>
								<label class="house-value" id="house_bed">0</label>
								<input type="hidden" name="house_bed" value="0">
								<div class="btn btn-outline-info btn-plus" onclick="bedNum('plus')">+</div>
							</div>
						</div>
					</div>
					<div class="house-option">
						<h4 class="text-left">게스트가 사용할 수 있는 욕실은 몇 개인가요?</h4>
						<div class="float-left house-options">
							<div class="option-title">욕실</div>
							<div class="float-right option-value">
								<div class="btn btn-outline-info btn-minus" onclick="bathNum('minus')">-</div>
								<label class="house-value" id="house_bath">0</label>
								<input type="hidden" name="house_bath" value="0">
								<div class="btn btn-outline-info btn-plus" onclick="bathNum('plus')">+</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="house-location">
						<h4 class="text-left">숙소의 위치를 알려주세요.</h4>
						<div class="house-address1">
							<input type="text" class="form-control zipcode" id="zonecode" placeholder="우편번호" required/>
							<input type="button" class="btn btn-info btn-md" onclick="openDaumZipAddress();" value="주소찾기"/>
							<p class="small text-left">예) 135-919</p>
						</div>
						<div class="house-address2">
							<div class="house-address-d1">
								<input type="text" class="form-control address" id="address" name="house_location" readonly/>
								<p class="small text-left">예) 언주로 406</p>
							</div>
							<div class="house-address-d2">
								<input type="text" class="form-control address-etc" id="address_etc" name="house_location_etc"/>
								<p class="small text-left">예) 35동 4층 407호</p>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="house-facility">
						<h4 class="text-left">어떤 편의시설을 제공하시나요?</h4>
						<p class="small text-left">일반적으로 게스트가 기대하는 편의시설 목록입니다.</p>
						<div class="float-left house-comfort">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort1" value="1">
								<label class="custom-control-label" for="comfort1">필수 품목</label>
								<div class="small text-left">수건, 침대 시트, 비누, 화장지, 베개</div>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort2" value="2">
								<label class="custom-control-label" for="comfort2">무선인터넷</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort3" value="3">
								<label class="custom-control-label" for="comfort3">TV</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort4" value="4">
								<label class="custom-control-label" for="comfort4">난방</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort5" value="5">
								<label class="custom-control-label" for="comfort5">에어컨</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort6" value="6">
								<label class="custom-control-label" for="comfort6">다리미</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort7" value="7">
								<label class="custom-control-label" for="comfort7">샴푸</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort8" value="8">
								<label class="custom-control-label" for="comfort8">헤어드라이어</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort9" value="9">
								<label class="custom-control-label" for="comfort9">조식, 커피, 차</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort10" value="10">
								<label class="custom-control-label" for="comfort10">업무 가능 공간/책상</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort11" value="11">
								<label class="custom-control-label" for="comfort11">벽난로</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort12" value="12">
								<label class="custom-control-label" for="comfort12">옷장/서랍장</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input comfort-list" id="comfort13" value="13">
								<label class="custom-control-label" for="comfort13">게스트 전용 출입문 </label>
							</div>
						</div>
						<input type="hidden" name="house_comfort_facility" value="">
					</div>
					<div class="house-facility">
						<p class="text-left house-secure">안전시설</p>
						<div class="float-left house-secure">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input secure-list" id="secure1" value="1">
								<label class="custom-control-label" for="secure1">화재 감지기</label>
								<div class="small text-left">잘 작동하는 화재 감지기를 모든 방에 구비해 놓아야 하는지 현지 법규를 확인해보세요.</div>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input secure-list" id="secure2" value="2">
								<label class="custom-control-label" for="secure2">일산화탄소 감지기</label>
								<div class="small text-left">일산화탄소 감지기 구비 요건에 대해 현지 법규를 확인해보세요. 지역에 따라, 정상적으로 작동하는 일산화탄소 감지기를 모든 방에 설치해야 할 수 있습니다.</div>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input secure-list" id="secure3" value="3">
								<label class="custom-control-label" for="secure3">구급상자</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input secure-list" id="secure4" value="4">
								<label class="custom-control-label" for="secure4">소화기</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input secure-list" id="secure5" value="5">
								<label class="custom-control-label" for="secure5">침실문 잠금잠치</label>
								<div class="small text-left">안전과 사생활 보호를 위해 방문을 잠글 수 있음</div>
							</div>
						</div>
						<input type="hidden" name="house_secure_facility" value="">
					</div>
				</div>
				<div class="form-group">
					<div class="house-facility">
						<h4 class="text-left">게스트가 어떤 공간을 사용할 수 있나요?</h4>
						<p class="small text-left">등록하고자 하는 숙소에서 게스트가 이용 가능한 공용 공간을 선택하세요.</p>
						<div class="float-left house-use">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input use-list" id="use1" value="1">
								<label class="custom-control-label" for="use1">주방</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input use-list" id="use2" value="2">
								<label class="custom-control-label" for="use2">세탁 공간 - 세탁기</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input use-list" id="use3" value="3">
								<label class="custom-control-label" for="use3">세탁 공간 - 건조기</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input use-list" id="use4" value="4">
								<label class="custom-control-label" for="use4">주차</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input use-list" id="use5" value="5">
								<label class="custom-control-label" for="use5">헬스장</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input use-list" id="use6" value="6">
								<label class="custom-control-label" for="use6">수영장</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input use-list" id="use7" value="7">
								<label class="custom-control-label" for="use7">자쿠지</label>
							</div>
						</div>
						<input type="hidden" name="house_use_facility" value="">
					</div>
				</div>
				<div class="form-group">
					<div class="house-photo">
						<h4 class="text-left">멋진 사진으로 숙소가 돋보이게 해주세요.</h4>
						<p class="small text-left">휴대전화나 카메라를 사용하여 사진을 찍으세요. 숙소를 등록하려면 1장 이상의 사진이 필요합니다.</p>
						<div class="custom-file">
							<input type="file" name="file" multiple="multiple" class="custom-file-input" id="inputGroupFile01" required/>
							<label class="custom-file-label text-left" for="inputGroupFile01" aria-describedby="inputGroupFileAddon01">사진 업로드</label>
						</div>
						<ul id="fileList"></ul>
					</div>
				</div>
				<div class="form-group">
					<div class="house-content">
						<h4 class="text-left">게스트에게 숙소에 대해 설명해주세요.</h4>
						<p class="small text-left">숙소의 장점, 특별한 편의시설(예: 빠른 와이파이 또는 주차 시설)과 주변 지역의 매력을 소개해주세요.</p>
						<textarea class="form-control" name="house_content" id="house_content" required></textarea>
						<label class="small float-right text-muted" id="c_counter">500</label>
					</div>
				</div>
				<div class="form-group">
					<div class="house-title">
						<h4 class="text-left">숙소의 제목을 만드세요.</h4>
						<p class="small text-left">숙소의 특징과 장점을 강조하는 제목으로 게스트의 관심을 끌어보세요.</p>
						<input type="text" class="form-control" name="house_title" id="house_title" required/>
						<label class="small float-right text-muted" id="t_counter">50</label>
					</div>
				</div>
				<div class="form-group">
					<div class="house-charge">
						<h4 class="text-left">숙소 요금 설정하기</h4>
						<label class="text-left">기본 요금</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text border-right-0">₩</span>
								<input type="text" class="form-control border-left-0" id="house_charge" name="house_charge" required/>
							</div>
						</div>
						<p class="small float-right">1박당 요금</p>
					</div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-md float-right btn-submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>
<script>
	//submit
	$('#house-form').submit(function () {
		const result=check_charge();
		if(!result) {
			return false;
		}else {
			comfort_list=[];
			$(".comfort-list:checked").each(function () {
				var value=$(this).val();
				comfort_list.push(value);
			});
			$("input[name='house_comfort_facility']").val(comfort_list);
			
			secure_list=[];
			$(".secure-list:checked").each(function () {
				var value=$(this).val();
				secure_list.push(value);
			});
			$("input[name='house_secure_facility']").val(secure_list);
			
			use_list=[];
			$(".use-list:checked").each(function () {
				var value=$(this).val();
				use_list.push(value);
			});
			$("input[name='house_use_facility']").val(use_list);
		}
	});

	//최대 숙박 인원
	function personNum(e) {
		var count=parseInt($('#house_person').text());
		if(e=='minus') {
			if(count!=0){
				count--;
			}
		}else if(e=='plus') {
			count++;
		}
		$('#house_person').text(count);
		$('input[name=house_person]').val(count);
	}
	
	//침대 갯수		
	function bedNum(e) {
		var count = parseInt($('#house_bed').text());
		if (e == 'minus') {
			if (count != 0) {
				count--;
			}
		} else if (e == 'plus') {
			count++;
		}
		$('#house_bed').text(count);
		$('input[name=house_bed]').val(count);
	}
	
	//욕실 갯수
	function bathNum(e) {
		var count = parseInt($('#house_bath').text());
		if (e == 'minus') {
			if (count != 0) {
				count--;
			}
		} else if (e == 'plus') {
			count++;
		}
		$('#house_bath').text(count);
		$('input[name=house_bath]').val(count);
	}
	
	//다음 주소 api	
	function openDaumZipAddress() {
		new daum.Postcode({ oncomplete : function(data) {
			jQuery("#postcode1").val(data.postcode1);
			jQuery("#postcode2").val(data.postcode2);
			jQuery("#zonecode").val(data.zonecode);
			jQuery("#address").val(data.address);
			jQuery("#address_etc").focus();
			}
		}).open();
	}
	
	//파일 목록 출력
	$('#inputGroupFile01').on('change', function() {
		var fileName = $(this).val();
		$(this).next('.custom-file-label').html(fileName);
		fileList = $('#inputGroupFile01')[0].files;
		fileListTag = '<p class="small text-left">[선택한 파일 목록]</p>';
		for (var i = 0; i < fileList.length; i++) {
			fileListTag += '<li class="small text-left">'
				+ fileList[i].name + '</li>';
		}
		$('#fileList').html(fileListTag);
	});
	
	//숙소 설명 keyup		
	$('#house_content').keyup(function(e) {
		var content = $(this).val();
		$('#c_counter').html(500 - content.length);
		if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 500));
			$('#c_counter').html("500");
		}
	});
	
	//숙소 제목 keyup			
	$('#house_title').keyup(function(e) {
		var content = $(this).val();
		$('#t_counter').html(50 - content.length);
		if (content.length > 50) {
			alert("최대 50자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 50));
			$('#t_counter').html("50");
		}
	});
	
	//숙소 요금 keyup
	$('#house_charge').keyup(function(e) {
		var content = $(this).val();
		if (content.length > 12) {
			$(this).val(content.substring(0, 12));
		}
	});
	
	//숙박 요금 유효성 검사
	function check_charge() {
		var charge=parseInt($('#house_charge').val());
		if(isNaN(charge)){
			alert("요금은 숫자만 가능합니다.");
			$('#house_charge').val("");
			$('#house_charge').focus();
			return false;
		}
		return true;
	}
</script>
</body>
</html>