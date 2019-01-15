<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateBoard</title>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

/*

IMGUR 파일 업로드 함수

@param file : 파일데이터

@param callback : 콜백함수

*/
function uploadImageByImgur(file, callback) {            
    form = new FormData();
    form.append('image', file);
    $.ajax({                   
        xhr: function(){
            var xhr = new window.XMLHttpRequest();
            xhr.upload.addEventListener("progress", function(evt){// 업로드상태이벤트리스너등록
                if (evt.lengthComputable) {               
                    console.log("업로드진행률:"+parseInt( (evt.loaded / evt.total * 100), 10)+"%");
                }
            }, false); 
            return xhr;
        },                     
        url: 'https://api.imgur.com/3/image',// 업로드요청주소              
        headers: { Authorization: 'c764d6730f6f9a6' },               
        type: 'POST',               
        data: form,               
        cache: false,                   
        contentType: false,                    
        processData: false                   
    }).always(callback); 
}



/*

파일 변경 이벤트가 감지되면 자동으로 이미지 업로드

*/

$(document).ready(function(){ // document가 모두 로드되면 실행됨

$("input[name=img]").change(function(){// 사용자가 파일을 변경했을때 발생됨

var file = this.files[0];

uploadImageByImgur(file, function(result){

console.log(result);

console.log('업로드결과:'+result.status); 

if(result.status!=200){

result = $.parseJSON(result.responseText);

}

if(result.data.error){

console.log('지원하지않는 파일형식..');

}else{

console.log('업로드된 파일경로:'+result.data.link);

}

});

});

});

</script>

</head>

<body>
<input name="img" type="file"/>
</body>

</html>


