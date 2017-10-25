<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="member.model.vo.Member, java.util.ArrayList, java.sql.Date" %>
<%
	Member member = (Member)session.getAttribute("member");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomReviewWriter</title>
</head>
<body>
<hr style="clear:both">
<h1 align="center">roomReview 서비스 : 글 등록하기</h1>
<br>
<form action="/tonight/rrinsert" method="post" enctype="multipart/form-data">
<table align="center" border="1" cellspacing="0" width="700">
<tr><th>제목</th><td><input type="text" name="rtitle"></td></tr>
<tr><th>작성자</th>
<td><input type="text" readonly name="rwriter" value="<%= member.getMemberId() %>"></td></tr>
<tr><th>첨부파일</th><td><input type="file" name="upfile"></td></tr>
<tr><th>내용</th><td><textarea cols="50" rows="7" name="rcontent"></textarea></td></tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="등록하기"> &nbsp;
	<a href="/tonight/rreview?page=1">목록</a>
	</td>
</tr>
</table>
</form>
<br>
</body>
</html>








