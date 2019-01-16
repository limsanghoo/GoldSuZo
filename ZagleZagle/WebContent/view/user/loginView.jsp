<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="770357560919-aul509lnf1546sjm4dpb8jdf48jk1ook.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
	   
	   
	   <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        var id= profile.getId();
        
        console.log("id :"+id)
        console.log("ID Token: " + id_token);
        
        self.location = "/user/getGGToken?id="+id
      }
    </script> 
	   
<%
   
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    session.setAttribute("state", state);
 %>



</head>


	


<body>

	<a href="https://kauth.kakao.com/oauth/authorize?client_id=c3883a306a9faad67b127d7631568b29&redirect_uri=http://192.168.0.16:8080/user/kakaologin&response_type=code">
	   <img src="/common/images/kakao_login_btn_small.png" width="100" />
	</a>
	

			
<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=ICC6WpwdQLzHUQn5KfEC&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fuser%2FnaverCallback&state=state"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>

	
  <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>

</body>
</html>