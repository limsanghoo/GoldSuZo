<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DongneVangne</title>
<style>
        div.editable{
        	border: 1px solid #777;
        }

.btn {
  transition: .5s ease;
}

.btn.btn-y {
  border-radius: 0;
  padding: .5rem 2rem;
  letter-spacing: .05rem;
}

.btn.btn-y {
  background-color: #fbe300;
  color: #000000;
}

.btn.btn-y:hover {
  background-color: #000000;
  color: #ffffff;
}

</style>

	<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet">

	<!-- Font Awesome for awesome icons. You can redefine icons used in a plugin configuration -->
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	
	<!-- CSS -->
	<link rel="stylesheet" href="/common/js/medium-editor/dist/css/medium-editor.min.css">
	<link rel="stylesheet" href="/common/js/medium-editor/dist/css/themes/beagle.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
<script type="text/javascript">
		
$(function() {
	
	var phone = '${buy.buyPhone}'.split('-');
	
	$("input:text[name='phone1']").val(phone[0]);
	$("input:text[name='phone2']").val(phone[1]);
	$("input:text[name='phone3']").val(phone[2]);

	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)

	$("button:contains('취소')").on("click", function() {
		self.location="/trade/listBuy";
		});
	
	 $(document).on("click", '#inicispay', function() {
		    
//         var price = $('#price').val();
//         var userNo = $('#userNo').val();
//         var streamerNo = $('#streamer').data("param3");;
        
	    var IMP = window.IMP; // 생략가능
	    var username = '주문명:결제테스트';
	    IMP.init('imp76516341'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	          
	    IMP.request_pay({
	        pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
	        pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
	        merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
	        name : '주문명:결제테스트',
	        amount : 10,
	        buyer_email : 'iamport@siot.do',
	        buyer_name : '구매자이름',
	        buyer_tel : '010-1234-5678', //누락되면 이니시스 결제창에서 오류
	        buyer_addr : '서울특별시 강남구 삼성동',
	        buyer_postcode : '123-456'
	    }, function(rsp) {
	        if ( rsp.success ) {
	        	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	        	
	        	payBuy();
	        	jQuery.ajax({
	        		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	        		type: 'POST',
	        		dataType: 'json',
	        		data: {
	    	    		imp_uid : rsp.imp_uid
	    	    		//기타 필요한 데이터가 있으면 추가 전달
	        		}
	        	}).done(function(data) {
	        		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	        		if ( everythings_fine ) {
	        			var msg = '결제가 완료되었습니다.';
	        			msg += '\n고유ID : ' + rsp.imp_uid;
	        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	        			msg += '\n결제 금액 : ' + rsp.paid_amount;
	        			msg += '카드 승인번호 : ' + rsp.apply_num;
	        			
	        			alert(msg);
	        		} else {
	        			//[3] 아직 제대로 결제가 되지 않았습니다.
	        			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	        		}
	        	});
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	            
	            alert(msg);
	        }
	    });
	    
	 });
	 
	 $(document).on("click", '#kakao', function() {
			
			var IMP = window.IMP; // 생략가능
		    var username = '주문명:결제테스트';
		    IMP.init('imp89029752'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

			IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 14000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {
			    	
			    	payBuy();
			    	
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
			    		type: 'POST',
			    		dataType: 'json',
			    		data: {
				    		imp_uid : rsp.imp_uid
				    		//기타 필요한 데이터가 있으면 추가 전달
			    		}
			    	}).done(function(data) {
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    		if ( everythings_fine ) {
			    			var msg = '결제가 완료되었습니다.';
			    			msg += '\n고유ID : ' + rsp.imp_uid;
			    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			    			msg += '\결제 금액 : ' + rsp.paid_amount;
			    			msg += '카드 승인번호 : ' + rsp.apply_num;
			    			
			    			alert(msg);
			    			
			    			  payBuy();
			    		} else {
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			    		}
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        
			        alert(msg);
			    }
			});
	 });	
	
});	



 function payBuy(){
	 
	 var phone = "";	
	 if( $("input:text[name='phone1']").val() != ""  && $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
			var phone = $("input[name='phone1']").val() 
								+'-'
								+ $("input[name='phone2']").val()
								+'-'
								+ $("input[name='phone3']").val();
		}

		$("input:hidden[name='buyPhone']").val(phone);
		
		var addr = "";
		
		if( $("input:text[name='address']").val() != ""  && $("input:text[name='detailaddress']").val() != "") {
			var addr = $("input[name='address']").val() 
								+' '
								+ $("input[name='detailaddress']").val();
		}

		$("input:hidden[name='buyAddress']").val(addr);
		
		$("form").attr("method" , "POST").attr("action" , "/trade/payBuy").submit();
 }
 
 function execDaumPostcode() {
		
     new daum.Postcode({
         oncomplete: function(data) {
         	
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullAddr = ''; // 최종 주소 변수
             var extraAddr = ''; // 조합형 주소 변수

             // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 fullAddr = data.jibunAddress;

             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 fullAddr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
             if(data.userSelectedType === 'R'){
                 //법정동명이 있을 경우 추가한다.
                 if(data.bname !== ''){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있을 경우 추가한다.
                 if(data.buildingName !== ''){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('address').value = fullAddr;

         },

     
     }).open();
  
         autoClose: true

 }
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/layout/toolbar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
	<form class="form-horizontal" method="post" enctype="multipart/form-data">
	<input type="hidden" name="sellNo" value=""/>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="margin-top:150px">

	    <div class="col-12">

	<div class="row">
	<div class="col-lg-7">
	<H2><strong>결제하기</strong></H2>&emsp;―&nbsp;상세정보를 입력하고 결제를 완료하세요
	</div>
	<div class="col-lg-5 text-right">
		<button type="button" class="btn btn-y" id="kakao"><strong>카카오PAY</strong></button>
		<button type="button" class="btn btn-b" id="inicispay"><strong>카드결제</strong></button>
		<button type="button" class="btn btn-a">취소</button>
	</div>
</div>
	    <div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
	    <br/>
		
		<div class="row">
			<div class="col-lg-12">
			<H3>&nbsp;상품 정보</H3>
			</div>
		</div>
		
		<br/>
		
		<div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>상품명</strong></div>
			<div class="col-xs-4 col-md-5">${buy.sellProd.sellName}</div>

	  		<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>작성일</strong></div>
			<div class="col-xs-4 col-md-4">${buy.sellProd.sellDate}</div>
		</div>
		
		<br/>

	    <div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>판매자</strong></div>
			<div class="col-xs-4 col-md-5">${buy.sellProd.seller.userNickname}</div>
			
			<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>전화번호</strong></div>
			<div class="col-xs-4 col-md-4">${buy.sellProd.sellPhone}</div>
		</div>
		
		<br/>

		<div class="row">
	  		<div class="col-xs-8 col-md-1" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>가격</strong></div>
			<div class="col-xs-4 col-md-5">${buy.sellProd.sellPrice}원</div>
			
			<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>판매방식</strong></div>
			<div class="col-xs-4 col-md-4">
				<c:if test="${buy.sellProd.sellStyle=='10'}">택배거래</c:if>
				<c:if test="${buy.sellProd.sellStyle=='20'}">직거래</c:if>
			</div>
		</div>
		
		<br/>
		
		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
		
		<br/>
		
		<div class="row">
			<div class="col-lg-12">
			<H3>&nbsp;배송 정보</H3>
			</div>
		</div>

	    <br/>
	    
		<div class="row">
		
		<div class="col-xs-8 col-md-1 text-right" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; padding-top: .5em; padding-bottom: .5em;"><strong>주문자</strong><br/><br/><strong>전화번호</strong></div>

			<div class="col-xs-4 col-md-4" >
			<div class="col-md-12">${user.userName}</div><br/><br/>
			     <div class="col-sm-3">
			      <input type="text" class="form-control" id="phone1" name="phone1">
			    </div>
		    	<div class="col-sm-1 text-center">-</div>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="phone2" name="phone2">
			    </div>
		    	<div class="col-sm-1 text-center">-</div>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="phone3" name="phone3">
			    </div>
		    	<input type="hidden" name="buyPhone"/>
		    	
		    </div>

	  		<div class="col-xs-8 col-md-2 text-right" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; padding-top: .5em; padding-bottom: .5em;"><strong>주소</strong></div>
			<div class="col-xs-4 col-md-5">
				<div class="col-xs-4 col-md-8">
					<input type="text" class="form-control" id="address" name="address" class="ct_input_g" value="${buy.buyAddress}" />
				</div>
				<div class="col-xs-8 col-md-4">
			    	<input type="button" class="btn" onclick="execDaumPostcode()" value="우편번호 찾기" readonly="readonly" ><br/>
				</div>
			<br/>
			<br/>
			<div class="col-xs-4 col-md-12">
				<input type="text" class="form-control" id="detailaddress" name="detailaddress" class="ct_input_g" placeholder="상세주소를 입력하세요" />
			</div>
			</div>
			<input type="hidden" name="buyAddress"/>

		</div>
		
		<br/>
		
		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>

</div>
</div>
</form>

</body>

</html>
