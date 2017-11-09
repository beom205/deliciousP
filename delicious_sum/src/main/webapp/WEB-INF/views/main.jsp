<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../views/include/header.jsp"%>
<div id="index-banner" class="parallax-container">
	<div class="section no-pad-bot">
		<div class="container">
			<br>
			<br>
			<h1 class="header center teal-text text-lighten-2">Delicious P</h1>
			<div class="row center">
				<h5 class="header col s12 light">지역별 맛집 검색 서비스</h5>
			</div>
		</div>
	</div>
	<div class="parallax">
		<video id="video" preload="auto" autoplay="true" loop="loop"
			muted="muted" volume="0">
			<source src="/resources/rest.mp4">
		</video>
	</div>
</div>


<!--    검   색   영   역    -->
<form role=form id="fId" method="get" action="/list/test">
		<div class="container">
			<div class="section">

				<!--   Icon Section   -->
				<div class="row">
					<div class="row">
						<input type="text" class="col s3 offset-s4 center" name="search"
							value="4번지">&nbsp;
						<button type="button" class="sBtn">submit</button>
						<!-- 
              <button type="submit">Search</button>
              -->
						<a href="/list/test" id="download-button"
							class="btn-large waves-effect waves-light teal lighten-1">검색(미구현)</a>
					</div>
					<br>
					<br>
				</div>
			</div>
		</div>
	</form>


<div class="parallax-container valign-wrapper">
	<div class="section no-pad-bot">
		<div class="container">
			<div class="row center">
				<h5 class="header col s12 light">A modern responsive front-end
					framework based on Material Design</h5>
			</div>
		</div>
	</div>
	<div class="parallax">
		<!-- 2번째 사진 자리 -->
	</div>
</div>

<div class="container">
	<div class="section">

		<div class="row">
			<div class="col s12 center">
				<h3>
					<i class="mdi-content-send brown-text"></i>
				</h3>
				Contact us!

				<p class="left-align light">Lorem ipsum dolor sit amet,
					consectetur adipiscing elit. Nullam scelerisque id nunc nec
					volutpat. Etiam pellentesque tristique arcu, non consequat magna
					fermentum ac. Cras ut ultricies eros. Maecenas eros justo,
					ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque,
					posuere et pretium eget, bibendum sollicitudin lacus. Aliquam
					eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla
					imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum
					ac, gravida ultrices erat. Nullam eget dignissim mauris, non
					tristique erat. Vestibulum ante ipsum primis in faucibus orci
					luctus et ultrices posuere cubilia Curae;</p>
			</div>
		</div>

	</div>
</div>


<div class="parallax-container valign-wrapper">
	<div class="section no-pad-bot">
		<div class="container">
			<div class="row center">
				<h5 class="header col s12 light">A modern responsive front-end
					framework based on Material Design</h5>
			</div>
		</div>
	</div>
	<div class="parallax">
		<img src="background3.jpg" alt="Unsplashed background img 3">
	</div>
</div>

<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/resources/js/materialize.js"></script>
<script src="/resources/js/init.js"></script>
<!-- <script>
	$(".sBtn").on("click", function() {
		$("#fId").submit();
	})
</script> -->


<%@include file="../views/include/footer.jsp"%>
