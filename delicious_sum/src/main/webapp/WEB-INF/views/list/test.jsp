<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
	width:70%;
	border:1px solid black;
}
</style>
</head>
<body>
                 <div>
                     <table>
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
                             <c:forEach items="${list}" begin="0" end="9" var="result">
                                  <tr class="odd gradeX">
                                      <td><c:out value='${result.rno}'></c:out></td>
                                      <td><c:out value='${result.rname}'></c:out></td>
                                      <td><c:out value='${result.raddress}'></c:out></td>
                                      <td><c:out value='${result.rtel}'></c:out></td>
                                      <td><c:out value='${result.rlat}'></c:out></td>
                                      <td><c:out value='${result.rlng}'></c:out></td>
                                  </tr>
                             </c:forEach>
                         </tbody>
                     </table>
                     </div>

</body>
</html>