<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Loading Effects for Grid Items with CSS Animations" />
<meta name="keywords" content="css animation, loading effect, google plus, grid items, masonry" />
<meta name="author" content="Codrops" />

<title>listBoard</title>  

<link rel="shortcut icon" href="../favicon.ico"> 
<link rel="stylesheet" type="text/css" href="/common/css/GridLoadingEffects/css/default.css" />
<link rel="stylesheet" type="text/css" href="/common/css/GridLoadingEffects/css/component.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="/common/css/GridLoadingEffects/js/modernizr.custom.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>       
 
<!-- 카톡 공유 -->       
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!--  sweetAlert -->     
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>       
        
 <!-- Favicons -->
  <link href="/common/css/estateagency-master/img/favicon.png" rel="icon">
  <link href="/common/css/estateagency-master/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="/common/css/estateagency-master/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="/common/css/estateagency-master/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/common/css/estateagency-master/lib/animate/animate.min.css" rel="stylesheet">
  <link href="/common/css/estateagency-master/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="/common/css/estateagency-master/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="/common/css/estateagency-master/css/style.css" rel="stylesheet"> 
  

       
<style>

@import url('https://fonts.googleapis.com/css?family=Poppins');


#nav{
 color: white; 
}

.getUserInfo{
	color: white; 
}

form{
	padding-top : 150px;
	min-height: 100vh;
	min-width:100%;
	
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#eaf2ec+0,dceadf+26,d1bafc+69,947dc0+85,220b4f+100 */
	background: #eaf2ec; /* Old browsers */
	background: -moz-linear-gradient(top, #eaf2ec 0%, #dceadf 26%, #d1bafc 69%, #947dc0 85%, #220b4f 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(top, #eaf2ec 0%,#dceadf 26%,#d1bafc 69%,#947dc0 85%,#220b4f 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(to bottom, #eaf2ec 0%,#dceadf 26%,#d1bafc 69%,#947dc0 85%,#220b4f 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eaf2ec', endColorstr='#220b4f',GradientType=0 ); /* IE6-9 */
	}

body {
   	margin: 0;
   	padding-right: 0px;
    padding: 0;
    font-family: 'Poppins', sans-serif;
	/* background: #333; */
	overflow-x: hidden;
}

.fullScreen{
	background-size: cover;
	background-image: url(/common/css/html5up-helios/images/pic03.jpg);
	margin-right: 0;
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
.containerList .box h2 {
    margin: 10px 0 0;
    padding: 0;
}
.containerList .box p {
    margin: 0;
    padding: 0 0 10px;
}

.disabled{
		pointer-events:none;
}


#selectTown{
	padding-top : 40px;
	text-align: center;
}

.profile{
	display: none;
}

 
input[name='report']{
-webkit-appearance: button;
    cursor: pointer;
    margin-left: 60px;
}

.btn {
  transition: .5s ease;
}

.btn.btn-c {
  border-radius: 0;
  padding: .5rem 2rem;
  letter-spacing: .05rem;
}

.btn.btn-c {
  background-color: #000000;
  color: #ffffff;
}

.btn.btn-c:hover {
  background-color: #dc3545;
  color: #000000;
}

#weather{
	background-image: url("https://i.imgur.com/wEnaF2K.png");
/* 	background-image: url("https://i.imgur.com/rkzHSG4.jpg"); */
	background-size: cover;
	
}


</style>
<script type="text/javascript">


