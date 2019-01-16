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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script> 
   
   
   

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
function coupon(){
	popWin = window.open("/coupon.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}


$(function(){
	
	$("#kakaopay").on("click",function(){
			$("form").attr("method" , "POST").attr("action","/stream/json/start").submit();
		
	});
	
});

</script>



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form>
      <h3>여러분의 후원이 큰 힘이 됩니다^^ ${param.userNo}${param.streamerNo}</h3>
                 금액<input type="text" id="price" name="price"></input>원  
      	 <input type="hidden" id="streamerNo" name="streamerNo" value="${param.streamerNo}"></input>
    	 <input type="hidden" id="userNo" name="userNo" value="${param.userNo}"></input>
        <button type="button" class="btn btn-default" id="kakaopay">카카오페이</button>
    	<button type="button" class="btn btn-default" id="naverpay">네이버페이</button>
    	<button type="button" class="btn btn-default" id="inicispay">이니시스페이</button> 
  </form>
</body>
</html>