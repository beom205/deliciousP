<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<title>등록</title>
</head>
<body>
   <form name="form1" method="post" action="${path}/list/register" enctype='multipart/form-data'>
            <table class="detail_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>신규업체등록</caption>
            <tbody>
                <tr>
                    <th scope="row">업체명</th>
                    <td><input name="rname" id="rname" size="80" placeholder="업체명을 입력해주세요"></td>
                </tr>
                  <tr>
                    <th scope="row">주소</th>
                    <td><input name="raddress" id="raddress" size="80" placeholder="주소를 입력해주세요"></td>
                </tr>
              <tr>
                    <th scope="row">전화</th>
                    <td><input name="rtel" id="rtel" size="80" placeholder="전화번호"></input></td>
                </tr>
                 <tr>
                    <th scope="row">홈페이지</th>
                    <td><input name="rhomepage" id="rhomepage" size="80" placeholder="홈페이지 주소입력해주세요"></input></td>
                </tr>
                <tr>
                    <th scope="row">영업시간</th>
                    <td><input name="rtime" id="rtime" size="80"  placeholder="영업시간 "></input></td>
                </tr>
                <tr>
                    <th scope="row">휴무일</th>
                    <td><input name="rholiday" id="rholiday" size="80" placeholder="휴무일"></input></td>
                </tr>
                 <tr>
                    <th scope="row">정보</th>
                    <td><input name="rinfo" id="rinfo" size="80" placeholder="정보"></input></td>
                </tr>
                <tr>
                    <th scope="row">위도</th>
                    <td><input name="rlng" id="rlng" size="80"  placeholder="위도"></input></td>
                </tr>
                <tr>
                    <th scope="row">경도</th>
                    <td><input name="rlat" id="rlat" size="80" placeholder="경도"></input></td>
                </tr>
                <tr>
                    <th scope="row">이미지</th>
                    <td><input type="file" name="f1" id="f1" size="80"></input></td>
                </tr>
            </tbody>
        </table>
          <button type="button" id="btnSave">확인</button>
   		  <button type="reset">취소</button>
   </form>
  <form id="form1" runat="server">
      <input type='file' id="imgInp" name="commentParentFile"/>
            <img id="blah" src="#"/>
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
        document.form1.submit();
    });
    
});
	
   
</script>

</body>
</html>