<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/../resources/css/detailstar.css">

<title>상세</title>
</head>
<style>
	
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
*{
font-family: 'Jeju Gothic', serif;
}
.star {
	z-index: -1;
}

.white {
	background-color: red;
	width: 100px;
}

.body {
	margin-top: 10px;
	margin-left: 20%;
	margin-right: 20%;
}

.top {
	margin-top: -20px;
	background-color: #26a69a;
	min-height: 180px;
	color: white;
}

.topSpace {
	margin-left: 20%;
	margin-right: 20%;
}

.column1 {
	width: 20%;
	float: left;
}

.column2 {
	width: 40%;
	float: left;
}

.column3 {
	width: 30%;
	float: left;
}

.column4 {
	width: 30%;
	float: left;
}

b {
	color: #004d40;
}
.td1 {
    background-color: #d1c4e9;
    border-left: 40px solid #b39ddb;
    text-align: center;
}
.td2 {
    background-color: #c5cae9;
    border-left: 40px solid #9fa8da ;
    text-align: center;
}
.td3 {
    background-color: #bbdefb ;
    border-left: 40px solid #90caf9;
    text-align: center;
}
.photo{
	width:100%;
}
</style>
<body>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<div id="map" style="width:; height: 350px;"></div>
	<form role="form" method="post">
		<input type="hidden" name="rno" value="${detail.rno}">
	</form>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86372a8403c72bd6350b05636cc843f8"></script>
	<script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new daum.maps.LatLng(${detail.rlat},${detail.rlng}), // 지도의 중심좌표
              level: 3, // 지도의 확대 레벨
              mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
          }; 

      // 지도를 생성한다 
      var map = new daum.maps.Map(mapContainer, mapOption); 

      // 지도에 확대 축소 컨트롤을 생성한다
      var zoomControl = new daum.maps.ZoomControl();

      // 지도의 우측에 확대 축소 컨트롤을 추가한다
      map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

      // 지도에 마커를 생성하고 표시한다
      var marker = new daum.maps.Marker({
          position: new daum.maps.LatLng(${detail.rlat}, ${detail.rlng}), // 마커의 좌표
          draggable : true, // 마커를 드래그 가능하도록 설정한다
          map: map // 마커를 표시할 지도 객체
      });

      // 마커 위에 표시할 인포윈도우를 생성한다
      var infowindow = new daum.maps.InfoWindow({
          content : '<div style="padding:5px;">유림이네</div>' // 인포윈도우에 표시할 내용
      });

      // 인포윈도우를 지도에 표시한다
      infowindow.open(map, marker);

      // 마커에 mouseover 이벤트를 등록한다
      daum.maps.event.addListener(marker, 'mouseover', function() {
          console.log('마커에 mouseover 이벤트가 발생했습니다!');
      });

      // 마커에 mouseout 이벤트 등록
      daum.maps.event.addListener(marker, 'mouseout', function() {
          console.log('마커에 mouseout 이벤트가 발생했습니다!');
      });

      // 마커에 dragstart 이벤트 등록
      daum.maps.event.addListener(marker, 'dragstart', function() {
          console.log('마커에 dragstart 이벤트가 발생했습니다!');
      });

      // 마커에 dragend 이벤트 등록
      daum.maps.event.addListener(marker, 'dragend', function() {
          console.log('마커에 dragend 이벤트가 발생했습니다!');
      });
   </script>
	<div class="top">
		<div class="topSpace">
			<br>
			<h1>${detail.rname}</h1>
			<h3>${detail.rinfo}</h3>
			<button type="button" id="btnRegister"
				style="width: 200px; float: right; position: relative; bottom: 60px;">평가하기</button>
			<br>
		</div>
	</div>
	<div class="body">
		<div class="column1">
			<h2>
				<img src="/list/display?name=s_${photo}" style="width: 100%;" />
			</h2>
		</div>
		<div class="column2" style="font-size: 20px; margin-top: 50px;">
			<b>매장주소 | </b> ${detail.raddress}<br> <b>전화번호 | </b>
			${detail.rtel}<br> <b>홈페이지 | </b> ${detail.rhomepage}<br>
		</div>
		<div class="column3" style="font-size: 20px; margin-top: 50px;">
			<b>영업시간 | </b> ${detail.rtime}<br> <b>휴무일 &nbsp; &nbsp;| </b>
			${detail.rholiday}<br>
		</div>
		<form name="form1" id="formId">
			<input type="hidden" name="rno" value="${detail.rno}">
			<button type="button" id="btnUpdete" style="float: right;">수정</button>
			<button type="button" id="btnDelete" style="float: right;">삭제</button>
			<button type="button" id="btnReviewPlus" style="width: 100%;">댓글
				보기</button>

