<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board, java.sql.Date, java.util.*" %>
<%
	Board board = (Board)request.getAttribute("board");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetailView</title>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<style>
	    .table > div > tr > th, .table > tbody > tr > th {
      background-color: #e6ecff;
      text-align: center;
      WIDTH="100" HEIGHT="80"
    }

	</style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr style="clear:both;">
<h2 align="center"><%= board.getBoardNum() %>번 게시글 상세보기</h2>
<br>
<div class="container">
<table border="1" align="center" cellspacing="0" cellpadding="10" border="1" width="500" class="table table-striped table-bordered">
<tr><th>제목</th><td width=800><%= board.getBoardTitle() %></td></tr>
<tr><th>작성자</th><td width="150"><%= board.getBoardWriter() %></td></tr>

<tr><th>내용</th><td><%= board.getBoardContent() %></td></tr>
<tr><td colspan="2" align="center">
<%  if(member != null){ %>
	<a class="btn btn-info" href="/tonight/views/board/boardReployForm.jsp?bnum=<%= board.getBoardNum() %>&page=<%= currentPage %>">댓글달기</a>
<% if(member.getMemberId().equals(board.getBoardWriter())){ %>
	<a class="btn btn-info" href="/tonight/bupview?bnum=<%= board.getBoardNum() %>&page=<%= currentPage %>">수정페이지로 이동</a>
	&nbsp;
	<a class="btn btn-info" href="/tonight/bdelete?bnum=<%= board.getBoardNum() %>">삭제</a>
<%  }} %>
&nbsp; 
<button type="button" onclick="location.href='/tonight/blist' " class="btn btn-info">목록으로 이동</button>
</td></tr>
</div>
</table>
<br>
<hr>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>











