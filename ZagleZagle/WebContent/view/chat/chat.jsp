<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Chat</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
	
	 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
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
	body,html{
			height: 100%;
			margin: 0;
			background: #7F7FD5;
	       background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
	        background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
	        background: url("http://img.chuing.net/i/eyyJJe/Preview.x.jpg") no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;
		}

		.chat{
			margin-top: auto;
			margin-bottom: auto;
		}
		.card{
			height: 500px;
			border-radius: 15px !important;
			background-color: rgba(0,0,0,0.4) !important;
		}
		.contacts_body{
			padding:  0.75rem 0 !important;
			overflow-y: auto;
			white-space: nowrap;
		}
		.msg_card_body{
			overflow-y: auto;
		}
		.card-header{
			border-radius: 15px 15px 0 0 !important;
			border-bottom: 0 !important;
		}
	 .card-footer{
		border-radius: 0 0 15px 15px !important;
			border-top: 0 !important;
	}
		.container{
			align-content: center;
		}
		.search{
			border-radius: 15px 0 0 15px !important;
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color:white !important;
		}
		.search:focus{
		     box-shadow:none !important;
           outline:0px !important;
		}
		#msg{
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color:white !important;
			height: 60px !important;
			overflow-y: auto;
		}
			.type_msg:focus{
		     box-shadow:none !important;
           outline:0px !important;
		}
		.attach_btn{
	border-radius: 15px 0 0 15px !important;
	background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.send_btn{
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.search_btn{
			border-radius: 0 15px 15px 0 !important;
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.contacts{
			list-style: none;
			padding: 0;
		}
		.contacts li{
			width: 100% !important;
			padding: 5px 10px;
			margin-bottom: 15px !important;
		}
	.active{
			background-color: rgba(0,0,0,0.3);
	}
		.user_img{
			height: 70px;
			width: 70px;
			border:1.5px solid #f5f6fa;
		
		}
		.user_img_msg{
			height: 40px;
			width: 40px;
			border:1.5px solid #f5f6fa;
		
		}
	.img_cont{
			position: relative;
			height: 70px;
			width: 70px;
	}
	.img_cont_msg{
			height: 40px;
			width: 40px;
	}
	.online_icon{
		position: absolute;
		height: 15px;
		width:15px;
		background-color: #4cd137;
		border-radius: 50%;
		bottom: 0.2em;
		right: 0.4em;
		border:1.5px solid white;
	}
	.offline{
		background-color: #c23616 !important;
	}
	.user_info{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 15px;
	}
	.user_info span{
		font-size: 20px;
		color: white;
	}
	.user_info p{
	font-size: 10px;
	color: rgba(255,255,255,0.6);
	}
	.video_cam{
		margin-left: 50px;
		margin-top: 5px;
	}
	.video_cam span{
		color: white;
		font-size: 20px;
		cursor: pointer;
		margin-right: 20px;
	}
	.msg_cotainer{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 10px;
		border-radius: 25px;
		background-color: #82ccdd;
		padding: 10px;
		position: relative;
	}
	.msg_cotainer_send{
		margin-top: auto;
		margin-bottom: auto;
		margin-right: 10px;
		border-radius: 25px;
		background-color: #78e08f;
		padding: 10px;
		position: relative;
	}
	.msg_time{
		position: absolute;
		left: 0;
		bottom: -15px;
		color: rgba(255,255,255,0.5);
		font-size: 10px;
	}
	.msg_time_send{
		position: absolute;
		right:0;
		bottom: -15px;
		color: rgba(255,255,255,0.5);
		font-size: 10px;
	}
	.msg_head{
		position: relative;
	}
	#action_menu_btn{
		position: absolute;
		right: 10px;
		top: 10px;
		color: white;
		cursor: pointer;
		font-size: 20px;
	}
	.action_menu{
		z-index: 1;
		position: absolute;
		padding: 15px 0;
		background-color: rgba(0,0,0,0.5);
		color: white;
		border-radius: 15px;
		top: 30px;
		right: 15px;
		display: none;
	}
	.action_menu ul{
		list-style: none;
		padding: 0;
	margin: 0;
	}
	.action_menu ul li{
		width: 100%;
		padding: 10px 15px;
		margin-bottom: 5px;
	}
	.action_menu ul li i{
		padding-right: 10px;
	
	}
	.action_menu ul li:hover{
		cursor: pointer;
		background-color: rgba(0,0,0,0.2);
	}
	@media(max-width: 576px){
	.contacts_card{
		margin-bottom: 15px !important;
	}
	}
	
#chat_box::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	background-color: #F5F5F5;
}

#chat_box::-webkit-scrollbar
{
	width: 10px;
	background-color: #F5F5F5;
}
lable:active
#chat_box::-webkit-scrollbar-thumb
{
	background-color: #0ae;
	
	background-image: -webkit-gradient(linear, 0 0, 0 100%,
	                   color-stop(.5, rgba(255, 255, 255, .2)),
					   color-stop(.5, transparent), to(transparent));
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
			socket.emit("send_user",{id :"${user.userNickname}", addr : "${user.userAddr}",pro : "${user.profile}"});
			
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
				$("<div style='text-align:center; color : white;'></div>").text(msg+"님이 입장하셧습니다.").appendTo("#chat_box");
				 $('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
			});
			//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
			socket.on('send_msg', function(data) {
				//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
				if (data.ms.substring(data.ms.length-3)=='jpg'||data.ms.substring(data.ms.length-3)=='png') {
					$("<div class='d-flex justify-content-start mb-4'><div class='img_cont_msg'><img src='/common/images/profile/"+data.pro+"' class='rounded-circle user_img_msg'></div><div class='msg_cotainer'><img src='http://192.168.0.25:8080/common/images/chat/"+data.ms+"' style='width: 200px; height: 180px;' class='img-thumbnail'/><span class='msg_time'></span></div></div>").appendTo("#chat_box");
					$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
				}else if(data.ms.substring(data.ms.length-3)=='mp4'||data.ms.substring(data.ms.length-3)=='wmv'){
					$("<div class='d-flex justify-content-start mb-4'><div class='img_cont_msg'><img src='/common/images/profile/"+data.pro+"' class='rounded-circle user_img_msg'></div><div class='msg_cotainer'><video controls controlsList='nodownload' width='320' height='240' muted><source src='http://192.168.0.25:8080/common/images/chat/"+data.ms+"' type='video/mp4'><a href='http://192.168.0.25:8080/common/images/chat/"+data.ms+"'>download video</a></video><span class='msg_time'></span></div></div>").appendTo("#chat_box");
					$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
				}else{
					$("<div class='d-flex justify-content-start mb-4'><div class='img_cont_msg'><img src='/common/images/profile/"+data.pro+"' class='rounded-circle user_img_msg'></div><div class='msg_cotainer'>"+data.ms+"<span class='msg_time'>"+data.rt+"</span></div></div>").appendTo("#chat_box");
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
		                     $("#image_name").val("");
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
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100">
				
				<div class="col-md-8 col-xl-6 chat">
					<div class="card">
						<div class="card-header msg_head">
							<div class="d-flex bd-highlight">
								<div class="img_cont">
									<img src="/common/images/profile/${user.profile}" class="rounded-circle user_img">
									<span class="online_icon"></span>
								</div>
								<div class="user_info">
									<span>${user.userNickname}</span>
									<p>${serverTime} 접속</p>
								</div>
							</div>
							<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
							<div class="action_menu">
								<ul>
									<li><i class="fas fa-user-circle"></i> View profile</li>
									<li><i class="fas fa-users"></i> Add to close friends</li>
									<li><i class="fas fa-plus"></i> Add to group</li>
									<li><i class="fas fa-ban"></i> Block</li>
								</ul>
							</div>
						</div>
						
						<div class="card-body msg_card_body" id="chat_box">
						
						</div>
					
						
						<div class="card-footer">
							<div class="input-group">
							<form enctype="multipart/form-data" id="frm">
								<div class="input-group-append">
									<span class="input-group-text attach_btn"><label for="#image_name" class="fas fa-paperclip"></label>
									<input type="file" name="imageFile" id="image_name"/>
									<button type='button' id='file_up'>등록</button></span>
								</div>
								</form>
								<div class="input-group-append">
								<input type="text" class="form-control type_msg" placeholder="여기에 입력하세요.." id="msg"/>
								<button type='button' id='msg_trans'>번역</button>
								</div>
								<div class="input-group-append" id="msg_process">
									<span class="input-group-text send_btn"><i class="fas fa-location-arrow"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	
</html>