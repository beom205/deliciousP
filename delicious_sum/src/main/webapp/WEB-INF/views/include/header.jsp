<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>DeliciousP : 지역별 맛집 검색 서비스</title>
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="/resources/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="/resources/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  
  <!-- 로고 폰트 -->
  <link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
  
  <style>

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

h1 {
font-family: 'Pacifico', cursive;
 text-shadow: -3px 0 #F2F1F6, 0 3px #F2F1F6, 3px 0 #F2F1F6, 0 -3px #F2F1F6;
 -moz-text-shadow: -3px 0 #F2F1F6, 0 3px #F2F1F6, 3px 0 #F2F1F6, 0 -3px #F2F1F6;
 -webkit-text-shadow: -3px 0 #F2F1F6, 0 3px #F2F1F6, 3px 0 #F2F1F6, 0 -3px #F2F1F6;
}

</style>



</head>
<body>
  <nav class="teal lighten-3" role="navigation">
    <div class="nav-wrapper container">
      <a id="logo-container" href="#" class="brand-logo">DeliciousP</a>
      <ul class="right hide-on-med-and-down">
        <li><a href="#">로그인</a></li>
      </ul>

      <ul id="nav-mobile" class="side-nav">
        <li><a href="#">사이드바모바일</a></li>
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
  </nav>