$(function(){
	
	//게시물 수정
	$("input[value='수정']").bind("click",function(){
		var boardNo=$(this).data('update');
	
		self.location="/board/updateBoard?boardNo="+boardNo;
	})
	
	//게시물 등록
	$("input[value='게시물 등록']").bind("click",function(){
		
		if("${user.blackCode}"=='2'){
			swal("","블랙리스트 회원은 이용할 수 없습니다.", "error");
			return;
		}
		
		self.location="http://192.168.0.19:8080/board/addBoard?userNo=${user.userNo}";
	})
	
	//지도로 보기
	$("input[value='지도로 보기']").bind("click",function(){
		
		self.location="/board/listMap";
	})
	
	//댓글 리스트 불러오기
	$(".realBox").bind("click",function(){
		var preBoardNo=$(this).data('target');
		
		//#${board.boardNo}modal1 자르기
		var boardNo=preBoardNo.substring(1,8);
		
		commentList(boardNo);
	})
	
	
	//좋아요 시작
	$("span[name='like']").on("click", function(){
		
		var userNo="${user.userNo}";
		var boardNo=$(this).data('boardno');
		var checkLike=$(this).data('checklike');
		
		//alert(checkLike);
		
		if(checkLike=='0'){
			$.ajax({
				
				url: '/board/json/addLike/'+userNo+'/'+boardNo,
				type: 'get',
				success: function(data){
					
					if(data==1){
						//alert('등록 성공');
						
						$("#"+boardNo+"like").data("checklike","1");
						$("img[name='"+boardNo+"emptyLike']").attr("src","/common/images/board/fullLike.png");
						$("img[name='"+boardNo+"emptyLike']").attr("name",boardNo+"fullLike");
						
						
						var before=$("span[name='"+boardNo+"likeCount']").html();
						var after=Number(before)+1;
						$("span[name='"+boardNo+"likeCount']").html(after);
							
					}
				}//success 끝
			})			
		}//0일때 끝
		
		if(checkLike=='1' || checkLike=='2'){
			
			$.ajax({
				
				url: '/board/json/updateLike/'+userNo+'/'+boardNo+'/'+checkLike,
				type: 'get',
				success: function(data){
					
					if(data==2){
						//alert('취소 성공');
						
						$("#"+boardNo+"like").data("checklike","2");
						$("img[name='"+boardNo+"fullLike']").attr("src","/common/images/board/emptyLike.png");
						$("img[name='"+boardNo+"fullLike']").attr("name",boardNo+"emptyLike");
						
						var before=$("span[name='"+boardNo+"likeCount']").html();
						var after=Number(before)-1;
						$("span[name='"+boardNo+"likeCount']").html(after);
						
						
					}else if(data==1){
						//alert('재등록 성공');

						$("#"+boardNo+"like").data("checklike","1");
						$("img[name='"+boardNo+"emptyLike']").attr("src","/common/images/board/fullLike.png");
						$("img[name='"+boardNo+"emptyLike']").attr("name",boardNo+"fullLike");
						
						var before=$("span[name='"+boardNo+"likeCount']").html();
						var after=Number(before)+1;
						$("span[name='"+boardNo+"likeCount']").html(after);					
					}
				}
				
			})
		}//1, 2일때 끝

		
	});//좋아요 끝
	
	
	//스크랩 시작
	$("span[name='scrap']").on("click", function(){
		
		var userNo="${user.userNo}";
		var boardNo=$(this).data('boardno');
		var checkScrap=$(this).data('checkscrap');
		
		//alert(checkScrap);
		
		if(checkScrap=='0'){
			
			$.ajax({
				
				url: '/board/json/addScrap/'+userNo+'/'+boardNo,
				type: 'get',
				success: function(data){
					
					if(data==1){
						//alert('등록 성공');
						
						$("#"+boardNo+"scrap").data("checkscrap","1");
						$("img[name='"+boardNo+"emptyScrap']").attr("src","/common/images/board/fullScrap.png");
						$("img[name='"+boardNo+"emptyScrap']").attr("name",boardNo+"fullScrap");
					}
				}
			})			
		}//0일때 끝
		
		if(checkScrap=='1' || checkScrap=='2'){
			
			//alert("수정"+checkScrap);
			
			$.ajax({
				
				url: '/board/json/updateScrap/'+userNo+'/'+boardNo+'/'+checkScrap,
				type: 'get',
				success: function(data){
					
					if(data==2){
						//alert('취소 성공');
						
						$("#"+boardNo+"scrap").data("checkscrap","2");
						$("img[name='"+boardNo+"fullScrap']").attr("src","/common/images/board/emptyScrap.png");
						$("img[name='"+boardNo+"fullScrap']").attr("name",boardNo+"emptyScrap");
						
					}else if(data==1){
						//alert('재등록 성공');
												
						$("#"+boardNo+"scrap").data("checkscrap","1");
						$("img[name='"+boardNo+"emptyScrap']").attr("src","/common/images/board/fullScrap.png");
						$("img[name='"+boardNo+"emptyScrap']").attr("name",boardNo+"fullScrap");
					}
				}
				
			})
		}//1, 2일때 끝
				
	});//스크랩 끝
	
	
	//신고 시작
	$("input[value='신고']").bind("click",function(){
		
		if("${user.userNo}"==""){
			swal("","로그인 후 이용 가능합니다.", "error");
			return;
		}
		
		var boardNo=$(this).data('report');
		
		var data = document.querySelector("#"+boardNo+"report").value;

	    window.open("/view/board/addReport.jsp?val="+data, "addReport", "width=500, height=400, resizable=yes" );
	});
	
	
	//사진 링크
	$("input[value='링크 추가']").bind("click",function(){
		var photo1=$(this).data('photo1');
		var boardNo=$(this).data('boardno');
		
		self.location="/board/addLink?boardNo="+boardNo;
	});
	
	
	//검색 버튼 클릭
	$("#search").bind("click",function(){
		$("form").attr("method" , "POST").attr("action" , "/board/listBoard?view=${param.view}").submit();
	});
	
	
	//카카오 링크1 주소 있는 경우
	$("span[name='kakao1']").bind("click",function(){
		
		var address=$(this).data('address');
		
		var boardDetailText=$(this).data('boarddetailtext');
		
		var hashTag=$(this).data('hashtag');
		
		var photo1=$(this).data('photo1');
		
		var likeCount=$(this).data('likecount');
		
		var boardNo=$(this).data('boardno');
		
		
		//<![CDATA[
		// // 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('83df98960f21b7281d6cdfddf483b6a5');
		// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
				
		  Kakao.Link.sendDefault({
		    objectType: 'location',
		    address: address,
		    content: {
		      title: boardDetailText,
		      description: hashTag,
		      imageUrl: photo1,
		      link: {
		        mobileWebUrl: 'http://192.168.0.19:8080/board/getBoard?view=mobile&boardNo='+boardNo,
		        webUrl: 'http://192.168.0.19:8080/board/getBoard?view=mobile&boardNo='+boardNo
		      }
		    },
		    social: {
		      likeCount: likeCount,
		    },
		    buttons: [
		      {
		        title: '웹으로 보기',
		        link: {
		          mobileWebUrl: 'http://192.168.0.19:8080/board/getBoard?boardNo='+boardNo,
		          webUrl: 'http://192.168.0.19:8080/board/getBoard?boardNo='+boardNo
		        }
		      }
		    ]
		  });
		
		//]]>
				
	});//카카오 링크1 끝
	
	
	//카카오 링크2 주소 없는 경우
	$("span[name='kakao2']").bind("click",function(){
		
		var boardDetailText=$(this).data('boarddetailtext');
		
		var hashTag=$(this).data('hashtag');
		
		var photo1=$(this).data('photo1');
		
		var likeCount=$(this).data('likecount');
		
		var boardNo=$(this).data('boardno');
		
		
	//<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('83df98960f21b7281d6cdfddf483b6a5');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    
      Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
          title: boardDetailText,
          description: hashTag,
          imageUrl: photo1,
          link: {
            mobileWebUrl: 'http://192.168.0.19:8080/board/getBoard?boardNo='+boardNo,
            webUrl: 'http://192.168.0.19:8080/board/getBoard?boardNo='+boardNo
          }
        },
        social: {
          likeCount: likeCount,
        },
        buttons: [
          {
            title: '웹으로 보기',
            link: {
              mobileWebUrl: 'http://192.168.0.19:8080/board/getBoard?view=mobile&boardNo='+boardNo,
              webUrl: 'http://192.168.0.19:8080/board/getBoard?view=mobile&boardNo='+boardNo
            }
          }
        ]
      });
     //]]>
	});//카카오 링크2 끝
	
});//function 끝


