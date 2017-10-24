<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accom.model.vo.RoomReview,member.model.vo.Member, java.sql.Date, java.util.*" %>

<%
	Member member = (Member)session.getAttribute("member");
%> 


<%
	int rnum = Integer.parseInt(request.getParameter("rnum"));
    int currentPage = Integer.parseInt(request.getParameter("page"));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RoomReviewReployForm</title>
</head>
<body>

<hr style="clear:both;">
<h2 align="center"><%= rnum %> 번글 댓글달기</h2>
<br>
<form action="/tonight/rreply" method="post">
<input type="hidden" name="page" value="<%= currentPage %>">
<input type="hidden" name="bnum" value="<%= rnum %>">

<table align="center" cellspacing="0" border="1" width="500">
<tr><th>제목</th><td><input type="text" name="btitle"></td></tr>
<tr><th>작성자</th>
<td>
<input type="text" name="bwriter" value="<%= member.getMemberId() %>" readonly></td></tr>
<tr><th>내용</th><td><textarea name="bcontent" rows="7" cols="50"></textarea></td></tr>
<tr><th colspan="2">
	<input type="submit" value="댓글등록"> &nbsp;
	<a href="javascript:history.go(-1);">이전 페이지로</a>
</th></tr>
</table>
</form>
<h4 align="center"><a href="/first/blist?page=<%= currentPage %>">목록</a></h4>
<br>
<%-- <%@ include file="../../footer.html" %> --%>
</body>
</html>














