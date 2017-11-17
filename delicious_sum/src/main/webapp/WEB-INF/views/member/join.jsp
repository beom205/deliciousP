<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/centerLogoHeader.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Pacifico"
	rel="stylesheet">
<style>
/* 로그인것  */
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


/* 원본 */
/* body {
	display: table-cell;
	/* vertical-align: middle; */
	background-color: #e0f2f1 !important;

}

html {
	display: table;
	 
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
}  */
</style>
<%@include file="../include/mate.html"%>
<body>
<div id="login-page" class="row">
		<div class="col s12 z-depth-4 card-panel">
			<form class="login-form" action="/member/join" method="post">
				<div class="row">
					<div class="input-field col s12 center">
						<h4>회원 등록</h4>
					</div>
				</div>
				
				<!-- 아이디 -->
				<div class="row margin">
					<div class="input-field col s12">
						<!-- <i class="mdi-social-person-outline prefix"></i> -->
						<i class="material-icons prefix">account_circle</i> <input id="uid" name="uid" type="text" /> 
						<label for="userId">아이디</label>
					</div>
				</div>

				<!-- 비밀번호 -->
				<div class="row margin">
					<div class="input-field col s12">
						<!-- <i class="mdi-action-lock-outline prefix"></i> -->
						<i class="material-icons prefix">vpn_key</i> <input id="upw" name="upw" type="password" /> 
							<label for="userPw">비밀번호</label>
					</div>
				</div>

				<!-- 비밀번호 다시 -->
				<div class="row margin">
					<div class="input-field col s12">
						<!-- <i class="mdi-action-lock-outline prefix"></i> -->
						<i class="material-icons prefix">vpn_key</i> <input id="rupw" name="rupw" type="password" /> 
						<label for="ruserPw">비밀번호 다시</label>
					</div>
				</div>

				<!-- 별명 -->
				<div class="row margin">
					<div class="input-field col s12">
						<!-- <i class="mdi-social-person-outline prefix"></i> -->
						<i class="material-icons prefix">sentiment_very_satisfied</i> <input id="uname" name="uname" type="text" style="cursor: auto;" /> 
						<label for="userName">별명</label>
					</div>
				</div>
				
				<!-- 전화번호 -->
				<div class="row margin">
					<div class="input-field col s12">
						<!-- <i class="mdi-social-person-outline prefix"></i> -->
						<i class="material-icons prefix">contact_phone</i> 
						<input id="utel" name="utel" type="text" style="cursor: auto;" /> 
						<label for="userTel">전화번호</label>
					</div>
				</div> 

				<div class="row">
					<div class="input-field col s12">
						<button type="submit" class="btn waves-effect waves-light col s12">REGISTER NOW</button>
					</div>
					<div class="input-field col s12">
						<p class="margin center medium-small sign-up"> 
						Already have an account? 
						<a href="./login">Login</a>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
		$(".login-form").validate({
			rules : {
				userId : {
					required : true,
					minlength : 4
				},
				userPw : {
					required : true,
					minlength : 5
				},
				ruserPw : {
					required : true,
					minlength : 5,
					equalTo : "#password"
				}
			},
			//For custom messages
			messages : {
				userId : {
					required : "Enter a userId",
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

