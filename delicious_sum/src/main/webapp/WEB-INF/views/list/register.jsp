<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/centerLogoHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	.inputHidden{
		display: none;
	}
	.container{
		margin-left: 20%;
		margin-right: 20%;
		margin-top: 5%;
		margin-bottom: 5%;
	}
</style>
<title>등록</title>
</head>
<body>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
 
   <form name="form1"  class="container" method="post" action="${path}/list/register" enctype='multipart/form-data'>
   	<input type="hidden" name="rtype" >
   	
			<div class="w3-container w3-teal" >
			  <h2>신규업체 등록</h2>
			 </div>
			 
			<label>업체명</label>
			<input class="w3-input" type="text" name="rname" id="rname" placeholder="업체명 또는 장소명을 입력하세요" style="width: 100%">
			
			<label>주소</label>
			<input class="w3-input" type="text" name="raddress" id="raddress" placeholder="주소입력하세요" style="width: 100%">
			<table>
			<tr>
			<td>
			<label>위도</label>
			<input class="w3-input" type="text" name="rlat" id="rlat"  style="width: 100%">
			</td>
			<td>
			<label>경도</label>
			<input class="w3-input" type="text" name="rlng" id="rlng" style="width: 100%">
			</td>
			</tr>
			</table>
	 <div id="map" style="width:;height:350px;"></div> 
	 
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86372a8403c72bd6350b05636cc843f8"></script>			  
	 <script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		    level: 3// 지도의 확대 레벨
		};  
	
		//지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		
		//현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		
		//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		    if (status === daum.maps.services.Status.OK) {
		        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		        
		        var content = '<div class="bAddr">' +
		                        '<span class="title">법정동 주소정보</span>' + 
		                        detailAddr + 
		                    '</div>';
		
		        // 마커를 클릭한 위치에 표시합니다 
		        marker.setPosition(mouseEvent.latLng);
		        marker.setMap(map);
		
		        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		        infowindow.setContent(content);
		        infowindow.open(map, marker);
		        }   
			 });
		});
		
		//중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'idle', function() {
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
		
		function searchAddrFromCoords(coords, callback) {
		// 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		
		function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		//지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		if (status === daum.maps.services.Status.OK) {
		    var infoDiv = document.getElementById('centerAddr');
		    infoDiv.innerHTML = result[0].address_name;
		}    
	}
</script>
<br>			  
           <div class="form-group" >
           	<label>전화</label>
           <table>
           <tr>
           <td>
        	&nbsp&nbsp<select class="selectBoxArea" name="area-code">
                		<option value="02">02</option>
                		<option value="031">031</option>
                		<option value="032">032</option>
                		<option value="033">033</option>
                		<option value="041">041</option>
                		<option value="042">042</option>
                		<option value="043">043</option>
                		<option value="051">051</option>
                		<option value="052">052</option>
                		<option value="053">053</option>
                		<option value="054">054</option>
                		<option value="055">055</option>
                		<option value="061">061</option>
                		<option value="062">062</option>
                		<option value="063">063</option>
                		<option value="064">064</option>
                	</select>
           </td>
           <td style="width:100%">
              <input class="w3-input" name="rtel" id="rtel" placeholder="전화번호입력하세요" style="width: 100%">  	
           </td>
           </tr>
           </table>
             </div><br>   	
       		<label>홈페이지</label>
			<input class="w3-input" type="text" name="rhomepage" id="rhomepage" placeholder="http://www.naver.com" style="width: 100%">
			
			<label>영업시간</label>
			<input class="w3-input" type="text" name="rtime" id="rtime" placeholder="영업시간" style="width: 100%">         	
           
           <label>휴무일</label>
			<input class="w3-input" type="text" name="rholiday" id="rholiday" placeholder="휴무일" style="width: 100%">   
			
           <label>상세정보</label>
           <textarea rows="5" cols="1" class="w3-input" name="rinfo" id="rinfo" placeholder="해당업체에 대한 설명을 입력해주세요"></textarea><br>
           
           <input type="file" name="f1" id="f1" size="80" class="w3-input"><br>
           
        	<b>음식점 타입</b>
        			<input type="text" class="inputHidden" id="iph">
        			&nbsp&nbsp<select class="selectBox" name="rtype" id="rtype">
                		<option value="한식">한식</option>
                		<option value="일식">일식</option>
                		<option value="중식">중식</option>
                		<option value="양식">양식</option>
                		<option value="뷔페">뷔페</option>
                		<option value="퓨젼">퓨젼</option>
                		<option value="7">직접입력</option>
                	</select>
                	<br>
        
          <button id="btnSave" type="button"  class="w3-button-large-teal">확인</button>
   		  <button type="reset" class="w3-button w3-large" >취소</button>
   </form>
   
   <ul class="uploadList">
   </ul>
   
   <form id="oper">
   
   </form>
   
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script>
	
	$(document).ready(function(){
	
	$(".selectBox").change(function(){
		console.log($(this).val());
		
		if($(".selectBox option:selected").val() == 7){
			$("#iph").removeClass("inputHidden");
		}else{
			$("#iph").addClass("inputHidden");
			
		}
	})	
		
		
    $("#btnSave").click(function(){
    	
        var rname = $("#rname").val();
        var raddress = $("#raddress").val();
        var rtel = $("#rtel").val();
        var rhomepage = $("#rhomepage").val();
        var rtime = $("#rtime").val();
        var rholiday = $("#rholiday").val();
        var rinfo = $("#rinfo").val();
        var rlat = $("#rlat").val();
        var rlng = $("#rlng").val();
        if(rname == ""){
            document.form1.rname.focus();
            return;
        }
        if(raddress == ""){
            document.form1.raddress.focus();
            return;
        }
        if(rtel == ""){
            document.form1.rtel.focus();
            return;
        }
         if(rhomepage == ""){
            document.form1.rhomepage.focus();
            return;
        }
        if(rtime == ""){
            document.form1.rtime.focus();
            return;
        }
        if(rholiday == ""){
            document.form1.rholiday.focus();
            return;
        }
        if(rinfo == ""){
            document.form1.rinfo.focus();
            return;
        }
        if(rlat == ""){
            document.form1.rlat.focus();
            return;
        }
        if(rlng == ""){
            document.form1.rlng.focus();
            return;
        } 
        
       rtel = $(".selectBoxArea").val()+"-"+ rtel; 
       console.log(rtel);
 		$("#rtel").val(rtel);
        
        document.form1.submit();
    });
    
});
	
   
</script>

</body>
</html>