<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
   
   var boardNo = ${board.boardNo}; //�Խñ� ��ȣ  �ϵ��ڵ�
   
   $(function() {
      $('#save').on("click",function(){ //��� ��� ��ư Ŭ���� 
         console.log("communityNo : "+boardNo);
          //var insertData = $('[name=replyInsertForm]').serialize(); //replyInsertForm�� ������ ������
          //replyInsert(); //Insert �Լ�ȣ��(�Ʒ�)
      });
   });
    
   //��� ��� : start
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
                   a += '<div class="replyInfo'+list.commentNo+'">'+'��۹�ȣ : '+list.commentNo+' / �ۼ��� : '+list.commentWriterId;
                   a += '<a onclick="replyUpdate('+list.commentNo+',\''+list.commentDetail+'\')"> ���� </a>';
                   a += '<a onclick="replyDelete('+list.commentNo+')"> ���� </a>';
                   a += '<a onclick="reReplyInsert('+list.commentNo+',\''+list.commentWriterId+'\')"> ��۴ޱ� </a></div>';
                   a += '<div class="replyContent"  name="'+list.commentNo+'"> <p> ���� : '+list.commentDetail+'</p>';
                   a += '</div></div>';
               });
               $(".replyList").html(a); 
           }
       });
   }
   //��� ��� : end
    
   //��� ��� : start
   function replyInsert(){
       $.ajax({
           url : '/comment/rest/addComment/'+communityNo,
           type : 'post',
           data : JSON.stringify({
                    commentWriterId : $('#userNo').val(), //�ϵ��ڵ� ����
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
                   replyList(); //��� �ۼ� �� ��� ��� reload
               }
           }
       });
   }
   //��� ��� : end
   
   //���� ���
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
                    commentWriterId : $('#userNo').val(), //�ϵ��ڵ� ����
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
                   replyList(); //��� �ۼ� �� ��� ��� reload
               }
           }
       });
   }
    
   //��� ���� - ��� ���� ����� input ������ ���� 
   function replyUpdate(commentNo, commentDetail, commentWriterId){
      var a ='';
      a += '<div class="input-group">';
      a += '<input type="text" class="form-control" name="content_'+commentNo+'" value="'+commentDetail+'"/>';
      a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyUpdateProc('+commentNo+');">����</button> </span>';
      a += '</div>';
      $('.replyContent[name='+commentNo+']').html(a);
      
      var b = '';
      b += '<div class="replyInfo'+commentNo+'">'+'��۹�ȣ : '+commentNo+' / �ۼ��� : '+commentWriterId;
       b += '<a onclick="replyUpdateCancel('+commentNo+',\''+commentDetail+'\');"> ������� </a>';
      $('.replyInfo'+commentNo+'').html(b);
   }
   
   //��� ���� ��� : start
   function replyUpdateCancel(commentNo, commentDetail, commentWriterId){
      var a = '';
         a += '<div class="replyInfo'+commentNo+'">'+'��۹�ȣ : '+commentNo+' / �ۼ��� : '+commentWriterId;
          a += '<a onclick="replyUpdate('+commentNo+',\''+commentDetail+'\')"> ���� </a>';
          a += '<a onclick="replyDelete('+commentNo+')"> ���� </a>';
          a += '<a onclick="reReplyInsert('+commentNo+')"> ��۴ޱ� </a></div>';
          $('.replyInfo'+commentNo+'').html(a);
      
      var b ='';
         b += '<div class="replyContent"  name="'+commentNo+'"> <p> ���� : '+commentDetail+'</p></div>';
         $('.replyContent[name='+commentNo+']').html(b);
   }
   //��� ���� ��� : end   
   
   //���� �ޱ� - ��� ���� ��¿� input �� �߰�
   function reReplyInsert(commentNo, commentWriterId){
       var a ='';
       
       a += '<div class="input-group">';
       a += '<input type="text" class="form-control" id="commentDetail" name="commentDetail" />';
       a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="reReplyText('+commentNo+',\''+commentWriterId+'\');">��۵��</button> </span>';
       a += '</div>';
       
      // $('.replyContent'+cno).html(a);
       $('.replyContent[name='+commentNo+']').append(a);
       
   }
    
   //��� ����
   function replyUpdateProc(commentNo){
       var updateContent = $('[name=content_'+commentNo+']').val();
       
       $.ajax({
           url : '/comment/rest/updateComment',
           type : 'post',
           data : {'commentDetail' : updateContent, 'commentNo' : commentNo},
           success : function(data){
               if(data == 1) replyList(); //��� ������ ��� ��� 
           }
       });
   }
    
   //��� ���� 
   function replyDelete(commentNo){
       $.ajax({
           url : '/comment/rest/deleteComment/'+commentNo,
           type : 'get',
           success : function(data){
               if(data == 1) replyList(); //��� ������ ��� ��� 
           }
       });
   }
   
   $(document).ready(function(){
       replyList(); //������ �ε��� ��� ��� ��� 
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
         <input type="text" class="form-control commentInput" name="commentDetailText" placeholder="����� �Է����ּ���">
         <button type="button" class="btn btn-default btn-md commentSave" id="save">���</button>
         <input type="hidden" id="userNo" name="userNo" value="${user.userNo}">
         <input type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}">
      </div>
      
        <div class="replyList"></div>
           
   </form>
   </div>
      
   
</body>
</html>