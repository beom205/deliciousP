<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>DeliciousP : 지역별 맛집 검색 서비스</title>

<!-- 로고 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Pacifico"
	rel="stylesheet">

<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
body {
	margin: 0;
}

.topnav {
	overflow: hidden;
	background-color: #80cbc4;
	min-width: 100%;
	max-height: 80px;
	z-index: 2;
}

.topnav a {
	float: center;
	display: block;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 25px;
	color: white;
	font-family: 'Pacifico', cursive;
}

.topnav a:hover {
	background-color: #b2dfdb;
	color: black;
	border-radius: 15px;
	transition: 0.5s;
}

.topnav a.active {
	background-color: #26a69a;
	color: white;
}

.topnav a.right {
	margin-top: 10px;
	float: right;
	font-size: 25px;
	font-family: 'Jeju Gothic', serif;
	color: white;
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
input[type=text] {
	width: 30%; /* Full width */
	padding: 12px; /* Some padding */
	border: 1px solid #ccc; /* Gray border */
	border-radius: 4px; /* Rounded borders */
	box-sizing: border-box;
	margin-top: 16px; /* Add a top margin */
	margin-bottom: 6px; /* Bottom margin */
	resize: vertical
}
button {
	border-radius: 4px;
	background-color: #80cbc4;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 20px;
	padding: 9px;
	width: 80px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 6px;
}
button:hover {
	background-color: #26a69a;
	transition: 0.5s;
}

</style>



</head>
<body>
	<div class="topnav" style="position: fixed; top:0px; left:0px;">
		<a class="active" href="/">DeliciousP</a> 
	</div>
	
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		var $html = $(".topnav").html();
		var $topnav = $(".topnav");
		console.log("세션검사 : " + window.sessionStorage.getItem("JSESSIONID"));
		
		if(document.cookie.indexOf("login=") != -1){
			$topnav.html($html + '<a href="/member/logout" class="right">로그아웃</a>');

		}else{
			$topnav.html($html + '<a href="/member/join" class="right">회원가입</a><a href="/member/login" class="right">로그인</a>');
		}
	}); 
</script>