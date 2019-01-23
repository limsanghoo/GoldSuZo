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
			
		replyInsert(boardNo, userNo);
	
	});

});

//댓글 등록
function replyInsert(boardNo,userNo){
	
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
                replyList(boardNo); //댓글 작성 후 댓글 목록 reload
            }
        }
    }); 
} 


//댓글 리스트
//댓글 목록 : start
   function replyList(boardNo){
	
	alert(boardNo);
	
       	$.ajax({
           url : '/board/json/listComment/'+boardNo,
           type : 'get',
          // data : {'postNo':postNo},
           /* success : function(JSONData){
                var a =''; 
                $.each(JSONData, function(i){
                  var list = JSONData[i];
                  console.log("list : "+list);
                   a += '<div class="replyArea'+list.commentNo+'" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                   a += '<div class="replyInfo'+list.commentNo+'">'+'댓글번호 : '+list.commentNo+' / 작성자 : '+list.commentWriterId;
                   a += '<a onclick="replyUpdate('+list.commentNo+',\''+list.commentDetail+'\')"> 수정 </a>';
                   a += '<a onclick="replyDelete('+list.commentNo+')"> 삭제 </a>';
                   a += '<a onclick="reReplyInsert('+list.commentNo+',\''+list.commentWriterId+'\')"> 답글달기 </a></div>';
                   a += '<div class="replyContent"  name="'+list.commentNo+'"> <p> 내용 : '+list.commentDetail+'</p>';
                   a += '</div></div>';
               });
               $(".replyList").html(a); 
           } */
       });
   }
   //댓글 목록 : end


</script>

</head>

<body>
		<div class="replyList"></div>
	
		<input type="text" name="commentDetailText" placeholder="댓글을 입력해주세요" value="">
		<input type="button" id="<%=boardNo%>Comment" value="등록">


</body>
</html>