//검색 엔터
function enter() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
        	$("form").attr("method" , "POST").attr("action" , "/board/listBoard?view=${param.view}").submit();
        }
}



//시도 선택
function fncGetState(){
	
	var stateCode = $("select[name=state]").val();
	//alert(stateCode);
	
	$.ajax(
		{
			url : "/board/json/listMap/getCity/"+stateCode,
			method : "GET",
			header : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(data, status){
				
				var temp ="";
				var display ="";
				
				if(data.length>0){
					$.each(data, function(index){
						temp = "<option value='"+data[index].cityCode+"' style='font-size:20px;'>"+data[index].cityName+"</option>";
						display += temp;
					});
					
					$("select[name=city]").children("option").not("option:nth-child(1)").remove();
					$("select[name=city]").append(display);
				}
				
			}
			
		});
}


//시군구 선택
function fncGetCity(){
	
	var stateCode = $("select[name=state]").val();
	var cityCode = $("select[name=city]").val();
	//alert(cityCode);
	
	$.ajax(
		{
			url : "/board/json/listMap/getTown/"+cityCode+"/"+stateCode,
			method : "GET",
			header : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(data, status){
				
				var temp ="";
				var display ="";
				
				if(data.length>0){
					$.each(data, function(index){
						temp = "<option value='"+data[index].townCode+"' style='font-size:20px;'>"+data[index].townName+"</option>";
						display += temp;
					});
					
					$("select[name=town]").children("option").not("option:nth-child(1)").remove();
					$("select[name=town]").append(display);
				}
				
			}
			
		});
}


