<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 폼</h1>
<form action="/member/login" method="get">
	<table>
		<tr>
		<td>
			<label>ID : </label> 
			<input type="text" name="userId">
		</td>
		<td>
			<label>PW : </label> 
			<input type="text" name="userPw">
			<input type="submit" value="로그인">
		</td>
		</tr> 
	</table> <br>
			<a href="/">홈으로 돌아가기</a>
			<a href="/member/idinquiry">아이디/비밀번호찾기</a>
</form>
</body>
</html> -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<!-- CSS  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="/resources/css/materialize.css" type="text/css"
	rel="stylesheet" media="screen,projection" />
<link href="/resources/css/style.css" type="text/css" rel="stylesheet"
	media="screen,projection" />

<!-- 로고 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Pacifico"
	rel="stylesheet">
<style>
body {
	display: table-cell;
	vertical-align: middle;
	background-color: #e0f2f1 !important;
}

html {
	display: table;
	margin: auto;
}

html, body {
	height: 100%;
}

.medium-small {
	font-size: 0.9rem;
	margin: 0;
	padding: 0;
}

.login-form {
	width: 280px;
}

.login-form-text {
	text-transform: uppercase;
	letter-spacing: 2px;
	font-size: 0.8rem;
}

.login-text {
	margin-top: -6px;
	margin-left: -6px !important;
}

.margin {
	margin: 0 !important;
}

.pointer-events {
	pointer-events: auto !important;
}

.input-field>.material-icons {
	padding-top: 10px;
}

.input-field div.error {
	position: relative;
	top: -1rem;
	left: 3rem;
	font-size: 0.8rem;
	color: #FF4081;
	-webkit-transform: translateY(0%);
	-ms-transform: translateY(0%);
	-o-transform: translateY(0%);
	transform: translateY(0%);
}
</style>
</head>
<body>
	<div id="login-page" class="row">
		<div class="col s12 z-depth-4 card-panel">
			<form class="login-form">
				<div class="row">
					<div class="input-field col s12 center">
						<!-- <img src="images/login-logo.png" alt="" class="circle responsive-img valign profile-image-login"/> -->
						<p class="center login-form-text">LOGIN</p>
					</div>
				</div>
				
				<div class="row margin">
					<div class="input-field col s12">
						<!-- <i class="mdi-social-person-outline prefix"></i> -->
						<i class="material-icons prefix">account_circle</i> 
						<input
							id="userId" name="userId" type="text"
							style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=&quot;); cursor: auto;" />
						<label for="username" data-error="wrong" class="center-align"
							data-success="right">아이디(이메일)</label>
					</div>
				</div>
				
				<div class="row margin">
					<div class="input-field col s12">
						<!-- <i class="mdi-action-lock-outline prefix"></i> -->
						<i class="material-icons prefix">vpn_key</i> 
						<input id="userPw"
							name="userPw" type="password"
							style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=&quot;);" />
						<label for="password">비밀번호</label>
					</div>
				</div>

	
				<div class="row">
				
					<div class="input-field col s12">
						<button type="submit" class="btn waves-effect waves-light col s12">로그인</button>
					</div>
					
					<div class="input-field col s12">
						<a href="index.html" class="btn waves-effect waves-light col s12 light-blue darken-4">페이스북 로그인</a>
					</div>
					
				</div>

				<div class="row">
					<div class="input-field col s6 m6 l6">
						<p class="margin medium-small">
							<a href="/member/join">바로 등록!</a>
						</p>
					</div>
					<div class="input-field col s6 m6 l6">
						<p class="margin right-align medium-small">
							<a href="/member/idinquiry">비밀번호 모름?</a>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
		$(".login-form").validate({
			rules : {
				username : {
					required : true,
					minlength : 4
				},
				password : {
					required : true,
					minlength : 5
				}
			},
			//For custom messages
			messages : {
				username : {
					required : "Enter a username",
					minlength : "Enter at least 4 characters"
				}
			},
			errorElement : 'div',
			errorPlacement : function(error, element) {
				var placement = $(element).data('error');
				if (placement) {
					$(placement).append(error)
				} else {
					error.insertAfter(element);
				}
			}
		});
	</script>
</body>
</html>