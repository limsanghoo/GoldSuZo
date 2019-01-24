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
		
		alert(boardNo);
		alert(userNo);
		alert($("input[name='commentDetailText']").val());
			
		commentInsert(boardNo, userNo);
	
	});

});

//댓글 등록
function commentInsert(boardNo,userNo){
	
	var data={
			"userNo" : userNo,
			"boardNo" : boardNo,
            "commentDetailText" : $("input[name='commentDetailText']").val()
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
        	
        	alert("성공");
             if(data == 1) {
                commentList(boardNo); //댓글 작성 후 댓글 목록 reload
            }
        }
    }); 
} 


//댓글 리스트
//댓글 목록 : start
   function commentList(boardNo){

       	$.ajax({
           url : '/board/json/listComment/'+boardNo,
           type : 'get',
          // data : {'postNo':postNo},
            success : function(JSONData){
                var a =''; 
                $.each(JSONData, function(i){
                  var list = JSONData[i];
                  console.log("list : "+list);
                   a += '<div class="commentArea'+list.commentNo+'" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                   a += '<div class="commentInfo'+list.commentNo+'">'+'댓글번호 : '+list.commentNo+' / 작성자 : '+list.user.userNickname;
                   a += '<a onclick="commentUpdate('+list.commentNo+',\''+list.commentDetailText+'\')"> 수정 </a>';
                   a += '<a onclick="commentDelete('+list.commentNo+')"> 삭제 </a>';
                   a += '<a onclick="recommentInsert('+list.commentNo+',\''+list.user.userNickname+'\')"> 답글달기 </a></div>';
                   a += '<div class="commentContent"  name="'+list.commentNo+'"> <p> 내용 : '+list.commentDetailText+'</p>';
                   a += '</div></div>';
               });
               $(".commentList").html(a); 
           }
       });
   }
   //댓글 목록 : end
   


</script>

</head>

<body>
		<div class="commentList"></div>
	
		<input type="text" name="commentDetailText" placeholder="댓글을 입력해주세요">
		<input type="button" id="<%=boardNo%>Comment" value="등록">


</body>
</html>