<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	
	Member member = (Member)request.getAttribute("member");
%>    
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/tonight/css/bootstrap.min.css">
<title>회원정보</title>
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
		<img id="profile-img" class="profile-img-card" src="/tonight/img/user.png" />
	    <p id="profile-name" class="profile-name-card"><%= member.getMemberName() %></p>
	    
		<br>
		
	    <form action="/tonight/mupdate" method="post" class="sign-form">
	    	<label class="col-xs-6">회원타입:</label>
	    	<div class="col-xs-6">
	    	<% if(member.getMemberType().equals("U")) { %>
	    		<p>일반회원</p>
	    	<% } else if(member.getMemberType().equals("G")) { %>
	    		<p>가이드</p>
	    	<% } else { %>
	    		<p>사업자</p>
	    	<% } %>
	    	</div>
	    	<input type="hidden" name="memberid" value="<%= member.getMemberId() %>">
	    	<label class="col-xs-6">아이디:</label>
	    	<div class="col-xs-6">
	    		<p><%= member.getMemberId() %></p>
	    	</div>

		    <input type="password" class="form-control" id="pwd" name="memberpwd" placeholder="패스워드" required>
			<input type="password" class="form-control" id="pwd2" placeholder="패스워드 확인" required>
			
			<label class="col-xs-6">생년월일:</label>
	    	<div class="col-xs-6">
	    		<p><%= member.getBirthDate().substring(0,4) %>.<%= member.getBirthDate().substring(4,6) %>.<%= member.getBirthDate().substring(6) %></p>
	    	</div>
			
			
			<input type="tel" class="form-control" name="memberphone" value="<%= member.getPhone() %>" required>
			<input type="email" class="form-control" name="memberemail" value="<%= member.getEmail() %>" required>
			<input type="text" class="form-control" name="memberaddress" value="<%= member.getAddress() %>" required>
			
			<label class="col-xs-6">회원등급:</label>
	    	<div class="col-xs-6">
	    		<p><%= member.getRank() %></p>
	    	</div>
			<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">회원 수정</button>
		</form>
		
		<div>
			<a href="/tonight/index.jsp">뒤로가기</a>
			<a id="delcheck" class="pull-right">회원탈퇴</a>
		</div>
	</div>
</div>

<script src="/tonight/js/jquery-3.2.1.min.js"></script>
<script src="/tonight/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$('#delcheck').click(function() {
		if(confirm("정말 탈퇴하시겠습니까?") == true) {
			mdel();
		}
		
	});
	
	function mdel(){
		location.href = "/tonight/mdelete?userid=<%= member.getMemberId() %>";
		return false;
	}
	
	$('#pwd2').change(function() {
		if($(this).val() != $('#pwd').val()) {
			alert("패스워드 확인이 동일하지 않습니다.");
			$('#pwd2').val("");
		}
	});
</script>


</body>
</html>





