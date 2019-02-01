  
<script type="text/javascript">  
$(function() {
    
    // alert(current);
  // $(document.body).animate({scrollTop: '0px'}, 1000);
  
   
   var end = "${resultPage.endUnitPage}";
  
     //  alert(current);
      var list = "${list}";
      var  current = 1;
$(window).scroll(function(){
 //var scrollHeight = $(document).height();
 //var scrollPosition = $(window).height() + $(window).scrollTop();
 //if ((scrollHeight - scrollPosition) / scrollHeight === 0) {
    // alert(current);
//if ($(window).scrollTop() == $(document).height() - $(window).height()){
 if ((window.innerHeight + window.scrollY) >= document.body.scrollHeight) {
//    if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
// if($(window).scrollTop() + $(window).height() == getDocHeight()) {
 //   if (winCached.scrollTop() + winCached.height() > docCached.height() - 300) {
 //alert(current);
   
     current++;
     var data = {
        "sortCondition":"${search.sortCondition}",
        "searchKeyword":"${search.searchKeyword}",
        "inquiryCondition":"${search.inquiryCondition}",
        "searchCondition":"${search.searchCondition}",
         "searchprice1": "${search.price1}",
         "searchprice2": "${search.price2}",
         "CurrentPage" : current,
         "endUnitPage" : "${resultPage.endUnitPage}",
       };
   alert("그냥data 찍을때"+data);   
  alert("string 화 할때"+ JSON.stringify(data)); 
   
    $.ajax({

      method: "post",

      url: "/product/json/listProduct/",
      data: JSON.stringify(data),
     dataType : 'json',
      headers: {
           "Accept": "application/json",
           "Content-Type": "application/json"
       },
      success: function(JSONData,status){
       //alert("String화할때==="+JSON.stringify(JSONData.list)); 
       //alert("그냥data찍을때==="+JSONData.list); 
      $.each(JSONData.list.reverse(),function(i,v){   
         //alert($.trim(v.proTranCode));
         if(v.sum!=null){      
        if($.trim(v.proTranCode)=="1"){   $("#dd").after("<div class='col-sm-6 col-md-4'> <div class='thumbnail'> <img alt='50%x50' data-src='holder.js/100%x200' src='/images/uploadFiles/"+v.sum+"'style='height: 250px; width: 50%; display: block;' data-aphoto='"+v.fileName+"' data-toggle='tooltip' title='대표이미지 불러오는중..'> <div class='caption'>  <h1>"+v.prodName+"</h1><h3>"+v.prodDetail+"</h3><p>가격:"+v.price+"</p><p><a class='btn btn-default' name='get' role='button' data-param1='"+v.prodNo+"'  data-param3='"+v.proTranCode+"'>상세보기</a></p> </div> </div> </div>")      
              
           }else{ $("#dd").after("<div class='col-sm-6 col-md-4'> <div class='thumbnail'> <img class='target' alt='50%x50' data-src='holder.js/100%x200' src='/images/uploadFiles/"+v.sum+"'style='height: 250px; width: 50%; display: block;' data-aphoto='"+v.fileName+"' data-toggle='tooltip' title='대표이미지 불러오는중..'> <div class='caption'>  <h1>"+v.prodName+"</h1><h3>"+v.prodDetail+"</h3><p>가격:"+v.price+"</p><p><a class='btn btn-default' name='get' role='button' data-param1='"+v.prodNo+"'  data-param3='"+v.proTranCode+"'>상세보기</a></p> </div> </div> </div>")      
                   
        }
         
         }else{
            if($.trim(v.proTranCode)=="1"){
               $("#dd").after("<div class='col-sm-6 col-md-4'> <div class='thumbnail'> <img alt='50%x50' data-src='holder.js/100%x200' src='data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMzE5IiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDMxOSAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MjAwCkNyZWF0ZWQgd2l0aCBIb2xkZXIuanMgMi42LjAuCkxlYXJuIG1vcmUgYXQgaHR0cDovL2hvbGRlcmpzLmNvbQooYykgMjAxMi0yMDE1IEl2YW4gTWFsb3BpbnNreSAtIGh0dHA6Ly9pbXNreS5jbwotLT48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhW0NEQVRBWyNob2xkZXJfMTY3NjI2NWE3ZDMgdGV4dCB7IGZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxNnB0IH0gXV0+PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImhvbGRlcl8xNjc2MjY1YTdkMyI+PHJlY3Qgd2lkdGg9IjMxOSIgaGVpZ2h0PSIyMDAiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSIxMTcuOTg0Mzc1IiB5PSIxMDcuMiI+MzE5eDIwMDwvdGV4dD48L2c+PC9nPjwvc3ZnPg=='style='height: 250px; width: 50%; display: block;' data-aphoto='"+v.fileName+"' data-toggle='tooltip' title='대표이미지 불러오는중..'> <div class='caption'>  <h1>"+v.prodName+"</h1><h3>"+v.prodDetail+"</h3><p>가격:"+v.price+"</p><p><a class='btn btn-default' name='get' role='button' data-param1='"+v.prodNo+"' data-param3='"+v.proTranCode+"'>상세보기</a></p> </div> </div> </div>")      
                 
            }else{
               $("#dd").after("<div class='col-sm-6 col-md-4'> <div class='thumbnail'> <img alt='50%x50' class='target' data-src='holder.js/100%x200' src='data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMzE5IiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDMxOSAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MjAwCkNyZWF0ZWQgd2l0aCBIb2xkZXIuanMgMi42LjAuCkxlYXJuIG1vcmUgYXQgaHR0cDovL2hvbGRlcmpzLmNvbQooYykgMjAxMi0yMDE1IEl2YW4gTWFsb3BpbnNreSAtIGh0dHA6Ly9pbXNreS5jbwotLT48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhW0NEQVRBWyNob2xkZXJfMTY3NjI2NWE3ZDMgdGV4dCB7IGZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxNnB0IH0gXV0+PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImhvbGRlcl8xNjc2MjY1YTdkMyI+PHJlY3Qgd2lkdGg9IjMxOSIgaGVpZ2h0PSIyMDAiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSIxMTcuOTg0Mzc1IiB5PSIxMDcuMiI+MzE5eDIwMDwvdGV4dD48L2c+PC9nPjwvc3ZnPg=='style='height: 250px; width: 50%; display: block;' data-aphoto='"+v.fileName+"' data-toggle='tooltip' title='대표이미지 불러오는중..'> <div class='caption'>  <h1>"+v.prodName+"</h1><h3>"+v.prodDetail+"</h3><p>가격:"+v.price+"</p><p><a class='btn btn-default' name='get' role='button' data-param1='"+v.prodNo+"' data-param3='"+v.proTranCode+"'>상세보기</a></p> </div> </div> </div>")      
                   
            }
  
         }
      })
            
</script>