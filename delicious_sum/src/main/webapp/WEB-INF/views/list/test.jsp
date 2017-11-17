<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>DeliciousP : 지역별 맛집 검색 서비스</title>

<!-- 로고 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Pacifico"
	rel="stylesheet">
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

#lists tr:nth-child(even) {
	background-color: #e0f2f1;
}

#lists tr:hover {
	background-color: #80cbc4;
}

#lists th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #26a69a;
	color: white;
}

.button {
	border-radius: 4px;
	background-color: #80cbc4;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 20px;
	padding: 9.5px;
	width: 100%;
	transition: all 0.5s;
	cursor: pointer;
	margin: auto;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

* {
	box-sizing: border-box;
}

body {
	margin: 0;
}
/* Create three equal columns that floats next to each other */
.column1 {
	float: left;
	width: 30%;
	padding: 10px;
	height: 200px; /* Should be removed. Only for demonstration */
	overflow: hidden;
	border-left: 1px solid #80cbc4;
}

.column2 {
	float: left;
	width: 40%;
	padding: 10px;
	height: 200px; /* Should be removed. Only for demonstration */
}

.column3 {
	float: left;
	width: 30%;
	padding: 10px;
	height: 200px; /* Should be removed. Only for demonstration */
	border-left: 3px double #80cbc4;
	border-right: 1px solid #80cbc4;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

p {
	max-height: 10px;
}
hr {
	height: 1;
	border-top : 1px solid white;
	border-bottom : 1px dashed #80cbc4;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

	<div id="map"
		style="width: 100%; height: 300px; margin: 72px 0 0 0; position: fixed;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86372a8403c72bd6350b05636cc843f8">
		
	</script>


	<script>
		var keyword = '${keyword}';
		$(document)
				.ready(
						function() {

							$
									.getJSON(
											"/list/ajax?keyword=" + keyword,
											function(data) {
												console.log(data);

												var container = document
														.getElementById('map');
												var options = {
													center : new daum.maps.LatLng(
															data[0].rlat,
															data[0].rlng),
													level : 3
												};
												var map = new daum.maps.Map(
														container, options);
												var points=[];
												if(data.length<5){
													
												for(var v= 0; v<data.length; v++){
													points[v] = new daum.maps.LatLng(
															data[v].rlat,
															data[v].rlng)
												}
												}else{
												points = [
														new daum.maps.LatLng(
																data[0].rlat,
																data[0].rlng),
														new daum.maps.LatLng(
																data[1].rlat,
																data[1].rlng),
														new daum.maps.LatLng(
																data[2].rlat,
																data[2].rlng),
														new daum.maps.LatLng(
																data[3].rlat,
																data[3].rlng),
														new daum.maps.LatLng(
																data[4].rlat,
																data[4].rlng) ];
												}

												var bounds = new daum.maps.LatLngBounds();
												var i;
												var marker = [];
												var infowindow = [];
												for (i = 0; i < points.length; i++) {
													// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
													marker[i] = new daum.maps.Marker(
															{
																position : points[i]
															});

													infowindow[i] = new daum.maps.InfoWindow(
															{
																position : points[i],
																content : "식당이름 : "
																		+ data[i].rname
															});

													marker[i].setMap(map);

													// LatLngBounds 객체에 좌표를 추가합니다
													bounds.extend(points[i]);

												}
												map.setBounds(bounds);

												daum.maps.event.addListener(
														marker[0], 'mouseover',
														function() {
															infowindow[0].open(
																	map,
																	marker[0]);
														});
												daum.maps.event.addListener(
														marker[1], 'mouseover',
														function() {
															infowindow[1].open(
																	map,
																	marker[1]);
														});
												daum.maps.event.addListener(
														marker[2], 'mouseover',
														function() {
															infowindow[2].open(
																	map,
																	marker[2]);
														});
												daum.maps.event.addListener(
														marker[3], 'mouseover',
														function() {
															infowindow[3].open(
																	map,
																	marker[3]);
														});
												daum.maps.event.addListener(
														marker[4], 'mouseover',
														function() {
															infowindow[4].open(
																	map,
																	marker[4]);
														});

												daum.maps.event
														.addListener(
																marker[0],
																'mouseout',
																function() {
																	infowindow[0]
																			.close(
																					map,
																					marker[0]);
																});
												daum.maps.event
														.addListener(
																marker[1],
																'mouseout',
																function() {
																	infowindow[1]
																			.close(
																					map,
																					marker[1]);
																});
												daum.maps.event
														.addListener(
																marker[2],
																'mouseout',
																function() {
																	infowindow[2]
																			.close(
																					map,
																					marker[2]);
																});
												daum.maps.event
														.addListener(
																marker[3],
																'mouseout',
																function() {
																	infowindow[3]
																			.close(
																					map,
																					marker[3]);
																});
												daum.maps.event
														.addListener(
																marker[4],
																'mouseout',
																function() {
																	infowindow[4]
																			.close(
																					map,
																					marker[4]);
																});

											});
						});
	</script>

	<!-- 
	<div style="padding-top:372px">
		<table id="lists">
			<thead>
				<tr>
					<th>식당번호</th>
					<th>식당이름</th>
					<th>주소</th>
					<th>식당번호</th>
					<th>식당이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" begin="0" end="5" var="result">
					<tr>
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
						<button class="button" id="load"><span>더보기</span></button>
	</div>

		 -->
	<div style="padding-top: 372px; margin-left: 20%; margin-right:20%;">
		<c:forEach items="${list}" begin="0" end="5" var="result">
			<div class="column1" >
				<img src="/list/display?name=s_${result.file_name}" style="width: 100%;">
			</div>
			<div class="column2">
				<h2>
					<a href="/list/detail?rno=${result.rno}"><c:out value='${result.rname}'></c:out></a>
				</h2>
				<h5><c:out value='${result.rinfo}'></c:out></h5>
				<h5>
					<c:out value='${result.raddress}'></c:out>
				</h5>
			</div>
			<div class="column3">
				<h4>영업시간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;<c:out value='${result.rtime}'></c:out></h4>

				<h4>
					전화번호 |&nbsp;
					<c:out value='${result.rtel}'></c:out>
				</h4>

				<h4>
					홈페이지 |&nbsp;
					<c:if test='${result.rhomepage ne null}'>
						<c:out value='${result.rhomepage}'></c:out>
					</c:if>
					<c:if test='${empty result.rhomepage}'>
						<c:out value='없음'></c:out>
					</c:if>
				</h4>
			</div>
				<hr/>
		</c:forEach>
		<div id="add"></div>
	</div>
	<button class="button" id="load">
		<span>더보기</span>
	</button>
</body>
<script>
	var page = 1;
	var btn = $("#load");
	btn.on("click",function() {
		$.getJSON("/list/ajax?page=" + page + "&keyword="+ keyword,
					function(data) {
						var num = page * 5 + 1;
						console.log(data[num]);
						var content = "";
						for (var i = num; i < num + 5; i++) {
							if (data[i].rhomepage == null) {
								console
										.log(data[i].rhomepage);
								data[i].rhomepage = "없음";
								console
										.log(data[i].rhomepage);
							}
							content += "<div class='column1'><img src='/resources/samplerest.jpg' style='width:100%;'></div>"
									+ "<div class='column2'><h2>"
									+ "<a href='/list/detail?rno="+data[i].rno+"'>"+data[i].rname+"</a>"
									+ "</h2>"
									+ "<h5>레스토랑 타입</h5>"
									+ "<h5>"
									+ data[i].raddress
									+ "</h5>"
									+ "</div>"
									+ "<div class='column3'><h4>정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;rinfo(미완)</h4>"
									+ "<h4>전화번호 |&nbsp;"
									+ data[i].rtel
									+ "</h4>"
									+ "<h4>홈페이지 |&nbsp;"
									+ data[i].rhomepage
									+ "</h4>"
									+ "</div><p>&nbsp;</p>";
						}
						$(content).appendTo("#add");
						page++;

						var container = document
								.getElementById('map');
						var options = {
							center : new daum.maps.LatLng(
									data[num].rlat,
									data[num].rlng),
							level : 3
						};
						var map = new daum.maps.Map(
								container, options);

						var points = [];
						var bounds = new daum.maps.LatLngBounds();
						for (var j = num; j < num + 5; j++) {
							points[j] = new daum.maps.LatLng(
									data[j].rlat,
									data[j].rlng);
							console.log(points[j]);
						}
						;

						for (var k = num; k < num + 5; k++) {
							marker = new daum.maps.Marker({
								position : points[k]
							});

							var infowindow = new daum.maps.InfoWindow(
									{
										position : points[k],
										content : data[k].rname
									});
							marker.setMap(map);
							infowindow.open(map, marker);
							bounds.extend(points[k]);
						}
						;

						map.setBounds(bounds);

					});
	});
</script>

</html>