<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addBoard</title>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">


//등록 클릭
$(function(){
   $('#submit').bind("click",function(){
      
      var boardDetailText=$("input[name='boardDetailText']").val();
      
      if(boardDetailText==""){
         alert("내용을 입력해라");
      }
         //$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/board/addBoard").submit();
         $("form").attr("method" , "POST").attr("action" , "/board/addBoard").submit();
      
   })
});



//다중 이미지 미리보기
function fileInfo(f){
   var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음

   // 파일의 갯수만큼 반복
   for(var i=0; i<file.length; i++){

      var reader = new FileReader(); // FileReader 객체 사용
      
      reader.onload = function(rst){
         $('#img_box').append('<img src="'+rst.target.result+'">'); // append 메소드를 사용해서 이미지 추가
         // 이미지는 base64 문자열로 추가
         // 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
         
      }   
      
      reader.readAsDataURL(file[i]); // 파일을 읽는다
            
   }

}
</script>

</head>

<body>

<form name="fileForm" class="form-horizontal" enctype="multipart/form-data">

<input type="hidden" name="userNo" value="${user.userNo}"/><!-- value 수정해야함 -->

<div style="text-align:center;">
   <input multiple="multiple" type="file" style="width:500px;" accept="image/*" multiple onchange="fileInfo(this)" name="file"/><br>
   <div id="img_box"></div>
</div>

<div>
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"/>
<input type="button" onclick="sample4_execDaumPostCode()" value="지명 검색"/><hr/>
<input type="text" name="address" id="sample5_address" placeholder="검색버튼을 눌러주세요" readOnly/><br/>
<input type="hidden" name="coord" value=""/><!-- 좌표 -->
<div id="map" style="width:500px;height:500px;margin-top:10px;display:none"></div>
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
<div>
   <input type="text" name="boardDetailText" value=""/>
</div>
<br/>

해시태그
<div>
   <input type="text" name="hashTag"/>
</div>
<br/>


</form>

<div>
   <input type="button" id="submit" value="등록"/>
   <input type="button" id="cancel" value="취소"/>
</div>

</body>

</html>