<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
    <meta charset="UTF-8">
    <title>Dongne Vangne</title>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}


        div.row{
        	padding-top : 150px;
        }
     


</style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>



<body style="background-color: #eaf2ec">

<jsp:include page="/view/layout/toolbar.jsp" />


<div class="row"style="text-align: center; display: inherit;">
				<select name="state" class="ct_input_g" style="width: 200px; height: 40px; background-color: white;" onchange="fncGetState(this)">
					<option value='' style="font-size:20px;"  selected>시·도</option>
					<c:set var="i" value="0"/>
					<c:forEach var="local" items="${list}">
					<c:set var="i" value="${i+1}"/>
					<option value='${local.stateCode}' style="font-size:20px;">${local.stateName}</option>
					</c:forEach>
				</select>
				
				<select name="city"  class="ct_input_g" style="width: 200px; height: 40px; background-color: white;" onchange="fncGetCity(this)">
					<option value="" style="font-size:20px;">시·군·구</option>
				</select>
        
				<select name="town"  class="ct_input_g" style="width: 200px; height: 40px; background-color: white;" onchange="fncGetTown(this)">
					<option value="" style="font-size:20px;">읍·면·동</option>
				</select>  
				
				            
			</div>
<br/>
<div id="map" style="width:80%;height:70%;margin: auto"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc9c3216a02c263f1acc2c4187e96443&libraries=services"></script>
<script>
var local = null;

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(37.49463908698535, 127.02799333430488), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
var imageSrc = "/common/images/icons8-place-marker-filled-64 (2).png";


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
	
	$.ajax(
			{
				url : "/board/json/listMap/getMaplist/"+local,
				method : "GET",
				header : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data, status){
					
					//alert("다녀옴");
					//alert(data);
					
					hideMarkers();
					if (data=='') {
					moveMap(local);
					
					swal({
						  title: "등록된 게시물이 없습니다.",
						  icon:"error",
						  buttons: ["취소", "게시물 등록"]
						})
						.then((willDelete) => {
						  if (willDelete) {
						  	self.location="http://192.168.0.18:8080/board/addBoard?userNo=${user.userNo}";
						  }
						});
					
					
					}else{
					markerMake(data);
					}
				}
				
			});
}

var markers = [];
var infowindow = [];
var marker;


function markerMake(data){
	
	var bounds = new daum.maps.LatLngBounds();
	
	for (var i = 0; i < data.length; i ++) {

	var coordArray = data[i].coord.split(',');
	var coordy = Number(coordArray[0]);
	var coordx = Number(coordArray[1]);
	
	var markerPosition  = new daum.maps.LatLng(coordy, coordx); 
	var boardNo = data[i].boardNo;
	//alert(boardNo);
	bounds.extend(markerPosition);
	
	 // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(50, 50); 
	 var imageOption = {offset: new daum.maps.Point(25, 40)};
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption); 
    
	// 마커를 생성합니다
	marker = new daum.maps.Marker({
		map: map,
	    position: markerPosition,
	    image : markerImage // 마커 이미지 
	});
	
	var content = '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
   data[i].address +
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="'+data[i].photo1+'" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis">'+data[i].boardDetailText+'</div>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';

    var overlay = new daum.maps.CustomOverlay({
        content: content,
        position: marker.getPosition()       
    });
    
	markers.push(marker);
	
	 daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, overlay));
	 daum.maps.event.addListener(marker, 'mouseout', makeOutListener(overlay));
	 daum.maps.event.addListener(marker, 'click', goBoardNo(data[i]));

}
	map.setBounds(bounds);
}//for문 종료

function makeOverListener(map, marker, overlay) {
    return function() {
        overlay.setMap(map);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(overlay) {
    return function() {
    	overlay.setMap(null);
    };
}

function goBoardNo(data){
	return function(){
		self.location='/board/getBoard?boardNo='+data.boardNo;
	};
}

function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}

function showMarkers() {
    setMarkers(map)    
}

function hideMarkers() {
    setMarkers(null);
    markers = [];
}

function moveMap(local){
	var ps = new daum.maps.services.Places(); 

	// 키워드로 장소를 검색합니다
	ps.keywordSearch(local, placesSearchCB); 

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === daum.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new daum.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
	        }       

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(place.y, place.x) 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    daum.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}

}

</script>
</body>
</html>