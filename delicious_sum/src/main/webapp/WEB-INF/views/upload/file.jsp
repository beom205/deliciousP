<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  
<title>Insert title here</title>
<style>
	.fileDrop{
		width: 50%;
		height: 200px;
		border: 1px dotted blue;
	}
</style>
</head>
<body>
<h1>지져스</h1>
<div class="fileDrop"></div>
<div class="uploadList"></div>

	<form method="post" enctype="multipart/form-data">
		<input type="file" name="f1">
		<button>upload</button>
	</form>

<script>
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
		
	var files = event.originalEvent.dataTransfer.files;//dataTransfer-> 전달된 파일 데이터를 가져옴
	
	var file = files[0];
	
	var formData = new formData();
	
	formData.append("file",file);
	
	$.ajax({
		url:'/uploadfile',
		data:formData,
		dataType:'text',
		processData: false,
		contentType : false,
		type:'POST',
		success: function(data){
			alert(data);
			
		}
	
		})
		
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
	});
</script>
		

</body>
</html>