<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

 	
 	<!--  sweetAlert -->  	
   	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   	
   	
   
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	

	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>


//============= 회원정보수정 Event  처리 =============	
	
	

	
	
	
	
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	
	
		
	
	
	 $("#updateUser").on("click" , function() {
		 	
			
			swal({
				  title: "회원정보를 수정하시겠습니까??",
				  text: "수정을 원하시면 OK 버튼을 눌러주세요.",
				
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				  
				  	self.location = "/user/updateUser?userNo=${user.userNo}"
				 
				  } else {
				    swal("수정을 취소하셨습니다.");
				  }
				});
			
			
		 
		 
		

		
		});
});




</script>


<style>

.page-header {

padding-top: 120px;

}
.container {

}

.row{


}


   img{
         height: 70px;
         width: 70px;
         border:1.5px solid #f5f6fa;
         border-radius: 50%;
         margin : auto;
      }


</style>


</head>
<body>
	
	<jsp:include page="/view/layout/toolbar.jsp"/>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="width: 50%;" align="center">
	
	<div class="page-header">
	       <h3 class=" text" style="color: #2eca6a">${user.userName} 님 회원정보</h3> 
	       <br>
	       <h5 class="text-muted">${user.userName}님의 등급은 
	       
			<c:if test="${user.grade=='3'}">
	       
	       <strong class="text" style="color: #ffd700">금수저</strong> 입니다.
	       
			</c:if>
			
			<c:if test="${user.grade=='2'}">
	       
	       <strong class="text" style="color: #c0c0c0">은수저</strong> 입니다.
	       
	       	   등업까지 ${299-user.totalActiveScore} 점 남았습니다.
	       
			</c:if>
	       	
	       	<c:if test="${user.grade=='1'}">
	       
	       <strong class="text" style="color: #9cc6600">동수저</strong> 입니다.
	       
	        등업까지 ${199-user.totalActiveScore} 점 남았습니다.
	       
	       
			</c:if>
	       	
	       	<c:if test="${user.grade=='0'}">
	       
	       <strong class="text" style="color: #854200">흙수저</strong> 입니다.
	       
	       	
	       
	       등업까지 ${99-user.totalActiveScore} 점 남았습니다.
	       
			</c:if>
	       
	       
	   	</h5>
	    </div>
		
		
	
		<div class="row">
	  		<div class="col-xs-4 col-md-5" align="right"><strong>프&nbsp;&nbsp;로&nbsp;&nbsp;필</strong></div>
	  		<div class="col-md-1"></div>
	  		<div class="col-xs-8 col-md-6" align="left">
			<img src="/common/images/profile/${user.profile}"/>
			</div>
		</div>


		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-5" align="right"><strong>닉&nbsp;&nbsp;네&nbsp;&nbsp;임</strong></div>
	  		<div class="col-md-1"></div>
			<div class="col-xs-8 col-md-6" align="left">${user.userNickname}</div>
		</div>
		
			<hr/>
			
				
	
			
		<div class="row">
	  		<div class="col-xs-4 col-md-5" align="right"><strong>생년월일</strong></div>
	  		<div class="col-md-1"></div>
			<div class="col-xs-8 col-md-6" align="left">${user.userBirth}</div>
		</div>
		
			<hr/>
			
		<div class="row">
	  		<div class="col-xs-4 col-md-5" align="right"><strong>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</strong></div>
	  		<div class="col-md-1"></div>
			<div class="col-xs-8 col-md-6" align="left">${user.userAddr}</div>
		</div>
		
			<hr/>		
			
			
		<div class="row">
	  		<div class="col-xs-4 col-md-5" align="right"><strong>활동점수</strong></div>
	  		<div class="col-md-1"></div>
			<div class="col-xs-8 col-md-6" align="left">${user.totalActiveScore}</div>
		</div>
		
			<hr/>
			

			
			<div class="row">
	  		<div class="col-xs-4 col-md-5" align="right"><strong>계&emsp;&emsp;좌</strong></div>
	  		<div class="col-md-1"></div>
			<div class="col-xs-8 col-md-6" align="left">
			
			<c:if test="${user.account == null}" >
			등록한 계좌가 없습니다.
			</c:if>
			
			${user.account}
			</div>
			
			
		</div>
		
			<hr/>
			
					<div class="row">
	  		<div class="col-xs-4 col-md-5" align="right"><strong>가입날짜</strong></div>
	  		<div class="col-md-1"></div>
			<div class="col-xs-8 col-md-6" align="left">${user.regDate}</div>
		</div>
		
			<hr/>
			
		
			
				
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" id="updateUser" class="btn btn-b">회원정보수정</button>
	  		</div>
		</div>
		
		</div>
		
		<br/>
		
</body>
</html>