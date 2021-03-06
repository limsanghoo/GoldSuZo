<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 <!--  sweetAlert -->     
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      
      <!-- Favicons -->
  <link href="/common/css/estateagency-master/img/favicon2.png" rel="icon">
  <link href="/common/css/estateagency-master/img/apple-touch-icon2.png" rel="apple-touch-icon">
      
<script>

$(function() {

	
	
swal({
	  title: "추가정보를 입력해 주세요.",
	

	  buttons: true,
	  buttons: true,
	 
	})
	.then((willDelete) => {
	  if (willDelete) {
	  
			return;
			  
	  } else {
		  	
		  
					
			 swal("기입을 취소하셨습니다. 메인화면으로 돌아갑니다.");
			 
		 		opener.location.replace("/board/listBoard/");
	 	
	  }
		 
		window.close();
		
	});

});


function fncAddUser() {
   
   

   
   history.replaceState({}, null, location.pathname);
   
   var name=$("input[name='userName']").val();
   var nickName=$("input[name='userNickname']").val();
   var birth=$("input[name='userBirth']").val();
   var userAddr=$("input[name='userAddr']").val();
   var profile=$("input[name='profile']").val();
   

   
   if(name.length < 1) {
	      swal("이름을 입력하세요")
	      return;
	   }
   
   if(nickName.length < 1) {
	      swal("닉네임을 입력하세요")
	      return;
	   }


   
   
   
   if(birth.length != 6) {
      swal("주민등록번호 앞자리를 입력해주세요")
      return;
   }
   
  
   if(userAddr.length < 1) {
	   
	swal("주소를 입력해주세요.");
	return
   }
   
   $("#goCon").attr("method" , "POST").attr("action" , "/user/addUser").submit();
}




//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
var nicCheck = 0;
var pwdCheck = 0;
//아이디 체크하여 가입버튼 비활성화, 중복확인.
function checkNickname() {
    var inputed = $("#userNickname").val();
    $.ajax({
        data : {
             userNickname : inputed
        },
        url : "/user/checkNickname/{userNickname}",
        success : function(data) {
           
       
           
            if(inputed=="" && data=='0') {
                $("#agreement").prop("disabled", true);
                $("#agreement").css("background-color", "#aaaaaa");
                $("#userNickname").css("background-color",  "rgba(255, 255, 255, 0)");
               	$("#footText").text("닉네임을 입력하세요.")   
 			
         
            }else if(data =='0') {
                    $("#agreement").prop("disabled", false);
                      $("#agreement").css("background-color", "#2eca6a");
                      $("#userNickname").css("background-color", "#2eca6a");
                  	$("#footText").text("사용가능한 닉네임입니다.")
          		
            }else if (data == '1') {
                $("#agreement").prop("disabled", true);
                $("#agreement").css("background-color", "#aaaaaa");
                $("#userNickname").css("background-color", "#FFCECE");
                
            	$("#footText").text("중복된 닉네임입니다. 다른 닉네임을 사용하세요.")   
               
            } 
        }
    });
}





function fncGetState(){
   
   var stateCode = $("select[name=state]").val();
   
   
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
                  temp = "<option value='"+data[index].cityCode+"' style='font-size:20px; color: black;'>"+data[index].cityName+"</option>";
                  display += temp;
               });
               
               $("select[name=city]").children("option").not("option:nth-child(1)").remove();
               $("select[name=city]").append(display);
            }
            
         }
         
      });
}


function fncGetTown(){
   var stateName = $("select[name=state] option:checked").text();
   var cityName = $("select[name=city] option:checked").text();
   var townName = $("select[name=town] option:checked").text();
   
   var local = stateName+" "+cityName+" "+townName;
   
   $("input:hidden[name='userAddr']").val( local );
}

