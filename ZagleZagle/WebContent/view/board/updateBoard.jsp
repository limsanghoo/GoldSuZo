<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateBoard</title>

<link rel="stylesheet" href="/common/js/medium-editor/dist/css/medium-editor.min.css">
<link rel="stylesheet" href="/common/js/medium-editor/dist/css/themes/beagle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<style>
div.editable{
        	border: 1px solid #D6CDB7;
        }
        
div{
        	margin:auto;
        }


.wrap-loading{ /*화면 전체를 어둡게 합니다.*/

    position: fixed;

    left:0;

    right:0;

    top:0;

    bottom:0;

    background: rgba(0,0,0,0.2); /*not in ie */

    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */

    

}

     .wrap-loading div{ /*로딩 이미지*/

        text-align: center;

    }

    .display-none{ /*감추기*/

        display:none;

    }        

</style>

<script type="text/javascript">

$(function(){
	
	$('#submit').bind("click",function(){
		
		var imgLength=$("img[name='img']").length;
	      
		  if(imgLength>3){
			alert("사진은 세 장까지 등록 가능합니다.");
			return;
		  }
		
		
		var boardDetailText=$("textarea[name='boardDetailText']").val();
		
		if(boardDetailText==""){
			alert("내용을 입력해주세요.");
		}
			
			$("form").attr("method" , "POST").attr("action" , "/board/updateBoard").submit();
		
	});
	
	
	$("button:contains('이전')").on("click", function() {
		 self.location="/board/listBoard?view=town";
	});
	
	
	$('#edit').bind("click",function(){
		$("#img_box").empty();//원래 이미지 비우기
		$("#newPhoto").append('<input id="file" type="file" multiple="multiple"><br/>* 사진은 한 장씩 등록해주세요 * 세 장까지 등록 가능합니다<br/><br/>');	//파일 첨부 버튼 생성
		$("#hashTag").val("");//원래 해시태그 비우기
		$("#link").val("");//원래 링크 비우기		
		
		var file = document.getElementById('file');
		var image = document.getElementById('image');

		file.onchange = function (event) {
			
			$('.wrap-loading').removeClass('display-none'); //로딩중 이미지 보여주기
			
		  var target = event.currentTarget;
		  var xmlHttpRequest = new XMLHttpRequest();
		  xmlHttpRequest.open('POST', 'https://api.imgur.com/3/image/', true);
		  xmlHttpRequest.setRequestHeader("Authorization", "Client-ID c764d6730f6f9a6");
		  xmlHttpRequest.onreadystatechange = function () {
		    if (xmlHttpRequest.readyState == 4) {
		      if (xmlHttpRequest.status == 200) {
		        var result = JSON.parse(xmlHttpRequest.responseText);

		        $("#img_box").append("<img src="+result.data.link+">");//이미지 미리보기
		        
		        var linkArea=$("#link");
				linkArea.val(linkArea.val()+result.data.link+",");//이미지 링크 append
				
		        console.log(result);        
		        
		        $.ajax(	
		        		{
		        			url : "http://192.168.0.49:8080/board/json/addBoardVisionTag",
		        			method : "GET",
		        			data : {
		        				link : result.data.link
		        			},
		        			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        			dataType : "text",
		        			success : function (data,status){
		        				var decode=decodeURIComponent(data);//특수문자 포함 디코딩
		        				//alert("decode : "+decode);
		        				
		        				if(decode.charAt(0)=="#"){
		        					var tagArea=$("#hashTag");
		        					tagArea.val(tagArea.val()+decode);//해시태그 append
		        				}
		        			}
		        			,complete:function(){
		        		        $('.wrap-loading').addClass('display-none'); //로딩중 이미지 감추기
		        		    }
		        		});
		      
		      }
		      else {
		      	alert("업로드 실패");
		      }
		    }
		  };//()function 끝
		  xmlHttpRequest.send(target.files[0]);
		};//(event)function 끝
		
		
	})//edit 끝
	
});//function 끝


</script>
</head>
<body>

<jsp:include page="/view/layout/toolbar.jsp"/>

<div class="container" style="margin-top:150px">
	<div class="col-12">
	
	
<div class="row">
	<div class="col-lg-9">
	<H2><strong>게시물 수정</strong></H2>
	</div>
	
	<div class="col-lg-3 text-right">
		<button id="submit" type="button" class="btn btn-b">수정</button>
		<button type="button" class="btn btn-a">이전</button>
	</div>	
