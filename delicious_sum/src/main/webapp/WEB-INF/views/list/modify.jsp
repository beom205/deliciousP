<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
</head>
<body>

<div id="map" style="width:;height:350px;"></div>
<form role= "form" method="post">
   <input type="hidden" name="rno" value="${detail.rno}">
</form>
 <form name="form1" method="post" action="${path}/list/modify" enctype='multipart/form-data'>

        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>수정</caption>
            <tbody>
                <tr>
                    <th scope="row">업체명</th>
                    <td><input name="rname" id="rname" size="80" value="${detail.rname}"></td>
                </tr>
                  <tr>
                    <th scope="row">주소</th>
                    <td><input name="raddress" id="radress" size="80" value="${detail.raddress}" ></td>
                </tr>
              <tr>
                    <th scope="row">전화</th>
                    <td><input name="rtel" id="rtel" size="80" value="${detail.rtel}"></input></td>
                </tr>
                 <tr>
                    <th scope="row">홈페이지</th>
                    <td><input name="rhomepage" id="rhomepage" size="80" value="${detail.rhomepage}" ></input></td>
                </tr>
                <tr>
                    <th scope="row">영업시간</th>
                     <td><input name="rtime" id="rtime" size="80" value="${detail.rtime}"></input></td>
                </tr>
                <tr>
                    <th scope="row">휴무일</th>
                     <td><input name="rholiday" id="rholiday" size="80" value="${detail.rholiday}"></input></td>
                </tr>
                 <tr>
                    <th scope="row">정보</th>
                    <td><input name="rinfo" id="rinfo" size="80" value="${detail.rinfo}"></input></td>
                </tr> 
                           
            </tbody>
        </table>
         
        <input type="hidden" name="rno" value="${detail.rno}">
          <button type="list" id="btnlist">목록</button>
         <button type="button" id="btnSave">확인</button>
    </form>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	
    $("#btnSave").click(function(){
    	
        var rname = $("#rname").val();
        var raddress = $("#raddress").val();
        var rtel = $("#rtel").val();
        var rhomepage = $("#rhomepage").val();
        var rtime = $("#rtime").val();
        var rholiday = $("#rholiday").val();
        var rinfo = $("#rinfo").val();
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
     
        document.form1.submit();
        
    });
        
        $("#btnlist").on("click",function(){
   		 	$("#formId").attr("action","/list/resultlist");
   	   	 document.form1.submit();
    });
    
});
</script>

</body>
</html>