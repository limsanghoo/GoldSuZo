<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta name="description" content="Loading Effects for Grid Items with CSS Animations" />
<meta name="keywords" content="css animation, loading effect, google plus, grid items, masonry" />
<meta name="author" content="Codrops" />
		
<title>listTrade</title>

<link rel="shortcut icon" href="../favicon.ico"> 
<link rel="stylesheet" type="text/css" href="/common/css/GridLoadingEffects/css/default.css" />
<link rel="stylesheet" type="text/css" href="/common/css/GridLoadingEffects/css/component.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="/common/css/GridLoadingEffects/js/modernizr.custom.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  

<style>
@import url('https://fonts.googleapis.com/css?family=Poppins');

form{
		padding-top:100px;
	 	padding-left:150px;
        padding-right:150px;
       background-color:#f2f2f2;
/*         background-image: url(/common/css/html5up-helios/images/pic03.jpg); */
        background-size: cover;
	}

body {
   	margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
	background: #333;
}

.grid{
   margin-bottom: 0px;
}

.containerList .box {
    width: 100%;
    margin: 0 0 20px;
    padding: 10px;
    background: #ffffff;
    overflow: hidden;
    break-inside: avoid;
    border-radius: 15px;
}
.containerList .box img {
    max-width: 100%;
    background-size: cover;
}


#goAddSell{
    	position: static;
    	float:right;
}

.disabled{
		pointer-events:none;
}

#selectMenu{
		padding-top:50px;
		padding-left:150px;
        padding-right:150px;
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

	$(".box").bind("click",function(){
		var sellNo=$(this).data('sellno');
		self.location="/trade/getSell?sellNo="+sellNo;
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
<!-- 게시물 등록 -->
<c:if test="${user.userNo!=null}">
<input type="button" class="btn btn-b" value="판매물품 등록" id="goAddSell"/>
</c:if>
<br/>
<br/>

<!-- 검색 -->
<span id="searchKeyword" style="text-align: center; display: inherit;">
<input type="text" name="searchKeyword" value="${! empty searchBoard.searchKeyword ? searchBoard.searchKeyword : ''}" onkeypress="enter()" placeholder=""/>
</span>
<br/>
<label style="text-align: center; display: inherit;">
<input type="checkbox">판매중인 상품만 보기
</label>

</div>

 <div class="containerList">
 
 <ul class="grid effect-2" id="grid">
 
 <c:forEach var="sell" items="${tradeList}">
	<c:set var="i" value="${ i+1 }" />
		<c:if test="${sell.sellState !=0}">
<!-- 썸네일 박스 시작 -->
	
<li>
<!-- 	<div class="box" data-toggle="modal" data-target="#${sell.sellNo}modal1"> -->
<div class="box" data-sellno="${sell.sellNo}">
		
	
	<p>
	<img src="/common/images/profile/${sell.seller.profile}" style="height: 60px; width:60px; border-radius: 70px; display: inline; vertical-align: middle"/>
	<span style="font-weight: bold; display: inline;">&nbsp;${sell.seller.userNickname}</span>
	<span style="float:right">
	<c:if test="${sell.sellStyle == 10}">
	<img src="/common/images/trade/transit-filled.png" style="height: 80%; display: inline; vertical-align: middle; float:right"/>
	</c:if>
	<c:if test="${sell.sellStyle == 20}">
	<img src="/common/images/trade/giveaway-filled.png" style="height: 80%; display: inline; vertical-align:text-top; float:right;"/>
	</c:if>
	</span>
	</p>

	<div><img src="${sell.sellPhoto1}" style="width:100%;" align="middle"/></div>

	<p align="center" style="font-size: small">${sell.sellName}</p>
	<p align="center">${sell.sellText}</p>
	<p align="center" style="text-align: left; font-size: small">${sell.sellPrice}</p>
	

</div>
</li>

</c:if>
</c:forEach>     
</ul> 

<script src="/common/css/GridLoadingEffects/js/masonry.pkgd.min.js"></script>
		<script src="/common/css/GridLoadingEffects/js/imagesloaded.js"></script>
		<script src="/common/css/GridLoadingEffects/js/classie.js"></script>
		<script src="/common/css/GridLoadingEffects/js/AnimOnScroll.js"></script>
		<script>
			new AnimOnScroll( document.getElementById( 'grid' ), {
				minDuration : 0.4,
				maxDuration : 0.7,
				viewportFactor : 0.2,
				horizontalOrder: true
			} );
		</script>
</div><!-- /container -->
</form>
</body>
</html>


