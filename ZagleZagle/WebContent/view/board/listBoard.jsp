<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>listBoard</title>
        
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<script src="/javascript/bootstrap-dropdownhover.min.js"></script>        
        
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
    margin: 20px auto;
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

#goAddBoard{
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

	$("input[value='게시물 등록']").bind("click",function(){
		var boardNo=$(this).data('update');
		
		self.location="http://127.0.0.1:8080/board/addBoard?userNo=${user.userNo}";
	})
	
	$("input[value='지도로 보기']").bind("click",function(){
		
		self.location="/board/listMap";
	})
	
	$("input[value='등록']").bind("click",function(){
		var boardNo=$(this).data('comment');
		alert(boardNo);
		
		var userNo="${user.userNo}";
		alert(userNo);
		
		
		
		replyInsert(boardNo, userNo);
		
	});
	
});

//댓글 등록 : start
function replyInsert(boardNo,userNo){
	
	var data={
            "commentDetailText" : /* $("input[name='commentDetailText']").val() */"왜안돼"
	};

     $.ajax({
        url : '/board/json/addComment/'+boardNo+'/'+userNo,
        type : 'post',
        data : JSON.stringify(data),
        dataType:"json",
       headers:{
                   "Accept":"application/json",
                   "Content-Type": "application/json"
                },
        success : function(data){
        	
        	alert("성공");
             /* if(data == 1) {
                replyList(); //댓글 작성 후 댓글 목록 reload
            }  */
        }
    }); 
} 
//댓글 등록 : end


//검색 엔터
function enter() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
        	$("form").attr("method" , "POST").attr("action" , "/board/listBoard?view=${param.view}").submit();
        }
}
//검색 엔터 끝 




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


<form name="listBoard">


<div id="selectMenu">
<!-- 지도로 보기 -->
<c:if test="${user.userNo!=null}">
<input type="button" value="지도로 보기"/>
</c:if>

<!-- 검색 -->
<span id="searchKeyword">
<input type="text" name="searchKeyword" value="${! empty searchBoard.searchKeyword ? searchBoard.searchKeyword : ''}" onkeypress="enter()"; placeholder="해시태그 검색하기"/>
</span>

<!-- 게시물 등록 -->
<c:if test="${user.userNo!=null}">
<input type="button" value="게시물 등록" id="goAddBoard"/>
</c:if>
</div>

<!-- 동네 선택 -->
<div id="selectTown">
<c:if test="${param.view=='town'}">
<div class="row">
				<select name="state" class="ct_input_g" style="width: 200px; height: 40px" onchange="fncGetState(this)">
					<option value='' style="font-size:20px;"  selected>시·도 ▼</option>
					<c:set var="i" value="0"/>
					<c:forEach var="local" items="${list}">
					<c:set var="i" value="${i+1}"/>
					<option value='${local.stateCode}' style="font-size:20px;">${local.stateName}</option>
					</c:forEach>
				</select>
				
				<select name="city"  class="ct_input_g" style="width: 200px; height: 40px" onchange="fncGetCity(this)">
					<option value="" style="font-size:20px;">시·군·구 ▼</option>
				</select>
        
				<select name="town"  class="ct_input_g" style="width: 200px; height: 40px" onchange="fncGetTown(this)">
					<option value="" style="font-size:20px;">읍·면·동 ▼</option>
				</select> 
				
				<input type="hidden" name="local" value="${searchBoard.local}"/>
	           
</div>
</c:if>
</div>
<!-- 동네 선택  끝-->

<br/>

 <div class="containerList">
 <c:forEach var="board" items="${boardList}">
	<c:set var="i" value="${ i+1 }" />
		
	<c:if test="${board.boardStatus=='1'}"><!-- 정상 게시물만 보여주기 -->
		
	<div class="box" data-toggle="modal" data-target="#${board.boardNo}modal1">
		
	<p>
	<img src="/common/images/profile/${board.user.profile}" style="height: 60px; width:60px; border-radius: 70px;" align="middle"/>
		${board.user.userNickname}
	</p>
	
	
