<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AccomError</title>
</head>
<body>
<h2>Accom 서비스 에러 발생 : <%= request.getAttribute("message") %></h2>
<a href="/tonight/index.jsp">시작페이지로 이동</a>
</body>
</html>