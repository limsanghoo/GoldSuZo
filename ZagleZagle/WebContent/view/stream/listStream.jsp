
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<html>
<head>
<title>스트리밍 목록조회</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<style>  
  
  h1, h2, h3, h4, h5, h6 {
    font-weight: 400;
    color: white !important;
    line-height: 1.25em;
}

#addRefundForm{
color:black !important; 
}
  
.homepage{
	padding-top :100px;
    background-color: #935d8c;
    background-image: url(images/overlay.png), -moz-linear-gradient(45deg, #e37682 15%, #5f4d93 85%);
    background-image: url(images/overlay.png), -webkit-linear-gradient(45deg, #e37682 15%, #5f4d93 85%);
    background-image: url(images/overlay.png), -ms-linear-gradient(45deg, #e37682 15%, #5f4d93 85%);
    background-image: url(images/overlay.png), linear-gradient(45deg, #e37682 15%, #5f4d93 85%);    
	color: rgba(255, 255, 255, 0.65);
 
}   

.box{ 
 width: 300px;   
   border: 1px solid black; 
	border-radius: 15px !important;
	background-color: rgba(0,0,0,0.4) !important; 
	display: block;  
}
     
       
    button:hover{
         box-shadow:2px 8px 4px -6px hsla(0,0%,0%,.3);
      } 
   
  </style>  
   
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
		
function addRefund(){
		//alert('addRefund()');
	    $("#addRefundForm").attr("method", "POST").attr("action", "/stream/addRefund").submit();
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
	
	$("#refund").on("click", function() {
		   alert("환급합니다~");
		   addRefund();    
		// $("#addRefundForm").attr("method", "POST").attr("action", "/stream/addRefund").submit();
		  var result = confirm("환급신청 완료! 환급리스트 화면으로 이동 하시겠습니까?");
		     
		  if(result){
			  //alert("환급리스트 공사중....") 
			  self.location="/stream/listRefund";
		  }else{ 
			  self.location="/stream/listStream";
		  } 
	});  
	$("#listRefund").on("click", function() {
		   alert("환급리스트로 이동합니다~");
		self.location="/stream/listRefund";  
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
		  window.open("https://192.168.0.12:443/stream/join?streamer="+streamer+"&userNo=US10002&userNickname=user02&userProfile=default.jpg", "popup_window", "width=1450, height=900, scrollbars=no");
	}); 
	   
	   $('button[name="banname"]').on('click',function(){

	    	alert('ddd');	
	    });
	   
	   $('button[name="refundbtn"]').on('click',function(){ 
	    	 $.ajax({
	             url : '/stream/json/listSpon', 
	             method : 'get', 
	             headers: {
	   	            "Accept": "application/json",
	   	            "Content-Type": "application/json"
	   	        }, 
	             success : function (JSONData,status) {
	              //   alert("보내기 성공");
	          //    alert(JSON.stringify(JSONData.list)); 
	         //   alert(JSON.stringify(JSONData.list.STREAMERNO)); 
	          	//alert(JSONData.list);       
	        		// 	alert(JSONData.list.STREAMERNO);   
	           $.each(JSONData.list,function(i,v){
	            	//alert(v);   
	            $('#streamerNo').text(v.STREAMERNO);
	            $('input[name="streamerNo"]').val(v.STREAMERNO);
	            $('#streamerNickname').text(v.USERNAME);
	            $('input[name="streamerNickname"]').val(v.USERNAME);
	            $('#price').text(v.POSSIBLEPRICE);
	            $('input[name="price"]').val(v.POSSIBLEPRICE);
	            $('#totalPrice').text(v.TOTALPRICE);   
	            $('input[name="totalPrice"]').val(v.TOTALPRICE);  
	             
	          });   	                    
	             },  
	             error : function (err) {
	             	alert('실패 ㅠㅠ');
	                 }
	         });
	    	
	    });
  
	 
});  
</script> 
</head>
<body>  
   	<!-- ToolBar End /////////////////////////////////////-->
<jsp:include page="/view/layout/toolbar.jsp" /> 

		<!--<button type="button" data-toggle="modal" data-target="#myModal" style="margin:15px; padding:15px;">스트리밍 방 업로드 하기</button>   -->
    
  <button class='lined thick' data-toggle="modal" data-target="#myModal"  style="width:200px;">스트리밍방업로드 하기</button> 
   
		<!--<button type="button" name="refundbtn" data-toggle="modal" data-target="#myModal2" style="margin:15px; padding:15px;">환급하기</button>  -->
   <button class='lined thick'  name="refundbtn" data-toggle="modal" data-target="#myModal2">환급하기</button>
    <button class='lined thick' id="listRefund" name="listRefund">환급리스트이동</button> 
  
					
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
  

	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel">환급하기</h4>
      </div>
      <form id="addRefundForm" method="post" target="popup_window">
      <div class="modal-body"> 
      
      			<label for="txt-user-text" class="col-form-label">유저No</label><br/> 
       			   <div class="refund" id="streamerNo" name="streamerNo"></div><br/>
       			   <input type="hidden" name="streamerNo">
      			<label for="txt-user-text" class="col-form-label">닉네임</label><br/> 
       			   <div class="refund" id="streamerNickname" name="streamerNickname"></div><br/>
      				 <input type="hidden" name="streamerNickname">
      
       			<label for="txt-user-text" class="col-form-label">후원받은 총 금액</label><br/> 
       			   <div class="refund" id="totalPrice" name="totalPrice"></div><br/>
 						 <input type="hidden" name="totalPrice">
       			<label for="txt-user-text" class="col-form-label">환급가능한 총 금액</label> <br/> 
       			   <div class="refund" id="price" name="price"></div> 
       			   		 <input type="hidden" name="price">
 			<div></div>
       </div>  
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal" id="refund">환급하기</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div> 
      </form>
    </div>
  </div></div>	
	 
<div class="row" id="list" "position: relative; z-index: 2;">
<c:set var="i" value="0" />
<c:forEach var="obj" items="${list}">
<div class="container"> <div class="box">
<h2><img id="profile" src="/common/images/stream/${obj.streamerProfile}" style="height:30px; width:30px;">${obj.streamNickname}</h2><img alt="50x50" data-src="holder.js/100x200" src='/common/images/stream/${obj.streamSum}' style=" width:80%;margin:auto; display: block;">
<h2>${obj.streamTitle}</h2><p>내용:${obj.streamContent}</p><p>시청자수:${obj.streamViewCount}<p><p>좋아요수:${obj.streamLikeCount}</p><a class="btn btn-default" name="get" role="button" data-param="${obj.streamer}">들어가기</a> 
    
</div> </div> 
</c:forEach>  
</div>   
</body>
</html>