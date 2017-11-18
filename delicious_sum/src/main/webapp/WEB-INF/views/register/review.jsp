<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../include/centerLogoHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/../resources/css/star.css">
 <style>
 .top{
 	margin-top: 100px;
 	margin-left: 20%;
 	margin-right: 20%;
 }
 
 
 
 .container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #80cbc4;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

.column{
	width:25%;
	float: left;
}
.file{
	opacity:0;
	  position: relative;
	  width:100px;
	  height:50px;
}
button.replace {  
  position: absolute;
	  width:100px;
	  height:50px;
  border-radius: 3px;
  font-weight: 600;
  border-color: transparent;
  font-size: 15px;
  background: #b2dfdb;
  color: #fff;
  cursor: pointer;
}
button.replace:hover{
  background: #26a69a;
  transition: 0.5s;
}
 </style>
<title>Insert title here</title>
</head>
<body>
<div class="top">
	<form role="form" id="fid" method="post" enctype="multipart/form-data">

		<input type="hidden" name="rno" value="${rno.rno}">
<h3>전체 평점&nbsp;* </h3>
		 <span class="star-input">
			<span class="input">
				<input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
				<input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
				<input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
				<input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
				<input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
				<input type="hidden" class="avg_rate" name="avg_rate">
			</span>
			<output for="star-input"><b>0</b>점</output>
		</span> 
<hr/>

		<div class="convDiv">
<h3>방문 목적&nbsp;*</h3>		
		<div class="column">
		<label class="container">
		아침식사<input type="checkbox" value="아침식사" name="conveninece[]" class="conv">	  
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		점심식사<input type="checkbox" value="점심식사" name="conveninece[]" class="conv">		
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		저녁식사<input type="checkbox" value="저녁식사" name="conveninece[]" class="conv">		
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		브런치<input type="checkbox" value="브런치" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		디저트<input type="checkbox" value="디저트" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		</div>
		
		
		
		<div class="column">
		<label class="container">
		파인다이닝<input type="checkbox" value="파인다이닝" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		간식<input type="checkbox" value="간식" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		야식<input type="checkbox" value="야식" name="conveninece[]" class="conv"><br/>
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		혼밥<input type="checkbox" value="혼밥" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		혼술<input type="checkbox" value="혼술" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		</div>		
		
		
		
		
		<div class="column">
		<label class="container">
		데이트<input type="checkbox" value="데이트" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		기념일<input type="checkbox" value="기념일" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		모임<input type="checkbox" value="모임" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		회식<input type="checkbox" value="회식" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		남자끼리<input type="checkbox" value="남자끼리" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		</div>		
		
		
		
		<div class="column">
		<label class="container">
		여자끼리<input type="checkbox" value="여자끼리" name="conveninece[]" class="conv"><br/>
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		가족외식(4인기준)<input type="checkbox" value="가족외식(4인기준)" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		가족외식(10인이상)<input type="checkbox" value="가족외식(10인기준)" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		상견례<input type="checkbox" value="상견례" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		접대<input type="checkbox" value="접대" name="conveninece[]" class="conv">
		<span class="checkmark"></span>	
		</label>
		</div>		
		
			<input type="text" class="convText" placeholder=' ","로 구분하여 입력해 주세요.'>
			<input type="hidden" name="convenience_keyword" value=convArrStr class="convValSum">
		</div>
<hr/>
		
		<div class="moodDiv">
