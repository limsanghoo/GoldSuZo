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

<!--  sweetAlert -->     
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 

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
    
    
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {top:0;left:0;bottom:0;width:250px;height:500px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;} 

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
		
		//sweetalert
	      swal("수정 하시겠습니까?","",{
	    	  icon: "info",
	    	  buttons: {
	    	    cancel: "취소",
	    	    catch: {
	    	      text: "수정",
	    	      value: "catch",
	    	    },
	    	  },
	    	})
	    	.then((value) => {
	    	  switch (value) {
	    	    	 
	    	    case "catch":
	    	    	$("form").attr("method" , "POST").attr("action" , "/board/updateBoard").submit();
	    	      break;  	 
	    	  }
	    	});
		
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
		        			url : "http://192.168.0.32:8080/board/json/addBoardVisionTag",
		        			method : "GET",
		        			data : {
		        				link : result.data.link
		        			},
		        			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        			dataType : "text",
		        			success : function (data,status){
		        				var decode=decodeURIComponent(data);//특수문자 포함 디코딩
		        				//alert("decode : "+decode);
		        				
		        				if(decode.charAt(0)=="#" && decode.length!=1){
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

<!-- 주소 시작 -->
<input class="btn" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"/>
<input class="btn" type="button" onclick="ummm()" value="지명 검색"/>
<input class="form-control" type="text" name="address" id="sample5_address" value="${board.address}" readOnly style="width:60%; margin-top: 5px;"/><br/>
<input type="hidden" name="coord" value="${board.coord}"/><!-- 좌표 -->
<div class="row col-md-12">

	<div class="col-md-6" id="map" style="width:600px; height:500px; margin-top:10px; display:none; margin-left: 0px; margin-right: 0px; z-index: -1;"></div>
	
	<div id="menu_wrap" class="col-md-5 bg_white"></div>
		
</div>
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc9c3216a02c263f1acc2c4187e96443&libraries=services"></script>
   <script>
   var markers = [];
   
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    
 // 지도를 보여준다.
    mapContainer.style.display = "block";
    map.relayout();
    
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    
    
    
 // 장소 검색 객체를 생성합니다
    var ps = new daum.maps.services.Places();  

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({zIndex:1});

    function ummm(){
    	
    	

    	a='<div class="option">'+
            	'<div>'+
        			'키워드 : <input type="text" value="" id="keyword" size="15">'+
         			 '<button type="button" onclick="searchPlaces()">검색하기</button>'+ 
 			 	'</div>'+
			'</div>'+
			'<hr>'+
			'<ul id="placesList"></ul>'+
			'<div id="pagination"></div>';
			
		$("#menu_wrap").empty();
		$('#menu_wrap').append(a);
    	
    }
    
 // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {

        var keyword = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB); 
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === daum.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === daum.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === daum.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'), 
        menuEl = document.getElementById('menu_wrap'),
        fragment = document.createDocumentFragment(), 
        bounds = new daum.maps.LatLngBounds(), 
        listStr = '';
        
        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
        
        for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i), 
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, places) {
            	var title = places.place_name;
            	var coordy = places.y;
            	var coordx = places.x;
            	var address = places.address_name;
            	
                daum.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                daum.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
                
                itemEl.onclick =  function () {
                	document.getElementById("sample5_address").value = address;
                    $("input[name='coord']").val(coordy+","+coordx);
                };
                
            })(marker, places[i]);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                    '<div class="info">' +
                    '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                        '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>'; 
        }
                     
          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                    '</div>';           

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new daum.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage 
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i; 

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

     // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {   
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }

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
<!-- 주소 끝 -->
</div>

</div>
<br/>
<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
<br/>

