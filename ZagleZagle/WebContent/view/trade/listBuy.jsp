<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<title>DongneVangne</title>
<head>
<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".list" ).on("click" , function() {
					self.location ="/product/getProduct?prodNo="+$(this).data("prodno");
			});
			
		});	
		
		 $(function() {
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/layout/toolbar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="margin-top:150px">
	
		<div class="page-header text-info">
	       <h3><strong>구매상품목록</strong></h3>
	    </div>
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
          	<th align="center">No</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">거래방법</th>
            <th align="left">상태</th>
            <th align="left"></th>
            <th align="right">배송위치조회</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="buy" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr class="list" data-sellno="${buy.buyNo}">
				<td align="left">${i}</td>
									
				<td align="left">${buy.sellProd.sellName}</td>
								  
				<td align="left">${buy.sellProd.sellPrice}</td>
								  
				<td align="left">
					<c:if test="${buy.sellProd.sellStyle=='10'}">택배거래</c:if>
					<c:if test="${buy.sellProd.sellStyle=='20'}">직거래</c:if>
				</td>
								  
				<td align="left">
						<c:if test="${buy.sellProd.sellState=='20'}">구매요청</c:if>
						<c:if test="${buy.sellProd.sellState=='30'}">취소완료</c:if>
						<c:if test="${buy.sellProd.sellState=='40'}">구매요청승인</c:if>
						
					<c:if test="${buy.sellProd.sellStyle=='10'}">
						<c:if test="${buy.sellProd.sellState=='50'}">결제완료</c:if>
						<c:if test="${buy.sellProd.sellState=='60'}">배송중</c:if>
					</c:if>
					
						<c:if test="${buy.sellProd.sellState=='70'}">완료</c:if>
				</td>
				
				<td align="center">
					<c:if test="${buy.sellProd.sellState=='20'}">구매요청취소</c:if>
					
					<c:if test="${buy.sellProd.sellStyle=='10'}">
						<c:if test="${buy.sellProd.sellState=='40'}">결제하기</c:if>	
						<c:if test="${buy.sellProd.sellState=='60'}">거래종료</c:if>
					</c:if>
					
					<c:if test="${buy.sellProd.sellStyle=='20'}">
						<c:if test="${buy.sellProd.sellState=='50'}">거래종료</c:if>
					</c:if>
				</td>
					
				<td align="right">
				</td>
				
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->

 	<!-- PageNavigation Start... -->
	<jsp:include page="/common/pageNavigation.jsp"/>
	<!-- PageNavigation End... -->

</body>
</html>