<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<script type ='text/JavaScript'>
<%if(("1").equals(request.getParameter("error"))){%>
	alert('아이디 또는 비밀번호를 잘못 입력하셨습니다!');
	
	location.href="<%= request.getRequestURI() %>";
<% } %>
</script> 
</head>
<body>
<%@ include file="../includes/header.jsp" %>
	<h3>로그인</h3>
	<form action="/tonight/login" method="post">
	<input type="text" name="memberid" placeholder="아이디"> <br>
	<input type="password" name="memberpwd" placeholder="패스워드"> <br>
	<input type="submit" value="로그인">
	</form>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>