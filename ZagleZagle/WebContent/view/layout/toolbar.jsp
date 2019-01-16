<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     
     </style>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a:contains('�α���')").on("click" , function() {
				$(self.location).attr("href","/user/loginView");
				
				//self.location = "/user/logout"
			}); 
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			});
		 	$("a:contains('ä��')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/chat/getChat"
		 		
			}); 
		 	$("a:contains('����1')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/chat/testUser"
		 		
			}); 
		 	$("a:contains('����2')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/chat/testUser2"
		 		
			}); 
		 	$("a:contains('����3')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/chat/testUser3"
		 		
			}); 
		 	
		 	$("a:contains('��ü�Խù�')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/board/listBoard"
		 		
			});
		 });
		

	</script>
<body>
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">ZagleZagle</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  �Խù����� -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" >
	                         <span >��ü�Խù�</span>
	                     </a>
	                     
	                 </li>
	                 
	              <!-- �߰����� DrowDown -->
	              <c:if test="${sessionScope.user.userNo != null}">
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >�߰�����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">�ǸŻ�ǰ���</a></li>
	                         <li><a href="#">���Ż�ǰ���</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">etc..</a></li>
	                     </ul>
	                 </li>
	                 <!-- onAir DrowDown -->
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >onAir</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">��۸�Ϻ���</a></li>
	                         <li><a href="#">�Ŀ�ȯ���ϱ�</a></li>
	                         <li class="divider"></li>
	                     </ul>
	                 </li>
	                 
	               </c:if>
	               <li><a href="#">ä��</a></li>
	               <li><a href="#">����1</a></li>
	               <li><a href="#">����2</a></li>
	               <li><a href="#">����3</a></li>
	             </ul>
	             
	             
	             <ul class="nav navbar-nav navbar-right">
	             	<c:if test="${sessionScope.user.userNo==null}"><li><a href="#">�α���</a></li></c:if>
	                <c:if test="${sessionScope.user.userNo!=null}"><li><a href="#">�α׾ƿ�</a></li></c:if>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
</body>
</html>