//읍면동 선택
function fncGetTown(){
	var stateName = $("select[name=state] option:checked").text();
	var cityName = $("select[name=city] option:checked").text();
	var townName = $("select[name=town] option:checked").text();
	
	local = stateName+" "+cityName+" "+townName;
	
	//alert(local);
	
	$("input[name='local']").val(local);
			
	$("form").attr("method" , "POST").attr("action" , "/board/listBoard?view=${param.view}").submit();
}


</script>


     

</head>



<body>

<jsp:include page="/view/layout/toolbar.jsp"/>


<div class="row fullScreen">


<div class="col-sm-12" style="padding-right: 0px;">
<form name="listBoard">


<a href="/board/testUser">
<input type="button" value="세션">
</a>

<a href="/board/testUser2">
<input type="button" value="어드민세션">
</a>


<div class="row">
<!-- 지도로 보기 -->
<div class="col-md-2 col-md-offset-1">
<c:if test="${user.userNo!=null}">
<input class="btn btn-b" type="button" value="지도로 보기"/>
</c:if>
</div>

<!-- 검색 -->
<div class="col-md-5 col-md-offset-2">
<span>
<input class="form-control" type="text" name="searchKeyword" value="${! empty searchBoard.searchKeyword ? searchBoard.searchKeyword : ''}" onkeypress="enter()"; placeholder=" 해시태그 검색하기" 
    style="width: 300px; height: 40px; border-radius: 5px; display: inherit;"/>
<img src="/common/images/trade/search.png" id="search">
</span>
</div>

<!-- 게시물 등록 -->
<div class="col-md-2">
<c:if test="${user.userNo!=null}">
<input class="btn btn-b" type="button" value="게시물 등록" id="goAddBoard"/>
</c:if>
</div>
</div>

<br/><br/>


<!-- 동네 선택 -->
<div id="selectTown">
<c:if test="${param.view=='town'}">
<div class="row" style="display: inherit; text-align: center; margin: 0px;">
				<select name="state" class="ct_input_g" style="width: 200px; height: 40px; background-color: white; border-radius: 5px;" onchange="fncGetState(this)">
					<option value='' style="font-size:20px;"  selected>시·도</option>
					<c:set var="i" value="0"/>
					<c:forEach var="local" items="${list}">
					<c:set var="i" value="${i+1}"/>
					<option value='${local.stateCode}' style="font-size:20px;">${local.stateName}</option>
					</c:forEach>
				</select>
				
				<select name="city"  class="ct_input_g" style="width: 200px; height: 40px; background-color: white; border-radius: 5px;" onchange="fncGetCity(this)">
					<option value="" style="font-size:20px;">시·군·구</option>
				</select>
        
				<select name="town"  class="ct_input_g" style="width: 200px; height: 40px; background-color: white; border-radius: 5px;" onchange="fncGetTown(this)">
					<option value="" style="font-size:20px;">읍·면·동</option>
				</select> 
				
				<input type="hidden" name="local" value="${searchBoard.local}"/>
	           
</div>
</c:if>
</div>
<!-- 동네 선택  끝-->

<!-- 선택한 동네 보여주는 부분 -->
<c:if test="${searchBoard.local !=null}">
<br/>
<div style="text-align: center;">
<img src="/common/images/board/local.png" style="width: 20px;">${searchBoard.local}
</div>
</c:if>

