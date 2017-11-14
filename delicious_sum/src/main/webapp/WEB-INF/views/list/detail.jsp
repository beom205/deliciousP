<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세</title>
</head>
<body>
<div id="map" style="width:;height:350px;"></div>
<form role= "form" method="post">
   <input type="hidden" name="rno" value="${detail.rno}">
</form>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0aae48ac4ccf8056a81bead68dbb539c"></script>
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
   
 <form name="form1" method="post">
 
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>상세</caption>
            <tbody>
                <tr>
                    <th scope="row">업체명</th>
                    <td><input name="rname" id="rname" size="80" value="${detail.rname}" placeholder="업체명을 입력해주세요"></td>
                </tr>
                  <tr>
                    <th scope="row">주소</th>
                    <td><input name="raddress" id="radress" size="80" value="${detail.raddress}" placeholder="주소를 입력해주세요"></td>
                </tr>
              <tr>
                    <th scope="row">전화</th>
                    <td><input name="rtel" id="rtel" size="80" value="${detail.rtel}"></input></td>
                </tr>
                 <tr>
                    <th scope="row">홈페이지</th>
                    <td><input name="rhomepage" id="rhomepage" size="80" value="${detail.rhomepage}" placeholder="홈페이지주소"></input></td>
                </tr>
                <tr>
                    <th scope="row">영업시간</th>
                     <td><input name="rtime" id="rtime" size="80" value="${detail.rtime}" placeholder="영업시간 "></input></td>
                </tr>
                <tr>
                    <th scope="row">휴무일</th>
                     <td><input name="rholiday" id="rholiday" size="80" value="${detail.rholiday}" placeholder="휴무일"></input></td>
                </tr>
                           
            </tbody>
        </table>
         
        <input type="hidden" name="rno" value="${detail.rno}">
        <button type="button" id="btnUpdete">수정</button>
        <button type="button" id="btnDelete">삭제</button>
    </form>

<script>
    $(document).ready(function(){
        $("#btnDelete").click(function(){
            if(confirm("삭제하시겠습니까?")){
                document.form1.action = "${path}/list/remove";
                document.form1.submit();
            }
        });
        
        $("#btnUpdete").click(function(){
            var rname = $("#rname").val();
            var radress = $("#radress").val();
            var rtel = $("#rtel").val();
            var rhomepage = $("#rhomepage").val();
            var rhomepage = $("#rtime").val();
            var rhomepage = $("#rholiday").val();
            if(rname == ""){
                document.form1.rname.focus();
                return;
            }
            if(radress == ""){
                document.form1.radress.focus();
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
            if(rhomepage == ""){
                document.form1.rtime.focus();
                return;
            }
            if(rhomepage == ""){
                document.form1.rhomepage.focus();
                return;
            }
            document.form1.action="${path}/list/modify"
            document.form1.submit();
        });
    });
</script>

</body>
</html>