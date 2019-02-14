<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
   
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    session.setAttribute("state", state);
 %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="770357560919-aul509lnf1546sjm4dpb8jdf48jk1ook.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>



<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


	 
	<!-- Favicons -->
  <link href="/common/css/estateagency-master/img/favicon2.png" rel="icon">
  <link href="/common/css/estateagency-master/img/apple-touch-icon2.png" rel="apple-touch-icon">


<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	
<style>
/* Made with love by Mutiullah Samim*/

@import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}


</style>
	
	
		<script>
	

	      $( function() {
				//==> 추가된부분 : "addUser"  Event 연결
				
				
				$("#GGG").on("click" , function() {
					self.location = "/user/googleLogin"
				});
			}); 
	      
	      
	      /////=========Kakao Login View popup ==========////////////

	       $(function() {
	      	
	    	  $("#Kakao").on("click", function() {
	    		  
	    		  alert("클릭 완료")
	    		  
	    		  
	    		  var  URL = "https://kauth.kakao.com/oauth/authorize?client_id=c3883a306a9faad67b127d7631568b29&redirect_uri=http://192.168.0.16:8080/user/kakaologin&response_type=code"
	    		  popWin
	    		  = window.open(URL,   "popWin",  "left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
							"scrollbars=no,scrolling=no,menubar=no,resizable=no")
	    				
							 opener.window.location = url;
	    		  close();
							
							
	    	  });
				



	    	  
	    	
	       }); 
	
	
	</script>
	   
	
	
</head>
<body>
<div class="container" >
	<div class="d-flex justify-content-center h-100" >
		<div class="card" >
			<div class="card-header" >
				<h3 align="center" style="font-style: italic;">Login</h3>
				<div class="d-flex justify-content-end social_icon">
		
	  
				</div>
			</div>
			<div class="card-body">
				<form>
				
				<br><br>
					
	<div class="snsLoginButton" align="center">		
	
	
	<a href=# id="Kakao">
	   <img src="/common/images/kakao_login_btn_small.png" width="100"/>
	</a>
	

<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=ICC6WpwdQLzHUQn5KfEC&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fuser%2FnaverCallback&state=state">
<img height="50" src="/common/images/NaverSmall.jpg" height="50" width="50" ></a>

	<a herf="#">
	<img src="/common/images/smallGoogle.jpg" height="50" width="50" id="GGG"/>
	</a>
	
	
	
			<div style="font-style: inherit; color: white;">
			
				<br>	<br>	<br>	<br>	<br/>
			
			SNS 로그인만 가능합니다.
			</div>
					
	</div>					
				</form>
			</div>
			<div class="card-footer"  align="center">
				<div class="d-flex justify-content-center links">
				
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>