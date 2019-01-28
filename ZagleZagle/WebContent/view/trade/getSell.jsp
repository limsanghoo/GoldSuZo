<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getsell</title>
<style>
	  .container {
            padding-top : 150px;
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
			 $( "button:contains('구매')" ).on("click" , function() {
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
	<div class="container">
	
	<div class="row">
	<div class="col-lg-8">
	<H2>상세정보</H2>
	</div>
	<c:if test="${user.userNo == sell.seller.userNo}">
	<div class="col-lg-4 text-center">
		<button type="button" class="btn-inverse">수정</button>
		<button type="button" class="btn-inverse">삭제</button>
		<button type="button" class="btn-inverse">이전</button>
	</div>
	</c:if>
	<c:if test="${user != null && user.userNo != sell.seller.userNo}">
	  		<div class="col-lg-4 text-center">
	  			<button type="button" class="btn-inverse">구매</button>
	  			<button type="button" class="btn-inverse">이전</button>
	  		</div>
		</c:if>
</div>
	    <div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: Gray;"></div>
	    <br/>
		
	    <div class="col-12">
	    
		<div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: darkgray;"><strong>상품명</strong></div>
			<div class="col-xs-4 col-md-5">${sell.sellName}</div>

	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: darkgray;"><strong>작성일</strong></div>
			<div class="col-xs-4 col-md-5">${sell.sellDate}</div>
		</div>
		
		<br/>

	    <div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: darkgray;"><strong>판매자</strong></div>
			<div class="col-xs-4 col-md-5">
				<img src="/common/images/profile/${sell.seller.profile}" style="height: 40px; width:40px;  border-radius: 70px; display: inline; vertical-align: middle"/> ${sell.seller.userNickname}
			</div>
			
			<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: darkgray;"><strong>전화번호</strong></div>
			<div class="col-xs-4 col-md-5">${sell.sellPhone}</div>
		</div>
		
		<br/>

		<div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: darkgray;"><strong>가격</strong></div>
			<div class="col-xs-4 col-md-5">${sell.sellPrice}원</div>
			
			<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: darkgray;"><strong>판매방식</strong></div>
			<div class="col-xs-4 col-md-5">
				<c:if test="${sell.sellStyle=='10'}">택배거래</c:if>
				<c:if test="${sell.sellStyle=='20'}">직거래</c:if>
			</div>
		</div>
		
		<br/>
		
		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: Gray;"></div>
		
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

		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: Gray;"></div>
		
</div>
</div>


</body>

</html>
