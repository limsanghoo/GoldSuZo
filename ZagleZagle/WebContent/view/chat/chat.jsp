<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>  
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<title>Chat</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
<style>
body,html{
			height: auto;
			margin: 0;
			background-color: rgba(0,0,0,0)
		}

		.chat{
			margin-top: auto;
			margin-bottom: auto;
		}
		.card{
			margin-top: auto;
			margin-bottom: auto;
			height: 600px;
			overflow-y: auto;
			border-radius: 15px !important;
			background-color: rgba(0,0,0,0.8) !important;
		}
		.contacts_body{
			padding:  0.75rem 0 !important;
			overflow-y: auto;
			white-space: nowrap;
			height : auto;
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
		.type_msg{
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
	
	.msg_cotainer{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 10px;
		border-radius: 25px;
		background-color: #82ccdd;
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
	.action_menu a{
		list-style: none;
		padding-left: 10px;
	margin: 0;
	color: white;
	}
	.action_menu a ul{
		width: 100%;
		padding: 10px 15px;
		margin-bottom: 5px;
	}
	.action_menu a ul li{
		padding-right: 10px;
	
	}
	.action_menu a ul:hover{
		cursor: pointer;
		background-color: rgba(0,0,0,0.2);
	}
	.action2_menu a ul{
		width: 100%;
		padding: 10px 15px;
		margin-bottom: 5px;
	}
	.action2_menu a ul li i{
		padding-right: 10px;
	
	}
	.action2_menu a ul li:hover{
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
	background-color: rgba(0,0,0,0.0) !important;
}

#chat_box::-webkit-scrollbar
{
	width: 10px;
	background-color: rgba(0,0,0,0.0) !important;;
}
#chat_box::-webkit-scrollbar-thumb
{
	background-color: #0ae;
	
	background-image: -webkit-gradient(linear, 0 0, 0 100%,
	                   color-stop(.5, rgba(255, 255, 255, .2)),
					   color-stop(.5, transparent), to(transparent));
}
margin-top: -1px;
}
#mydiv {
  position: absolute;
  z-index: 9;
  background-color: #f1f1f1;
  text-align: center;
  background-color: rgba(0,0,0,0.6);
  height: 800px;
  width: 600px;
}

#mydivheader {
  padding: 10px;
  cursor: move;
  z-index: 10;
  background-color: rgba(0,0,0,0.7);
  color: #fff;
  width: 70px;
  height: 30px;
}

