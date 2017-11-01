<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/tonight/css/bootstrap.min.css">
<title>아이디/패스워드 찾기</title>
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
.form-inline,
.sign-form input,
.sign-form button {
    width: 100%;
    display: block;
    margin-bottom: 3px;
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
	    
		<br>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#mid">아이디 찾기</a></li>
			<li><a data-toggle="tab" href="#mpwd">패스워드 찾기</a></li>
		</ul>
		<div class="tab-content">
		    <div id="mid" class="tab-pane fade in active">
				<form action="/tonight/msearchmyid" method="post" class="sign-form" id="submit">
					<input type="text" class="form-control" name="membername" placeholder="이름" required>
					<input type="email" class="form-control" name="memberemail" placeholder="이메일 주소" required>
					<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">아이디 찾기</button>
				</form>
				<div id="resultid" style="color:red"></div>
			</div>
			
			<div id="mpwd" class="tab-pane fade">
				<form action="/tonight/msearchMyPwd" method="post" class="sign-form" id="submit2">
					<input type="text" class="form-control" name="memberid" placeholder="아이디" required>
					<input type="text" class="form-control" name="membername" placeholder="이름" required>
					<input type="email" class="form-control" name="memberemail" placeholder="이메일 주소" required>
					<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">패스워드 찾기</button>
				</form>
				<div id="resultpwd" style="color:red"></div>
			</div>
		</div>
	</div>
</div>

<script src="/tonight/js/jquery-3.2.1.min.js"></script>
<script src="/tonight/js/bootstrap.min.js"></script>
<script>
$("#submit").submit(function(e) {
	var postData = $(this).serializeArray();
    var formURL = $(this).attr("action");
	$.ajax({
        url: formURL,
        data: postData,
        type: 'POST',
        success: function(result){
        	var str = result["mid"];
        	if(str == null) {
        		str = "일치하는 아이디가 없습니다.";
        	} else {
        		str = "귀하의 아이디는 " + str + "입니다.";
        	}
        	$('#resultid').text(str);
        },
        error: function(result){
        	alert("error");
        }
    });
	e.preventDefault();
	//e.unbind();
});

$("#submit2").submit(function(e) {
	var postData = $(this).serializeArray();
    var formURL = $(this).attr("action");
	$.ajax({
        url: formURL,
        data: postData,
        type: 'POST',
        success: function(result){
        	var str = result["mpwd"];
        	if(str == null) {
        		str = "일치하는 정보가 없습니다.";
        	} else {
        		str = "귀하의 패스워드는 " + str + "입니다.";
        	}
        	$('#resultpwd').text(str);
        },
        error: function(result){
        	alert("error");
        }
    });
	e.preventDefault();
	//e.unbind();
});
</script>
</body>
</html>