<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Loading Effects for Grid Items with CSS Animations" />
<meta name="keywords" content="css animation, loading effect, google plus, grid items, masonry" />
<meta name="author" content="Codrops" />

<title>listBoard</title>  

<link rel="shortcut icon" href="../favicon.ico"> 
<link rel="stylesheet" type="text/css" href="/common/css/GridLoadingEffects/css/default.css" />
<link rel="stylesheet" type="text/css" href="/common/css/GridLoadingEffects/css/component.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="/common/css/GridLoadingEffects/js/modernizr.custom.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>       
        
        
        
 <!--  --> 
 <!-- Favicons -->
  <link href="/common/css/estateagency-master/img/favicon.png" rel="icon">
  <link href="/common/css/estateagency-master/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="/common/css/estateagency-master/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="/common/css/estateagency-master/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/common/css/estateagency-master/lib/animate/animate.min.css" rel="stylesheet">
  <link href="/common/css/estateagency-master/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="/common/css/estateagency-master/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="/common/css/estateagency-master/css/style.css" rel="stylesheet">   
<style>  

.thumbnail{
padding: 15px;  
}

.sumnail{
padding: 10px; 
}
button{
text-align:center; 
}
body{
padding-top : 135px;
}
@import url('https://fonts.googleapis.com/css?family=Poppins');
  
.row{

 padding-left: 140px;
  padding-right: 140px; 
}
#get{ 
margin-left: 70%;  
}  
   
 
#buttonList{
 padding: 10px; 
margin: 0 0 10px; 
 
}  

</style>  
   
<script type="text/javascript">


/*var auto_refresh = setInterval(
		function ()
		{
		$('#list').load('/stream/listStream').fadeIn("slow"); 
		},3000); // 새로고침 시간 1000은 1초를 의미합니다.
   */
function ban()
 {
     alert('강퇴당하셨습니다 ㅠㅠㅠㅠㅠ');
   }
   
   
function addStream(){
	
    $("#addStreamForm").attr("method", "POST").attr("action", "/stream/addStream").submit();
 }
		
