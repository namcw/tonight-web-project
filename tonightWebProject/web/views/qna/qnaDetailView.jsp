<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.Qna" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>qnaDetailView</title>
</head>
<body>
	<%@ include file="../includes/header.jsp" %>
	<session>
		<h2 align="center"><%= qna.getQnaNo() %>번 공지글 상세보기</h2><br>
<table border="1" cellspacing="0" width="600" align="center">
	<tr><th>카테고리</th><td><%= qna.getQnaCategory() %></td></tr>
	<tr><th>제목</th><td><%= qna.getQnaTitle() %></td></tr>
	<tr><th>조회수</th><td><%= qna.getQnaReadCount() %></td></tr>
	<tr><th>내용</th><td><%= qna.getQnaAnswer() %></td></tr>
	<tr><th colspan="2">
		<a href="/tonight/fupdateview?no=<%= qna.getQnaNo() %>">수정페이지로 이동</a> &nbsp;
		<a href="/tonight/fdelete?no=<%= qna.getQnaNo() %>">삭제하기</a>
	</th></tr>
	
</table>
<br>
<div align="center">
	<a href="/tonight/qlist">목록보기로 이동</a>
</div>
<br><br>
<hr>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>
