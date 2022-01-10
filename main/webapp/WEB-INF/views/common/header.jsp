<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Varela+Round&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Gothic+A1" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath }/resources/css/common/header.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/725b2f0ba3.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.navbar {
	border: none;
}
</style>
<title>메인페이지</title>
</head>
<body>
<nav class="navbar navbar-default navbar-expand-lg fixed-top navbar-light">
	<div class="navbar-header">
		<a class="navbar-brand" href="${contextPath }/main.do"><i class="fas fa-bold"></i>.<i class="fas fa-bold"></i>.<i class="fas fa-bold"></i></a>
	</div>
	<div id="navbarCollapse" class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${member!=null }">
					<li class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							${member.member_id } 님&nbsp;&nbsp;<i class="fas fa-bars"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="${contextPath }/mypage/guest.do" class="dropdown-item">나의 예약</a></li>
							<li><a href="${contextPath }/mypage/host.do" class="dropdown-item">숙소 관리</a></li>
							<!-- <li><a href="#" class="dropdown-item">계정</a></li> -->
							<div class="dropdown-divider"></div>
							<li><a href="${contextPath }/member/logout.do" class="dropdown-item">로그아웃</a></li>
						</ul>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<a href="${contextPath }/member/joinForm.do" class="trigger-btn">회원가입</a>
					</li>
					<li class="nav-item">
						<a href="${contextPath }/member/loginForm.do" class="trigger-btn">로그인</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>
</body>
</html>