<h3>분위기&nbsp;*</h3>		
		
		<div class="column">
		<label class="container">
		조용한<input type="checkbox" value="조용한" name="mood[]" class="mood">		
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		시끌벅적한<input type="checkbox" value="시끌벅적한" name="mood[]" class="mood">		
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		아담한<input type="checkbox" value="아담한" name="mood[]" class="mood">		
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		규모가큰<input type="checkbox" value="규모가큰" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		깔끔한<input type="checkbox" value="깔끔한" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		</div>
		
		<div class="column">
		<label class="container">
		격식있는<input type="checkbox" value="격식있는" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		캐주얼한<input type="checkbox" value="캐주얼한" name="mood[]" class="mood"><br/>
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		착한가격<input type="checkbox" value="착한가격" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		가성비좋은<input type="checkbox" value="가성비좋은" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		고급스러운<input type="checkbox" value="고급스러운" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		</div>
		
		<div class="column">
		<label class="container">
		허름한<input type="checkbox" value="허름한" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		서민적인<input type="checkbox" value="서민적인" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		오래된집<input type="checkbox" value="오래된집" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		모던한<input type="checkbox" value="모던한" name="mood[]" class="mood"><br/>
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		복고풍<input type="checkbox" value="복고풍" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		</div>
		
		
		<div class="column">
		<label class="container">
		빈티지<input type="checkbox" value="빈티지" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		토속적인<input type="checkbox" value="토속적인" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		이국적인<input type="checkbox" value="이국적인" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		이색적인<input type="checkbox" value="이색적인" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		전망이좋은<input type="checkbox" value="전망이좋은" name="mood[]" class="mood">
		<span class="checkmark"></span>	
		</label>
		</div>
			<input type="text" class="moodText" placeholder='","로 구분하여 입력해 주세요.'>
			<input type="hidden" name="mood_keyword" value=moodArrStr class="moodValSum">
		</div>
<hr/>

		<div class="purposeDiv">
<h3>편의시설&nbsp;*</h3>		
		<div class="column">
		<label class="container">
		무료주차<input type="checkbox" value="무료주차" name="purpose[]" class="purpose">		
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		발렛주차<input type="checkbox" value="발렛주차" name="purpose[]" class="purpose">		
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		개별룸(4인이하)<input type="checkbox" value="개별룸(4인이하)" name="purpose[]" class="purpose">		
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		개별룸(5~10인)<input type="checkbox" value="개별룸(5-10인)" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		대형룸(10인이상)<input type="checkbox" value="대형룸(10인이상)" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		</div>
		
		<div class="column">
		<label class="container">
		좌식<input type="checkbox" value="좌식" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		야외좌석(테라스)<input type="checkbox" value="야외좌석(테라스)" name="purpose[]" class="purpose"><br/>
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		24시간영업<input type="checkbox" value="24시간영업" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		배달<input type="checkbox" value="배달" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		예약필요<input type="checkbox" value="예약필요" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		</div>
		
		<div class="column">
		<label class="container">
		현장대기필요<input type="checkbox" value="현장대기필요" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		콜키지가능<input type="checkbox" value="콜키지가능" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		콜키지무료<input type="checkbox" value="콜키지무료" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		애완동물동반<input type="checkbox" value="애완동물동반" name="purpose[]" class="purpose"><br/>
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		장애인편의시설<input type="checkbox" value="장애인편의시설" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		</div>
		
		<div class="column">
		<label class="container">
		키즈시설(놀이방)<input type="checkbox" value="키즈시설(놀이방)" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		
		<label class="container">
		노키즈<input type="checkbox" value="노키즈" name="purpose[]" class="purpose">
		<span class="checkmark"></span>	
		</label>
		</div>
		
			<input type="text" class="purposeText" placeholder='","로 구분하여 입력해 주세요.'>
			<input type="hidden" name="purpose_keyword" value=purposeArrStr class="purposeValSum">
		</div>
<hr/>
		
<h3>후기 입력</h3>			
		<textarea rows="5" cols="100" style="resize:none; width:100%;" name="content"></textarea><br>
<hr/>
<button type="button" class="replace">파일 업로드</button> 
				<input type="file" class="file" name="file">
	
			<ul class="uploadList">
			
			</ul>
		
			<form id="oper">
				
			</form>
			
			
			
		</form>
<%-- 	<form id="goDetail" action="/list/detail">
		<input type="hidden" name="rno" value="${rno.rno}">
	</form> --%>
	
	<button type="button" class="confirm">확인</button>		
	<button type="button" class="btnCancle"  onclick="history.back();">취소</button>
