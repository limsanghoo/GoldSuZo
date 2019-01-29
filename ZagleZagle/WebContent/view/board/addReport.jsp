<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8" />

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  -->


<script type="text/javascript">

$(function(){
	
	$("input[value='신고']").on("click",function(){

		var reportReason=$("select[name='reportReason']").val();
		alert(reportReason);
		
		var reportingUserNo=$("input[name='reportingUserNo']").val();
		//alert(reportingUserNo);
		
		var reportedBoard=$("input[name='reportedBoard']").val();
		//alert(reportedBoard);
		
		var reportedUserNo=$("input[name='reportedUserNo']").val();
		//alert(reportedUserNo);
		
		self.location="/board/addReport?reportReason="+reportReason+"&reportingUserNo="+reportingUserNo+"&reportedBoard="+reportedBoard+"&reportedUserNo="+reportedUserNo;	
		
		window.close();
	});
	
});

//부모창에서 값 받아오기
window.onload = function () {
    var search = window.location.search;
    var getData =  decodeURI(search);
    		
    var reportedBoard=getData.substring(5,12);
    
    var reportedUserNo=getData.substring(12,20);
    
    var sender1 = document.querySelector('#reportedBoard');
    sender1.value = reportedBoard;
    
    var sender2 = document.querySelector('#reportedUserNo');
    sender2.value = reportedUserNo;
    
}


</script>

<title>addReport</title>
</head>
<body>
<form name="addReport">
	<select class="form-control" id="reportReason" name="reportReason">
		      	<option value="0">신고 사유를 선택해주세요</option>
		      	<option value="욕설">욕설</option>
		      	<option value="광고">광고</option>
		      	<option value="음란">음란</option>		      	
	</select>
	
	<input type="hidden" name="reportingUserNo" value="${user.userNo}"/>
	<input type="hidden" name="reportedBoard" id="reportedBoard"/>
	<input type="hidden" name="reportedUserNo" id="reportedUserNo"/>

	
</form>

<br/><br/><br/>

<input type="button" value="신고"/>
</body>
</html>