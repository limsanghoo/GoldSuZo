<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">

$(function(){
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
        $("#img_box").append("<img src="+result.data.link+">");
        
        var linkArea=$("#link");
		linkArea.val(linkArea.val()+result.data.link+",");
		
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
        				var decode=decodeURIComponent(data);
        				alert("decode : "+decode);
        				
        				var tagArea=$("#tag");
        				tagArea.val(tagArea.val()+decode);
        				
        			}
        		});
      
      }
      else {
      	alert("업로드 실패");
        //image.src = "http://dy.gnch.or.kr/img/no-image.jpg";
      }
    }
  };
  xmlHttpRequest.send(target.files[0]);
  //image.src = "https://nrm.dfg.ca.gov/images/image-loader.gif";
};
});

$(function(){
	   $('#submit').bind("click",function(){
		   
	         //$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/board/addBoard").submit();
	         $("form").attr("method" , "POST").attr("action" , "/board/addBoard").submit();
	      
	   })
	});
</script>

</head>

<body>

<form name="fileForm" enctype="multipart/form-data">
<input type="hidden" name="userNo" value="US10003"/>
<!-- <img id=image src="http://dy.gnch.or.kr/img/no-image.jpg"> -->
<!-- <img id=image> -->
<br>
<input id=file type=file multiple="multiple">

<div id="img_box"></div>

<input type="text" id="tag" value="" name="hashTag"></input>
<input type="text" id="link" value="" name="photo1"></input>
<input type="text" name="boardDetailText" value="테스트텍스트"/>
<input name="userTheme" value="H_spoon"/>
</form>

  <input type="button" id="submit" value="등록"/>

</body>

</html>