<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <style>
  .uploadList li {
  	list-style: none;
  	margin:5px;
  	float:left;
  }
  
  .zero {
  	width:0px;
  	height: 0px;
  	border: 0px;
  }
  .att {
    widows: 100px;
  	height: 100px;
  }
  </style>

  <h1>File Upload Ex1</h1>
  
  <form id='f1' action="/mytodo/newForm" method='post'>
    <input type='text' name='title' value='sample'>
    <input type='text' name='todo' value='fun'>
    <input type='hidden' name='files' value='aaa.jpg'>
    <input type='hidden' name='files' value='bbb.jpg'>
    <input type='hidden' name='files' value='ccc.jpg'>
    <button>Save</button>
  </form>
  
  
  <form method="post" enctype="multipart/form-data" target="zero">
    <input type="file" name='f1'>
    <button>Upload</button>
  </form>
  <ul class="uploadList">
  
  </ul>
  
  <form id="oper">
  
  </form>
  
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  
  <script>
  	function showAttach(data) {
		
  		var uploadList = $(".uploadList");
  		var before = uploadList.html();
  		
 		var str = ""; 
  		if(data.isImage){
  			str = "<div><img src='/display?name=s_" + encodeURIComponent(data.uploadName) + "'/><span data-src='"+data.uploadName+"'> x </span> </div>";
  		}else{
  			str = "<div><img src='/resources/file.png' class='att'><span data-src='"+data.uploadName+"'> x </span></div>";
  		}
  		
  		before += "<li>" + str + "</li>";
  		uploadList.html(before);
  	
  	}
  
  	function checkImageType(fileName){
  		
  		var pattern = /jpg|gif|png|jpeg/i;
  		
  		return fileName.match(pattern);

  	}
  	
  	$('.uploadList').on("click", "img", function(e){
  		e.stopPropagation();
  		
  		var fileName = $(this).siblings("span").data("src");
  		alert("image click" + fileName);
  		
  		if(!checkImageType(fileName)){
  			$("#oper").attr("action", "/download");
  			$("#oper").html("<input type='hidden' name='name' value='" + fileName + "'>");
  			$("#oper").submit();
  		}
  		
  	});
  	
  	$('.uploadList').on("click", "span", function(e){
  		e.stopPropagation();
  		
  		var ele = $(this);
  		var fileName = ele.data("src");
  		
  		$.get("/delFile?name=" + fileName, function(result){ // fileName에 원래 encodeURIComponent 를 넣어줘야한다.
  			alert(result);
  			ele.closest("li").remove();
  		});
  		
  	});
  	
  </script>
  

  
  <iframe name="zero" class="zero">
  
  </iframe>
  
</body>
</html>