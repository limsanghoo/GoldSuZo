<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->

<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous"> -->

<!-- Optional theme -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR" crossorigin="anonymous"> -->

<!-- Latest compiled and minified JavaScript -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script> -->


<style type="text/css">
   .giyong{
      margin-left : 100px;
   }
</style>
<script type="text/javascript">
   
   var boardNo = ${board.boardNo}; //게시글 번호  하드코딩
   
   $(function() {
      $('#save').on("click",function(){ //댓글 등록 버튼 클릭시 
         console.log("communityNo : "+boardNo);
          //var insertData = $('[name=replyInsertForm]').serialize(); //replyInsertForm의 내용을 가져옴
          //replyInsert(); //Insert 함수호출(아래)
      });
   });
    
   //댓글 목록 : start
   function replyList(){
       $.ajax({
           url : '/comment/rest/getCommentList/'+communityNo,
           type : 'get',
          // data : {'postNo':postNo},
           success : function(JSONData){
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
           }
       });
   }
   //댓글 목록 : end
    
   //댓글 등록 : start
   function replyInsert(){
       $.ajax({
           url : '/comment/rest/addComment/'+communityNo,
           type : 'post',
           data : JSON.stringify({
                    commentWriterId : $('#userNo').val(), //하드코딩 수정
                    commentComuNo : communityNo,
                    commentDetail : $('[name=commentDetail]').val()
                    }),
           dataType:"json",
          headers:{
                      "Accept":"application/json",
                      "Content-Type": "application/json"
                   },
           success : function(data){
               if(data == 1) {
                   replyList(); //댓글 작성 후 댓글 목록 reload
               }
           }
       });
   }
   //댓글 등록 : end
   
   //대댓글 등록
   function reReplyText(targetNo, commentWriterId){
      console.log("targetNo : "+targetNo);
      console.log("commentWriterId : "+commentWriterId);
      console.log("commentComuNo : "+communityNo);
      console.log("Detail : "+$("#commentDetail").val());
       $.ajax({
           url : '/comment/rest/addReComment/'+targetNo,
           type : 'post',
           data : JSON.stringify({
                    targetNo : targetNo,
                    commentWriterId : $('#userNo').val(), //하드코딩 수정
                    commentComuNo : communityNo,
                    commentDetail : $('#commentDetail').val()
                    }),
            dataType:"json",
              headers:{
                          "Accept":"application/json",
                          "Content-Type": "application/json"
                       },
           success : function(data){
               if(data == 1) {
                   replyList(); //댓글 작성 후 댓글 목록 reload
               }
           }
       });
   }
    
   //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
   function replyUpdate(commentNo, commentDetail, commentWriterId){
      var a ='';
      a += '<div class="input-group">';
      a += '<input type="text" class="form-control" name="content_'+commentNo+'" value="'+commentDetail+'"/>';
      a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyUpdateProc('+commentNo+');">수정</button> </span>';
      a += '</div>';
      $('.replyContent[name='+commentNo+']').html(a);
      
      var b = '';
      b += '<div class="replyInfo'+commentNo+'">'+'댓글번호 : '+commentNo+' / 작성자 : '+commentWriterId;
       b += '<a onclick="replyUpdateCancel('+commentNo+',\''+commentDetail+'\');"> 수정취소 </a>';
      $('.replyInfo'+commentNo+'').html(b);
   }
   
   //댓글 수정 취소 : start
   function replyUpdateCancel(commentNo, commentDetail, commentWriterId){
      var a = '';
         a += '<div class="replyInfo'+commentNo+'">'+'댓글번호 : '+commentNo+' / 작성자 : '+commentWriterId;
          a += '<a onclick="replyUpdate('+commentNo+',\''+commentDetail+'\')"> 수정 </a>';
          a += '<a onclick="replyDelete('+commentNo+')"> 삭제 </a>';
          a += '<a onclick="reReplyInsert('+commentNo+')"> 답글달기 </a></div>';
          $('.replyInfo'+commentNo+'').html(a);
      
      var b ='';
         b += '<div class="replyContent"  name="'+commentNo+'"> <p> 내용 : '+commentDetail+'</p></div>';
         $('.replyContent[name='+commentNo+']').html(b);
   }
   //댓글 수정 취소 : end   
   
   //대댓글 달기 - 댓글 내용 출력에 input 폼 추가
   function reReplyInsert(commentNo, commentWriterId){
       var a ='';
       
       a += '<div class="input-group">';
       a += '<input type="text" class="form-control" id="commentDetail" name="commentDetail" />';
       a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="reReplyText('+commentNo+',\''+commentWriterId+'\');">답글등록</button> </span>';
       a += '</div>';
       
      // $('.replyContent'+cno).html(a);
       $('.replyContent[name='+commentNo+']').append(a);
       
   }
    
   //댓글 수정
   function replyUpdateProc(commentNo){
       var updateContent = $('[name=content_'+commentNo+']').val();
       
       $.ajax({
           url : '/comment/rest/updateComment',
           type : 'post',
           data : {'commentDetail' : updateContent, 'commentNo' : commentNo},
           success : function(data){
               if(data == 1) replyList(); //댓글 수정후 목록 출력 
           }
       });
   }
    
   //댓글 삭제 
   function replyDelete(commentNo){
       $.ajax({
           url : '/comment/rest/deleteComment/'+commentNo,
           type : 'get',
           success : function(data){
               if(data == 1) replyList(); //댓글 삭제후 목록 출력 
           }
       });
   }
   
   $(document).ready(function(){
       replyList(); //페이지 로딩시 댓글 목록 출력 
   });
   
</script>

<style>
   .commentWrap{
      margin-top : 40px;
      padding : 20px;
      background-color : #EEEEEE;
   }
   
   .commentForm{
      overflow : hidden;
   }
   
   .commentInput{
      width : 93%;
      float : left;
   }
   
   .commentSave{
      float : right;
   }
</style>

</head>
<body>
   
   <div class="commentWrap">
      
   <form>
      
      <div class="form-group commentForm">
         <input type="text" class="form-control commentInput" name="commentDetailText" placeholder="댓글을 입력해주세요">
         <button type="button" class="btn btn-default btn-md commentSave" id="save">등록</button>
         <input type="hidden" id="userNo" name="userNo" value="${user.userNo}">
         <input type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}">
      </div>
      
        <div class="replyList"></div>
           
   </form>
   </div>
      
   

</body>
</html>