</div>
<!-- jQuery -->
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous">
</script>
<script>
	// 별점
	var starRating = function(){
	var $star = $(".star-input"),
	$result = $star.find("output>b");
	
	
	$(document).on("focusin", ".star-input>.input", function(){
		$(this).addClass("focus");
	}).on("focusout", ".star-input>.input", function(){
		var $this = $(this);
		setTimeout(function(){
			if($this.find(":focus").length === 0){
			$this.removeClass("focus");
    		}
		}, 100);
	}).on("change", ".star-input :radio", function(){
		$result.text($(this).next().text());
	}).on("mouseover", ".star-input label", function(){
		$result.text($(this).text());
	}).on("mouseleave", ".star-input>.input", function(){
		var $checked = $star.find(":checked");
	if($checked.length === 0){
		$result.text("0");
	} else {
    $result.text($checked.next().text());
			}
		});
	};
    
	starRating();
	
	
	
	
	
	
	// input으로 받은값 
	$(".input").on("click","input",function(){
		$(".avg_rate").val($(this).val());
	});
	
	// 확인 버튼 누르면 처리되는 곳
	$('.confirm').on('click', function(){
		// conv체크박스 처리
		var convArr = new Array();
		var convArr_cnt = 0;
		var convCheckbox = $(".conv");
		
		for(var i = 0 ; i < convCheckbox.length; i++){
			if(convCheckbox[i].checked == true){
				convArr[convArr_cnt] = convCheckbox[i].value;
				convArr_cnt++;
			}
		}
		var convTextStr = $(".convText").val();
		
		console.log(convTextStr);
		
		if(convArr[0] != null){
			var convArrStr = convArr.join(",");
			if (convTextStr.length != 0){ convArrStr += (","+convTextStr)};
		}else {
			convArrStr = convTextStr;
		}
		
		// mood체크박스 처리
		var moodArr = new Array();
		var moodArr_cnt = 0;
		var moodCheckbox = $(".mood");
		
		for(var i = 0 ; i < moodCheckbox.length; i++){
			if(moodCheckbox[i].checked == true){
				moodArr[moodArr_cnt] = moodCheckbox[i].value;
				moodArr_cnt++;
			}
		}
		var moodTextStr = $(".moodText").val();
		
		if(moodArr[0] != null){
			var moodArrStr = moodArr.join(",");
			if (moodTextStr.length != 0){ moodArrStr += (","+moodTextStr)};
		}else {
			moodArrStr = moodTextStr;
		}
		
		// purpose체크박스 처리
		var purposeArr = new Array();
		var purposeArr_cnt = 0;
		var purposeCheckbox = $(".purpose");
		
		for(var i = 0 ; i < purposeCheckbox.length; i++){
			if(purposeCheckbox[i].checked == true){
				purposeArr[purposeArr_cnt] = purposeCheckbox[i].value;
				purposeArr_cnt++;
			}
		}
		var purposeTextStr = $(".purposeText").val();
		
		if(purposeArr[0] != null){
			var purposeArrStr = purposeArr.join(",");
			if (purposeTextStr.length != 0){ purposeArrStr += (","+purposeTextStr)};
		}else {
			purposeArrStr = purposeTextStr;
		}

		$(".convValSum").val(convArrStr);
		$(".moodValSum").val(moodArrStr);
		$(".purposeValSum").val(purposeArrStr);
		$('#fid').submit();
		
	});
	
	
	function showAttach(data){
		var uploadList = $(".uploadList");
		var before = uploadList.html();
		
		var str = "";
		if(data.isImage){
			str = "<div><img class='att' src='/display?name=s_"+data.uploadName+"'/><span data-src='"+data.uploadName+"'> x </span></div>"
		}else{
			str = "<div><img class='att' src='/resources/file.jpg'><span data-src='"+data.uploadName+"'> x </span></div>";
		}
		
		before += "<li>" + str + "</li>";
		uploadList.html(before);
	}
	
	
	
	$('.uploadList').on("click", "img", function(e){
		e.stopPropagation();
		
		var fileName = $(this).siblings().data("src"); // .siblings(형제태그 찾기, .next() 로 해도됨)
		
		
		if(!checkImageType(fileName)){
			alert("이미지 파일이 아닙니다.")
		}
	}); 
	
	
	$('.uploadList').on("click", "span", function(e){
		
		e.stopPropagation();
		
		var ele = $(this);
		var fileName = $(this).data("src");
		
		$.get("/delFile?name="+ fileName, function(result){ //가장 무난한 삭제 방법
			alert(result);
		
			ele.closest("li").remove();
		});
		
	});
	
	
	/*  $("#btnCancle").on('click', function(){
     	console.log("취소 버튼 눌림");
     	location.href="/list/detail?rno="+${rno.rno};
     }); */
</script>	
		
</body>
</html>