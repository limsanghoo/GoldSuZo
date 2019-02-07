<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<!--
	Identity by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->




<html>
	<head>
		<title>Dongne Vangne</title>
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/common/css/assets/css/main.css" />
		<link rel="stylesheet" href="/common/css/assets/css/noscript.css" />
		<link href="/css/animate.min.css" rel="stylesheet">
   		<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<script>
	

    	$( function() {
		
			
			
			$("#GGG").on("click" , function() {
				self.location = "/user/googleLogin"
			});
		}); 
    	
    	
    //////////==============Naver Login View popup================/////////
    
    
    	$(function() {
    		
    		
    		
    		$("#naverLogin").on("click", function() {
    			
    			alert("네이버 로긴 클릭")
        		
    			
    			
    			var URL ="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=ICC6WpwdQLzHUQn5KfEC&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fuser%2FnaverCallback&state=state"
    					
    			popWin
    			= window.open(URL, "popWin", "left=300, top=200, width=780, height=500, marginwidth=0, marginheight=0,"+"scrollbars=no,scrolling=no,menubar=no,resizable=no")
    			
    			opener.window.location = url;
    			
    			close();
    			
    		});
    	});
    
    
    
    	   /////=========Kakao Login View popup ==========////////////

	       $(function() {
	      	
	    	  $("#Kakao").on("click", function() {
	    		  
	    		  alert("클릭 완료")
	    		  
	    		  
	    		  var  URL = "https://kauth.kakao.com/oauth/authorize?client_id=c3883a306a9faad67b127d7631568b29&redirect_uri=http://192.168.0.18:8080/user/kakaologin&response_type=code"
	    		  popWin
	    		  = window.open(URL,   "popWin",  "left=300,top=200,width=780,height=500,marginwidth=0,marginheight=0,"+
							"scrollbars=no,scrolling=no,menubar=no,resizable=no")
	    				
							 opener.window.location = url;
	    		  close();
							
							
	    	  });
			
	       }); 
	
	</script>
	
	
	
	</head>
	
	
	<style>
	
	body,html { background: url("https://i.imgur.com/E5lL08V.jpg") no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;}
	

	div.modal-body,.modal-content{
		background-color: rgba(0,0,0,0.1);
	}
	
	</style>
	

	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">
				
				<!-- Main -->
					<section id="main">
						<header>
							<span class="avatar"><img src="/common/images/logo2.png" alt="" style="width : 200px; height : 200px;"/></span>
							
							<p>by  GoldSuZo</p>
						</header>
						<!--
						<hr />
						<h2>Extra Stuff!</h2>
						<form method="post" action="#">
							<div class="fields">
								<div class="field">
									<input type="text" name="name" id="name" placeholder="Name" />
								</div>
								<div class="field">
									<input type="email" name="email" id="email" placeholder="Email" />
								</div>
								<div class="field">
									<select name="department" id="department">
										<option value="">Department</option>
										<option value="sales">Sales</option>
										<option value="tech">Tech Support</option>
										<option value="null">/dev/null</option>
									</select>
								</div>
								<div class="field">
									<textarea name="message" id="message" placeholder="Message" rows="4"></textarea>
								</div>
								<div class="field">
									<input type="checkbox" id="human" name="human" /><label for="human">I'm a human</label>
								</div>
								<div class="field">
									<label>But are you a robot?</label>
									<input type="radio" id="robot_yes" name="robot" /><label for="robot_yes">Yes</label>
									<input type="radio" id="robot_no" name="robot" /><label for="robot_no">No</label>
								</div>
							</div>
							<ul class="actions special">
								<li><a href="#" class="button">Get Started</a></li>
							</ul>
						</form>
						<hr />
						-->
						<br/><br/>
						<footer>
								<button class="button primary" id="login" data-toggle="modal" data-target="#modal1" >-LOGIN-</button>
								<br/><br/><a href="/board/listBoard?view=all">온 동네 소식보기</a>
							</ul>
						</footer>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<ul class="copyright">
							<li>&copy; Jane Doe</li><li>Design: <a href="/user/adminLogin">HTML5 UP</a></li>
						</ul>
					</footer>
					
				</div>	
				
			<!-- 로그인 창 모달 시작 -->
			<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="modal1">
  			<div class="modal-dialog" role="document">
    		<div class="modal-content">
  
   
   			<!-- 모달 Body -->	  
  			<div class="modal-body" style="text-align: center">
		
				
				<br><br>
					
			<a href=# id="Kakao">
	   <img src="/common/images/KakaoTalk.png" height="50" width="50"/>
		</a>
		
		
		<a href=# id="naverLogin">
		<img src="/common/images/NaverSmall.jpg" height="50" width="50">
		</a>
		
	
	
		<a href="#">
		<img src="/common/images/smallGoogle.jpg" height="50" width="50" id="GGG"/>
		</a>
		
	  <div>
				
		<br>	<br>	<br>	<br>	<br/>
				
			<strong style="color: white; font-style: oblique;">SNS 로그인만 가능합니다.</strong>
		</div>
	  				
  				
  	</div>

  					
  					
  	</div>
  </div>			
	</div>
	</div>
	</div>
	<!-- ------------------------모달 끝--------------------------------- -->	
						
			

		<!-- Scripts -->
			<script>
			
			function listener(e){
				
				if ('addEventListener' in window) {
					window.addEventListener('load', function() { document.body.className = document.body.className.replace(/\bis-preload\b/, ''); });
					document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
				}
			}
				
			</script>


	</body>
</html>