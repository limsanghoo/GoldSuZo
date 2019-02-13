<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<!-- sweetAlert -->
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

<title>addLink</title>

<script type="text/javascript">

$(function(){
	
	//동적으로 추가된 태그는 이렇게 이벤트 걸어줘야 함
	$(document).on("click","#addLink",function(){
		
		var photo1=$("input[name='photo1']").val();
		//alert(photo1);
		
		var url=$("textarea[name='url']").val();
		//alert(url);
		
		var coordX=$("input[name='coordX']").val();
		//alert(coordX);
		
		var coordY=$("input[name='coordY']").val();
		//alert(coordY);
		
		
		addLink(photo1, url, coordX, coordY);
		
	});
	
	
	$("#submit").on("click",function(){
		
		swal("태그 등록 완료!","",{
	         icon: "success",
	         buttons: {
	           catch: {
	             text: "확인",
	             value: "catch",
	           },
	         },
	       })
	       .then((value) => {
	         switch (value) {
	        	        
	           case "catch":
	             close();
	             break;	        
	         }
	       });
	});

});


//링크 등록
function addLink(photo1, url, coordX, coordY){
	
	var data={
			"photo1" : photo1,
			"url" : url,
			"coordX" : coordX,
			"coordY" : coordY
	};
	
	$.ajax({
		url : '/board/json/addLink',
		type : 'POST',
		data : JSON.stringify(data),
		dataType:"json",
	    headers:{
	                   "Accept":"application/json",
	                   "Content-Type": "application/json"
	                },
	    success : function(data){
	                	
	        if(data == 1) {
	        	
	        	$("#image_panel").empty();

				listLink(photo1); //링크 추가후 바로 리스트 불러오기
	        }
	    }           
		
	});//ajax 끝
		
}//링크 등록 끝


//링크 리스트
function listLink(photo1){
	
	var data={"photo1" : photo1};
	
	$.ajax({
		url : '/board/json/listLink',
		type: 'POST',
		data : JSON.stringify(data),
		headers:{
            "Accept":"application/json",
            "Content-Type": "application/json"
         },
		success:function(JSONData){
			
			var a='';
			
			 $.each(JSONData, function(i){
             	
                 var list = JSONData[i];
                 
                 var linkNo="'"+list.linkNo+"'"; 
                 var url="'"+list.url+"'";            
                 var coordX="'"+list.coordX+"'";                 
                 var coordY="'"+list.coordY+"'";
                 var photo1="'"+list.photo1+"'";
                 
                 a+='<span style="left: '+list.coordX+'px; top: '+list.coordY+'px; position: absolute;">'
                 
                 a+='<div style="background-color:white; width:150px; word-break:break-all; font-size:small;">'+list.url+'</div>'
                 a+='<input type="hidden" value='+list.linkNo+'>'
                 a+='<button class="btn" style="margin-top:5px;" onclick="deleteLink('+linkNo+','+photo1+')">삭제</button>'               
                 a+='</span>'             
                 
			 });
			 
			 $(".listLink").html(a); 
		}//success 끝
		
	});//ajax 끝
	
}//링크 리스트 끝


//링크 삭제
function deleteLink(linkNo,photo1){

	$.ajax({
		url : '/board/json/deleteLink/'+linkNo,
		type : 'GET',
		success : function(data){
			if(data == 1){
			
				listLink(photo1); //링크 삭제 후 바로 리스트 불러오기
			}
		}
	});

}




//클릭 위치
function action_coords(event) {

	var x = event.offsetX;

    var y = event.offsetY;
    

    $("#image_panel").append(
    		'<span style="left: '+x+'px; top: '+y+'px; position: relative; display: block;">'
    		+'<span>'
    		+'<textarea name="url" style="font-size:small;"></textarea>'
    		+'<input type="hidden" name="coordX" value="'+x+'">'
    		+'<input type="hidden" name="coordY" value="'+y+'">'
    		+'<br/>'
    		+'<button class="btn" id="addLink" style="margin-top:5px;">등록</button>'
    		+'</span>'
    		+'</span>'
    );

}


//부모창에서 photo1 받아오기
$(function(){

window.onload = function () {
	var search = window.location.search;
    var getData =  decodeURI(search);
    
    var photo1=getData.substring(5);

    
   $(".photo1").attr("src",photo1);
   $(".photo1").val(photo1);
}

});




</script>

</head>
<body id="body" style="text-align: center;">

<br/>
	
	<div>
    	<span id="image_panel" style="position:absolute;">
    	</span>
		<span class="listLink" style="position: absolute;"></span>
    	<img class="photo1" src="" alt="None" onclick="action_coords(event)" style="width: 466px;"> 
    	<input type="hidden" class="photo1" name="photo1" value="">
    </div>

<br/><br/>

<input class="btn btn-b" type="button" id="submit" value="등록" style="text-align: center;">

</body>
</html>