</div>		

<form class="form-horizontal" name="fileForm" enctype="multipart/form-data">

<input type="hidden" name="userNo" value="${board.user.userNo}"/>
<input type="hidden" name="boardNo" value="${board.boardNo}"/>

<br/>
<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;">
</div>
<br/>


<!-- 텍스트 -->
<div class="row">
		<div class="col-xs-8 col-md-2 text-right" style="padding-top: .5em; padding-bottom: .5em;"><strong>내용</strong></div>
	
			<div class="col-xs-4 col-md-10" style="border-left-width: 0.1em; border-left-style: solid; border-left-color: #777; padding-top: .5em; padding-bottom: .5em;">
			<textarea class="editable" id="boardDetailText" name="boardDetailText">${board.boardDetailText}</textarea>
			</div>	
</div>

<script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
<script>
  
    var editor = new MediumEditor('.editable', {
    	extensions: {
            'imageDragging': {}
        },
        placeholder: {
            text: '내용은 필수 입력사항입니다',
            hideOnClick: false
        }
        
    
    });
    
</script>

<br/>
<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
<br/>
<!-- 지도 -->
<div class="row">
<div class="col-xs-8 col-md-2 text-right" style="padding-top: .5em; padding-bottom: .5em;"><strong>위치정보</strong></div>
<div class="col-xs-4 col-md-10" style="border-left-width: 0.1em; border-left-style: solid; border-left-color: #777; padding-top: .5em; padding-bottom: .5em;">

<input class="btn" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"/>
<input class="btn" type="button" onclick="sample4_execDaumPostCode()" value="지명 검색"/>
<input class="form-control" type="text" name="address" id="sample5_address" placeholder="${board.address}" readOnly value="${board.address}" style="width:35%; margin-top: 5px;"/><br/>
<input type="hidden" name="coord" value="${board.coord}"/><!-- 좌표 -->
<div id="map" style="width:500px; height:500px; margin-top:10px; display:none; z-index: -1;"></div>
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc9c3216a02c263f1acc2c4187e96443&libraries=services"></script>
   <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
               
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                
                var fullAddr = data.jibunAddress; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                   
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        $("input[name='coord']").val(result.y+","+result.x);
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

</div>
</div><!-- 지도 끝 -->

<br/>
<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
<br/>

<!-- 테마 시작 -->
<div class="row">
<div class="col-xs-8 col-md-2 text-right" style="padding-top: .5em; padding-bottom: .5em;"><strong>테마</strong></div>
<div class="col-xs-4 col-md-10" style="border-left-width: 0.1em; border-left-style: solid; border-left-color: #777; padding-top: .5em; padding-bottom: .5em;">


	<c:if test="${user.grade=='0'}">
	<input type="radio" name="userTheme" value="H_spoon" checked="checked"> 흙수저
    <input type="radio" name="userTheme" value="D_spoon" disabled="disabled"> 동수저
    <input type="radio" name="userTheme" value="S_spoon1" disabled="disabled"> 은수저
    <input type="radio" name="userTheme" value="S_spoon2" disabled="disabled"> 은수저
    <input type="radio" name="userTheme" value="G_spoon1" disabled="disabled"> 금수저
    <input type="radio" name="userTheme" value="G_spoon2" disabled="disabled"> 금수저
	</c:if> 
	
	<c:if test="${user.grade=='1'}">
	<input type="radio" name="userTheme" value="H_spoon" ${! empty board.userTheme && board.userTheme=="H_spoon" ? "checked":""}> 흙수저
    <input type="radio" name="userTheme" value="D_spoon" ${! empty board.userTheme && board.userTheme=="D_spoon" ? "checked":""}> 동수저
    <input type="radio" name="userTheme" value="S_spoon1" disabled="disabled"> 은수저
    <input type="radio" name="userTheme" value="S_spoon2" disabled="disabled"> 은수저
    <input type="radio" name="userTheme" value="G_spoon1" disabled="disabled"> 금수저
    <input type="radio" name="userTheme" value="G_spoon2" disabled="disabled"> 금수저
	</c:if> 
	
	<c:if test="${user.grade=='2'}">
	<input type="radio" name="userTheme" value="H_spoon" ${! empty board.userTheme && board.userTheme=="H_spoon" ? "checked":""}> 흙수저
    <input type="radio" name="userTheme" value="D_spoon" ${! empty board.userTheme && board.userTheme=="D_spoon" ? "checked":""}> 동수저
    <input type="radio" name="userTheme" value="S_spoon1" ${! empty board.userTheme && board.userTheme=="S_spoon1" ? "checked":""}> 은수저
    <input type="radio" name="userTheme" value="S_spoon2" ${! empty board.userTheme && board.userTheme=="S_spoon2" ? "checked":""}> 은수저
    <input type="radio" name="userTheme" value="G_spoon1" disabled="disabled"> 금수저
    <input type="radio" name="userTheme" value="G_spoon2" disabled="disabled"> 금수저
	</c:if> 
	
	<c:if test="${user.grade=='3' || user.grade=='4'}">
	<input type="radio" name="userTheme" value="H_spoon" ${! empty board.userTheme && board.userTheme=="H_spoon" ? "checked":""}> 흙수저
  	<input type="radio" name="userTheme" value="D_spoon" ${! empty board.userTheme && board.userTheme=="D_spoon" ? "checked":""}> 동수저
    <input type="radio" name="userTheme" value="S_spoon1" ${! empty board.userTheme && board.userTheme=="S_spoon1" ? "checked":""}> 은수저
    <input type="radio" name="userTheme" value="S_spoon2" ${! empty board.userTheme && board.userTheme=="S_spoon2" ? "checked":""}> 은수저
    <input type="radio" name="userTheme" value="G_spoon1" ${! empty board.userTheme && board.userTheme=="G_spoon1" ? "checked":""}> 금수저
    <input type="radio" name="userTheme" value="G_spoon2" ${! empty board.userTheme && board.userTheme=="G_spoon2" ? "checked":""}> 금수저
	</c:if>