<br/>


 <div class="containerList" style="width: 100%;">

 <ul class="grid effect-2" id="grid">
 
 	<!-- 날씨 -->
 	<c:if test="${user.userNo!=null}">
 	<li>
 	<div class="box" id="weather" style="height:250px;">
 
 		<!-- searchBoard.local 있는 경우 -->
 		<div style="margin-left: 4.5em; margin-top: 1em;">
 		<c:if test="${searchBoard.local != null}">
 		<jsp:include page="/view/board/weather.jsp">
			<jsp:param name="weatherLocal" value="${searchBoard.local}"/>
		</jsp:include>
 		</c:if>
 		
 		<!-- searchBoard.local 없는 경우 -->
 		<c:if test="${searchBoard.local == null && user.userAddr != null}">
 		<jsp:include page="/view/board/weather.jsp">
			<jsp:param name="weatherLocal" value="${user.userAddr}"/>
		</jsp:include>
 		</c:if>
 		</div>
 	</div>
 	</li>
 	</c:if>
 	
 	
	<!-- 게시물 리스트 없는 경우 -->
	<c:if test="${fn:length(boardList)==0}">
	<li>
	<div class="box" style="height:500px; width: 600px; text-align: center; ">
	<br/><br/><br/>
	<img src="/common/images/board/goal.png" style="display: block; margin: 0px auto;">
	<br/>
	아직 등록된 게시물이 없습니다.
	<br/>
	개척자가 되어보세요!
	</div>
	</li>
	</c:if>
 
 
 <c:forEach var="board" items="${boardList}">
	<c:set var="i" value="${ i+1 }" />

	
	<!-- 블라인드 게시물 -->
	<c:if test="${board.boardStatus=='3' && user.grade!='4'}">
		<li>	
		<div class="box" style="height:250px;">
		<p style="text-align: center;"><br/><br/><br/>신고 누적으로<br/>블라인드 된 게시물입니다</p>
		</div>
		</li>
	</c:if>

	<!-- 정상 게시물, 블라인드 해지 게시물 -->
	<c:if test="${board.boardStatus=='1' || board.boardStatus=='4' || (board.boardStatus=='3' && user.grade=='4')}">


<!-- 썸네일 박스 시작 -->
<li>

	<!-- 유저 테마 -->
	<c:if test="${board.userTheme=='H_spoon'}">
	<div class="box" style="border-style: solid; border-width: .2rem; border-color: #9ebdcc;">
	</c:if>
	
	<c:if test="${board.userTheme=='D_spoon'}">	
	<div class="box" style="border-style: solid; border-width: .2rem; border-color: #ffdf7f;">
	</c:if>
	
	<c:if test="${board.userTheme=='S_spoon1'}">	
	<div class="box" style="border-style: solid; border-width: .2rem; border-color: #ff9a9a;">
	</c:if>
	
	<c:if test="${board.userTheme=='S_spoon2'}">	
	<div class="box" style="border-style: solid; border-width: .2rem; border-color: #8cdc94;">
	</c:if>
	
	<c:if test="${board.userTheme=='G_spoon1'}">	
	<div class="box" style="border-style: solid; border-width: .2rem; border-color: #8fd5f5;">
	</c:if>
	
	<c:if test="${board.userTheme=='G_spoon2'}">	
	<div class="box" style="border-style: solid; border-width: .2rem; border-color: #b79fef;">
	</c:if>
	
	<!-- 프로필 사진, 닉네임 -->	
	<p>
	<img src="/common/images/profile/${board.user.profile}" style="height: 60px; width:60px; border-radius: 70px; display: inline; vertical-align: middle"/>
	<span style="height:100%; font-weight: bold; display: inline; vertical-align: middle;">&nbsp;${board.user.userNickname}</span>
	
	<!-- 좋아요 -->
	<span name="like" id="${board.boardNo}like" data-boardNo="${board.boardNo}" data-checkLike="${board.checkLike}">	
	<c:choose>
		<c:when test="${user.userNo !=null}">
		
		<span name="${board.boardNo}likeCount" style="display: inline; margin-left:3px; margin-top: 19px; float: right;">${board.likeCount}</span>
		
			<c:if test="${board.likeUserNo==null && board.checkLike=='0'}">
				<img src="/common/images/board/emptyLike.png" style="display: inline; vertical-align: middle; float:right; width: 30px; margin-top: 12px;" name="${board.boardNo}emptyLike"/>
			</c:if>
			
			<c:if test="${user.userNo==board.likeUserNo && board.checkLike=='1'}">
				<img src="/common/images/board/fullLike.png" style="display: inline; vertical-align: middle; float:right; width: 30px; margin-top: 12px;" name="${board.boardNo}fullLike"/>			
			</c:if>
			
			<c:if test="${user.userNo==board.likeUserNo && board.checkLike=='2'}">
				<img src="/common/images/board/emptyLike.png" style="display: inline; vertical-align: middle; float:right; width: 30px; margin-top: 12px;" name="${board.boardNo}emptyLike"/>			
			</c:if>
			
		</c:when>
	</c:choose>
	</span>
	
	<!-- 스크랩 -->	
	<span name="scrap" id="${board.boardNo}scrap" data-boardNo="${board.boardNo}" data-checkScrap="${board.checkScrap}">
	<c:choose>
		<c:when test="${user.userNo !=null}">
			<c:if test="${board.scrapUserNo==null && board.checkScrap=='0'}">
				<img src="/common/images/board/emptyScrap.png" style="display: inline; vertical-align: middle; float:right; width: 40px; height: 30px; margin-top: 12px;" name="${board.boardNo}emptyScrap"/>
			</c:if>
			
			<c:if test="${user.userNo==board.scrapUserNo && board.checkScrap=='1'}">
				<img src="/common/images/board/fullScrap.png" style="display: inline; vertical-align: middle; float:right; width: 40px; height: 30px; margin-top: 12px;" name="${board.boardNo}fullScrap"/>
			</c:if>
			
			<c:if test="${user.userNo==board.scrapUserNo && board.checkScrap=='2'}">
				<img src="/common/images/board/emptyScrap.png" style="display: inline; vertical-align: middle; float:right; width: 40px; height: 30px; margin-top: 12px;" name="${board.boardNo}emptyScrap"/>
			</c:if>
		
		</c:when>
	</c:choose>
	</span>
	
	<!-- 카카오링크 -->
	<c:if test="${board.address!=null}">	
	<span id="${board.boardNo}kakao-link-btn" name="kakao1"
	 data-address="${board.address}" data-boardDetailText="${board.boardDetailText}" data-hashTag="${board.hashTag}" data-photo1="${board.photo1}" data-likeCount="${board.likeCount}" data-boardNo="${board.boardNo}"
	 style="display: inline; float: right; width: 30px; height: 40px; margin-top: 13px;">
	<img src="/common/images/board/kakao.JPG"/>
	</span>
	</c:if>
	
	<c:if test="${board.address==null}">
	<span id="${board.boardNo}kakao-link-btn" name="kakao2"
	 data-boardDetailText="${board.boardDetailText}" data-hashTag="${board.hashTag}" data-photo1="${board.photo1}" data-likeCount="${board.likeCount}" data-boardNo="${board.boardNo}"
	 style="display: inline; float: right; width: 30px; height: 40px; margin-top: 13px;">
	<img src="/common/images/board/kakao.JPG"/>
	</span>
	</c:if>
	
	</p>

	
