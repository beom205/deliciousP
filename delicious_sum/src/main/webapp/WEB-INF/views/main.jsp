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
						<input type="text" class="col s3 offset-s4 center" name="keyword">&nbsp;
						<input type="hidden" name="page" value="1">
              <button type="submit">Search</button>
					</div>
					<br>
					<br>
				</div>
			</div>
		</div>
	</form>


<%@include file="../views/include/footer.jsp"%>
