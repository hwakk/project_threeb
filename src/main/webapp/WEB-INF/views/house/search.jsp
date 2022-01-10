<%@page import="net.sf.json.JSON"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>	
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
<link rel="stylesheet" href="${contextPath }/resources/css/jquery.scrollbar.css"/>
<link rel="stylesheet" href="${contextPath }/resources/css/house/search.css"/>
<title>숙소</title>
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
	position: fixed !important;
	background-color: #fff!important;
	box-shadow: 0 1px 15px rgba(0, 0, 0, .08);
}
</style>
<script>
var checkin="${searchMap.start}";
var checkout="${searchMap.end}";
var gap=${searchMap.gap};
var person=${searchMap.person};
var detail="${searchMap.detail}";

function sendtoInfo(house_id, charge){
   location.href="${contextPath}/house/info.do?id=" + house_id
         + "&checkin=" + checkin
         + "&checkout=" + checkout
         + "&gap=" + gap
         + "&person=" + person
         + "&detail=" + detail
         + "&host=0";
}

jQuery(document).ready(function(){
    jQuery('.scrollbar-dynamic').scrollbar();
});
</script>
</head>
<body>	
<div class="div-body">
	<div class="div-list">
		<div class="div-location" align="left">
			<p>${searchMap.searched }개의 숙소 · ${searchMap.start } - ${searchMap.end } · 게스트 ${searchMap.person }명</p>
			<h2>${searchMap.location }의 숙소</h2>
		</div>
		<div class="scrollbar-dynamic div-house-list">
		<c:choose>
		<c:when test="${not empty houseList && houseList !='null' }"> 
		<c:forEach var="item" items="${houseList }" varStatus="status">		
		<div class="div-house">		
			<div id="carousel${status.index }" class="carousel slide" data-interval="false" data-ride="carousel">
				<ol class="carousel-indicators">
				<c:if test="${fn:length(houseImgList[status.index]) < 3}">
					<c:set var="end" value="${fn:length(houseImgList[status.index])}"/>
				</c:if>
				<c:if test="${fn:length(houseImgList[status.index]) >= 3}">
					<c:set var="end" value="3"/>
				</c:if>
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
							<img src="${contextPath}/download.do?house_id=${item.house_id}&imageFileName=${houseImgList[status.index][0].filename}" class="d-block w-100" alt="">
						</div>
 					</c:when>
 					<c:otherwise>
 						<div class="carousel-item">
							<img src="${contextPath}/download.do?house_id=${item.house_id}&imageFileName=${houseImgList[status.index][i].filename}" class="d-block w-100" alt="">
						</div>
 					</c:otherwise>
 					</c:choose>			
 				</c:forEach>
			</div>
				<a class="carousel-control-prev" href="#carousel${status.index }" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carousel${status.index }" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<div class="div-spec" onClick="sendtoInfo(${item.house_id}, ${item.house_charge })">		
				<div class="div-spec1">
					<h5 class="text-left">${houseList[status.index].house_location }의 ${houseList[status.index].house_type }의 ${houseList[status.index].house_type_detail }</h5>
				</div>
				<div class="div-spec2">
					<h3 class="text-left">${houseList[status.index].house_title }</h3>
				</div>
				<div class="div-spec3"></div>	
				<div class="div-spec4">
					<p class="text-left">최대 인원 ${houseList[status.index].house_person }명 · 침실 ${houseList[status.index].house_room }개 · 침대 ${houseList[status.index].house_bed }개 · 욕실 ${houseList[status.index].house_bath }개</p>
				</div>	
				<div class="float-left div-spec5">
					<p class="text-left">⭐&nbsp;${houseList[status.index].review_score }&nbsp;<small>(${houseList[status.index].review_count })</small></p>
				</div>
				<div class="float-right div-spec6">
					<p class="text-right"><b>₩${houseList[status.index].house_charge }</b>/1박</p>				
					<p class="small text-right">총 요금:&nbsp;₩${houseList[status.index].house_charge * searchMap.gap}</p>
				</div>	
			</div>			
		</div>		
		</c:forEach>
		</c:when>		
		</c:choose>
		</div>
		<%-- 페이징 쪽 나누기 --%>
		<div class="div-page">
			<nav aria-label="...">
			<ul class="pagination">
			  	<c:if test="${searchMap.page <= 1 }">			
					<li class="page-item disabled">
						<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Prev</a>
					</li>		
				</c:if> 
				<c:if test="${searchMap.page > 1 }">
				    <li class="page-item"><a class="page-link" href="${contextPath }/house/search.do?page=${searchMap.page -1}&address=${searchMap.location }&start=${searchMap.start}&end=${searchMap.end}&person=${searchMap.person}&detail=${searchMap.detail}">Prev</a></li>
				</c:if> 
				<!-- 시작페이지부터 끝페이지까지 1씩 증가하는 반복문 -->
				<c:forEach var="a" begin="1" end="${searchMap.maxpage }" step="1">	
				<!-- 선택된 페이지가 현재 페이지일 경우 -->	
				<c:if test="${a == searchMap.page }">
					<li class="page-item active" aria-current="page">
			      		<a class="page-link" href="#">${a }<span class="sr-only">(current)</span></a>
			   		</li>
				</c:if>
				<!-- 현재 선택된 쪽번호가 아닌 경우 -->
				<c:if test="${a != searchMap.page }">		
					<li class="page-item">
						<a class="page-link" href="${contextPath }/house/search.do?page=${a }&address=${searchMap.location }&start=${searchMap.start}&end=${searchMap.end}&person=${searchMap.person}&detail=${searchMap.detail}">${a }</a>
					</li>
				</c:if>
			</c:forEach> 
			<c:if test="${searchMap.page >= searchMap.maxpage}">
				<li class="page-item disabled">
					<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Next</a>
				</li>	
			</c:if> 
			<c:if test="${searchMap.page < searchMap.maxpage }">
				<li class="page-item">
			      <a class="page-link" href="${contextPath }/house/search.do?page=${searchMap.page + 1}&address=${searchMap.location }&start=${searchMap.start}&end=${searchMap.end}&person=${searchMap.person}&detail=${searchMap.detail}">Next</a>
			    </li>
			</c:if>
			</ul>
			</nav>
		</div>
	</div>
	<div class="div-map" id="map">
		<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	2195bda5cc0442e30e93d9b9b8e78985&libraries=services,clusterer,drawing"></script>
		<script>		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표  
		        level: 9// 지도의 확대 레벨
		    };  
															
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
		
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder(); 
			var callback = function(result, status){
				if (status === kakao.maps.services.Status.OK) {		
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				}
			}
				
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch("${searchMap.location}", function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			    if (status === kakao.maps.services.Status.OK) {					
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);	
			     	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			       	map.setCenter(coords);
			    }
			});
			
	
			
			${houseList}.forEach(function(house, i) {
				geocoder.addressSearch(house.house_location, function(result, status) {	
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				    if (status === kakao.maps.services.Status.OK) {
				    	console.log(result);
				 		var marker = new kakao.maps.Marker({
							map:map, 
							position:coords
						}); 
				 		
				 		var content = '<div class="customoverlay">'+ '₩ ' + house.house_charge + '</div>';
			
					 	// 커스텀 오버레이를 생성합니다
					 	var customOverlay = new kakao.maps.CustomOverlay({
					 	    map: map,
					 	    position: coords,
					 	    content: content,
					 	    yAnchor: 1 
					 	});
	/* 			 		// 인포윈도우로 장소에 대한 설명을 표시합니다
					    var infowindow = new kakao.maps.InfoWindow({
					    	position:coords,
		                    content:
		                    	'<div class="customoverlay">'+ '₩' + house.house_charge + '</div>'              		        
					    }); */
				 		
					    kakao.maps.event.addListener(marker, 'click', function() {
					    	marker.setZIndex(5); 
					    	customOverlay.setZIndex(5);
					  	});
			    	}		    	    				    
					i++;
				});	
			});
		</script>
	</div>
</div>
</body>
</html>