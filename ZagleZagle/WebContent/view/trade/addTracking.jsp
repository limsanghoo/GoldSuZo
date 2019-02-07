<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DongneVangne</title>
<style>

</style>

	<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet">

	<!-- Font Awesome for awesome icons. You can redefine icons used in a plugin configuration -->
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	
	<!-- CSS -->
	<link rel="stylesheet" href="/common/js/medium-editor/dist/css/medium-editor.min.css">
	<link rel="stylesheet" href="/common/js/medium-editor/dist/css/themes/beagle.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
<script type="text/javascript">
		
$(function() {

	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)

	$("button:contains('취소')").on("click", function() {
		self.location="/trade/listSell";
		});
	
	$("button:contains('확인')").on("click", function() {
		$("form").attr("method" , "POST").attr("action" , "/trade/addTracking").submit();
		});
	

});	

	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/layout/toolbar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<input type="hidden" name="buyNo" value="${buy.buyNo}"/>
	<input type="hidden" name="sellNo" value="${buy.sellProd.sellNo}"/>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="margin-top:150px">

	    <div class="col-12">

	<div class="row">
	<div class="col-lg-7">
	<H2><strong>배송하기</strong></H2>
	</div>
	<div class="col-lg-5 text-right">
		<button type="button" class="btn btn-b" data-toggle="modal" data-target="#myModal">배송완료</button>
		<button type="button" class="btn btn-a">취소</button>
	</div>
</div>
	    <div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
	    <br/>
		
		<div class="row">
			<div class="col-lg-12">
			<H3>&nbsp;상품 정보</H3>
			</div>
		</div>
		
		<br/>
		
		<div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>상품명</strong></div>
			<div class="col-xs-4 col-md-5">${buy.sellProd.sellName}</div>

	  		<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>작성일</strong></div>
			<div class="col-xs-4 col-md-4">${buy.sellProd.sellDate}</div>
		</div>
		
		<br/>

	    <div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>판매자</strong></div>
			<div class="col-xs-4 col-md-5">${buy.sellProd.seller.userNickname}</div>
			
			<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>전화번호</strong></div>
			<div class="col-xs-4 col-md-4">${buy.sellProd.sellPhone}</div>
		</div>
		
		<br/>

		<div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>가격</strong></div>
			<div class="col-xs-4 col-md-5">${buy.sellProd.sellPrice}원</div>
			
			<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>판매방식</strong></div>
			<div class="col-xs-4 col-md-4">
				<c:if test="${buy.sellProd.sellStyle=='10'}">택배거래</c:if>
				<c:if test="${buy.sellProd.sellStyle=='20'}">직거래</c:if>
			</div>
		</div>
		
		<br/>
		
		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
		
		<br/>
		
		<div class="row">
			<div class="col-lg-12">
			<H3>&nbsp;배송 정보</H3>
			</div>
		</div>

	    <br/>
	    
	    <div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>구매자</strong></div>
			<div class="col-xs-4 col-md-5">${buy.buyer.userName}</div>
			
			<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>전화번호</strong></div>
			<div class="col-xs-4 col-md-4">${buy.buyPhone}</div>
		</div>
		
		<br/>
	    
		<div class="row">
			<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>주소</strong></div>
			<div class="col-xs-4 col-md-11">${buy.buyAddress}</div>
		</div>
		
		<br/>
		
		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>

</div>
</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="display: inline;">
	        <h4 class="modal-title" id="myModalLabel">운송장 등록</h4>
	      </div>
	      <div class="modal-body">
	       운송장 번호를 등록하시면 배송완료 처리 됩니다.<br/><br/>
	       <form>
	       	<div>
	       	<div class="col-md-4">택배사&emsp;&emsp;&emsp;:&nbsp;</div>
	       	<div class="col-md-8" >
	       		<select name="companyCode" class="ct_input_g">
					<option value='' selected>택배사</option>
					<c:set var="i" value="0"/>
					<c:forEach var="company" items="${company}">
					<c:set var="i" value="${i+1}"/>
					<option value='${company.companyCode}'>${company.companyName}</option>
					</c:forEach>
				</select>
				</div>
				<br/><br/>
				<div class="col-md-4">운송장번호&emsp;&nbsp;:&nbsp;</div>
				<div class="col-md-8">
				<input type="text" class="form-control" id="trackingNo" name="trackingNo" style="height: 25px;">
				</div>
				</div>
				<input type="hidden" id="buyNo" value="${buy.buyNo}" name="buyNo"/>
				<input type="hidden" id="sellNo" value="${buy.sellProd.sellNo}" name="sellNo"/>
	       </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-b">확인</button>
	        <button type="button" class="btn btn-a" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

</body>

</html>
