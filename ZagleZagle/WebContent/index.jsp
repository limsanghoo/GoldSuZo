<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
            padding-top : 70px;
        }
       
		div { text-align: center; }
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	 <script type="text/javascript">
	 
	 //========�α���â ����
	 $(function() {

			 $("#snsLogin").on("click" , function() {
					self.location = "http://localhost:8080/view/user/loginView.jsp"
				});
		});
	 
	 
	 //========admin�α���â ����
	 $(function() {

			 $("#adminLogin").on("click" , function() {
					self.location = "http://localhost:8080/view/user/adminLoginView.jsp"
				});
		});
	 
	 
	 
	 
	 
	 </script>	
	 	
	 	
	 	
	
</head>
	
<body>



	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
	<p><img src='/common/images/LOGO.png' style="width: 1100px; height: 500px; overflow: hidden" />

  	 <img src="/common/images/adminlogin.png" id="adminLogin" style="width:30px; height:30px;">
  	 
	
	</p>
	
	
  	  
	
  	 </div>
  	 
  	 
  	  
  	 <div class="container">
  	 <img src="/common/images/login.png" style="width: 100px; height: 100px; overflow: hidden"/>
  	 
  	 <div>
  	 <h3 id="snsLogin">Login</h3>
  	 </div>
  	 
  	 <br/>
  	 
  	 
  	 <h4><a href="/board/listBoard">����ߴ� �Խù�</a></h4>
  	 </div>

</body>

</html>