<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	


<script type="text/javascript">
	


	
	
	
	$(function() {
	 
 		
 		if('${userNo}' !=null) {
 			
 		opener.location.replace("/board/listBoard/");
 		}

 		
 	
 
 		
		window.close();    //현재 팝업창 Close	
 		

		
		$("#logout").on("click",function() {
			
			alert("클릭됨")
			
				var snsNo = $(this).data("param");
				
				alert(snsNo)
			
			if(snsNo.startsWith("K")) {
				
				alert("K로시작하는거 인식")
				$("form").attr("method" , "POST").attr("action" , "/user/logout/json").submit();
				
			}else if(snsNo.startsWith("N")){
				alert("N으로시작하는거 인식")
				$("form").attr("method" , "POST").attr("action" , "/user/Nlogout").submit();
			}
	
			
		
			
		});
		
		
	});
	
 	$(function() {
 		
 		$(".getUserInfo").on("click", function() {
 			
 			
 			var userNo =$(this).data("param1");
 			alert(userNo)
 			console.log(userNo);
 			
 			self.location="/user/getUser2?userNo="+userNo
 		
 		});
 	});
  	
 	$(function() {
 		
 	
 		
 	});
 	
</script>


</head>
<body>
<form>
<input type="button" id="logout" name="logout" value="로그아웃" data-param="${user.snsNo}">
</form>

<h3 class=getUserInfo data-param1="${user.userNo}">${user.userName} 님 환영합니다.</h3>
<p>${user.snsNo}</p>
<p>${user.userNo}</p>

컨트롤러 기능 확인용
</body>
</html>