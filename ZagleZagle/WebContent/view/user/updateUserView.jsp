<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
     <!--  sweetAlert -->     
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-b" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		////////////////////////////////////////////////////////////////////////////////////////////
			function fncUpdateUser() {
		
			
				var birth=$("input[name='userBirth']").val();
				var userAddr=$("input[name='userAddr']").val();
				
				  if(birth.length != 6) {
					  swal("주민등록번호 앞자리만 입력해주세요.");
				      return;
				   }
				   
			
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser?userNo=${user.userNo}&snsNo=${user.snsNo}").submit();
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
				                        var path = 'http://192.168.0.35:8080/common/images/profile/'+data;
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
			             
			         
			            }else if(data =='0') {
			                    $("#agreement").prop("disabled", false);
			                      $("#agreement").css("background-color", "#2eca6a");
			                      $("#userNickname").css("background-color", "#2eca6a");
			               
			          
			            }else if (data == '1') {
			                $("#agreement").prop("disabled", true);
			                $("#agreement").css("background-color", "#aaaaaa");
			                $("#userNickname").css("background-color", "#FFCECE");
			                
			                                
			               
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


.page-header{

padding-top :120px;

}


   #uploadPro, img{
         height: 70px;
         width: 70px;
         border:1.5px solid #f5f6fa;
         border-radius: 50%;
         margin : auto;
         background-color: #2eca6a;
      }
      
   #camera{
   
   margin : auto;
      
   }   

</style>



</head>
<body>

<jsp:include page="/view/layout/toolbar.jsp"/>


<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">${user.userName}님 &nbsp;정보수정</h3>
	       
	    </div>
	     <form enctype="multipart/form-data" method="post" id="perioe">
               <input type="file" id="broll" name="proimg"/>
            </form>
            
	    
	    
	    
	    	    <div id="uploadPro">
               
              
                          
              </div> 
	    		<label for="broll" style="margin: auto;" id="aaa"><br>프로필 등록&nbsp;<i class="glyphicon glyphicon-camera" style="width: 10px; height: 10px;" ></i></label>
	    
	      <!-- form Start /////////////////////////////////////-->
	      
	      
	      
	      		<form class="form-horizontal">
	      		
	      	
		
		
	      		
		
			 <div class="form-group">
		    
		       <input type="hidden" id="coffee" name="profile" value="default.png"/>
               <br><br>
		    
		  </div>
		  
		      <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이 름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="변경할이름">
		    </div>
		  </div>
		  
		  
		    <div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${user.userNickname}" placeholder="변경닉네임"    oninput="checkNickname()">
		    </div>
		  </div>
		  
	
		  <div class="form-group">
		   <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">주 소</label>
		 
               <div class="col-sm-4">
            <select name="state" class="ct_input_g" onchange="fncGetState(this)">
               <option value='' style="font-size:20px;"  selected>시·도</option>
               
               <c:set var="i" value="0"/>
               <c:forEach var="local" items="${list}">
               <c:set var="i" value="${i+1}"/>
               <option value='${local.stateCode}' style="font-size:20px; color: black;">${local.stateName}</option>
               </c:forEach>
               
			
         
            </select>
            
   			&emsp;&emsp;&emsp;&emsp;&nbsp;
            
            <select name="city"  class="ct_input_g" onchange="fncGetCity(this)">
               <option value="" style="font-size:20px;">시·군·구</option>
            </select>
        	
  			&emsp;&emsp;&emsp;&emsp;&nbsp;
        	
            <select name="town"  class="ct_input_g"  onchange="fncGetTown(this)">
               <option value="" style="font-size:20px;">읍·면·동</option>
            </select>  
            <input type="hidden" name="userAddr" />
            <input type="hidden" name="snsNo" value="${snsNo}"/>
                        
         </div>
         
        </div>
<br/>
	
		  
		 
		 
		 
		
		 
		  <div class="form-group">
		    <label for="userBirth" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userBirth" name="userBirth" value="${user.userBirth}" placeholder="생년월일">
		    </div>
		  </div>
		
		  
		    <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-b" id="agreement">수 &nbsp;정</button>
			  <a class="btn btn-b" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		
		</div>


</body>
</html>