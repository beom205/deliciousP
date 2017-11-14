<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>DeliciousP : 지역별 맛집 검색 서비스</title>

  <!-- 로고 폰트 -->
  <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
  
  <style>
body {margin:0;}

.topnav {
  overflow: hidden;
  background-color: #80cbc4;
     min-width: 100%;
}

.topnav a {
  float: left;
  display: block;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 25px;
  color:white;
  font-family: 'Pacifico', cursive;
  
}

.topnav a:hover {
  background-color: #b2dfdb;
  color: black;
}

.topnav a.active {
    background-color: #26a69a;
    color: white;
}
.topnav a.right{
float: right;
}
#video { 
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1;
     overflow: hidden;
}

</style>



</head>
<body>
<div class="topnav" style="position:fixed;">
  <a class="active" href="/">DeliciousP</a>
  <a href="#news">A</a>
  <a href="#contact">B</a>
  <a href="/member/join" class="right">회원가입</a>
  <a href="/member/login" class="right">로그인</a>
</div>

