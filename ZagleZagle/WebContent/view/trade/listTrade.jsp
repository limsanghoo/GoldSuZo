<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta name="description" content="Loading Effects for Grid Items with CSS Animations" />
<meta name="keywords" content="css animation, loading effect, google plus, grid items, masonry" />
<meta name="author" content="Codrops" />
		
<title>중고장터</title>

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
        background-size: cover;
        height: 100%;

/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#eaf2ec+0,dceadf+26,d1bafc+69,947dc0+85,220b4f+100 */
background: #eaf2ec; /* Old browsers */
background: -moz-linear-gradient(top, #eaf2ec 0%, #dceadf 26%, #d1bafc 69%, #947dc0 85%, #220b4f 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #eaf2ec 0%,#dceadf 26%,#d1bafc 69%,#947dc0 85%,#220b4f 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #eaf2ec 0%,#dceadf 26%,#d1bafc 69%,#947dc0 85%,#220b4f 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eaf2ec', endColorstr='#220b4f',GradientType=0 ); /* IE6-9 */
	}

body {
   	margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
	background: #333;
	overflow-x: hidden; 
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
    border-style: solid; 
    border-width: .2rem; 
    border-color: #9ebdcc;
}
.containerList .box img {
    max-width: 100%;
    background-size: cover;
}

.containerList .box p {
    margin: 0;
    padding: 0 0 10px;
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
	
	$(".box").bind("click",function(){
		var sellNo=$(this).data('sellno');
		self.location="/trade/getSell?sellNo="+sellNo;
	})
	
	$("#search").bind("click",function(){
		search();
	})
	
	$("#searchCondition").change(function(){
        search();
    });
	
});

//검색 엔터
function enter() {
        if (window.event.keyCode == 13) {
			search();
        }
}
//검색 엔터 끝 

function search(){
	$("form").attr("method" , "POST").attr("action" , "/trade/listTrade").submit();
}

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
<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ''}" onkeypress="enter()" placeholder=" 상품명으로 검색하기" style="height: 40px"/>
<img src="/common/images/trade/search.png" id="search">
</span>
<label style="text-align: center; display: inherit;">
<c:if test="${search.searchCondition == null }">
<input type="checkbox" id="searchCondition" name="searchCondition" value="1">&nbsp;판매중인 상품만 보기
</c:if>
<c:if test="${search.searchCondition != null }">
<input type="checkbox" id="searchCondition" name="searchCondition" value="1" checked>&nbsp;판매중인 상품만 보기
</c:if>
</label>

</div>

 <div class="containerList">
 
 <ul class="grid effect-2" id="grid">
 
 <c:forEach var="sell" items="${tradeList}">
	<c:set var="i" value="${ i+1 }" />
		<c:if test="${sell.sellState !=0}">
<!-- 썸네일 박스 시작 -->

<li id="startbox">

<div class="box" data-sellno="${sell.sellNo}">
		
	<p>
	<img src="/common/images/profile/${sell.seller.profile}" style="height: 60px; width:60px; border-radius: 70px; display: inline; vertical-align: middle"/>
	<span style="font-weight: bold; display: inline;">&nbsp;${sell.seller.userNickname}</span>
	<span style="float:right">
	<c:if test="${sell.sellState == 10 || sell.sellState == 30 }">
	<c:if test="${sell.sellStyle == 10}">
	<img src="/common/images/trade/transit-filled.png" style="height: 80%; display: inline; vertical-align: middle; float:right"/>
	</c:if>
	<c:if test="${sell.sellStyle == 20}">
	<img src="/common/images/trade/giveaway-filled.png" style="height: 80%; display: inline; vertical-align:text-top; float:right;"/>
	</c:if>
	</c:if>
	<c:if test="${sell.sellState != 10 && sell.sellState != 30}">
	<img src="/common/images/trade/soldout.png" style="height: 80%; display: inline; vertical-align: middle; float:right"/>
	</c:if>
	</span>
	</p>


	<div>
	<img src="${sell.sellPhoto1}" style="width:100%;" align="middle"/>
	</div>
	
	<div style="word-break:break-all;">
	<p align="left"><strong>상&nbsp;품&nbsp;명</strong>&nbsp;:&nbsp;${sell.sellName}</p>
	<p align="left"><strong>가&emsp;&nbsp;격</strong>&nbsp;:&nbsp;<fmt:formatNumber value="${sell.sellPrice}" type="number"/> 원</p>
	<p align="left"><strong>상세정보</strong></p>
	<p align="left" style="text-align: center;">${sell.sellText}</p>
	</div>
	
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
<jsp:include page="/view/layout/footer.jsp"></jsp:include>
</form>
</body>
</html>