</div>
</div>
<!-- 테마 끝 -->

<br/>
<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
<br/>

<!-- 해시태그 시작 -->
<div class="row">
<div class="col-xs-8 col-md-2 text-right" style="padding-top: .5em; padding-bottom: .5em;"><strong>해시태그</strong></div>
<div class="col-xs-4 col-md-10" style="border-left-width: 0.1em; border-left-style: solid; border-left-color: #777; padding-top: .5em; padding-bottom: .5em;">

	 <input class="form-control" type="text" name="hashTag" id="hashTag" value="${board.hashTag}"/>
	
</div>
</div>
<!-- 해시태그 끝 -->

<br/>
<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
<br/>


<div class="row">
<div class="col-xs-8 col-md-2 text-right" style="padding-top: .5em; padding-bottom: .5em;"><strong>사진</strong></div>
<div class="col-xs-4 col-md-10" style="border-left-width: 0.1em; border-left-style: solid; border-left-color: #777; padding-top: .5em; padding-bottom: .5em;">

<div id="newPhoto">
	
	<input type="hidden" name="photo1" value="${board.photo1}" id="link"/>
	
	<div id="img_box">
	
	<input class="btn" type="button" value="사진 수정하기" id="edit"/>
	<br/>
	<br/>
	<!-- 원래 이미지 보여주는 부분 시작-->
	<c:if test="${board.photo1 !=null}">
	<img src="${board.photo1}" style="width: 500px;"/>
	</c:if>

	<c:if test="${board.photo2 !=null}">
	<img src="${board.photo2}" name="photo2" value="${board.photo2}" style="width: 500px;"/>
	<input type="hidden" name="photo2" value="${board.photo2}"/>
	</c:if>
	
	<c:if test="${board.photo3 !=null}">
	<img src="${board.photo3}" name="photo3" value="${board.photo3}" style="width: 500px;"/>
	<input type="hidden" name="photo3" value="${board.photo3}"/>
	</c:if>
	<!-- 원래 이미지 보여주는 부분 끝-->
	
	
	</div><!-- /img_box -->
</div><!-- newPhoto -->


</div>
</div>


</form>	
</div><!-- col 12 끝 -->
</div><!-- 컨테이너 끝 -->


<!-- 로딩중 이미지 -->
<div class="wrap-loading display-none">
    <div><img src="/common/images/board/equalizes.gif" style="z-index: 6;"/></div>
</div>   

</body>
</html>