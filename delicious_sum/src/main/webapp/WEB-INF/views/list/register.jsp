<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery-3.2.1.js"></script>
<title>등록</title>
</head>
<body>
 <h1>${detail.rname}</h1>
 <h3>${detail.rinfo}</h3>
 <hr>  
   <form name="form1" method="post" action="${path}/list/register">
            <table class="detail_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>신규업체등록</caption>
            <tbody>
                <tr>
                    <th scope="row">업체명</th>
                    <td><input name="rname" id="rname" size="80" value="${detail.rname}" placeholder="업체명을 입력해주세요"></td>
                </tr>
                  <tr>
                    <th scope="row">주소</th>
                    <td><input name="radress" id="radress" size="80" value="${detail.radress}" placeholder="주소를 입력해주세요"></td>
                </tr>
              <tr>
                    <th scope="row">전화</th>
                    <td><input name="rtel" id="rtel" size="80" value="${detail.rtel}"></input></td>
                </tr>
                 <tr>
                    <th scope="row">홈페이지</th>
                    <td><input name="rhomepage" id="rhomepage" size="80" value="${detail.rhomepage}" placeholder="홈페이지 주소입력해주세요"></input></td>
                </tr>
                <tr>
                    <th scope="row">영업시간</th>
                    <td><input name="rtime" id="rtime" size="80" value="${detail.rtime}" placeholder="홈페이지 주소입력해주세요"></input></td>
                </tr>
                <tr>
                    <th scope="row">휴무일</th>
                    <td><input name="rholiday" id="rholiday" size="80" value="${detail.rholiday}" placeholder="홈페이지 주소입력해주세요"></input></td>
                </tr>
               <button>메뉴판사진등록</button>
            </tbody>
        </table>
         <button type="button" id="btnSave">확인</button>
           <button type="reset">취소</button>  
</form>

<script>
    $(document).ready(function(){
        $("#btnSave").click(function(){
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
            if(rtime == ""){
                document.form1.rtime.focus();
                return;
            }
            if(rholiday == ""){
                document.form1.rholiday.focus();
                return;
            }
            document.form1.submit();
        });
    });
</script>

</body>
</html>