<!-- 
			<div>
				<div class="column1">
					<img src="/list/display?name=s_${photo}" style="width: 100%;" />
				</div>
				<div class="column4" style="font-size: 20px;">
					<div>작성자 | 작성자이름</div>
					<div class="star_'+data[i].avg_rate+'">★★★★★ 5</div>
					<div>2017. 11. 18.</div>
				</div>
				<div>
					<table style="font-size: 20px;">
						<tr>
							<td class="td1">&nbsp; 방문목적 &nbsp;</td>
							<td><span>데이트,기념일조용한,고급스러운조용한,고급스러운조용한,고급스러운</span></td>
						</tr>
						<tr>
						<td class="td2">분위기</td>
						<td>
							<div>조용한,고급스러운조용한,고급스러운조용한,고급스러운조용한,고급스러운</div>
						</td>
						</tr>
						<tr>
						<td class="td3">편의시설</td>
						<td>
							<div>조용한,고급스러운조용한,고급스러운조용한,고급스러운조용한,고급스러운</div>
						</td>
						</tr>
					</table>
				</div>
				<div>방문후기~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</div>
				<div></div>
			</div>
			<hr>
 -->
			
			
			
			<div class="hidden reviewDiv"></div>
		</form>


		<form id="reviewForm" action="/register/review">
			<input type="hidden" name="rno" value="${detail.rno}">
		</form>
	</div>
	<script>
	/* 디테일 스크립트 */
    $(document).ready(function(){
        $("#btnDelete").click(function(){
            if(confirm("삭제하시겠습니까?")){
              $("#formId").attr("method","POST")
              			  .attr("action","/list/remove");
            	document.form1.submit();
            }    	
        });
    	
    	$("#btnUpdete").on("click",function(){
    		 $("#formId").attr("action","/list/modify");
    	    document.form1.submit();
    		
    	});
    });
	
	function dateFormat(cDate){
		return new Date(cDate).toLocaleDateString();
	}
	
	
	/* 댓글 스크립트 */
	 $("#btnRegister").on('click', function(){
        	console.log("버튼 눌림");
        	$("#reviewForm").submit();
        });
        
        function reviewPlus(){
        	$.ajax({
        		url:"/list/review",
        		data:"rno=${detail.rno}",
        		dataType: "json"
        	}).done(function(data){
        		console.log("탓는지");
        		console.log(data);
        		
        		var rStr = "";
        		for(var i = 0 ; i < data.length; i++){
        			rStr += '<div>';
    	rStr +=			'<div class="column1">';
					for(var j = 0; j < data[i].rphoto.length ; j++){
						var rp = data[i].rphoto[j];
						if(rp.endsWith(".jpg")){
							rStr += '<img src="/register/display?name=s_'+rp+'"style="width: 100%;" />';
						}
					}
    	rStr += '</div>';
    	rStr +=			'<div class="column4" style="font-size: 20px;">';
    	rStr +=				'<div>작성자 | '+data[i].uid+'</div>';
    	rStr +=				'<div class="star_'+data[i].avg_rate+'">★★★★★ '+data[i].avg_rate+'</div>';
    	rStr +=				'<div>'+dateFormat(data[i].reg_date)+'</div>';
        rStr +=			'</div>';
        rStr +=			'<div>';
    	rStr +=				'<table style="font-size: 20px;">';
    	rStr +=					'<tr>';
    	rStr +=						'<td class="td1">&nbsp; 방문목적 &nbsp;</td>';
    	rStr +=						'<td>'+data[i].convenience_keyword+'</td>';
    	rStr +=					'</tr>';
    	rStr +=					'<tr>';
    	rStr +=					'<td class="td2">분위기</td>';
    	rStr +=					'<td>';
    	rStr +=						'<div>'+data[i].mood_keyword+'</div>';
    	rStr +=					'</td>';
    	rStr +=					'</tr>';
    	rStr +=					'<tr>';
    	rStr +=					'<td class="td3">편의시설</td>';
    	rStr +=					'<td>';
    	rStr +=						'<div>'+data[i].purpose_keyword+'</div>';
    	rStr +=					'</td>';
    	rStr +=					'</tr>';
    	rStr +=				'</table>';
    	rStr +=			'</div>';
    	rStr +=			'<div>'+data[i].content+'</div>';
    	rStr +=		'</div>';
    	rStr +=		'<hr>';
        			/*
        			rStr += '<div>';
        			rStr += '<div>'+data[i].mphoto+'</div>';
        			rStr += '<div>'+data[i].uid+'</div>';
        			rStr += '<div class="star_'+data[i].avg_rate+'">★★★★★ '+data[i].avg_rate+'</div>';
        			rStr += '<div>'+dateFormat(data[i].reg_date)+'</div>';
        			rStr += '<div>'+data[i].content+'</div>';
					
					for(var j = 0; j < data[i].rphoto.length ; j++){
						var rp = data[i].rphoto[j];
						if(rp.endsWith(".jpg")){
							rStr += '<img src="/register/display?name=s_'+rp+'">';
						}
					}
        			rStr += '<div>방문목적 : '+data[i].convenience_keyword+'</div>';
        			rStr += '<div>분위기 : '+data[i].mood_keyword+'</div>';
        			rStr += '<div>편의시설 : '+data[i].purpose_keyword+'</div>';
        			rStr += '</div>';
        			rStr += '<hr>';
        			*/
        			
        			/*
        			rStr += '<div>'+
    						'<div>'+data[i].mphoto+'</div>'+
    						'<div>'+data[i].uid+'</div>'+
    						'<div class="star_'+data[i].avg_rate+'">★★★★★ '+data[i].avg_rate+'</div>'+
    						'<div>'+data[i].reg_date+'</div>'+
    						'<div>'+data[i].content+'</div>'+
    						
    						for(var j = 0; j < data[i].rphoto.length ; j++){
    							var rp = data[i].rphoto[j];
    							if(rp.endsWith(".jpg")){
			        			'<img src="/register/display?name=s_'+rp+'">'+
    							}
    						}
        					'<div>방문목적 : '+data[i].convenience_keyword+'</div>'+
        					'<div>분위기 : '+data[i].mood_keyword+'</div>'+
        					'<div>편의시설 : '+data[i].purpose_keyword+'</div>'+
    						'</div>'
    				*/
        		}
        		$(".reviewDiv").html(rStr);
        	});
        }  
        
        $("#btnReviewPlus").on('click', function(){
        	$(".reviewDiv").toggleClass("hidden");
        	if(!$(".reviewDiv").hasClass("hidden")){
        		reviewPlus();		
        	}
        });

</script>
</body>
</html>