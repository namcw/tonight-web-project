<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
    int currentPage = Integer.parseInt(request.getParameter("page"));
%>    
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8">
<title>qnaReployForm</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr style="clear:both;">
<br>
<form action="/tonight/qreply" method="post">
<h2 align="center"><%= bnum %> 번글 댓글달기</h2>
<input type="hidden" name="page" value="<%= currentPage %>">
<input type="hidden" name="bnum" value="<%= bnum %>">

<table align="center" cellspacing="0" border="1" width="500">
<tr><th>제목</th><td><input type="text" name="qnaTitle"></td></tr>
<tr><th>제목</th><td><input type="text" name="writerId"></td></tr>
<td>
<input type="text" name="bwriter" value="<%= member.getMemberId() %>"></td></tr>
<tr><th>내용</th><td><textarea name="answer" rows="7" cols="50"></textarea></td></tr>
<tr><th colspan="2">
	<input type="submit" value="댓글등록"> &nbsp;
	<a href="javascript:history.go(-1);">이전 페이지로</a>
</th></tr>
</table>
</form>
<h4 align="center"><a href="/tonight/qlist?page=<%= currentPage %>">목록</a></h4>
<br>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>