function addRefund(){
		alert('addRefund()'); 
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
		  // alert("전송됩니다~");
		   window.open("", "popup_window", "width=1450, height=900, toolbar=no, location=no, status=no, memubar=no, scrollbars=no, resizable=no");
		   addStream();
	});
	$("#refund").on("click", function() {
		  // alert("환급합니다~");
		   var streamerNo = $('input[name="streamerNo"]').val();
		   var streamerNickname = $('input[name="streamerNickname"]').val();
		   var price = $('input[name="price"]').val();
		   var totalPrice = $('input[name="totalPrice"]').val();
		   var data = {
				   "streamerNo" : streamerNo,
		   			"streamerNickname" : streamerNickname, 
		   			"price" :   price,
		    		"totalPrice" : totalPrice 
		   };    
		 	 $.ajax({
	             url : '/stream/json/addRefund',  
	             method : 'post', 
	             data: JSON.stringify(data),
	             headers: {
	   	            "Accept": "application/json",
	   	            "Content-Type": "application/json"
	   	        },    	        
	             success : function (JSONData,status) {
	           //alert("보내기 성공");
	           var result = confirm("환급신청 완료! 환급리스트 화면으로 이동 하시겠습니까?");
			     
	 		  if(result){
	 			  //alert("환급리스트 공사중....") 
	 			  self.location="/stream/listRefund";
	 		  }else{ 
	 			  self.location="/stream/listStream";
	 		  }  
	             },
	             error : function (err) { 
	              //   alert("보내기 성공");
	  	           var result = confirm("환급신청 완료! 환급리스트 화면으로 이동 하시겠습니까?");
	  			     
	  	 		  if(result){
	  	 			  //alert("환급리스트 공사중....") 
	  	 			  self.location="/stream/listRefund";
	  	 		  }else{ 
	  	 			  self.location="/stream/listStream";
	  	 		  }  
	  	             
	                 }  
	         }); 
		 /*  addRefund();    
		   var result = confirm("환급신청 완료! 환급리스트 화면으로 이동 하시겠습니까?");
		     
	 		  if(result){
	 			  //alert("환급리스트 공사중....") 
	 			  self.location="/stream/listRefund";
	 		  }else{ 
	 			  self.location="/stream/listStream";
	 		  }  */
	 		   
	//	 $("#addRefundForm").attr("method", "POST").attr("action", "/stream/addRefund").submit();
	});  
	$("#listRefund").on("click", function() {
		//   alert("환급리스트로 이동합니다~"); 
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
		//alert(streamer);
	 	 $.ajax({
             url : '/stream/json/checkBan?userNo=${user.userNo}&streamer='+streamer,   
             method : 'get', 
             headers: {
   	            "Accept": "application/json",
   	            "Content-Type": "application/json"
   	        }, 
             success : function (JSONData,status) {
           //alert("보내기 성공");
          // alert(JSON.stringify(JSONData));
           if(JSONData==1){
        	   alert('강퇴당하셔서 입장 불가능 하십니다 ㅠ.ㅠ 다음기회에...~'); 
           }else{
        		 window.open("https://192.168.0.14:443/stream/join?streamer="+streamer+"&userNo=${user.userNo}&userNickname=${user.userNickname}&userProfile=${user.profile}", "popup_window", "width=1450, height=900, scrollbars=no");
           }  	                    
             },  
             error : function (err) { 
             	alert('실패 ㅠㅠ');
                 } 
         });
	}); 
	   
	   $('button[name="banname"]').on('click',function(){

	    	alert('ddd');	
	    });
	   
	   
	   $('button[id="session"]').on('click',function(){

	    	//alert('ddd');	
	    	self.location ="/stream/listStream2?userNo=US10023";
	    });
	    
	   $('button[id="session2"]').on('click',function(){

	    	//alert('ddd');	
	    	self.location ="/stream/listStream2?userNo=US10003";
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
<jsp:include page="/view/layout/toolbar.jsp" /> 
  
<body>  
   	<!-- ToolBar End /////////////////////////////////////-->
		<!--<button type="button" data-toggle="modal" data-target="#myModal" style="margin:15px; padding:15px;">스트리밍 방 업로드 하기</button>   -->
   <div id="buttonList"> 
  <button class='btn btn-b' data-toggle="modal" data-target="#myModal">스트리밍방업로드 하기</button>  
		<!--<button type="button" name="refundbtn" data-toggle="modal" data-target="#myModal2" style="margin:15px; padding:15px;">환급하기</button>  -->
   <button class="btn btn-b"  name="refundbtn" data-toggle="modal" data-target="#myModal2">환급하기</button>
    <button class='btn btn-b' id="listRefund" name="listRefund">환급리스트이동</button> 
        <button class='btn btn-b' id="session" name="session">세션</button> 
         <button class='btn btn-b' id="session2" name="session">세션2</button>  
        
  </div>
					 
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
	 
<!--<div class="row" id="list" "position: relative; z-index: 2;">
<c:set var="i" value="0" />
<c:forEach var="obj" items="${list}">
<div class="container"> <div class="box">
<h2><img id="profile" src="/common/images/stream/${obj.streamerProfile}" style="height:50px; width:50px; border-radius:70px;  ">${obj.streamNickname}</h2><img alt="50x50" data-src="holder.js/100x200" src='/common/images/stream/${obj.streamSum}' style=" width:80%;margin:auto; display: block;">
<h2>${obj.streamTitle}</h2><p>내용:${obj.streamContent}</p><p>시청자수:${obj.streamViewCount}<p><p>좋아요수:${obj.streamLikeCount}</p><a class="btn btn-default" name="get" role="button" data-param="${obj.streamer}">들어가기</a> 
    
</div> </div> 
</c:forEach>  
</div>    -->
 
<div class="row" id="list">
<c:set var="i" value="0" /> 
<c:forEach var="obj" items="${list}"> 
<div class="col-sm-6 col-md-4">  
<div class="thumbnail">  
<div class="profileusername"><img id="profile" src="/common/images/profile/${obj.streamerProfile}" style="height:50px; width:50px; border-radius:70px;">${obj.streamNickname}</div>
<img class="sumnail" alt="50x50" data-src="holder.js/100x200" src='/common/images/stream/${obj.streamSum}' style=" width:80%;margin:auto; display: block;">
<div class="caption"><h2>${obj.streamTitle}</h2><p>내용:${obj.streamContent}</p><p>시청자수:${obj.streamViewCount}</p><p>좋아요수:${obj.streamLikeCount}</p><a id="get" class="btn btn-default" name="get" role="button" data-param="${obj.streamer}">들어가기</a>
</div>  
</div> </div>
</c:forEach>
</div> 

<%-- <div class="containerList">
 <ul class="grid effect-2" id="grid">
 <c:forEach var="obj" items="${list}">
	<c:set var="i" value="0" />	
<li>	
<div class="box">		
<p>
<img id="profile" src="/common/images/stream/${obj.streamerProfile}" style="height:50px; width:50px; border-radius:70px;  "><img alt="50x50" data-src="holder.js/100x200" src='/common/images/stream/${obj.streamSum}' style=" width:80%;margin:auto; display: block;">
<span style="font-weight: bold; display: inline;">&nbsp;${obj.streamNickname}</span>		</p>
<!-- 본문 시작 -->
<div class="realBox" data-toggle="modal">  
<!-- 지도 끝 -->
<div><img src="/common/images/stream/${obj.streamSum}" style="width:100%;" align="middle"/></div>	
</div><!-- 본문 내용 끝 -->	
</div><!-- box 끝 -->
</li>
</c:forEach> 
</ul>  
</div>  --%>


</body>
</html>