$(function() {
   
   $('#broll').on('change',function(){
	   
	   var form = $("#perioe")[0];
        var formData = new FormData(form);
        
  
			
        
           var ajaxReq = $.ajax({
                type : 'post',
                url : '/user/json/uploadFile/',
                data : formData,
                processData : false,
                contentType : false,
              
                success : function(data, statusText, xhr) {                                      
               //    $("#msg").val(data);
                  alert(data)
                  
                  alert("프로필 사진 등록 성공") 
                 
      
                },
                error : function(error) {
                    alert("파일 업로드에 실패하였습니다.");
                    console.log(error);
                    console.log(error.status);
                }
            });
           
           
        
           ajaxReq.done(function(data){
        	   
        	   	alert(data)
        	  
       		 $("#coffee").val(data);
    
      	
              
              if(data == "") {
            	  
            	  alert("데이터 없음")
            	  
              } else  {
              
              setTimeout(function() {
                     while(true){
                        var path = 'http://192.168.0.46:8080/common/images/profile/'+data;
                        var re = doesFileExist(path);
                        if (re) {
                           
                           $("#uploadPro").html("<img src='/common/images/profile/"+data+"'/>")
                           
                        break;
                     }
                     }
                  },2000);
            
              }
              
           });
           
           function doesFileExist(urlToFile) {
             var xhr = new XMLHttpRequest();
             xhr.open('HEAD', urlToFile, false);
             xhr.send();
              
             if (xhr.status == "404") {
                 return false;
             } else {
                 return true;
             }
         }



    });   
});



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
                  temp = "<option value='"+data[index].townCode+"' style='font-size:20px; color: black;'>"+data[index].townName+"</option>";
                  display += temp;
               });
               
               $("select[name=town]").children("option").not("option:nth-child(1)").remove();
               $("select[name=town]").append(display);
            }
            
         }
         
      });
}



   
</script>

<style>
/*--
Author: Colorlib
Author URL: https://colorlib.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
--*/
/*-- reset --*/
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, dl, dt, dd, ol, nav ul, nav li, fieldset, form,  legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
  display: block;
}

ol, ul {
  list-style: none;
  margin: 0px;
  padding: 0px;
}