<!-- 본문 시작 -->
<div class="realBox" data-toggle="modal" data-target="#${board.boardNo}modal1">

<!-- 지도 시작 -->
<c:if test="${board.coord !=null}">
<div id="map${board.boardNo}" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc9c3216a02c263f1acc2c4187e96443"></script>
<script type="text/javascript">

   
   var mapContainer = document.getElementById('map${board.boardNo}'), // 이미지 지도를 표시할 div  
   mapOption = { 
           center: new daum.maps.LatLng(37.49463908698535, 127.02799333430488), // 이미지 지도의 중심좌표
           level: 3, // 이미지 지도의 확대 레벨
           disableDoubleClick: true
       };
   
   var map = new daum.maps.Map(mapContainer, mapOption); 
   var imageSrc = "/common/images/icons8-place-marker-filled-64 (2).png";

   var bounds = new daum.maps.LatLngBounds();
   
   var coord = ('${board.coord}');
   
      var coordArray = coord.split(',');
      var coordy = Number(coordArray[0]);
      var coordx = Number(coordArray[1]);
      
      var markerPosition  = new daum.maps.LatLng(coordy, coordx); 

      bounds.extend(markerPosition);
      
   // 마커 이미지의 이미지 크기 입니다
       var imageSize = new daum.maps.Size(50, 50); 
       var imageOption = {offset: new daum.maps.Point(25, 40)};
       
      // 마커 이미지를 생성합니다    
          var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption); 
          
         // 마커를 생성합니다
         var marker = new daum.maps.Marker({
            map: map,
             position: markerPosition,
             image : markerImage // 마커 이미지 
         });

         marker.setMap(map);
         map.setBounds(bounds);
         map.setLevel(3);

      map.setDraggable(false);
      map.setZoomable(false);
   