input[type="file"] { /* 파일 필드 숨기기 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
#mdStart {position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
</style>
	<script src="http://192.168.0.45:82/socket.io/socket.io.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script>
		$(document).ready(function() {
			var socket = io("http://192.168.0.45:82");
			socket.emit("send_user",{id :"${user.userNickname}", addr : "${room}",pro : "${user.profile}"});
			
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
				var msg = $("#msg").val();
				if (msg!="") {
					socket.emit("send_msg",$("#msg").val());
				}
				
				//#msg에 벨류값을 비워준다.
				$("#msg").val("");
			});

			////소켓 서버로 부터 in_msg를 통해 이벤트를 받을 경우 
			socket.on('send_user_name',function(msg){
				$("<div style='text-align:center; color : white;'></div>").text(msg+"님이 입장하셨습니다.").appendTo("#chat_box");
				 $('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
			});
			//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
			socket.on('send_msg', function(data) {
				//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
				if (data.id=="${user.userNickname}") {
					if (data.ms.substring(data.ms.length-3)=='jpg'||data.ms.substring(data.ms.length-3)=='png') {
						$("<div class='d-flex justify-content-start mb-4 flex-row-reverse'><div class='img_cont_msg' style='padding-left: 10px;'><img src='/common/images/profile/"+data.pro+"' class='rounded-circle user_img_msg' onclick='javascript:mdmd(/@"+data.pro+"/);'></div><div class='msg_cotainer' onclick='javascript:mdmd(/"+data.ms+"/);'><img src='/common/images/chat/"+data.ms+"' style='width: 200px; height: 180px;' class='img-thumbnail' /><span class='msg_time'>"+data.rt+"</span></div></div>").appendTo("#chat_box");
						$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
					}else if(data.ms.substring(data.ms.length-3)=='mp4'||data.ms.substring(data.ms.length-3)=='wmv'){
						$("<div class='d-flex justify-content-start mb-4 flex-row-reverse'><div class='img_cont_msg' style='padding-left: 10px;'><img src='/common/images/profile/"+data.pro+"' class='rounded-circle user_img_msg' onclick='javascript:mdmd(/@"+data.pro+"/);'></div><div class='msg_cotainer'><video controls controlsList='nodownload' width='320' height='240' muted><source src='/common/images/chat/"+data.ms+"' type='video/mp4'></video><span class='msg_time'>"+data.rt+"</span></div></div>").appendTo("#chat_box");
						$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
					}else{
						$("<div class='d-flex justify-content-start mb-4 flex-row-reverse'><div class='img_cont_msg' style='padding-left: 10px;'><img src='/common/images/profile/"+data.pro+"' class='rounded-circle user_img_msg' onclick='javascript:mdmd(/@"+data.pro+"/);'></div><div class='msg_cotainer'>"+data.ms+"<span class='msg_time'>"+data.rt+"</span></div></div>").appendTo("#chat_box");
						$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);	
					}
				}else{
					if (data.ms.substring(data.ms.length-3)=='jpg'||data.ms.substring(data.ms.length-3)=='png') {
						$("<div class='d-flex justify-content-start mb-4'><div class='img_cont_msg dropdown-toggle' data-toggle='dropdown'><ul class='dropdown-menu'><li><div onclick='javascript:sChat(/"+data.id+"/)'>1:1채팅하기</div><div onclick='javascript:strChat(/"+data.id+"/)'>1:1화상채팅하기</div></li></ul><img src='/common/images/profile/"+data.pro+"' class='rounded-circle user_img_msg'></div><div class='msg_cotainer' onclick='javascript:mdmd(/"+data.ms+"/);'><img src='/common/images/chat/"+data.ms+"' style='width: 200px; height: 180px;' class='img-thumbnail' /><span class='msg_time'>"+data.rt+"</span></div></div>").appendTo("#chat_box");
						$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
					}else if(data.ms.substring(data.ms.length-3)=='mp4'||data.ms.substring(data.ms.length-3)=='wmv'){
						$("<div class='d-flex justify-content-start mb-4'><div class='img_cont_msg dropdown-toggle' data-toggle='dropdown'><ul class='dropdown-menu'><li><div onclick='javascript:sChat(/"+data.id+"/)'>1:1채팅하기</div><div onclick='javascript:strChat(/"+data.id+"/)'>1:1화상채팅하기</div></li></ul><img src='/common/images/profile/"+data.pro+"' class='rounded-circle user_img_msg'></div><div class='msg_cotainer'><video controls controlsList='nodownload' width='320' height='240' muted><source src='/common/images/chat/"+data.ms+"' type='video/mp4'></video><span class='msg_time'>"+data.rt+"</span></div></div>").appendTo("#chat_box");
						$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
					}else{
						$("<div class='d-flex justify-content-start mb-4'><div class='img_cont_msg dropdown-toggle' data-toggle='dropdown'><ul class='dropdown-menu' style='background-color: rgba(0,0,0,0.3); color:white;'><li><div onclick='javascript:sChat(/"+data.id+"/)'>1:1채팅하기</div><div onclick='javascript:strChat(/"+data.id+"/)'>1:1화상채팅하기</div></li></ul><img src='/common/images/profile/"+data.pro+"' class='rounded-circle user_img_msg'></div><div class='msg_cotainer'>"+data.ms+"<span class='msg_time'>"+data.rt+"</span></div></div>").appendTo("#chat_box");
						$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
						
					}
				}
				
				
			});
			
			////////////1:1채팅신청///////
			$("#btn_one").on("click",function(){
				var name = $(this).text();
				socket.emit("one_msg",{a_user:"${user.userNickname}",b_user:name,ms:"${user.profile}"});
			})
			
			
			socket.on('out_msg',function(msg){
				$("<div style='text-align:center; color : white;'></div>").text(msg).appendTo("#chat_box");
				$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);
			});
			
			socket.on("one_msg",function(msg){
				if (msg.b_user=="${user.userNickname}"&&msg.ms!="ok"&&msg.ms!="no") {
					$("#m_body2").html("<img src='/common/images/profile/"+msg.ms+"' class='img-thumbnail' style='height: auto;width:150px'/><div >"+msg.a_user+"님이 1:1채팅신청을 하셨슴다.</div>");
					$("#ok_chat").val(msg.a_user)
					mdstart2.click();
				}else if(msg.b_user=="${user.userNickname}"&&msg.ms=="ok"){
					window.open("/chat/getChat?room=@@"+msg.b_user,"_blank", "width=400, height=600, scrollbars=no ,location=no,resizable=yes,toolbar=no,status=no ")
					
				}else if(msg.b_user=="${user.userNickname}"&&msg.ms=="no"){
					swal("상대방이 거절하셨습니다.","","error");
				       
				}else if(msg.b_user.substring(0,msg.b_user.length-2)=="${user.userNickname}"&&msg.ms!="ok"&&msg.ms!="no"){
					$("#m_body2").html("<img src='/common/images/profile/"+msg.ms+"' class='img-thumbnail' style='height: auto;width:150px'/><div >"+msg.a_user+"님이 1:1화상채팅신청을 하셨슴다.</div>");
					$("#ok_chat").val(msg.a_user+"@s")
					mdstart2.click();
				}else if(msg.b_user.substring(0,msg.b_user.length-2)=="${user.userNickname}"&&msg.ms=="ok"){
					window.open("https://192.168.0.43/stream/videochat?applyuserNo="+msg.no,"_blank", "width=400, height=300, scrollbars=no,status=no");
				}else if(msg.b_user.substring(0,msg.b_user.length-2)=="${user.userNickname}"&&msg.ms=="no"){
					swal("상대방이 거절하셨습니다.","","error");
					}
				
			});
			///////////1:1채팅신청결과///////
			$("#ok_chat").on("click",function(){
				var name = $(this).val();
				socket.emit("one_msg",{a_user:"${user.userNickname}",b_user:name,ms:"ok",no:"${user.userNo}"});
				if (name.substring(name.length-2)=="@s") {
					window.open("https://192.168.0.43/stream/videochat?applyuserNo=${user.userNo}","_blank", "width=400,status=no, height=300, scrollbars=no");  
				}else{
					window.open("/chat/getChat?room=@@"+name,"_blank", "width=400, height=600, scrollbars=no ,location=no,resizable=yes,toolbar=no,status=no")
				}
			})
			$("#no_chat").on("click",function(){
				var name = $("#ok_chat").val();
				socket.emit("one_msg",{a_user:"${user.userNickname}",b_user:name,ms:"no"});
			})
			//////////////////////////////
            	var obj = $("#chat_box");

	   		     obj.on('dragenter', function (e) {
	   		          e.stopPropagation();
	   		          e.preventDefault();
	   		          
	   		     });

	   		     obj.on('dragleave', function (e) {
	   		          e.stopPropagation();
	   		          e.preventDefault();
	   		         
	   		     });

	   		     obj.on('dragover', function (e) {
	   		          e.stopPropagation();
	   		          e.preventDefault();
	   		     });

	   		     obj.on('drop', function (e) {
	   		          e.preventDefault();
	   		         

	   		          var files = e.originalEvent.dataTransfer.files;
	   		          if(files.length < 1)
	   		               return;

	   		          F_FileMultiUpload(files, obj);
	   		     });
	   		     
	   		  function F_FileMultiUpload(files, obj) {
				         var data = new FormData();
				         for (var i = 0; i < files.length; i++) {
				            data.append('file', files[i]);
				         }
				         var bar = $('.bar');
						    var percent = $('.percent');
						    var status = $('#status');  
				            var testDrop = $.ajax({
				                 type : 'post',
				                 url : '/chat/json/uploadFile/',
				                 data : data,
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
				                     msg_process.click();
				                     
				                 },
				                 error : function(error) {
				                	 swal("파일업로드실패","","error");
				                     console.log(error);
				                     console.log(error.status);
				                 }
				             });
				         
				         testDrop.done(function(msg){
				        	 socket.emit("send_msg",msg);
								});
				 
				}

	           
	   		     
        
			$('#image_name').on('change',function(){
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
		                     
		                     msg_process.click();
		                     
		                 },
		                 error : function(error) {
		                	 swal("파일업로드 실패","","error");
		                     console.log(error);
		                     console.log(error.status);
		                 }
		             });
		            
		            ajaxReq.done(function(msg){
		            	socket.emit("send_msg",msg);
		            	/*if (msg.substring(msg.length-3)=='mp4') {
		            		setTimeout(function() {
			            		while(true){
				            		var path = 'http://192.168.0.46:8080/common/images/chat/'+msg;
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
				            		var path = 'http://192.168.0.46:8080/common/images/chat/'+msg;
				            		var re = doesFileExist(path);
				            		if (re) {
				            			socket.emit("send_msg",msg);
										break;
									}
				            	}
			            	},2000);
						}*/
		            	
		            	
		          
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
			    $("#msg_trans li a").on("click",function(){
			        	var inputData = $('#msg').val();
			        	var target = $(this).data("val");
				        $.ajax({
				                 type : 'post',
				                 url : '/chat/json/translate2/',
				                 data : { 
				                	 "text" : inputData,
				                	"target" : 	target	 
				                 },
				                 success : function(data) {	         		                	 
				                //	 $("#msg").val(data);
				                	$.ajax({
						                 type : 'post',
						                 url : '/chat/json/translate/',
						                 data : { 
						                	 "text" : data.text,
						                	"target" : data.target,
						                	"tranCode" : data.tranCode
						                 },
						                 success : function(data) {
						                	 $('#msg').val(data).focus();
						                 },
						                 error : function(error) {
						                	 swal("번역실패","","error");
						                 }	
					        
					        		});
				                 },
				                 error : function(error) {
				                	 swal("번역실패","","error");
				                 }	
			        
			        });
			        
				});
			});
			$(function(){
			    $("#msg_trans2").on("click",function(){
			        	var inputData = $('#msg').val();
				        $.ajax({
				                 type : 'post',
				                 url : '/chat/json/translate2/',
				                 data : { "text" : inputData},
				                 success : function(data) {	         		                	 
				                //	 $("#msg").val(data);
				                	 $('#msg').val(data).focus();
				                 },
				                 error : function(error) {
				                	 swal("번역실패","","error");
				                 }	
			        
			        });
			        
				});
			});
			
		});
		function sChat(name){
			var text1 = name.toString();
			var name = text1.substring(1,text1.length-1);
			$("#btn_one").text(name);
			btn_one.click();
		}
		function strChat(name){
			var text1 = name.toString();
			var name = text1.substring(1,text1.length-1);
			$("#btn_one").text(name+"@s");
			
			btn_one.click();
		}
		$(document).ready(function(){
			$('#action_menu_btn').click(function(){
				$('.action_menu').toggle();
			});
				});
		////채팅장 내의 이미지 모달로 띄우기////////////////
		function mdmd(data){
			var a = data.toString();
			var b = a.substring(0,a.length-1);
			if (a.substring(1,2)=="@") {
				$("#m_body").html("<img src='/common/images/profile/"+b.substring(2)+"' class='img-thumbnail' style='height: auto;'/>");
			}else{
				$("#m_body").html("<img src='/common/images/chat"+b+"' class='img-thumbnail' style='height: auto;'/>");
			}
			
			mdStart.click();
		}
		
		//////////////////////////////////////////////
			$(function(){
				dragElement(document.getElementById("mydiv"));
				function dragElement(elmnt) {
	  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
	  if (document.getElementById(elmnt.id + "header")) {
	    /* if present, the header is where you move the DIV from:*/
	    document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
	  } else {
	    /* otherwise, move the DIV from anywhere inside the DIV:*/
	    elmnt.onmousedown = dragMouseDown;
	  }

	  function dragMouseDown(e) {
	    e = e || window.event;
	    e.preventDefault();
	    // get the mouse cursor position at startup:
	    pos3 = e.clientX;
	    pos4 = e.clientY;
	    document.onmouseup = closeDragElement;
	    // call a function whenever the cursor moves:
	    document.onmousemove = elementDrag;
	  }

	  function elementDrag(e) {
	    e = e || window.event;
	    e.preventDefault();
	    // calculate the new cursor position:
	    pos1 = pos3 - e.clientX;
	    pos2 = pos4 - e.clientY;
	    pos3 = e.clientX;
	    pos4 = e.clientY;
	    // set the element's new position:
	    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
	    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
	  }

	  function closeDragElement() {
	    /* stop moving when mouse button is released:*/
	    document.onmouseup = null;
	    document.onmousemove = null;
	  }
	}
			})
			
	</script>
