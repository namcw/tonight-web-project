<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accom.model.vo.RoomReview" %>
<%
RoomReview Review = (RoomReview)request.getAttribute("Review");
    int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewUpdateView</title>
</head>
<body>
<hr style="clear:both;">
<br>
<h2 align="center"><%= Review.getReviewNum() %> 번글 수정페이지</h2>
<% 	//원글일 때 
	if(Review.getReviewLevel() == 0){ %>
<form action="/first/bupdate0" method="post" enctype="multipart/form-data">
<input type="hidden" name="bnum" value="<%= Review.getReviewNum() %>">
<input type="hidden" name="ofile" value="<%= Review.getReviewOriginalFileName() %>">
<input type="hidden" name="rfile" value="<%= Review.getReviewRenameFileName() %>">
<input type="hidden" name="page" value="<%= currentPage %>">

<table align="center" border="1" cellspacing="0" width="700">
<tr><th>제목</th><td><input type="text" name="btitle" value="<%= Review.getReviewTitle() %>"></td></tr>
<tr><th>작성자</th>
<td><input type="text" readonly name="bwriter" value="<%= Review.getReviewriter() %>"></td></tr>
<tr><th>첨부파일</th>
<td>
<% if(Review.getReviewOriginalFileName() != null){ %>
	<%= Review.getReviewOriginalFileName() %>
<% } %> <br>
<input type="file" name="upfile"></td></tr>
<tr><th>내용</th><td><textarea cols="50" rows="7" name="bcontent"><%= Review.getReviewContent() %></textarea></td></tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="수정하기">	
	</td>
</tr>
</table>
</form>
<% }else{ //댓글일 때 %>
<form action="/tonight/rupdate" method="post">
<input type="hidden" name="bnum" value="<%= Review.getReviewNum() %>">
<input type="hidden" name="page" value="<%= currentPage %>">

<table align="center" cellspacing="0" border="1" width="500">
<tr><th>제목</th><td><input type="text" name="btitle" value="<%= Review.getReviewTitle() %>"></td></tr>
<tr><th>작성자</th>
<td>
<input type="text" name="bwriter" value="<%= Review.getReviewriter() %>" readonly></td></tr>
<tr><th>내용</th><td><textarea name="bcontent" rows="7" cols="50"><%= Review.getReviewContent() %></textarea></td></tr>
<tr><th colspan="2">
	<input type="submit" value="댓글수정">	
</th></tr>
</table>
</form>
<% } %>
<br>
<div align="center">
<a href="/tonight/rreview?page=<%= currentPage %>">목록</a>
</div>
<%-- <%@ include file="../../footer.html" %> --%>
</body>
</html>













