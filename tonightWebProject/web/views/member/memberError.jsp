<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String errorMessage = (String)request.getAttribute("message");
%>    
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>error</title>
</head>
<body>
<h1>에러 메세지 : <%= errorMessage %></h1>
<button onclick="javascript:history.go(-1);">이전 페이지로 이동</button>
</body>
</html>