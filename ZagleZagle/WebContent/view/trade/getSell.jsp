<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
.btn {
  transition: .5s ease;
}

.btn.btn-c {
  border-radius: 0;
  padding: .5rem 2rem;
  letter-spacing: .05rem;
}

.btn.btn-c {
  background-color: #dc3545;
  color: #000000;
}

.btn.btn-c:hover {
  background-color: #000000;
  color: #ffffff;
}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  

<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('구매 요청')" ).on("click" , function() {
				 self.location="/trade/addBuy?sellNo="+'${sell.sellNo}';
				});
			
			 $("button:contains('이전')").on("click", function() {
				 self.location="/trade/listTrade";
				});
			 
			 $( "button:contains('수정')" ).on("click" , function() {
				 self.location="/trade/updateSell?sellNo="+'${sell.sellNo}';
				});
			
			 $("button:contains('삭제')").on("click", function() {
				 self.location="/trade/deleteSell?sellNo="+'${sell.sellNo}&sellState=00';
				});
		});
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/layout/toolbar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="margin-top:150px">
	    <div class="col-12">
	    
	    <div class="row">
	<div class="col-lg-7">
	<H2><strong>상세정보</strong></H2>
	</div>
	<c:if test="${user.userNo == sell.seller.userNo}">
	<div class="col-lg-5 text-right">
	<c:if test="${sell.sellState==10}">
		<button type="button" class="btn btn-b">수정</button>
		<button type="button" class="btn btn-b">삭제</button>
	</c:if>
	<c:if test="${sell.sellState!=10}">
	  		<button type="button" class="btn btn-c">판매완료</button>
	</c:if>
		<button type="button" class="btn btn-a">이전</button>
	</div>
	</c:if>
	<c:if test="${user != null && user.userNo != sell.seller.userNo}">
	  		<div class="col-lg-5 text-right">
	  		<c:if test="${sell.sellState==10}">
	  			<button type="button" class="btn btn-b">구매 요청</button>
	  		</c:if>
	  		<c:if test="${sell.sellState!=10}">
	  			<button type="button" class="btn btn-c">판매완료</button>
	  		</c:if>
	  			<button type="button" class="btn btn-a">이전</button>
	  		</div>
		</c:if>

</div>
	    		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
	    <br/>
	    
		<div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>상품명</strong></div>
			<div class="col-xs-4 col-md-5">${sell.sellName}</div>

	  		<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>작성일</strong></div>
			<div class="col-xs-4 col-md-4">${sell.sellDate}</div>
		</div>
		
		<br/>

	    <div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>판매자</strong></div>
			<div class="col-xs-4 col-md-5">${sell.seller.userNickname}</div>
			
			<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>전화번호</strong></div>
			<div class="col-xs-4 col-md-4">${sell.sellPhone}</div>
		</div>
		
		<br/>

		<div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>가격</strong></div>
			<div class="col-xs-4 col-md-5">${sell.sellPrice}원</div>
			
			<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>판매방식</strong></div>
			<div class="col-xs-4 col-md-4">
				<c:if test="${sell.sellStyle=='10'}">택배거래</c:if>
				<c:if test="${sell.sellStyle=='20'}">직거래</c:if>
			</div>
		</div>
		
		<br/>
		
		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
		
		<br/>
	
	  	<div class="row">
	  		<div class="col-xs-4 col-md-4">
	    	<img src="${board.photo1}"/>사진1
			</div>
			<div class="col-xs-4 col-md-4">
	    	<img src="${board.photo2}" />사진2
			</div>
			<div class="col-xs-4 col-md-4">
	    	<img src="${board.photo3}"/>사진3
			</div>
		</div>
		
		<br/>
		
		<div class="row">
			<div class="col-xs-12 col-md-12">${sell.sellText}</div>
		</div>
		<br/>

		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
		
</div>
</div>


</body>

</html>