blockquote, q {
  quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
  content: '';
  content: none;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

/*-- start editing from here --*/
a {
  text-decoration: none;
}

.txt-rt {
  text-align: right;
}

/* text align right */
.txt-lt {
  text-align: left;
}

/* text align left */
.txt-center {
  text-align: center;
}

/* text align center */
.float-rt {
  float: right;
}

/* float right */
.float-lt {
  float: left;
}

/* float left */
.clear {
  clear: both;
}

/* clear float */
.pos-relative {
  position: relative;
}

/* Position Relative */
.pos-absolute {
  position: absolute;
}

/* Position Absolute */
.vertical-base {
  vertical-align: baseline;
}

/* vertical align baseline */
.vertical-top {
  vertical-align: top;
}

/* vertical align top */
nav.vertical ul li {
  display: block;
}

/* vertical menu */
nav.horizontal ul li {
  display: inline-block;
}

/* horizontal menu */
img {
  max-width: 100%;
}

/*-- end reset --*/
body {
  background: #76b852;
  /* fallback for old browsers */
  background: -webkit-linear-gradient(to top, #76b852, #8DC26F);
  background: -moz-linear-gradient(to top, #76b852, #8DC26F);
  background: -o-linear-gradient(to top, #76b852, #8DC26F);
  background: linear-gradient(to top, #76b852, #8DC26F);
  background-size: cover;
  background-attachment: fixed;
  font-family: 'Roboto', sans-serif;
}

h1 {
  font-size: 3em;
  text-align: center;
  color: #fff;
  font-weight: 100;
  text-transform: capitalize;
  letter-spacing: 4px;
  font-family: 'Roboto', sans-serif;
}

/*-- main --*/
.main-w3layouts {
  padding: 3em 0 1em;
}

.main-agileinfo {
  width: 35%;
  margin: 3em auto;
  background: rgba(0, 0, 0, 0.18);
  background-size: cover;
}

.agileits-top {
  padding: 3em;
}

select {
 font-size: 0.9em;
  color: #fff;
  font-weight: 100;
  width: 25%;
  display: inline-flex;
  border: none;
  padding: 0.8em;
  border: solid 1px rgba(255, 255, 255, 0.37);
  -webkit-transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
  transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
  background: -webkit-linear-gradient(top, rgba(255, 255, 255, 0) 96%, #fff 4%);
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 96%, #fff 4%);
  background-position: -800px 0;
  background-size: 100%;
  background-repeat: no-repeat;
  color: #fff;
  font-family: 'Roboto', sans-serif;

 
 

}

input[type="text"], input[type="email"], input[type="password"] {
  font-size: 0.9em;
  color: #fff;
  font-weight: 100;
  width: 94.5%;
  display: block;
  border: none;
  padding: 0.8em;
  border: solid 1px rgba(255, 255, 255, 0.37);
  -webkit-transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
  transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
  background: -webkit-linear-gradient(top, rgba(255, 255, 255, 0) 96%, #fff 4%);
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 96%, #fff 4%);
  background-position: -800px 0;
  background-size: 100%;
  background-repeat: no-repeat;
  color: #fff;
  font-family: 'Roboto', sans-serif;
}

input.email, input.text.w3lpass {
  margin: 2em 0;
}

.text:focus, .text:valid {
  box-shadow: none;
  outline: none;
  background-position: 0 0;
}

.text:focus::-webkit-input-placeholder, .text:valid::-webkit-input-placeholder {
  color: rgba(255, 255, 255, 0.7);
  font-size: .9em;
  -webkit-transform: translateY(-30px);
  -moz-transform: translateY(-30px);
  -o-transform: translateY(-30px);
  -ms-transform: translateY(-30px);
  transform: translateY(-30px);
  visibility: visible !important;
}

::-webkit-input-placeholder {
  color: #fff;
  font-weight: 100;
}

:-moz-placeholder {
  /* Firefox 18- */
  color: #fff;
}

::-moz-placeholder {
  /* Firefox 19+ */
  color: #fff;
}

:-ms-input-placeholder {
  color: #fff;
}

input[type="submit"] {
  font-size: .9em;
  color: #fff;
  background: #76b852;
  outline: none;
  border: 1px solid #76b852;
  cursor: pointer;
  padding: 0.9em;
  -webkit-appearance: none;
  width: 100%;
  margin: 2em 0;
  letter-spacing: 4px;
}

input[type="submit"]:hover {
  -webkit-transition: .5s all;
  -moz-transition: .5s all;
  -o-transition: .5s all;
  -ms-transition: .5s all;
  transition: .5s all;
  background: #8DC26F;
}

.agileits-top p {
  font-size: 1em;
  color: #fff;
  text-align: center;
  letter-spacing: 1px;
  font-weight: 300;
}

.agileits-top p a {
  color: #fff;
  -webkit-transition: .5s all;
  -moz-transition: .5s all;
  transition: .5s all;
  font-weight: 400;
}

.agileits-top p a:hover {
  color: #76b852;
}

/*-- //main --*/
/*-- checkbox --*/
.wthree-text label {
  font-size: 0.9em;
  color: #fff;
  font-weight: 200;
  cursor: pointer;
  position: relative;
}

input.checkbox {
  background: #8DC26F;
  cursor: pointer;
  width: 1.2em;
  height: 1.2em;
}

input.checkbox:before {
  content: "";
  position: absolute;
  width: 1.2em;
  height: 1.2em;
  background: inherit;
  cursor: pointer;
}

input.checkbox:after {
  content: "";
  position: absolute;
  top: 0px;
  left: 0;
  z-index: 1;
  width: 1.2em;
  height: 1.2em;
  border: 1px solid #fff;
  -webkit-transition: .4s ease-in-out;
  -moz-transition: .4s ease-in-out;
  -o-transition: .4s ease-in-out;
  transition: .4s ease-in-out;
}

input.checkbox:checked:after {
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  transform: rotate(-45deg);
  height: .5rem;
  border-color: #fff;
  border-top-color: transparent;
  border-right-color: transparent;
}

.anim input.checkbox:checked:after {
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  transform: rotate(-45deg);
  height: .5rem;
  border-color: transparent;
  border-right-color: transparent;
  animation: .4s rippling .4s ease;
  animation-fill-mode: forwards;
}

@keyframes rippling {
  50% {
    border-left-color: #fff;
  }

  100% {
    border-bottom-color: #fff;
    border-left-color: #fff;
  }
}

/*-- //checkbox --*/
/*-- copyright --*/
.colorlibcopy-agile {
  margin: 2em 0 1em;
  text-align: center;
}

.colorlibcopy-agile p {
  font-size: .9em;
  color: #fff;
  line-height: 1.8em;
  letter-spacing: 1px;
  font-weight: 100;
}

.colorlibcopy-agile p a {
  color: #fff;
  transition: 0.5s all;
  -webkit-transition: 0.5s all;
  -moz-transition: 0.5s all;
  -o-transition: 0.5s all;
  -ms-transition: 0.5s all;
}

.colorlibcopy-agile p a:hover {
  color: #000;
}

/*-- //copyright --*/
.wrapper {
  position: relative;
  overflow: hidden;
}

.colorlib-bubbles {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
}

.colorlib-bubbles li {
  position: absolute;
  list-style: none;
  display: block;
  width: 40px;
  height: 40px;
  background-color: rgba(255, 255, 255, 0.15);
  bottom: -160px;
  -webkit-animation: square 20s infinite;
  -moz-animation: square 250s infinite;
  -o-animation: square 20s infinite;
  -ms-animation: square 20s infinite;
  animation: square 20s infinite;
  -webkit-transition-timing-function: linear;
  -moz-transition-timing-function: linear;
  -o-transition-timing-function: linear;
  -ms-transition-timing-function: linear;
  transition-timing-function: linear;
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  -o-border-radius: 50%;
  -ms-border-radius: 50%;
  border-radius: 50%;
}

.colorlib-bubbles li:nth-child(1) {
  left: 10%;
}

.colorlib-bubbles li:nth-child(2) {
  left: 20%;
  width: 80px;
  height: 80px;
  -webkit-animation-delay: 2s;
  -moz-animation-delay: 2s;
  -o-animation-delay: 2s;
  -ms-animation-delay: 2s;
  animation-delay: 2s;
  -webkit-animation-duration: 17s;
  -moz-animation-duration: 17s;
  -o-animation-duration: 17s;
  animation-duration: 17s;
}

.colorlib-bubbles li:nth-child(3) {
  left: 25%;
  -webkit-animation-delay: 4s;
  -moz-animation-delay: 4s;
  -o-animation-delay: 4s;
  -ms-animation-delay: 4s;
  animation-delay: 4s;
}

.colorlib-bubbles li:nth-child(4) {
  left: 40%;
  width: 60px;
  height: 60px;
  -webkit-animation-duration: 22s;
  -moz-animation-duration: 22s;
  -o-animation-duration: 22s;
  -ms-animation-duration: 22s;
  animation-duration: 22s;
  background-color: rgba(255, 255, 255, 0.25);
}

.colorlib-bubbles li:nth-child(5) {
  left: 70%;
}

.colorlib-bubbles li:nth-child(6) {
  left: 80%;
  width: 120px;
  height: 120px;
  -webkit-animation-delay: 3s;
  -moz-animation-delay: 3s;
  -o-animation-delay: 3s;
  -ms-animation-delay: 3s;
  animation-delay: 3s;
  background-color: rgba(255, 255, 255, 0.2);
}

.colorlib-bubbles li:nth-child(7) {
  left: 32%;
  width: 160px;
  height: 160px;
  -webkit-animation-delay: 7s;
  -moz-animation-delay: 7s;
  -o-animation-delay: 7s;
  -ms-animation-delay: 7s;
  animation-delay: 7s;
}

.colorlib-bubbles li:nth-child(8) {
  left: 55%;
  width: 20px;
  height: 20px;
  -webkit-animation-delay: 15s;
  -moz-animation-delay: 15s;
  animation-delay: 15s;
  -webkit-animation-duration: 40s;
  -moz-animation-duration: 40s;
  animation-duration: 40s;
}

.colorlib-bubbles li:nth-child(9) {
  left: 25%;
  width: 10px;
  height: 10px;
  -webkit-animation-delay: 2s;
  animation-delay: 2s;
  -webkit-animation-duration: 40s;
  animation-duration: 40s;
  background-color: rgba(255, 255, 255, 0.3);
}

.colorlib-bubbles li:nth-child(10) {
  left: 90%;
  width: 160px;
  height: 160px;
  -webkit-animation-delay: 11s;
  animation-delay: 11s;
}

@-webkit-keyframes square {
  0% {
    -webkit-transform: translateY(0);
    -moz-transform: translateY(0);
    -o-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
  }

  100% {
    -webkit-transform: translateY(-700px) rotate(600deg);
    -moz-transform: translateY(-700px) rotate(600deg);
    -o-transform: translateY(-700px) rotate(600deg);
    -ms-transform: translateY(-700px) rotate(600deg);
    transform: translateY(-700px) rotate(600deg);
  }
}

@keyframes square {
  0% {
    -webkit-transform: translateY(0);
    -moz-transform: translateY(0);
    -o-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
  }

  100% {
    -webkit-transform: translateY(-700px) rotate(600deg);
    -moz-transform: translateY(-700px) rotate(600deg);
    -o-transform: translateY(-700px) rotate(600deg);
    -ms-transform: translateY(-700px) rotate(600deg);
    transform: translateY(-700px) rotate(600deg);
  }
}

/*-- responsive-design --*/
@media(max-width:1440px) {
  input[type="text"], input[type="email"], input[type="password"] {
    width: 94%;
  }
}

@media(max-width:1366px) {
  h1 {
    font-size: 2.6em;
  }

  .agileits-top {
    padding: 2.5em;
  }

  .main-agileinfo {
    margin: 2em auto;
  }

  .main-agileinfo {
    width: 36%;
  }
}

@media(max-width:1280px) {
  .main-agileinfo {
    width: 40%;
  }
}

@media(max-width:1080px) {
  .main-agileinfo {
    width: 46%;
  }
}

@media(max-width:1024px) {
  .main-agileinfo {
    width: 49%;
  }
}

@media(max-width:991px) {
  h1 {
    font-size: 2.4em;
  }

  .main-w3layouts {
    padding: 2em 0 1em;
  }
}

@media(max-width:900px) {
  .main-agileinfo {
    width: 58%;
  }

  input[type="text"], input[type="email"], input[type="password"] {
    width: 93%;
  }
}

@media(max-width:800px) {
  h1 {
    font-size: 2.2em;
  }
}

@media(max-width:736px) {
  .main-agileinfo {
    width: 62%;
  }
}

@media(max-width:667px) {
  .main-agileinfo {
    width: 67%;
  }
}

@media(max-width:600px) {
  .agileits-top {
    padding: 2.2em;
  }

  input.email, input.text.w3lpass {
    margin: 1.5em 0;
  }

  input[type="submit"] {
    margin: 2em 0;
  }

  h1 {
    font-size: 2em;
    letter-spacing: 3px;
  }
}

@media(max-width:568px) {
  .main-agileinfo {
    width: 75%;
  }

  .colorlibcopy-agile p {
    padding: 0 2em;
  }
}

@media(max-width:480px) {
  h1 {
    font-size: 1.8em;
    letter-spacing: 3px;
  }

  .agileits-top {
    padding: 1.8em;
  }

  input[type="text"], input[type="email"], input[type="password"] {
    width: 91%;
  }

  .agileits-top p {
    font-size: 0.9em;
  }
}

@media(max-width:414px) {
  h1 {
    font-size: 1.8em;
    letter-spacing: 2px;
  }

  .main-agileinfo {
    width: 85%;
    margin: 1.5em auto;
  }

  .text:focus, .text:valid {
    background-position: 0 0px;
  }

  .wthree-text ul li, .wthree-text ul li:nth-child(2) {
    display: block;
    float: none;
  }

  .wthree-text ul li:nth-child(2) {
    margin-top: 1.5em;
  }

  input[type="submit"] {
    margin: 2em 0 1.5em;
    letter-spacing: 3px;
  }

  input[type="submit"] {
    margin: 2em 0 1.5em;
  }

  .colorlibcopy-agile {
    margin: 1em 0 1em;
  }
}

@media(max-width:384px) {
  .main-agileinfo {
    width: 88%;
  }

  .colorlibcopy-agile p {
    padding: 0 1em;
  }
}

@media(max-width:375px) {
  .agileits-top p {
    letter-spacing: 0px;
  }
}

@media(max-width:320px) {
  .main-w3layouts {
    padding: 1.5em 0 0;
  }

  .agileits-top {
    padding: 1.2em;
  }

  .colorlibcopy-agile {
    margin: 0 0 1em;
  }

  input[type="text"], input[type="email"], input[type="password"], input[type="file"] {
    width: 89.5%;
    font-size: 0.85em;
  }

  h1 {
    font-size: 1.7em;
    letter-spacing: 0px;
  }

  .main-agileinfo {
    width: 92%;
    margin: 1em auto;
  }

  .text:focus, .text:valid {
    background-position: 0 0px;
  }

  input[type="submit"] {
    margin: 1.5em 0;
    padding: 0.8em;
    font-size: .85em;
  }

  .colorlibcopy-agile p {
    font-size: .85em;
  }

  .wthree-text label {
    font-size: 0.85em;
  }

  .main-w3layouts {
    padding: 1em 0 0;
  }
  
 

}


   #uploadPro, img{
         height: 70px;
         width: 70px;
         border:1.5px solid #f5f6fa;
         border-radius: 50%;
         margin : auto;
      }
      
   #camera{
   
   margin : auto;
      
   }   
   
   #footText {
     color: #020000;
     font-size: .85em;
   }
	

	
   
input[type="file"] { /* 파일 필드 숨기기 */ position: absolute; width: 1px; height: 1px; 
padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }


</style>

</head>




<title>Creative Colorlib SignUp Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->


<body>
   <!-- main -->
   <div class="main-w3layouts wrapper">
      <h1>추가정보 입력</h1>
      <div class="main-agileinfo">
         <div class="agileits-top">
         
            <form enctype="multipart/form-data" method="post" id="perioe">
               <input type="file" id="broll" name="proimg"/>
            </form>
            
            
               
               <div id="uploadPro">
               
              
                          
              </div> <br>
              
              <div style="text-align: center;">
              <label for="broll" style="margin: auto;" id="aaa"><br>프로필 등록&nbsp;<i class="glyphicon glyphicon-camera" style="width: 10px; height: 10px;" ></i></label>
           	</div>
           	   <form method="post" id="goCon">
           	
                <input type="hidden" id="coffee" name="profile" value="default.png"/>
               <br>
               
               <input class="text" type="text" name="userName" placeholder="이름을 입력하세요." required="">
               <br>
               <input class="text" type="text" name="userNickname" placeholder="닉네임을 입력하세요."  id="userNickname" name="userNickname" placeholder="중복확인하세요"
                                                                                                                        oninput="checkNickname()" required="">
                                                                                                                        <div id="footText"></div>
                                                                                                               
               
               <br>
               <input class="text" type="text" name="userBirth" placeholder="주민등록번호 앞자리만 입력하세요." required="">
      
               <br>
            
            

            
               <div class="row"style="text-align: center; display: inherit;" >
            <select name="state" class="ct_input_g" onchange="fncGetState(this)">
               <option value='' style="font-size:20px;"  selected>시·도</option>
               
               <c:set var="i" value="0"/>
               <c:forEach var="local" items="${list}">
               <c:set var="i" value="${i+1}"/>
               <option value='${local.stateCode}' style="font-size:20px; color: black;">${local.stateName}</option>
               </c:forEach>
               

         
            </select>
            
            <select name="city"  class="ct_input_g" onchange="fncGetCity(this)">
               <option value="" style="font-size:20px;">시·군·구</option>
            </select>
        
            <select name="town"  class="ct_input_g"  onchange="fncGetTown(this)">
               <option value="" style="font-size:20px;">읍·면·동</option>
            </select>  
            <input type="hidden" name="userAddr" />
            <input type="hidden" name="snsNo" value="${snsNo}"/>
                        
         </div>
<br/>
            
   
                     
               <div class="wthree-text">
                  <label class="anim">
                  
                     <input type="checkbox" class="checkbox" required="">
            
                     <span>추가정보 기입에 동의합니다.</span>
                  </label>
                  <div class="clear"> </div>
               </div>
               
              <br>    <br>    <br> 
               
            </form>
               
               <input type="submit" value="확 인" id="agreement" onclick="javascript : fncAddUser()">
               
         
         
         </div>
      </div>
      <!-- copyright -->
      <div class="colorlibcopy-agile">
         <p>© 2019 DongneVangne Signup Form. All rights reserved | Design by <a href="https://colorlib.com/" target="_blank">DongneVangne</a></p>
      </div>
      <!-- //copyright -->
      <ul class="colorlib-bubbles">
         <li></li>
         <li></li>
         <li></li>
         <li></li>
         <li></li>
         <li></li>
         <li></li>
         <li></li>
         <li></li>
         <li></li>
      </ul>
   </div>
   <!-- //main -->
</body>
</html>