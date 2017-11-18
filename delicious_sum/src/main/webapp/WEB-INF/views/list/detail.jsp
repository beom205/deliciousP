<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../resources/css/detailstar.css">

<title>상세</title>
</head>
<style>
.star{
	z-index: -1;
}
.white{
	background-color: red;
	width:100px;
}
</style>
<body>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<div id="map" style="width:;height:350px;"></div>
<form role= "form" method="post">
   <input type="hidden" name="rno" value="${detail.rno}">
</form>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86372a8403c72bd6350b05636cc843f8"></script>
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
   
   
 <h1>${detail.rname}</h1>
 <h3>${detail.rinfo}</h3>
 <hr> 
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>상세</caption>
            <tbody>
                <tr>
                    <th scope="row">업체명</th>
                   
                      <td><h2>${detail.rname}</h2></td>
                </tr>
                  <tr>
                    <th scope="row">주소</th>
                    <td><h2>${detail.raddress}</h2></td>
                </tr>
                  <tr>
                    <th scope="row">전화</th>
                    <td><h2>${detail.rtel}</h2></td>
                </tr>
                  <tr>
                    <th scope="row">홈페이지</th>
                    <td><h2>${detail.rhomepage}</h2></td>
                </tr>
                  <tr>
                    <th scope="row">영업시간</th>
                    <td><h2>${detail.rtime}</h2></td>
                </tr>
                  <tr>
                    <th scope="row">휴무일</th>
                    <td><h2>${detail.rholiday}</h2></td>
                </tr>
                 <tr>
                    <th scope="row">정보</th>
                    <td><h2>${detail.rinfo}</h2></td>
                </tr>          
                <tr>
                    <th scope="row">이미지</th>
                    <td><h2><img src="/list/display?name=s_${photo}"/> </h2></td>
                </tr>
            </tbody>
        </table>
    <form name="form1" id="formId">    
        <input type="hidden" name="rno" value="${detail.rno}">
        <button type="button" id="btnRegister">평가하기</button>
        <button type="button" id="btnUpdete">수정</button>
        <button type="button" id="btnDelete">삭제</button>
        <hr>
        <button type="button" id="btnReviewPlus">댓글 보기</button>
         <div class="hidden reviewDiv" >
    
        </div>
    </form>
	<form id="reviewForm" action="/register/review" >
    	<input type="hidden" name="rno" value="${detail.rno}"> 
    </form>
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
        			rStr += '<div>'+data[i].mphoto+'</div>';
        			rStr += '<div>'+data[i].uid+'</div>';
        			rStr += '<div class="star_'+data[i].avg_rate+'">★★★★★ '+data[i].avg_rate+'</div>';
        			rStr += '<div>'+data[i].reg_date+'</div>';
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