<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>ZagleZagle</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>

<style>
.progress { position:relative; width:400px; border: 1px solid #ddd; padding: 1px; border-radius: 3px; }
  .bar { background-color: #B4F5B4; width:0%; height:20px; border-radius: 3px; }
  .percent { position:absolute; display:inline-block; top:3px; left:48%; }
#chat_box {
	width: 800px;
	min-width: 800px;
	height: 500px;
	min-height: 500px;
	border: 1px solid black;
	overflow:scroll;
}

#msg {
	width: 700px;
}

#msg_process {
	width: 90px;
}
</style>
	<script src="http://192.168.0.25:82/socket.io/socket.io.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script>
		$(document).ready(function() {
			var socket = io("http://192.168.0.25:82");
			socket.emit("send_user",{id : "${user.userNickname}", addr : "${user.userAddr}"});
			
			//msg에서 키를 누를떄
			$("#msg").keydown(function(key) {
				//해당하는 키가 엔터키(13) 일떄
				if (key.keyCode == 13) {
					//msg_process를 클릭해준다.
					msg_process.click();
				}
			});

			//msg_process를 클릭할 때
			$("#msg_process").click(function() {
				//소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
				socket.emit("send_msg",$("#msg").val());
				//#msg에 벨류값을 비워준다.
				$("#msg").val("");
			});

			////소켓 서버로 부터 in_msg를 통해 이벤트를 받을 경우 
			socket.on('send_user_name',function(msg){
				$("<div></div>").text(msg+"님이 입장하셧습니다.").appendTo("#chat_box");
				 $('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
			});
			//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
			socket.on('send_msg', function(data) {
				//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
				if (data.ms.substring(data.ms.length-3)=='jpg'||data.ms.substring(data.ms.length-3)=='png') {
					$("<div>"+data.id+" : <img src='http://192.168.0.25:8080/common/images/chat/"+data.ms+"' style='width: 200px; height: 180px;'/></div>").appendTo("#chat_box");
					$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
				}else if(data.ms.substring(data.ms.length-3)=='mp4'||data.ms.substring(data.ms.length-3)=='wmv'){
					$("<div>"+data.id+" : <video controls controlsList='nodownload' width='320' height='240' muted><source src='http://192.168.0.25:8080/common/images/chat/"+data.ms+"' type='video/mp4'><a href='http://192.168.0.25:8080/common/images/chat/"+data.ms+"'>download video</a></video></div>").appendTo("#chat_box");
					$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
				}else{
					$("<div></div>").text(data.id+" : "+data.ms).appendTo("#chat_box");
					$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
				}
				
			});
			//
			socket.on('out_msg',function(msg){
				$('<div></div>').text(msg).appendTo("#chat_box");
				$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
			});
			

			$('#file_up').on('click',function(){
		         var formData = new FormData($('form')[0]);
		         var bar = $('.bar');
				    var percent = $('.percent');
				    var status = $('#status');  
		            var ajaxReq = $.ajax({
		                 type : 'post',
		                 url : '/chat/json/uploadFile/',
		                 data : formData,
		                 processData : false,
		                 contentType : false,
		                 uploadProgress: function(event, position, total, percentComplete) {
					            var percentVal = percentComplete + '%';
					            bar.width(percentVal);
					            percent.html(percentVal);
					        },
		                 success : function(data, statusText, xhr) {	         		                	 
		                //	 $("#msg").val(data);
		                	 var percentVal = '100%';
		                     bar.width(percentVal);
		                     percent.html(percentVal);
		                     status.html(xhr.responseText);
		                 },
		                 error : function(error) {
		                     alert("파일 업로드에 실패하였습니다.");
		                     console.log(error);
		                     console.log(error.status);
		                 }
		             });
		            
		            ajaxReq.done(function(msg){
		           
		            	if (msg.substring(msg.length-3)=='mp4') {
		            		setTimeout(function() {
			            		while(true){
				            		var path = 'http://192.168.0.25:8080/common/images/chat/'+msg;
				            		var re = doesFileExist(path);
				            		if (re) {
				            			socket.emit("send_msg",msg);
										break;
									}
				            	}
			            	},5000);
						}else{
							setTimeout(function() {
			            		while(true){
				            		var path = 'http://192.168.0.25:8080/common/images/chat/'+msg;
				            		var re = doesFileExist(path);
				            		if (re) {
				            			socket.emit("send_msg",msg);
										break;
									}
				            	}
			            	},2000);
						}
		            	
		            	
		          
		            });

		           function doesFileExist(urlToFile) {
					    var xhr = new XMLHttpRequest();
					    xhr.open('HEAD', urlToFile, false);
					    xhr.send();
					     
					    if (xhr.status == "404") {
					        return false;
					    } else {
					        return true;
					    }
					}
		            
			});
			
			$(function(){
			    $("#msg_trans").on("click",function(){
			        	var inputData = $('#msg').val();
			        	alert(inputData);
				        $.ajax({
				                 type : 'post',
				                 url : '/chat/json/translate/',
				                 data : { "text" : inputData},
				                 success : function(data) {	         		                	 
				                //	 $("#msg").val(data);
				                	alert("번역성공!!")
				                	 $('#msg').val(data);
				                 },
				                 error : function(error) {
				                     alert("번역실패.");
				                 }	
			        
			        });
			        
				});
			});
			
		});
		
		
	</script>
</head>
<body>
	<div id="chat_box" ></div>
	<input type="text" id="msg"/>
	<button id="msg_trans">번역</button>
	<button id="msg_process">전송</button>
	<form enctype="multipart/form-data" id="frm">
	<input type="file" name="imageFile" class="ct_input_g" style="width: 200px; height: 19px" maxLength="13" />
	<button type='button' id='file_up'>등록</button>
	</form>
	<div class="progress">
    <div class="bar"></div>
    <div class="percent">0%</div>
	</div>
	<div id="status"></div>

</body>
</html>