</script>
</c:if>
<!-- 지도 끝 -->
	
	
<c:if test="${board.coord ==null && board.photo1 !=null}">
	<div><img src="${board.photo1}" style="width:100%;" align="middle"/></div>
</c:if>	

	<p style="font-size: small; text-align: center;">${board.address}</p>
	<p style="text-align: center;">${board.boardDetailText}</p>
	<p style="text-align: left; font-size: small">${board.hashTag}</p>
	
</div><!-- 본문 내용 realBox 끝 -->
</div><!-- box 끝 -->
</li>
<!-- 썸네일 박스 끝 -->


<!-- 모달1 시작 -->
<div class="modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="${board.boardNo}modal1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
	<!-- 모달1 헤더 시작 -->
    
      <div class="row">
      
      	<div class="col-md-11 col-md-offset-1">
        <span aria-hidden="true" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 15px; margin-right:5px; margin-bottom:15px; display: inline;">&times;</span>       
        </div>
      </div> 
      
        <h4 class="row modal-title" id="gridSystemModalLabel">
         
        <div class="col-sm-2 col-3">
        <img src="/common/images/profile/${board.user.profile}" style="height: 60px; width:60px; border-radius: 70px; vertical-align: middle; margin-left: 15px;"/>
        </div>
        
        <div class="col-sm-3 col-4">
		${board.user.userNickname}
		</div>
		
		<!-- 내 글만 수정, 삭제 -->
		<c:if test="${user.userNo==board.user.userNo}">
		<div class="col-sm-7 col-4" style="padding-left: 50px;">
		<input class="btn btn-a" type="button" value="수정" data-update="${board.boardNo}"/>
        <span class="btn btn-b" data-toggle="modal" data-target="#${board.boardNo}modal2">삭제</span>
        </div>
        </c:if>
        
        <!-- 신고 버튼 -->
        <c:if test="${user.userNo!=board.user.userNo}">
        <div class="col-sm-4 col-md-offset-3 col-4">    
        <input type="button" name="report" class="btn btn-c" value="신고" data-report="${board.boardNo}" style="margin-left: 0px;"/>
        <input type="hidden" id="${board.boardNo}report" value="${board.boardNo}${board.user.userNo}">
        </div>
        </c:if>     
         
        </h4>
          
     <!-- 모달1 헤더 끝 -->
      
     <!-- 모달1 바디 시작 -->
      <div class="modal-body" style="text-align: center">  

		<div>
			<c:if test="${board.photo1 !=null}">
			<div><img src="${board.photo1}" style="width: 100%"/>
				<input type="button" value="링크 추가" data-photo1="${board.photo1}" data-boardNo="${board.boardNo}">
			</div>
			<br/>
			</c:if>

			<c:if test="${board.photo2 !=null}">
			<div><img src="${board.photo2}" style="width: 100%"/></div>
			<br/>
			</c:if>
	
			<c:if test="${board.photo3 !=null}">
			<div><img src="${board.photo3}" style="width: 100%"/></div>
			<br/>
			</c:if>
		</div>

		<p>
			${board.boardDetailText}
		</p>
     
       
      </div>
      <!-- 모달1 바디 끝 -->
      
      <!-- 모달1 푸터 시작 -->
      <div>
      
		<!-- listComment로 파라미터 보내기 -->      
     	<jsp:include page="/view/board/listComment.jsp">
     		<jsp:param name="boardNo" value="${board.boardNo}"/>
     	</jsp:include>
    	
      </div>
      <!-- 모달1 푸터 끝 -->
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 모달1 끝 -->

<!-- 모달2 시작 -->
<div class="modal"  aria-hidden="true" style="display: none; z-index: 1060;" id="${board.boardNo}modal2">
    	<div class="modal-dialog modal-md">
          <div class="modal-content">
            <div class="modal-header">
				<br/>
            </div>
            <div class="modal-body">
             	삭제하시겠습니까?
            </div>
            <div class="modal-footer">
              <a href="/board/deleteBoard?boardNo=${board.boardNo}" class="btn btn-b">삭제</a>
              <button type="button" class="btn btn-a" data-dismiss="modal">닫기</button>
            </div>
          </div>
        </div>
</div>
<!-- 모달2 끝 -->

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
				viewportFactor : 0.2
			} );
		</script>
        
        
  
</div><!-- /container -->

</form>

</div>
</div><!-- row 끝 -->
    </body>
</html>


