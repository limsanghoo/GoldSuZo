<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

    
   

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
    
<script type="text/javascript">
<!--
	function fncGetProductList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
   	System.out.println("현재페이지"+currentPage);
}
-->
//opener.setChildValue("안녕");
		alert("결제완료되었습니다");
		 window.opener.document.location.href = window.opener.document.URL;
		window.close(); 
		$(function(){
			
		
			//window.opener.location.reload();  
			//});   
		});

</script>



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form> 
     결제가 완료되었습니다 <button id="close">닫기</button>
  </form>
</body>
</html>