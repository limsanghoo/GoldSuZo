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
		<title>Zagle Zagle</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/common/css/assets/css/main.css" />
		<link rel="stylesheet" href="/common/css/assets/css/noscript.css" />
		
	</head>
	<style>
	body { background: url("https://images.wallpaperscraft.com/image/window_sunset_trees_132266_3840x2160.jpg") no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;}
	
	</style>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<section id="main">
						<header>
							<span class="avatar"><img src="https://us.123rf.com/450wm/uasumy/uasumy1507/uasumy150700013/42874535-%ED%8E%B8%EC%A7%80-z-%EB%A1%9C%EA%B3%A0-%EB%AA%A8%ED%98%95-%EB%AA%A8%ED%98%95-%EB%AA%A8%EB%85%B8%EA%B7%B8%EB%9E%A8-%EA%B2%B9%EC%B9%98%EB%8A%94-%EC%8A%A4%ED%83%80%EC%9D%BC-%EB%AA%85%ED%95%A8-.jpg?ver=6" alt="" style="width : 200px; height : 200px;"/></span>
							<h1>ZAGLE ZAGLE</h1>
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
								<a href="#" id="mod"><img src="/common/images/icons8-lock-50 (1).png" style="width: 60px;height:60px;"/><br/>-login-</a>
								<br/><br/><a href="/board/listBoard">온 동네 소식보기</a>
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