</head>
<body>

<button id="btn_one" style="display: none;" value=""></button>

<div style="text-align: center; color: #2eca6a; font-style: inherit; "><h3><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;${room}</h3></div>
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
									<a href="#" class="dropdown-toggle fas fa-retweet" data-toggle="dropdown">&emsp;번역<b class="caret"></b></a>
                   					 <ul class="dropdown-menu" style="background-color: rgba(0,0,0,0); text-align: right; border: 0em; color: fuchsia;" id="msg_trans">
				                        <li><a href="#" data-val="en">영어</a>&emsp;</li>
				                        <li><a href="#" data-val="ja">일어</a>&emsp;</li>
				                        <li><a href="#" data-val="ko">한국어</a>&emsp;</li>
				                     </ul>
							</div>
						</div>
						<div class="card-body msg_card_body" id="chat_box">
						
						</div>
					
						
						<form enctype="multipart/form-data" id="frm">
							<input type="file" name="imageFile" id="image_name"/>
						</form>
						<div class="card-footer">
							<div class="input-group">
								<div class="input-group-append">
									<span class="input-group-text attach_btn"><label for="image_name"><i class="fas fa-paperclip"></i></label></span>
									
								</div>
								<input name="" class="form-control type_msg" placeholder="Type your message..." id="msg"></input>
								<div class="input-group-append" id="msg_process">
									<span class="input-group-text send_btn"><i class="fas fa-location-arrow"></i></span>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#basicExampleModal" id="mdStart">
  			Launch demo modal
		</button>
		<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		  aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-body" id="m_body">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<button type="button" id="mdstart2" style="display: none;" data-toggle="modal" data-target="#basicExampleModalChat" ></button>
		<div class="modal fade" id="basicExampleModalChat" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		  aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-body" id="m_body2">
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-primary" data-dismiss="modal" id="ok_chat" value="">승인</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="no_chat">거절</button>
		      </div>
		    </div>
		  </div>
		</div>
	</body>
	
</html>