<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/js/moment.min.js"></script>
<script src="${contextPath}/resources/js/daterangepicker.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<title>main</title>
<style>
html, body {
	font-family: 'Varela Round', 'Nanum Gothic';
}

body {
	background-image: url("${contextPath}/resources/image/main.png");
	background-repeat: no-repeat;
	background-size: cover;
}

body>div.wrap>div>div>div {
	transform: translate(-50%, -50%);
	position: absolute;
	top: 40%;
	left: 50%;
	padding: 20px;
	overflow: auto;
	border-radius: .5rem;
	background: rgba(0, 0, 0, 0.24);
}

.btn {
	color: #fff;
}

select {
	width: 200px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	border-radius: 0px;
}
.div-footer p {
	color: #555!important;
}
</style>
<script>
	//데이터 초기화
	window.onload = function() {
		$('input[name="address"]').val("");
		$('input[id="date"]').val("");
		$('select[id="adult"]').val("");
		$('select[id="child"]').val("0");
	}
</script>
</head>
<body>
	<div class="hero-section-wrap fl-wrap">
		<div class="container">
			<div class="intro-item fl-wrap">
				<div class="caption text-center cl-white"></div>
				<form action="${contextPath }/house/search.do" method="get" id="search-form">
					<fieldset class="home-form-1">
						<div class="col-md-3 col-sm-3 padd-0">
							<input type="text" id="address" name="address" class="form-control br-1" placeholder="어디로 여행가세요?" required>
						</div>
						<div class="col-md-3 col-sm-3 padd-0">
							<input type="text" id="date" class="form-control br-1" placeholder="날짜" required>
						</div>
						<input type="hidden" name="start" value=""/>
						<input type="hidden" name="end" value=""/>
						<div class="col-md-2 col-sm-2 padd-0">
							<div class="box">
								<select id="adult" class="wide form-control br-1" required>
									<option class="name"  data-display="Adults" value="" selected>성인</option>
									<option class="drop-link" value="1">1</option>
									<option class="drop-link" value="2">2</option>
									<option class="drop-link" value="3">3</option>
									<option class="drop-link" value="4">4</option>
									<option class="drop-link" value="5">5</option>
								</select>
							</div>
						</div>
						<div class="col-md-2 col-sm-2 padd-0">
							<div class="box">
								<select id="child" class="wide form-control br-1">
									<option class="name"  data-display="Childs" value="0" selected>어린이</option>
									<option class="drop-link" value="1">1</option>
									<option class="drop-link" value="2">2</option>
									<option class="drop-link" value="3">3</option>
									<option class="drop-link" value="4">4</option>
									<option class="drop-link" value="5">5</option>
								</select>
							</div>
						</div>
						<input type="hidden" name="person" value=""/>
						<input type="hidden" name="detail" value=""/>
						<div class="col-md-2 col-sm-2 padd-0">
							<button type="submit" class="btn theme-btn cl-white seub-btn">
								검색&nbsp;
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  									<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
 									<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
								</svg>
							</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#date').daterangepicker({
				autoUpdateInput : false,
				locale : {
					cancelLabel : 'Clear'
				}
			});

			$('#date').on(
					'apply.daterangepicker',
					function(ev, picker) {
						$(this).val(
							picker.startDate.format('YYYY-MM-DD') + ' - '
									+ picker.endDate.format('YYYY-MM-DD'));
							startDate = picker.startDate.format('YYYY-MM-DD');
							endDate = picker.endDate.format('YYYY-MM-DD');
							$('input[name="start"]').val(picker.startDate.format('YYYY-MM-DD'));
							$('input[name="end"]').val(picker.endDate.format('YYYY-MM-DD'));
					});

			$('#date').on('cancel.daterangepicker',
					function(ev, picker) {
						$(this).val('');
					});
		});
		
		$('#search-form').submit(function () {
			var person = parseInt($('#adult').val()) + parseInt($('#child').val());
			var detail = "성인 " + $('#adult').val() + ", 어린이 "
					+ $('#child').val();
			$('input[name="person"]').val(person);
			$('input[name="detail"]').val(detail);
		});
	</script>
</body>
</html>