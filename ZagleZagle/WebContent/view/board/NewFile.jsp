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