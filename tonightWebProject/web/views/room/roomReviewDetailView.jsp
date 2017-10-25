<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accom.model.vo.RoomReview,member.model.vo.Member, java.sql.Date, java.util.*" %>


<%
	Member member = (Member)session.getAttribute("member");
%> 
<%
RoomReview RoomReview = (RoomReview)request.getAttribute("review");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomReviewDetailView</title>
</head>
<body>

<hr style="clear:both;">
<h2 align="center"><%= RoomReview.getReviewNum() %>번 게시글 상세보기</h2>
<br>
<table align="center" cellspacing="0" cellpadding="10" border="1" width="500">
<tr><th>제목</th><td><%= RoomReview.getReviewTitle() %></td></tr>
<tr><th>작성자</th><td><%= RoomReview.getReviewriter() %></td></tr>
<tr><th>첨부파일</th>
	<td>
	<% if(RoomReview.getReviewOriginalFileName() == null){ %>
		첨부파일 없음
	<% }else{ %>
	<a href="/tonight/rfdown?ofile=<%= RoomReview.getReviewOriginalFileName() %>&rfile=<%= RoomReview.getReviewRenameFileName() %>">
		<%= RoomReview.getReviewOriginalFileName() %>
	</a>
	<% } %>
	</td>
</tr>
<tr><th>내용</th><td><%= RoomReview.getReviewContent() %></td></tr>
<tr><td colspan="2" align="center">
<%  if(member != null){ %>
	<a href="/tonight/views/room/roomReviewReplyView.jsp?rnum=<%= RoomReview.getReviewNum() %>&page=<%= currentPage %>">[댓글달기]</a>
<% if(member.getMemberId().equals(RoomReview.getReviewriter())){ %>
	
	<a href="/tonight/rrupdate?rnum=<%= RoomReview.getReviewNum() %>&page=<%= currentPage %>">[수정페이지로 이동]</a>
	&nbsp;
	<a href="/tonight/rrdelete?rnum=<%= RoomReview.getReviewNum() %>">[삭제]</a>
<%  }} %>
&nbsp; 
<a href="/tonight/rreview?page=<%= currentPage %>">[목록]</a>
</td></tr>
</table>
<br>
<hr>

</body>
</html>











