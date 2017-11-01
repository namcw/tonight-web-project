<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/tonight/css/bootstrap.min.css">
<title>Login Page</title>
<style type="text/css">

body, html {
    height: 100%;
    background-repeat: no-repeat;
    background-image: url('/tonight/img/loginbackground.jpg');
}

.card-container.card {
    max-width: 350px;
    padding: 40px 40px;
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

/*
 * Card component
 */
.card {
    background-color: #F7F7F7;
    /* just in case there no content*/
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 50px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}

.reauth-email {
    display: block;
    color: #404040;
    line-height: 2;
    margin-bottom: 10px;
    font-size: 14px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.sign-form #inputEmail,
.sign-form #inputPassword {
    direction: ltr;
    height: 44px;
    font-size: 16px;
}

.sign-form input[type=email],
.sign-form input[type=password],
.sign-form input[type=text],
.sign-form button {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.sign-form .form-control:focus {
    border-color: rgb(104, 145, 162);
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
}

.btn.btn-signin {
    /*background-color: #4d90fe; */
    background-color: rgb(104, 145, 162);
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 16px;
    height: 50px;
    -moz-border-radius: 1px;
    -webkit-border-radius: 1px;
    border-radius: 1px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}

.btn.btn-signin:hover,
.btn.btn-signin:active,
.btn.btn-signin:focus {
    background-color: rgb(12, 97, 33);
}

.forgot-password {
    color: rgb(104, 145, 162);
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: rgb(12, 97, 33);
}
	
</style>
</head>
<body>
<div class="container">
	<div class="card card-container">
	    <a href="/tonight/index.jsp"><img id="profile-img" class="profile-img-card" src="/tonight/img/logo.png" /></a>
	    <p id="profile-name" class="profile-name-card">TONIGHT</p>
	    <form action="/tonight/login" method="post" class="sign-form">
	        <span id="reauth-email" class="reauth-email">오신것을 환영합니다.</span>
	        <input type="text" class="form-control" name="memberid" placeholder="아이디" required autofocus>
	        <input type="password" class="form-control" name="memberpwd" placeholder="패스워드" required>
	
	        <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">로그인</button>
	    </form><!-- /form -->
	    <a href="/tonight/views/member/searchMyInfo.jsp" class="forgot-password">
			아이디/패스워드 찾기
	    </a>
	    <a href="/tonight/views/member/enrollForm.jsp" class="forgot-password pull-right">
			회원가입
	    </a>
	</div>
</div>

<script src="/tonight/js/jquery-3.2.1.min.js"></script>
<script src="/tonight/js/bootstrap.min.js"></script>
<script type ='text/JavaScript'>
	<%if(("1").equals(request.getParameter("error"))){%>
		alert('아이디 또는 비밀번호를 잘못 입력하셨습니다!');
		
		location.href="<%= request.getRequestURI() %>";
	<% } %>
</script> 
</body>
</html>