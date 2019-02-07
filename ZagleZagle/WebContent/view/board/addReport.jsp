<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

  <!-- JavaScript Libraries -->
  <script src="/common/css/estateagency-master/lib/jquery/jquery.min.js"></script>
  <script src="/common/css/estateagency-master/lib/jquery/jquery-migrate.min.js"></script>
  <script src="/common/css/estateagency-master/lib/popper/popper.min.js"></script>
  <script src="/common/css/estateagency-master/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="/common/css/estateagency-master/lib/easing/easing.min.js"></script>
  <script src="/common/css/estateagency-master/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="/common/css/estateagency-master/lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="/common/css/estateagency-master/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="/common/css/estateagency-master/js/main.js"></script>

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

<script type="text/javascript">

$(function(){
	
	$("input[value='신고']").on("click",function(){

		var reportReason=$("select[name='reportReason']").val();
		//alert(reportReason);
		
		var reportingUserNo=$("input[name='reportingUserNo']").val();
		//alert(reportingUserNo);
		
		var reportedUserNo=$("input[name='reportedUserNo']").val();
		//alert(reportedUserNo);
		
		var reportedBoardNo=$("input[name='reportedBoardNo']").val();
		//alert(reportedBoardNo);
		
		var reportedCommentNo=$("input[name='reportedCommentNo']").val();
		//alert(reportedCommentNo);
		
		
		if(reportReason=='0'){
			alert("신고 사유를 선택해주세요");
			return;
		}

		self.location="/board/addReport?reportReason="+reportReason+"&reportingUserNo="+reportingUserNo+"&reportedUserNo="+reportedUserNo+"&reportedBoardNo="+reportedBoardNo+"&reportedCommentNo="+reportedCommentNo;	
	
	});
});

//부모창에서 값 받아오기
window.onload = function () {
	
    var search = window.location.search;
    var getData =  decodeURI(search);
    
    //게시물인지 댓글인지 구분
    var vali=getData.substring(5,7);
    		
    if(vali=='BD'){
    	
    	var reportedBoardNo=getData.substring(5,12);
        
        var reportedUserNo=getData.substring(12,20);
        
        var sender1 = document.querySelector('#reportedBoardNo');
        sender1.value = reportedBoardNo;
        
        var sender2 = document.querySelector('#reportedUserNo');
        sender2.value = reportedUserNo;
    	
    }else if(vali=='CM'){
    	
		var reportedCommentNo=getData.substring(5,12);
        
        var reportedUserNo=getData.substring(12,20);
        
        var sender1 = document.querySelector('#reportedCommentNo');
        sender1.value = reportedCommentNo;
        
        var sender2 = document.querySelector('#reportedUserNo');
        sender2.value = reportedUserNo;
    }
    
    
}


</script>

<title>addReport</title>
</head>
<body style="text-align: center; margin-top: 100px;">
<form name="addReport">
	
	<select class="ct_input_g" id="reportReason" name="reportReason">
		      	<option value="0">신고 사유를 선택해주세요</option>
		      	<option value="욕설/비방">욕설/비방</option>
		      	<option value="광고/허위">광고/허위</option>
		      	<option value="음란/유해">음란/유해</option>		      	
	</select>
	
	<input type="hidden" name="reportingUserNo" value="${user.userNo}"/>
	<input type="hidden" name="reportedUserNo" id="reportedUserNo"/>
	
	<input type="hidden" name="reportedBoardNo" id="reportedBoardNo"/>
	
	<input type="hidden" name="reportedCommentNo" id="reportedCommentNo"/>

	
</form>

<br/><br/><br/><br/>

<input class="btn btn-b" type="button" value="신고"/>
</body>
</html>