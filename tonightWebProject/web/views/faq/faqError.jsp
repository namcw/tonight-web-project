<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>faqError</title>
</head>
<body>
<h2>Faq서비스 에러발생 : <%= (String)request.getAttribute("message") %></h2>
</body>
</html>