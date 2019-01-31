<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
//============= 회원정보수정 Event  처리 =============	
	
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 $("#updateUser").on("click" , function() {
			self.location = "/user/updateUser?userNo=${user.userNo}"
		});
});


</script>



</head>
<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">회원정보조회</h3>
	       <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>프로필</strong></div>
			<div class="col-xs-8 col-md-4">${user.profile}</div>
		</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>닉네임</strong></div>
			<div class="col-xs-8 col-md-4">${user.userNickname}</div>
		</div>
		
			<hr/>
			
				
	
			
			<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>생년월일</strong></div>
			<div class="col-xs-8 col-md-4">${user.userBirth}</div>
		</div>
		
			<hr/>
			
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>활동점수</strong></div>
			<div class="col-xs-8 col-md-4">${user.totalActiveScore}</div>
		</div>
		
			<hr/>
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>등급</strong></div>
			<div class="col-xs-8 col-md-4">${user.grade}</div>
		</div>
		
			<hr/>
			
			<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>계좌</strong></div>
			<div class="col-xs-8 col-md-4">${user.account}</div>
		</div>
		
			<hr/>
			
					<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가입날짜</strong></div>
			<div class="col-xs-8 col-md-4">${user.regDate}</div>
		</div>
		
			<hr/>
			
			<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" id="confirm" class="btn btn-primary">확인</button>
	  		</div>
		</div>
		
		
			
				
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" id="updateUser" class="btn btn-primary">회원정보수정</button>
	  		</div>
		</div>
		
		<br/>
			
	 	</div>
</body>
</html>