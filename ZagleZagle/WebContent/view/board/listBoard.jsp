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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<style>
	body{
	 	padding-top : 100px;
        padding-left:100px;
        padding-right:100px;
	}
	
	.thumbnail{
        	width:500px;
        	height:650px;
    }
    
    #goAddBoard{
    	position: static;
    	float:right;
    }
    
    #sessionTest{
    	position: static;
    	align-content: center;
    }

</style>

<script type="text/javascript">
//수정 시작
$(function(){
	
	$("input[value='수정']").bind("click",function(){
		var boardNo=$(this).data('update');
		self.location="/board/updateBoard?boardNo="+boardNo;
	})

});
//수정 끝

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
	
	alert(local);
	
	$("input[name='local']").val(local);
			
	$("form").attr("method" , "POST").attr("action" , "/board/listBoard?view=town").submit();
}


</script>

</head>

<body>

<form name="listBoard">

<a href="/board/listMap">지도로 보기</a>

<a href="/board/testUser">
<input id="sessionTest" type="button" value="세션 테스트">
</a>
userNickname : ${user.userNickname}

<c:if test="${user.userNo!=null}">
<a href="/board/addBoard">
<input type="button" value="게시물 등록" id="goAddBoard">
</a>
</c:if>

<!-- 동네 선택 -->
<div>
<c:if test="${param.view=='town'}">
<div class="row">
				<select name="state" class="ct_input_g" style="width: 200px; height: 40px" onchange="fncGetState(this)">
					<option value='' style="font-size:20px;"  selected>시·도</option>
					<c:set var="i" value="0"/>
					<c:forEach var="local" items="${list}">
					<c:set var="i" value="${i+1}"/>
					<option value='${local.stateCode}' style="font-size:20px;">${local.stateName}</option>
					</c:forEach>
				</select>
				
				<select name="city"  class="ct_input_g" style="width: 200px; height: 40px" onchange="fncGetCity(this)">
					<option value="" style="font-size:20px;">시·군·구</option>
				</select>
        
				<select name="town"  class="ct_input_g" style="width: 200px; height: 40px" onchange="fncGetTown(this)">
					<option value="" style="font-size:20px;">읍·면·동</option>
				</select> 
				
				<input type="hidden" name="local" value="${searchBoard.local}"/>
	           
</div>
</c:if>
</div>
<!-- 동네 선택  끝-->

<hr/>

<!-- 리스트 시작 -->
<div>
<c:set var="i" value="0" />
<c:forEach var="board" items="${boardList}">
	<c:set var="i" value="${ i+1 }" />
		
	<c:if test="${board.boardStatus=='1'}"><!-- 정상 게시물만 보여주기 -->
		
	<div class="bs-example" data-example-id="thumbnails-with-custom-content">
	<div class="col-sm-6 col-md-4">
	<div class="thumbnail" data-toggle="modal" data-target="#${board.boardNo}modal1">
		
	<p>
	<img src="/common/images/profile/${board.user.profile}" style="height: 60px; width:60px;" align="middle"/>
	${board.user.userNickname}
	</p>
	
	<div class="caption">
	
	
<!-- 지도 시작 -->
<c:if test="${board.coord !=null && board.photo1 !=null}">
<div id="staticMap${board.boardNo}" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc9c3216a02c263f1acc2c4187e96443"></script>
<script type="text/javascript">
var staticMapContainer  = document.getElementById('staticMap${board.boardNo}'); // 이미지 지도를 표시할 div  
var staticMapOption = {};
var marker = {};

var coord = ('${board.coord}');

if (coord==null || coord=='') {

}else{
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
}

</script>
</c:if>
<!-- 지도 끝 -->
	
	
<c:if test="${board.coord ==null && board.photo1 !=null}">
	<%-- <c:if test="${board.coord !=null && board.photo1 !=null}">
	<p align="center">${board.coord}</p>
	</c:if>
	
	<c:if test="${board.coord ==null && board.photo1 !=null}">
	<img src="/common/images/board/${board.photo1}" style="width:100%;" align="middle"/>
	</c:if>	
	--%>

	
	<img src="${board.photo1}" style="width:100%;" align="middle"/>

</c:if>	
	<p align="center">${board.coord}</p><!-- 삭제해야됨 -->
	
	<p align="center">${board.boardDetailText}</p>
	<p align="center">${board.hashTag}</p>
	
	</div>
	</div>
	</div>
	</div>

<!-- 모달 시작 -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="${board.boardNo}modal1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
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
        
        <div class="btn btn-primary" data-toggle="modal" data-target="#${board.boardNo}modal2">삭제
        </div>
        </c:if>
        </h4>
        </div>
      </div>
      
      <div class="modal-body">     
      <jsp:include page="/board/getBoard?boardNo=${board.boardNo}"/>
      </div>
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 모달 끝 -->

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
<!-- 리스트 끝 -->
</div>



</form>
</body>


</html>