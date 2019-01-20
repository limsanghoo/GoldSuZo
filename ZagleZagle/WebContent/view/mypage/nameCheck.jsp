<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
	
	<script type="text/javascript">
	//=============  "중복확인"  Event 처리 =============
	
	$(function() {
			
			$("#account").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button.btn.btn-info").on("click" , function() {
				
				// Form 유효성 검증
				if( $("#account").val() != null && $("#account").val().length >0) {
					$("form").attr("method" , "POST");
				    $("form").attr("action" , "/mypage/getBankCode");
				    $("form").submit();
				}else {
					alert('계좌번호를 입력하세요');
				}
				$("#account").focus();
			});
		});
	
	

	//=============  "사용"  Event 처리 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-success").on("click" , function() {
			
			if(opener) {
				opener.$("input[name='account']").val("${account}");
				
			}
			
			window.close();
		});
	});
		
		
		
	//=============   "닫기"  Event  처리 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button.btn.btn-primary").on("click" , function() {
				window.close();
			});
		});		
	</script>

</head>
<body>

<div class="container">
		
		
		<br/><br/>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-inline">
		
		 <div class="form-group">
		    <label for="account">계좌번호</label>
		      <input type="text" class="form-control" name="account" id="account"  placeholder="계좌번호"
		    																		value="${ ! empty result && result ? account : '' }" >
		    																		
		      </div>
		       <button type="button" class="btn btn-info">계좌실명확인</button>				
		       
		       
		      <c:if test="${ ! empty result }">
		  	<c:if test="${ result =='true' }">
		  		<button type="button" class="btn btn-success">사 용</button>
		  	</c:if>
		  </c:if>														
		  
		  <button type="button" class="btn btn-primary">닫 기</button>
		  
		    <c:if test="${ empty result }">
		  	<span class="text-info glyphicon glyphicon-ok">실명여부확인</span>
		  </c:if>
		  
		  <c:if test="${ ! empty result }">
		  	<c:if test="${ result =='true' }">
				<span class="text-success glyphicon glyphicon-ok">인증성공 &nbsp;</span>
			</c:if>
			<c:if test="${ result=='false' }">
		 		<span class="text-danger glyphicon glyphicon-remove">인증실패</span>
			</c:if>
		  </c:if>
		
		   
		</form>
		<!-- form Start /////////////////////////////////////-->
	
	
	
	
	
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
		  
		  



</body>
</html>