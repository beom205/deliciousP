<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>DeliciousP : 지역별 맛집 검색 서비스</title>

  <!-- 로고 폰트 -->
  <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
<style>
#lists {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#lists td, #lists th {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

#lists tr:nth-child(even){background-color: #e0f2f1;}

#lists tr:hover {background-color: #80cbc4;}

#lists th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #26a69a;
    color: white;
}

</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: 300px; margin: 72px 0 0 0; position: fixed;" ></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0aae48ac4ccf8056a81bead68dbb539c">
	</script>
		

	<script>
	var keyword = ${keyword};
	$(document).ready(function(){
		
		$.getJSON("/list/ajax?keyword="+keyword, function(data) {
		console.log(data);
			
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(data[0].rlat, data[0].rlng),
			level : 3
		};
		var map = new daum.maps.Map(container, options);
		/*
		*/
		var points = [
			new daum.maps.LatLng(data[0].rlat, data[0].rlng),
			new daum.maps.LatLng(data[1].rlat, data[1].rlng),
			new daum.maps.LatLng(data[2].rlat, data[2].rlng),
			new daum.maps.LatLng(data[3].rlat, data[3].rlng),
			new daum.maps.LatLng(data[4].rlat, data[4].rlng)
		];
		var bounds = new daum.maps.LatLngBounds();   
		var i, marker, infowindow;
		for (i = 0; i < points.length; i++) {
		    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
		    marker =     new daum.maps.Marker({ position : points[i] });
		    
		    var infowindow = new daum.maps.InfoWindow({
		    	position : points[i], content : data[i].rname 
		    });
		    
		    marker.setMap(map);
		    infowindow.open(map, marker); 
		    // LatLngBounds 객체에 좌표를 추가합니다
		    bounds.extend(points[i]);

		}
		map.setBounds(bounds);
	});
	});
	</script>

	<div style="padding-top:372px">
		<table id="lists">
			<thead>
				<tr>
					<th>식당번호</th>
					<th>식당이름</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>위도</th>
					<th>경도</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" begin="0" end="5" var="result">
					<tr class="odd gradeX">
						<td><c:out value='${result.rno}'></c:out></td>
						<td><a href="/list/detail?rno=${result.rno}"><c:out value='${result.rname}'></c:out></a></td>
						<td><c:out value='${result.raddress}'></c:out></td>
						<td><c:out value='${result.rtel}'></c:out></td>
						<td><c:out value='${result.rlat}'></c:out></td>
						<td><c:out value='${result.rlng}'></c:out></td>
					</tr>
				</c:forEach>
			<tbody id="add">
			</tbody>
		</table>
						<button id="load">더보기</button>
	</div>

	<script>
		var page = 1;
		var btn = $("#load");
					btn.on("click", function() {
						$.getJSON("/list/ajax?page="+ page + "&keyword="+ keyword, function(data) {
							var num = page * 5 + 1;
							console.log(data[num]);
							var content = "";
							for (var i = num; i < num + 5; i++) {
								content += "<tr>" + "<td>" + data[i].rno
										+ "</td>" + "<td><a href='/list?detail="+data[i].rno+"'>" + data[i].rname+"</a>"
										+ "</td>" + "<td>" + data[i].raddress
										+ "</td>" + "<td>" + data[i].rtel
										+ "</td>" + "<td>" + data[i].rlat
										+ "</td>" + "<td>" + data[i].rlng
										+ "</td>" + "</tr>";

							}
							$(content).appendTo("#add");
							page++;

						});
					});
	</script>
	
</body>
</html>