<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.Board" %>
<%
	Board board = (Board)request.getAttribute("board");
    int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdateView</title>
<style>
    .table > div > tr > th, .table > tbody > tr > th {
      background-color: #e6ecff;
      text-align: center;
    }
</style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr style="clear:both;">
<br>
<h2 align="center"><%= board.getBoardNum() %> 번글 수정페이지</h2>
<div class="container">
<% 	//원글일 때 
	if(board.getBoardLevel() == 0){ %>
<form action="/tonight/bupdate0" method="post" enctype="multipart/form-data">
<input type="hidden" name="bnum" value="<%= board.getBoardNum() %>">
<input type="hidden" name="page" value="<%= currentPage %>">

<table align="center" border="1" cellspacing="0" width="700" class="table table-striped table-bordered">
<tr><th>제목</th><td><input type="text" name="btitle" value="<%= board.getBoardTitle() %>"></td></tr>
<tr><th>작성자</th>
<td><input type="text" readonly name="bwriter" value="<%= board.getBoardWriter() %>"></td></tr>
<tr><th>내용</th><td><textarea cols="50" rows="7" name="bcontent"><%= board.getBoardContent() %></textarea></td></tr>
<tr><td colspan="2" align="center">
	<input class="btn btn-info" type="submit" value="수정하기">
	<button type="button" onclick="location.href='/tonight/blist' " class="btn btn-info">목록으로 이동</button>	
	</td>
</tr>
</table>
</form>
<% }else{ //댓글일 때 %>
<form action="/tonight/bupdate1" method="post">
<input type="hidden" name="bnum" value="<%= board.getBoardNum() %>">
<input type="hidden" name="page" value="<%= currentPage %>">

<table align="center" cellspacing="0" border="1" width="500" class="table table-striped table-bordered">
<tr><th>제목</th><td><input type="text" name="btitle" value="<%= board.getBoardTitle() %>"></td></tr>
<tr><th>작성자</th>
<td>
<input type="text" name="bwriter" value="<%= board.getBoardWriter() %>" readonly></td></tr>
<tr><th>내용</th><td><textarea name="bcontent" style="resize:none;" cols="40" rows="10" rows="5" cols="50"  class="form-control"><%= board.getBoardContent() %></textarea></td></tr>
<tr><th colspan="2">
	<input class="btn btn-info" type="submit" value="댓글수정">	
</th></tr>

</table>
</form>
<% } %>
<br>
</div>
</div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>