<!-- 테마 시작 -->
<div class="row">
<div class="col-xs-8 col-md-2 text-right" style="padding-top: .5em; padding-bottom: .5em;"><strong>테마</strong></div>
<div class="col-xs-4 col-md-10" style="border-left-width: 0.1em; border-left-style: solid; border-left-color: #777; padding-top: .5em; padding-bottom: .5em;">


	<c:if test="${user.grade=='0'}">
	<input type="radio" name="userTheme" value="H_spoon" checked="checked"> 흙수저
	<img src="/common/images/board/hspoon.png" style="border-radius: 70px; width: 20px;">
	
    <input type="radio" name="userTheme" value="D_spoon" disabled="disabled" style="margin-left: 15px;"> 동수저
    <img src="/common/images/board/dspoon.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="S_spoon1" disabled="disabled" style="margin-left: 15px;"> 은수저
    <img src="/common/images/board/sspoon1.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="S_spoon2" disabled="disabled" style="margin-left: 15px;"> 은수저
    <img src="/common/images/board/sspoon2.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="G_spoon1" disabled="disabled" style="margin-left: 15px;"> 금수저
    <img src="/common/images/board/gspoon1.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="G_spoon2" disabled="disabled" style="margin-left: 15px;"> 금수저
    <img src="/common/images/board/gspoon2.png" style="border-radius: 70px; width: 20px;">    
	</c:if> 
	
	
	<c:if test="${user.grade=='1'}">
	<input type="radio" name="userTheme" value="H_spoon"  ${! empty board.userTheme && board.userTheme=="H_spoon" ? "checked":""} style="margin-left: 15px;"> 흙수저
	<img src="/common/images/board/hspoon.png" style="border-radius: 70px; width: 20px;">
	
    <input type="radio" name="userTheme" value="D_spoon"  ${! empty board.userTheme && board.userTheme=="D_spoon" ? "checked":""} style="margin-left: 15px;"> 동수저
    <img src="/common/images/board/dspoon.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="S_spoon1" disabled="disabled" style="margin-left: 15px;"> 은수저
    <img src="/common/images/board/sspoon1.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="S_spoon2" disabled="disabled" style="margin-left: 15px;"> 은수저
    <img src="/common/images/board/sspoon2.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="G_spoon1" disabled="disabled" style="margin-left: 15px;"> 금수저
    <img src="/common/images/board/gspoon1.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="G_spoon2" disabled="disabled" style="margin-left: 15px;"> 금수저
    <img src="/common/images/board/gspoon2.png" style="border-radius: 70px; width: 20px;">   
	</c:if> 
	
	
	<c:if test="${user.grade=='2'}">
	<input type="radio" name="userTheme" value="H_spoon" ${! empty board.userTheme && board.userTheme=="H_spoon" ? "checked":""} style="margin-left: 15px;"> 흙수저
	<img src="/common/images/board/hspoon.png" style="border-radius: 70px; width: 20px;">
	
    <input type="radio" name="userTheme" value="D_spoon" ${! empty board.userTheme && board.userTheme=="D_spoon" ? "checked":""} style="margin-left: 15px;"> 동수저
    <img src="/common/images/board/dspoon.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="S_spoon1" ${! empty board.userTheme && board.userTheme=="S_spoon1" ? "checked":""} style="margin-left: 15px;"> 은수저
    <img src="/common/images/board/sspoon1.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="S_spoon2" ${! empty board.userTheme && board.userTheme=="S_spoon2" ? "checked":""} style="margin-left: 15px;"> 은수저
    <img src="/common/images/board/sspoon2.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="G_spoon1" disabled="disabled" style="margin-left: 15px;"> 금수저
    <img src="/common/images/board/gspoon1.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="G_spoon2" disabled="disabled" style="margin-left: 15px;"> 금수저
    <img src="/common/images/board/gspoon2.png" style="border-radius: 70px; width: 20px;">
	</c:if> 
	
	
	<c:if test="${user.grade=='3' || user.grade=='4'}">
	<input type="radio" name="userTheme" value="H_spoon" ${! empty board.userTheme && board.userTheme=="H_spoon" ? "checked":""} style="margin-left: 15px;"> 흙수저
	<img src="/common/images/board/hspoon.png" style="border-radius: 70px; width: 20px;">
	
  	<input type="radio" name="userTheme" value="D_spoon" ${! empty board.userTheme && board.userTheme=="D_spoon" ? "checked":""} style="margin-left: 15px;"> 동수저
    <img src="/common/images/board/dspoon.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="S_spoon1" ${! empty board.userTheme && board.userTheme=="S_spoon1" ? "checked":""} style="margin-left: 15px;"> 은수저
    <img src="/common/images/board/sspoon1.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="S_spoon2" ${! empty board.userTheme && board.userTheme=="S_spoon2" ? "checked":""} style="margin-left: 15px;"> 은수저
    <img src="/common/images/board/sspoon2.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="G_spoon1" ${! empty board.userTheme && board.userTheme=="G_spoon1" ? "checked":""} style="margin-left: 15px;"> 금수저
    <img src="/common/images/board/gspoon1.png" style="border-radius: 70px; width: 20px;">
    
    <input type="radio" name="userTheme" value="G_spoon2" ${! empty board.userTheme && board.userTheme=="G_spoon2" ? "checked":""} style="margin-left: 15px;"> 금수저
	<img src="/common/images/board/gspoon2.png" style="border-radius: 70px; width: 20px;">
	</c:if>
	
	
	
</div>
</div>
<!-- 테마 끝 -->


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


</form>	
</div><!-- col 12 끝 -->
</div><!-- 컨테이너 끝 -->


<!-- 로딩중 이미지 -->
<div class="wrap-loading display-none">
    <div id="preloader" style="background:none; "></div>
</div>   

</body>
</html>