<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<!-- 로고 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Pacifico"
	rel="stylesheet">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);

#titleFont {
	color: white;
	font-family: 'Pacifico', cursive;
	font-size: 70px;
	text-shadow: 12px 12px #80cbc4;
}

.container {
	background: rgba(0, 0, 0, 0.5);
	width: 30%;
	margin: auto;
	text-align: center;
	vertical-align: center;
	border-radius: 20px;
}

#subTitle {
	font-size: 25px;
	font-family: 'Jeju Gothic', serif;
	color: white;
}

input[type=text], select, textarea {
	width: 50%; /* Full width */
	padding: 12px; /* Some padding */
	border: 1px solid #ccc; /* Gray border */
	border-radius: 4px; /* Rounded borders */
	box-sizing: border-box;
	/* Make sure that padding and width stays in place */
	margin-top: 6px; /* Add a top margin */
	margin-bottom: 16px; /* Bottom margin */
	resize: vertical
		/* Allow the user to vertically resize the textarea (not horizontally) */
}

.button {
	border-radius: 4px;
	background-color: #80cbc4;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 20px;
	padding: 9.5px;
	width: 120px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 6px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

body {
	margin: 0;
}

.topnav {
	overflow: hidden;
	background-color: #80cbc4;
	min-width: 100%;
	max-height: 80px;
}

.topnav a {
	float: left;
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

.top {
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
.top:hover {
	background-color: #26a69a;
	transition: 0.5s;
}


.text {
  width: 450px;
  left: 50%;
  margin-left: 50px;
  height: 40px;
  top: 50%;
  margin-top: -20px;
	font-family: 'Jeju Gothic', serif;
	font-size: 20px;
	
}

.p {
  display: inline-block;
  vertical-align: top;
  margin: 0;
	font-family: 'Jeju Gothic', serif;
	font-size: 20px;
}

.word {
  position: absolute;
  width: 220px;
  opacity: 0;
	font-family: 'Jeju Gothic', serif;
	font-size: 20px;
}

.letter {
  display: inline-block;
  position: relative;
  float: left;
  transform: translateZ(25px);
  transform-origin: 50% 50% 25px;
}

.letter.out {
  transform: rotateX(90deg);
  transition: transform 0.32s cubic-bezier(0.55, 0.055, 0.675, 0.19);
}

.letter.behind {
  transform: rotateX(-90deg);
}

.letter.in {
  transform: rotateX(0deg);
  transition: transform 0.38s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.wisteria {
  color: #cddc39;
  margin-left: 20px;
}

.belize {
  color: #18ffff;
}

.pomegranate {
  color: #ffc400;
  margin-left: 40px;
}

.green {
  color: #ff3d00;
  margin-left: 20px;
}

.midnight {
  color: #00e676;
  margin-left: 20px;
}
</style>
</head>
<body>
	<div class="topnav" style="position: fixed;">
		<a class="active" href="/">DeliciousP</a> 
	</div>

<div class="parallax">
	<video id="video" preload="auto" autoplay="true" loop="loop"
		muted="muted" volume="0">
		<source src="/resources/rest.mp4">
	</video>
</div>
<div>
	<br> <br>

</div>
<div class="container">
	<h1 class="header center teal-text text-lighten-2" id="titleFont">Delicious	P</h1>
	<!-- 
	<p id="subTitle">지역 맛집 검색 서비스</p>
	 -->
<div class="text">
  <p class="p">
    <span class="word wisteria">강남역 </span>
    <span class="word belize">가로수길 </span>
    <span class="word pomegranate">홍대</span>
    <span class="word green">조용한 </span>
    <span class="word midnight">데이트 </span>
  </p>
  <p class="p" style="color: white;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;맛집 검색 서비스</p>
</div>


	<!--    검   색   영   역    -->
	<form role=form id="fId" method="get" action="/list/test">

			<!--   Icon Section   -->
			<input type="text" placeholder="강남역 중국집" name="keyword">
			&nbsp; 
			<input type="hidden" name="page" value="1">
			<button type="submit" class="button">
				<span>Search</span>
			</button>
			<br> <br>
	</form>
</div>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
var words = document.getElementsByClassName('word');
var wordArray = [];
var currentWord = 0;

$(document).ready(function(){
	var $html = $(".topnav").html();
	var $topnav = $(".topnav");
	console.log("세션값" + '${login}');
	
	if(document.cookie.indexOf("login=") != -1 || '${login}'){
		$topnav.html($html + '<a href="/member/logout" class="right">로그아웃</a><a href="/list/register" class="right" id="subTitle">업체등록</a>');

	}else{
		$topnav.html($html + '<a href="/member/join" class="right">회원가입</a><a href="/member/login" class="right">로그인</a> <a href="/list/register" class="right" id="subTitle">업체등록</a>');
	}
		
});

words[currentWord].style.opacity = 1;
for (var i = 0; i < words.length; i++) {
  splitLetters(words[i]);
}

function changeWord() {
  var cw = wordArray[currentWord];
  var nw = currentWord == words.length-1 ? wordArray[0] : wordArray[currentWord+1];
  for (var i = 0; i < cw.length; i++) {
    animateLetterOut(cw, i);
  }
  
  for (var i = 0; i < nw.length; i++) {
    nw[i].className = 'letter behind';
    nw[0].parentElement.style.opacity = 1;
    animateLetterIn(nw, i);
  }
  
  currentWord = (currentWord == wordArray.length-1) ? 0 : currentWord+1;
}

function animateLetterOut(cw, i) {
  setTimeout(function() {
		cw[i].className = 'letter out';
  }, i*80);
}

function animateLetterIn(nw, i) {
  setTimeout(function() {
		nw[i].className = 'letter in';
  }, 340+(i*80));
}

function splitLetters(word) {
  var content = word.innerHTML;
  word.innerHTML = '';
  var letters = [];
  for (var i = 0; i < content.length; i++) {
    var letter = document.createElement('span');
    letter.className = 'letter';
    letter.innerHTML = content.charAt(i);
    word.appendChild(letter);
    letters.push(letter);
  }
  
  wordArray.push(letters);
}

changeWord();
setInterval(changeWord, 4000);


</script>
<%@include file="../views/include/footer.jsp"%>
