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
		
		if(boardDetailText==""){
			alert("내용을 입력해라");
		}
			//$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/board/addBoard").submit();
			$("form").attr("method" , "POST").attr("action" , "/board/updateBoard").submit();
		
	})
	
	$('#edit').bind("click",function(){
		$("#img_box").empty();//원래 이미지 비우기
		$("#newPhoto").append('<input id="file" type="file" multiple="multiple">* 사진은 하나씩 등록해주세요!<br/>');	//파일 첨부 버튼 생성
		$("#hashTag").val("");//원래 해시태그 비우기
		$("#link").val("");//원래 링크 비우기		
		
		var file = document.getElementById('file');
		var image = document.getElementById('image');

		file.onchange = function (event) {
		  var target = event.currentTarget;
		  var xmlHttpRequest = new XMLHttpRequest();
		  xmlHttpRequest.open('POST', 'https://api.imgur.com/3/image/', true);
		  xmlHttpRequest.setRequestHeader("Authorization", "Client-ID c764d6730f6f9a6");
		  xmlHttpRequest.onreadystatechange = function () {
		    if (xmlHttpRequest.readyState == 4) {
		      if (xmlHttpRequest.status == 200) {
		        var result = JSON.parse(xmlHttpRequest.responseText);

		        $("#img_box").append("<img src="+result.data.link+">");//이미지 미리보기
		        
		        var linkArea=$("#link");
				linkArea.val(linkArea.val()+result.data.link+",");//이미지 링크 append
				
		        console.log(result);        
		        
		        $.ajax(	
		        		{
		        			url : "http://192.168.0.36:8080/board/json/addBoardVisionTag",
		        			method : "GET",
		        			data : {
		        				link : result.data.link
		        			},
		        			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        			dataType : "text",
		        			success : function (data,status){
		        				var decode=decodeURIComponent(data);//특수문자 포함 디코딩
		        				alert("decode : "+decode);
		        				
		        				var tagArea=$("#hashTag");
		        				tagArea.val(tagArea.val()+decode);//해시태그 append
		        				
		        			}
		        		});
		      
		      }
		      else {
		      	alert("업로드 실패");
		      }
		    }
		  };//()function 끝
		  xmlHttpRequest.send(target.files[0]);
		};//(event)function 끝
		
		
	})//edit 끝
	
});//function 끝


</script>
</head>
<body>

<form name="fileForm" class="form-horizontal" enctype="multipart/form-data">

<input type="hidden" name="userNo" value="${board.user.userNo}"/>
<input type="hidden" name="boardNo" value="${board.boardNo}"/>

<div id="newPhoto">
	
	<input type="hidden" name="photo1" value="${board.photo1}" id="link"/>
	
	<div id="img_box">
	
	<input type="button" value="사진 수정하기" id="edit"/>
	
	<!-- 원래 이미지 보여주는 부분 시작-->
	<c:if test="${board.photo1 !=null}">
	<img src="${board.photo1}"/>
	</c:if>

	<c:if test="${board.photo2 !=null}">
	<img src="${board.photo2}" name="photo2" value="${board.photo2}"/>
	<input type="hidden" name="photo2" value="${board.photo2}"/>
	</c:if>
	
	<c:if test="${board.photo3 !=null}">
	<img src="${board.photo3}" name="photo3" value="${board.photo3}"/>
	<input type="hidden" name="photo3" value="${board.photo3}"/>
	</c:if>
	<!-- 원래 이미지 보여주는 부분 끝-->
	
	
	</div><!-- /img_box -->
</div>

<br/>

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
	<input type="text" name="hashTag" id="hashTag" value="${board.hashTag}"/>
</div>
<br/>

</form>

<div>
	<input type="button" id="submit" value="수정"/>
	<input type="button" id="cancel" value="취소"/>
</div>

</body>
</html>