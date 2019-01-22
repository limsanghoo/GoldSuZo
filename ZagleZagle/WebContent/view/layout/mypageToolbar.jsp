<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>


<script>

$(function() {

$("a:contains('작성 게시물 모아보기')").on("click" , function() {
	alert("클릭됨")
	
	$(self.location).attr("href","/mypage/listMyBoard");
	
});


$("a:contains('댓글 작성한 게시물 보기')").on("click" , function() {
	alert("클릭됨")
	
	$(self.location).attr("href","/mypage/listComment");
	
});



$("a:contains('스크랩 게시물 모아보기')").on("click" , function() {
	alert("클릭됨")
	
	$(self.location).attr("href","/mypage/listScrap");
	
});


$("a:contains('좋아요한 게시물 모아보기')").on("click" , function() {
	alert("클릭됨")
	
	$(self.location).attr("href","/mypage/listLike");
	
});




$("a:contains('계좌번호 등록')").on("click" , function() {
	alert("클릭됨")
	
	$(self.location).attr("href","/mypage/addAccount");
	
});


$("a:contains('계좌번호 수정')").on("click" , function() {
	alert("클릭됨")
	
	$(self.location).attr("href","/mypage/updateAccount");
	
});



});
</script>
</head>

<style>
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: #000;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #999;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }

</style>

<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
      </br>
        <a href="#"><h1>Mypage</h1></a>
        </br>
      </li>
      <li><a href="#"><h2>작성 게시물 모아보기</h2></a></li>
      <br><br>
      <li><a href="#"><h2>댓글 작성한 게시물 보기</h2></a></li>
      </br><br>
      <li><a href="#"><h2>스크랩 게시물 모아보기</h2></a></li>
      </br><br>
      <li><a href="#"><h2>좋아요한 게시물 모아보기</h2></a></li>
      </br><br>
      <li><a href="#"><h2>계좌번호 등록</a></h2></li>
      </br><br>
      <li><a href="#"><h2>계좌번호 수정</a></h2></li>
 
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
  
    </div>
  </div>
  <!-- /본문 -->
</div>


</head>
</html>
