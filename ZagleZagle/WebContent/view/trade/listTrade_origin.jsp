<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listTrade</title>
        
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >


<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<script src="/javascript/bootstrap-dropdownhover.min.js"></script>        
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  
<style>

@import url('https://fonts.googleapis.com/css?family=Poppins');


#nav{
 color: white; 
}

form{
	 	padding-top : 150px;
	 	padding-left:150px;
        padding-right:150px;
       /*  background-color:#f2f2f2; */
        background-image: url(/common/css/html5up-helios/images/pic03.jpg);
        background-size: cover;
	}

body {
   	margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
	background: #333;
    
}
.containerList {
	padding-top : 20px; /* 리스트 맨 위 */
    width: 1200px;
    margin: auto;
    columns: 4;
    column-gap: 40px;
}
.containerList .box {
    width: 100%;
    margin: 0 0 20px;
    padding: 10px;
    background: #ffffff;
    overflow: hidden;
    break-inside: avoid;
}

.containerList .box img {
    max-width: 100%;
    background-size: cover;
}
.containerList .box h2 {
    margin: 10px 0 0;
    padding: 0;
    font-size: 20px;
}
.containerList .box p {
    margin: 0;
    padding: 0 0 10px;
    font-size: 16px;
}
@media (max-width: 1200px) {
    .containerList {
        columns: 3;
        width: calc(100% - 40px);
        box-sizing: border-box;
        padding: 20px 20px 20px 0;
    }
}
@media (max-width: 768px) {
    .containerList {
        columns: 2;
    }
}
@media (max-width: 480px) {
    .containerList {
        columns: 1;
    }
}

#goAddSell{
    	position: static;
    	float:right;
}

#searchKeyword{
    	position: absolute;
    	left:40%;
    	width:300px;
}

.disabled{
		pointer-events:none;
}

#selectMenu{
		padding-top : 100px;
		padding-left: 300px;
		padding-right: 300px;
}

#selectTown{
	padding-top : 40px;
	text-align: center;
}


</style>
<script type="text/javascript">
$(function(){
	
	$("input[value='수정']").bind("click",function(){
		var boardNo=$(this).data('update');
		self.location="/board/updateBoard?boardNo="+boardNo;
	})

	$("input[value='판매물품 등록']").bind("click",function(){
		self.location="/trade/addSell";
	})
	
	$("input[value='지도로 보기']").bind("click",function(){
		
		self.location="/board/listMap";
	})
	
});


//검색 엔터
function enter() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
        	$("form").attr("method" , "POST").attr("action" , "/board/listBoard?view=${param.view}").submit();
        }
}
//검색 엔터 끝 
</script>

</head>

<body>

<jsp:include page="/view/layout/toolbar.jsp"/>

<form name="listTrade">

<div id="selectMenu">

<!-- 검색 -->
<span id="searchKeyword">
<input type="text" name="searchKeyword" value="${! empty searchBoard.searchKeyword ? searchBoard.searchKeyword : ''}" onkeypress="enter()"; placeholder=""/>
</span>

<!-- 게시물 등록 -->
<c:if test="${user.userNo!=null}">
<input type="button" value="판매물품 등록" id="goAddSell"/>
</c:if>
</div>

<br/>

 <div class="containerList">
 <c:forEach var="sell" items="${tradeList}">
	<c:set var="i" value="${ i+1 }" />
		
<!-- 썸네일 박스 시작 -->	
	<div class="box" data-toggle="modal" data-target="#${sell.sellNo}modal1">
		
	<p>
	<img src="/common/images/profile/${sell.seller.profile}" style="height: 60px; width:60px; border-radius: 70px;" align="middle"/>
		${sell.seller.userNickname}
	</p>
	

<c:if test="${sell.sellPhoto1 !=null}">
	<div><img src="${sell.sellPhoto1}" style="width:100%;" align="middle"/></div>
</c:if>	

	<p align="center" style="font-size: small">${sell.sellName}</p>
	<p align="center">${sell.sellText}</p>
	<p align="center" style="text-align: left; font-size: small">${sell.sellPrice}</p>
	

</div>
<!-- 썸네일 박스 끝 -->


<!-- 모달1 시작 -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="${sell.sellNo}modal1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
	<!-- 모달1 헤더 시작 -->
      <div class="modal-header">
      <div class="row">
      
      	<div class="col-md-11 col-md-offset-1">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        
        <h4 class="modal-title" id="gridSystemModalLabel">
        <div class="col-md-4">
        <img src="/common/images/profile/${sell.seller.profile}" style="height: 60px; width:60px;" align="middle"/>
		${sell.seller.userNickname}
		</div>
		
		<!-- 내 글만 수정, 삭제 -->
		<c:if test="${user.userNo==sell.seller.userNo}">
		<div class="col-md-4 col-md-offset-4">
		<input type="button" value="수정" data-update="${sell.sellNo}"/>
        <div class="btn btn-primary" data-toggle="modal" data-target="#${sell.sellNo}modal2">삭제</div>
        </div>
        </c:if>
        
        </h4>
        </div>
      </div>
     <!-- 모달1 헤더 끝 -->
      
     <!-- 모달1 바디 시작 -->
      <div class="modal-body" style="text-align: center">  

		<div>
			<c:if test="${sell.sellPhoto1 !=null}">
			<div><img src="${sell.sellPhoto1}" style="width: 500px"/></div>
			<br/>
			</c:if>

			<c:if test="${sell.sellPhoto2 !=null}">
			<div><img src="${sell.sellPhoto2}" style="width: 500px"/></div>
			<br/>
			</c:if>
	
			<c:if test="${sell.sellPhoto3 !=null}">
			<div><img src="${sell.sellPhoto3}" style="width: 500px"/></div>
			<br/>
			</c:if>
		</div>

		<p>
			${sell.sellText}
		</p>
     
       
      </div>
      <!-- 모달1 바디 끝 -->
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 모달1 끝 -->

<!-- 모달2 시작 -->
<div class="modal"  aria-hidden="true" style="display: none; z-index: 1060;" id="${sell.sellNo}modal2">
    	<div class="modal-dialog modal-md">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title"></h4>
            </div><div class="container"></div>
            <div class="modal-body">
             	삭제하시겠습니까?
            </div>
            <div class="modal-footer">
              <a href="/board/deleteBoard?boardNo=${sell.sellNo}" class="btn btn-primary">삭제</a>
            </div>
          </div>
        </div>
</div>
<!-- 모달2 끝 -->


</c:forEach>      
</div><!-- /container -->
</form>
    </body>
</html>


