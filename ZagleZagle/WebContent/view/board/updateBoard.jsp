<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateBoard</title>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">

$(function(){
	
	$('#submit').bind("click",function(){
		
		var userTheme=$("input[name='userTheme']").val();
		var boardDetailText=$("input[name='boardDetailText']").val();
		/* var photo2 = $("img[name='photo1']").data("param1");
		
		alert(photo2); */
		
		if(boardDetailText==""){
			alert("내용을 입력해라");
		}
			//$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/board/addBoard").submit();
			$("form").attr("method" , "POST").attr("action" , "/board/updateBoard").submit();
		
	})
});

//다중 이미지 미리보기
function fileInfo(f){
	var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음

	$('#img_box').empty();
	
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

<form name="fileForm" class="form-horizontal" enctype="multipart/form-data">

<input type="hidden" name="userNo" value="${board.user.userNo}"/>
<input type="hidden" name="boardNo" value="${board.boardNo}"/>

<div style="text-align:center;">
	<input multiple="multiple" type="file" style="width:500px;" accept="image/*" multiple onchange="fileInfo(this)" name="file"/><br>
</div>
 
<div id="img_box">

	<c:if test="${board.photo1 !=null}">
	<img src="/common/images/board/${board.photo1}"/>
	<input type="hidden" name="photo1" value="${board.photo1}"/>
	</c:if>

	<c:if test="${board.photo2 !=null}">
	<img src="/common/images/board/${board.photo2}" name="photo2" value="${board.photo2}"/>
	<input type="hidden" name="photo2" value="${board.photo2}"/>
	</c:if>
	
	<c:if test="${board.photo3 !=null}">
	<img src="/common/images/board/${board.photo3}" name="photo3" value="${board.photo3}"/>
	<input type="hidden" name="photo3" value="${board.photo3}"/>
	</c:if>
</div>

<div>
	<input type="button" value="지도첨부"/>
</div>
<br/>

테마선택

<div class="userTheme">
	<input type="radio" name="userTheme" value="H_spoon" ${! empty board.userTheme && board.userTheme=="H_spoon" ? "checked":""}> 흙수저
	<input type="radio" name="userTheme" value="D_spoon" ${! empty board.userTheme && board.userTheme=="D_spoon" ? "checked":""}> 동수저
	<input type="radio" name="userTheme" value="S_spoon" ${! empty board.userTheme && board.userTheme=="S_spoon" ? "checked":""}> 은수저
	<input type="radio" name="userTheme" value="G_spoon" ${! empty board.userTheme && board.userTheme=="G_spoon" ? "checked":""}> 금수저
</div>
<br/>

내용
<div>
	<input type="text" name="boardDetailText" value="${board.boardDetailText}"/>
</div>
<br/>

해시태그
<div>
	<input type="text" name="hashTag" value="${board.hashTag}"/>
</div>
<br/>

</form>

<div>
	<input type="button" id="submit" value="수정"/>
	<input type="button" id="cancel" value="취소"/>
</div>

</body>
</html>