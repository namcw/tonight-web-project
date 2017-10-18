<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="member.model.vo.Member"%>
<% Member member = (Member)session.getAttribute("member"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tonight/css/style.css">
</head>
<body>
<header class="lfloat">
	<h3><a href="/tonight/index.jsp">Tonight</a></h3>
	<div class="rfloat">
		<% if(member == null) { %>
			<p><a href="/tonight/views/member/loginForm.jsp">로그인&nbsp;&nbsp;&nbsp;</a></p>
			<p><a href="#">회원가입</a></p>
		<% } else { %>
			<p><%= member.getMemberName() %> 님&nbsp;&nbsp;&nbsp;</p>
			<p><a href="#">마이페이지&nbsp;&nbsp;&nbsp;</a></p>
			<p><a href="/tonight/logout">로그아웃&nbsp;&nbsp;&nbsp;</a></p>
		<% } %>
	</div>
</header>
<nav>
	<ul class="lfloat">
		<li><a href="#">전체메뉴&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="/tonight/tlist">투어&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="#">숙소&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="#">고객센터&nbsp;&nbsp;&nbsp;</a></li>
	</ul>
</nav>
</body>
</html>