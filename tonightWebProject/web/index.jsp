<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tonight</title>
</head>
<body>
<%@ include file="views/includes/header.jsp" %>
<form action="/tonight/tpopul" method="post" id="f"></form>
<script>
	$(document).ready(function() {
		$('#f').submit();
	});
</script>
</body>
</html>

