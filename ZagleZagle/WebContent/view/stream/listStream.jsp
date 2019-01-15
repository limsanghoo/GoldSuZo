
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   


<html>
<head>
<title>스트리밍 목록조회</title>
<style>
  #color {
    background: yellow;
    font-weight: bold;
    cursor: pointer;
    padding: 5px;
  }
  </style>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<script type="text/javascript">

/*var auto_refresh = setInterval(
		function ()
		{
		$('#list').load('/stream/listStream').fadeIn("slow"); 
		},3000); // 새로고침 시간 1000은 1초를 의미합니다.
   */
function addStream(){
	
    $("#addStreamForm").attr("method", "POST").attr("action", "/stream/addStream").submit();
 }
 
$(function() {
	var modal = document.getElementById('myModal');
	var moda2 = document.getElementById('myModal2');
	var title = document.getElementById('streamTitle');
	var content = document.getElementById('streamContent');
	
	  var streamTitle = $("input[name='streamTitle']").val();
	  
	  var streamContent = $("input[name='streamContent']").val();
      
	$("#upload").on("click", function() {
		   alert("전송됩니다~");
		   window.open("", "popup_window", "width=1450, height=900, scrollbars=no");
		   addStream();
	 
	});
	$('span[class="close"]').on("click", function() {
		 var span = document.getElementsByClassName("close")[0];  
	            modal.style.display = "none";
	    
	}); 
	
	$("#upload2").on("click", function() {
		
		   modal.style.display = "block";
	
	});
	
	$('a[name="get"]').on("click", function() {
		var streamer = $(this).data("param");
		alert(streamer);
		  window.open("https://192.168.0.26:443/stream/join?streamer="+streamer+"&userNo=US10002&userNickname=user02&userProfile=default.jpg", "popup_window", "width=1450, height=900, scrollbars=no");
	}); 
	 
	   $('button[name="banname"]').on('click',function(){

	    	alert('ddd');	
	    });
 
	
});  
</script>
</head>



<body>
   	<!-- ToolBar End /////////////////////////////////////-->


		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin:15px; padding:15px;">
스트리밍 방 업로드 하기
</button>
	<button class="ban" name="banname">강퇴하기</button>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel">스트리밍방 만들기</h4>
      </div>
      <form id="addStreamForm" method="post" target="popup_window" enctype="multipart/form-data">
      <div class="modal-body">
       			<label for="txt-user-text" class="col-form-label">제목</label><br/> 
       			   <input type="text" class="form-control" id="streamTtitle" value="" placeholder="제목을 입력하세요" name="streamTitle"><br/>
 				
       			<label for="txt-user-text" class="col-form-label">내용</label> <br/> 
 				   <input type="text" class="form-control" id="streamContent" value="" placeholder="내용을 입력하세요" name="streamContent"> <br/>	
 				
 				 <label for="txt-user-text" class="col-form-label">썸네일이미지</label> <br/>   
 	<input type="file" multiple class="form-control" id="file" name="file">
		   
      </div> 
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal" id="upload">업로드하기</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
      </form>
    </div>
  </div></div>	
		
	 
		
		
<div class="row" id="list">
<c:set var="i" value="0" />
<c:forEach var="obj" items="${list}">
<div class="col-sm-6 col-md-4"> <div class="thumbnail"> 
<img alt="50x50" data-src="holder.js/100x200" src='/common/images/stream/${obj.streamSum}' style="height: 250px; width: 50%; display: block;">
<div class="caption"> <h1>${obj.streamTitle}</h1><img id="profile" src="/common/images/stream/${obj.streamerProfile}" style="height:100px; width:100px;"><h2>${obj.streamNickname}</h2><h3>${obj.streamer}</h3><p>내용:${obj.streamContent}</p><p>시청자수:${obj.streamViewCount}<p><p>좋아요수:${obj.streamLikeCount}</p><a class="btn btn-default" name="get" role="button" data-param="${obj.streamer}">들어가기</a> 
</div>  
</div> </div>
</c:forEach>  
</div>   
 
</body>
</html>