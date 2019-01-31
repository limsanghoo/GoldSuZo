<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>listComment</title>

<!-- listBoard에서 파리미터 받기 -->
<%String boardNo=request.getParameter("boardNo");%>


<script type="text/javascript">

$(function(){
	
	$("#<%=boardNo%>Comment").bind("click",function(){
		
 		var boardNo="<%=boardNo%>";
	
		var userNo="${user.userNo}";
		
		var text=$("#<%=boardNo%>commentDetailText").val();
		
		if(userNo==""){
			alert("로그인 후 이용 가능합니다");
			return;
		}
			
		commentInsert(boardNo, userNo, text);
	
	});

});

//댓글 등록

function commentInsert(boardNo,userNo, text){

	
	var data={
			"userNo" : userNo,
			"boardNo" : boardNo,
            "commentDetailText" : text
	};

     $.ajax({
        url : '/board/json/addComment',
        type : 'post',
        data : JSON.stringify(data),
        dataType:"json",
       headers:{
                   "Accept":"application/json",
                   "Content-Type": "application/json"
                },
        success : function(data){
        	
        	$("input[type=text]").val("");
        	
             if(data == 1) {
                commentList(boardNo); //댓글 작성 후 댓글 목록 reload
            }
        }
    }); 
} 

  

//댓글 리스트
   function commentList(boardNo){

       	$.ajax({
           url : '/board/json/listComment/'+boardNo,
           type : 'get',
          // data : {'postNo':postNo},
            success : function(JSONData){
            	
            	var a='';
            	var b='';
            	
                
                $.each(JSONData, function(i){
                	
                  var list = JSONData[i];  
                  
                  var commentNo="'"+list.commentNo+"'";
                  var boardNo="'"+list.board.boardNo+"'";
                  var userNo="'"+list.user.userNo+"'";
                  
                  if(list.commentStatus=='1'){
                  
               		if("${user.userNo}"==list.user.userNo){
              			b='<div class="col-sm-2" style="margin-top: 5px;" onclick="commentDelete('+commentNo+','+boardNo+')"><img src="/common/images/board/trash.png" style="width:20px;"></div>';
              		}else{
              			b='<div class="col-sm-2" style="margin-top: 5px;" onclick="reportComment('+commentNo+','+userNo+')"><img src="/common/images/board/siren.png" style="width:20px;"></div>';
              		}
                                
                   a += '<div class="row commentArea'+list.commentNo+'" style="padding-bottom: 5px; height:30px;">';                           
                   a += '<div class="col-sm-1"><img src="/common/images/profile/'+list.user.profile+'" style="width: 30px; height: 30px; border-radius: 70px;"/></div>';                 
                   a += '<div class="col-sm-3" style="font-size:medium">'+list.user.userNickname+'</div>';                 
                   a += '<div class="col-sm-6" style="font-size:medium">'+list.commentDetailText+'</div>';                   
                   a += b+'<div class="w-100"></div>';                                
                   a += '</div>';
                  }else if(list.commentStatus=='2'){
                   a += '<div class="row commentArea'+list.commentNo+'" style="padding-bottom: 5px;">';
                   a += '<div class="col-sm-4" style="font-size:medium"></div>';
                   a += '<div class="col-sm-6" style="font-size:medium">'+'블라인드 처리된 댓글입니다'+'</div>';
                   a += '<div class="w-100"></div></div>';
                  }
                  
               });
                
               a += '<br/>'; 
               $(".commentList").html(a); 
           }
       });
   }

 //댓글 삭제
function commentDelete(commentNo, boardNo){
   	
         $.ajax({
             url : '/board/json/deleteComment/'+commentNo,
             type : 'get',
             success : function(data){
                 if(data == 1) commentList(boardNo); //댓글 삭제후 목록 출력 
             }
         });
}

//댓글 신고
function reportComment(commentNo, userNo){
	
	//alert(commentNo);
	//alert(userNo);
	
	window.open("/view/board/addReport.jsp?val="+commentNo+userNo, "addReport", "width=300, height=200, resizable=yes" );
}

</script>

<style>

.col-sm-6{

 word-wrap: break-word;
}
</style>


</head>

<body>
		<div class="commentList" align="left" style="padding-left: 10px;"></div>
		
		<div style="padding-bottom: 20px;margin-bottom: 30px;">
		<div class="col-sm-10"><input type="text" id="<%=boardNo%>commentDetailText" placeholder="댓글을 입력해주세요" style="width: 400px;"></div>
		<div class="col-sm-2" style="padding-left: 10;"><input class="btn btn-b" type="button" id="<%=boardNo%>Comment" value="등록" style="width:60px; height:30px; padding:0px;"></div>
		</div>
</body>
</html>