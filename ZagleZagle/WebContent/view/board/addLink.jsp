<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

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
	        	
// 				$("#plus").append(
// 					'<span style="left: '+coordX+'px; top: '+coordY+'px; position: relative;">'
// 					+'<img src="/common/images/board/plus.png">'
// 					+'</span>'
// 				);

				listLink(photo1);
	        }
	    }           
		
	});//ajax 끝
		
}//링크 등록 끝


//링크 리스트
function listLink(photo1){
	
	alert("리스트");
	
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
                 
                 a+='<span style="left: '+list.coordX+'px; top: '+list.coordY+'px; position: absolute; width:100px; background-color:white;">'
                 a+=list.url
                 a+='<input type="hidden" value='+list.linkNo+'>'
                 a+='<input type="button" value="삭제" onclick="deleteLink('+linkNo+')">'
                 a+='</span>'
                 
			 });
			 
			 $(".listLink").html(a); 
		}//success 끝
		
	});//ajax 끝
	
}//링크 리스트 끝


//링크 삭제
function deleteLink(linkNo){
	alert(linkNo);
}





function action_coords(event) {

	var x = event.offsetX;

    var y = event.offsetY;
    

    $("#image_panel").append(
    		'<span class="tags_form" style="left: '+x+'px; top: '+y+'px; position: relative;">'
    		+'<span id="#inputArea">'
    		+'<textarea name="url"></textarea>'
    		+'<input type="hidden" name="coordX" value="'+x+'">'
    		+'<input type="hidden" name="coordY" value="'+y+'">'
    		+'<button id="addLink">등록</button>'
    		+'</span>'
    		+'</span>'
    );

}

</script>

</head>
<body id="body">



	
	
	
	<span style="margin-left: 300px;">
    	<span id="image_panel" style="position:absolute;">
    	</span>
		<!-- <span id="plus" style="position:absolute;"></span> -->
		<span class="listLink" style="position: absolute;"></span>
    	<img src="${board.photo1}" alt="None" onclick="action_coords(event)" style="height: 500px;"> 
    	<input type="hidden" name="photo1" value="${board.photo1}">
    </span>

<input type="button" value="등록">


</body>
</html>