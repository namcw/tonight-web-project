<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>qnaError</title>
</head>
<body>
<h2>Qaq서비스 에러발생 : <%= (String)request.getAttribute("message") %></h2>
</body>
</html>