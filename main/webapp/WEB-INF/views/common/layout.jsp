<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
html, body, div, header, footer {
	margin: 0;
	padding: 0;
}
html, body {
	height: 100%;
}
.wrap {
	min-height: calc(100% - 80px);
}
header {
	position: relative;
	height: 100px;
	background: transparent;
}
footer {
	position: relative;
	height: 80px;
	background: transparent;
	bottom: 0px;
}
.content {
	width: 100%;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title"/></title>
</head>
<body>
	<div class="wrap">
		<header class="header">
			<tiles:insertAttribute name="header"/>
		</header>
		<div class="content">
			<tiles:insertAttribute name="body"/>
		</div>
	</div>
	<footer class="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>