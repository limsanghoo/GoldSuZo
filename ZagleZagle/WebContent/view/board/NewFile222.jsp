<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">



function fileInfo(f){
	var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음

	// 파일의 갯수만큼 반복
	for(var i=0; i<file.length; i++){

		var reader = new FileReader(); // FileReader 객체 사용
		
		reader.onload = function(rst){
			$('#img_box').append('<img src="'+rst.target.result+'">'); // append 메소드를 사용해서 이미지 추가
			// 이미지는 base64 문자열로 추가
			// 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
			
		}	
		
		reader.readAsDataURL(file[i]); // 파일을 읽는다
				
	}

}


</script>

</head>

<body>
<img id=image src="http://dy.gnch.or.kr/img/no-image.jpg">
<br>

<div style="text-align:center;">
	<input multiple="multiple" type="file" style="width:500px;" accept="image/*" multiple onchange="fileInfo(this)" name="file" id="file"/><br>
	<div id="img_box"></div>
</div>


<textarea id="tag"></textarea>

</body>

</html>


