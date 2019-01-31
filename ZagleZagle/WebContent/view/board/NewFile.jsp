<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/demo.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet">

<title>addBoard</title>


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
            margin-top: 10px;
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
	var file = document.getElementById('file');
	var image = document.getElementById('image');

	file.onchange = function (event) {
		
	  $('.wrap-loading').removeClass('display-none'); //로딩중 이미지 보여주기
		
	  var target = event.currentTarget;
	  var xmlHttpRequest = new XMLHttpRequest();
	  xmlHttpRequest.open('POST', 'https://api.imgur.com/3/image/', true); //원래 true
	  xmlHttpRequest.setRequestHeader("Authorization", "Client-ID c764d6730f6f9a6");
	  xmlHttpRequest.onreadystatechange = function () {

	    if (xmlHttpRequest.readyState == 4) {
	      if (xmlHttpRequest.status == 200) {
	        var result = JSON.parse(xmlHttpRequest.responseText);
	        $("#img_box").append("<img src='"+result.data.link+"' name='img' style='width: 500px;'>");//이미지 미리보기
	        
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
	        				
	        				var tagArea=$("#hashTag");
	        				tagArea.val(tagArea.val()+decode);//해시태그 append
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
	});


//등록 클릭
$(function(){
   $('#submit').bind("click",function(){
	   
	  var imgLength=$("img[name='img']").length;
      
	  if(imgLength>3){
		alert("사진은 세 장까지 등록 가능합니다.");
		return;
	  }
	   
      var boardDetailText=$("input[name='boardDetailText']").val();
      
      if(boardDetailText==""){
         alert("내용을 입력해주세요.");
         return;
      }
      
         $("form").attr("method" , "POST").attr("action" , "/board/addBoard").submit();
      
   })
});

</script>

</head>

<body>

<jsp:include page="/view/layout/toolbar.jsp"/>

<form class="form-horizontal" name="fileForm" class="form-horizontal" enctype="multipart/form-data">

<div class="container" style="margin-top:150px">
	<div class="col-12">

<div class="row">
	<div class="col-lg-9">
	<H2><strong>게시물 등록</strong></H2>
	</div>
	
	<div class="col-lg-3 text-right">
		<button type="button" class="btn btn-b">등록</button>
		<button type="button" class="btn btn-a">이전</button>
	</div>
	
</div><!-- row 끝 -->

<input type="hidden" name="userNo" value="${param.userNo}"/><!-- value 수정해야함 -->

<div>
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"/>
<input type="button" onclick="sample4_execDaumPostCode()" value="지명 검색"/>
<input type="text" name="address" id="sample5_address" placeholder="검색버튼을 눌러주세요" readOnly/><br/>
<input type="hidden" name="coord" value=""/><!-- 좌표 -->
<div id="map" style="width:500px;height:500px;margin-top:10px;display:none;"></div>
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
<br/>

테마선택
<div class="userTheme">
   <input type="radio" name="userTheme" value="H_spoon" checked="checked"> 흙수저
   <input type="radio" name="userTheme" value="D_spoon"> 동수저
   <input type="radio" name="userTheme" value="S_spoon"> 은수저
   <input type="radio" name="userTheme" value="G_spoon"> 금수저
</div>
<br/>

내용
<!-- <div>
   <input type="text" name="boardDetailText" value=""/>
   <textarea cols="50px" rows="10px" name="boardDetailText" value=""></textarea>
</div>
<br/> -->


			<div class="container">
				<textarea class="editable" id="boardDetailText" name="boardDetailText"></textarea>
			</div>

    <script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
    <script>
  
    var editor = new MediumEditor('.editable', {
    	extensions: {
            'imageDragging': {}
        },
        placeholder: {
            text: '여기에 글을 작성 해 주세요',
            hideOnClick: true
        }
    
    });

    </script>



해시태그
<div>
   <input type="text" name="hashTag" id="hashTag" value=""/>
</div>
<br/>

<div>
	<input id=file type=file multiple="multiple" style="display: inline;">* 사진은 하나씩 등록해주세요!<br/>
	<div id="img_box"></div>
</div>

<input type="hidden" id="link" value="" name="photo1"/><!-- 이미지 링크 append 되는 부분 -->


</div><!-- col-12 끝 -->
</div><!-- 컨테이너 끝 -->

</form>

<!-- 로딩중 이미지 -->
<div class="wrap-loading display-none">
    <div><img src="/common/images/board/equalizes.gif"/></div>
</div>    


<div style="text-align: center">
   <input type="button" id="submit" value="등록"/>
   <input type="button" id="cancel" value="취소"/>
</div>


</body>

</html>