<!-- 지도 시작 -->
<c:if test="${board.coord !=null}">
<div id="staticMap${board.boardNo}" style="width:100%;height:350px;" class="disabled"></div> <!-- 지도 클릭 안되게 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc9c3216a02c263f1acc2c4187e96443"></script>
<script type="text/javascript">

window.addEventListener('load', function(event) {
	var staticMapContainer  = document.getElementById('staticMap${board.boardNo}'); // 이미지 지도를 표시할 div  
	var staticMapOption = {};
	var marker = {};

	var coord = ('${board.coord}');
	
	   var coordArray = coord.split(',');
	   var coordy = Number(coordArray[0]);
	   var coordx = Number(coordArray[1]);
	   
	   var markerPosition  = new daum.maps.LatLng(coordy, coordx); 

	   marker = {
	         position: markerPosition
	   };
	   
	   staticMapOption = { 
	        center: new daum.maps.LatLng(coordy, coordx), // 이미지 지도의 중심좌표
	        level: 3, // 이미지 지도의 확대 레벨
	        marker: marker
	    };
	   var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);

});


</script>
</c:if>
<!-- 지도 끝 -->
	
	
<c:if test="${board.coord ==null && board.photo1 !=null}">
	<div><img src="${board.photo1}" style="width:100%;" align="middle"/></div>
</c:if>	

	<p align="center" style="font-size: small">${board.address}</p>
	<p align="center">${board.boardDetailText}</p>
	<p align="center" style="text-align: left; font-size: small">${board.hashTag}</p>
	

	</div>

<!-- 모달1 시작 -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="${board.boardNo}modal1">
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
        <img src="/common/images/profile/${board.user.profile}" style="height: 60px; width:60px;" align="middle"/>
		${board.user.userNickname}
		</div>
		
		<!-- 내 글만 수정, 삭제 -->
		<c:if test="${user.userNo==board.user.userNo}">
		<div class="col-md-4 col-md-offset-4">
		<input type="button" value="수정" data-update="${board.boardNo}"/>
        <div class="btn btn-primary" data-toggle="modal" data-target="#${board.boardNo}modal2">삭제</div>
        </div>
        </c:if>
        
        </h4>
        </div>
      </div>
     <!-- 모달1 헤더 끝 -->
      
     <!-- 모달1 바디 시작 -->
      <div class="modal-body" style="text-align: center">  

		<div>
			<c:if test="${board.photo1 !=null}">
			<div><img src="${board.photo1}" style="width: 500px"/></div>
			<br/>
			</c:if>

			<c:if test="${board.photo2 !=null}">
			<div><img src="${board.photo2}" style="width: 500px"/></div>
			<br/>
			</c:if>
	
			<c:if test="${board.photo3 !=null}">
			<div><img src="${board.photo3}" style="width: 500px"/></div>
			<br/>
			</c:if>
		</div>

		<p>
			${board.boardDetailText}
		</p>
     
       
      </div>
      <!-- 모달1 바디 끝 -->
      
      <!-- 모달1 푸터 시작 -->
      <div class="modal-footer">
      
     	<%-- <jsp:include page="/view/board/listComment.jsp" /> --%>
     	<input type="text" name="commentDetailText" placeholder="댓글을 입력해주세요" value="">
		<input type="button" value="등록" data-comment="${board.boardNo}">
     	
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
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title"></h4>
            </div><div class="container"></div>
            <div class="modal-body">
             	삭제하시겠습니까?
            </div>
            <div class="modal-footer">
              <a href="/board/deleteBoard?boardNo=${board.boardNo}" class="btn btn-primary">삭제</a>
            </div>
          </div>
        </div>
</div>
<!-- 모달2 끝 -->


</c:if>

</c:forEach>       
        
        
  
</div><!-- /container -->
</form>
        
    </body>
</html>


