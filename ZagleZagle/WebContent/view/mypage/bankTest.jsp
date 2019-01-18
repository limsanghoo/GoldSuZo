<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


	<!--  Bootstrap, JQuery CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script>
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-primary" ).on("click" , function() {
			$("form").attr("method" , "POST").attr("action" , "/mypage/confirmName").submit();
		});
	});	
	
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#test").on("click" , function() {
			$("form").attr("method" , "POST").attr("action" , "/mypage/getBankCode").submit();
		});
	});	
	
	
	
	</script>


</head>
<body>



<a href="https://testapi.open-platform.or.kr/oauth/2.0/authorize2/">토큰 얻기 확인</a>

<form>

  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button>
			  <a class="btn btn-primary btn" href="#" role="button" id="test">취&nbsp;소</a>
		    </div>
		  </div>
		</form>

<a href="https://testapi.open-platform.or.kr/oauth/2.0/authorize2?response_type=code&client_id=l7xx60c67b59db9e4130aad0b4d113a9e890&redirect_uri=http://localhost:8080/mypage/bankCallback&scope=login inquiry&client_info=ZagleZagle&auth_type=1">토큰 겟방식 화면에서</a>
<a href="https://testapi.open-platform.or.kr/oauth/2.0/token?client_id=l7xx60c67b59db9e4130aad0b4d113a9e890&client_secret=1efe286e56a94d85a44d7c0d7d19a144&redirect_uri=http://localhost:8080/mypage/bankCallback">개짜증남</a>


</body>



</html>