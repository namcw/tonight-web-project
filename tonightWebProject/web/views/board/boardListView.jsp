<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- page 지시자 태그는 한 페이지에 한 개만 사용이 원칙임
     예외로 import 속성에 대해서만 따로 작성할 수 있음. --%>
<%@ page import="board.model.vo.Board, java.util.ArrayList, java.sql.Date" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardListView</title>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	function showWriteBoard(){
		location.href = "views/board/boardWriteForm.jsp";
	}
</script>
<style>
    #nowpage{
     background-color: lightgray;
    }
    .table > div > tr > th, .table > tbody > tr > th {
      background-color: #e6ecff;
      text-align: center;
    }</style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr style="clear:both">
<h2 align="center">게시글 목록</h2>
<br>

<br>
<div class="container">
<table align="center" border="1" cellspacing="0" width="700" class="table table-striped table-bordered">
<tr><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
<%
	for(Board b : list){
%>
<tr>
	<td>
	<%-- 답글일 때는 들여쓰기하면서 앞에 ▶ 표시함 --%>
		<% if(b.getBoardLevel() == 1){  //원글의 댓글일 때 %>
		&nbsp; &nbsp; [RE]
		<% }else if(b.getBoardLevel() == 2){  //댓글의 댓글일 때 %>
		&nbsp; &nbsp; &nbsp; &nbsp; [RE]
		<% } %>
	<%-- 로그인한 경우 상세보기 가능하게 처리함 --%>
		<% if(member != null){ %>
			<a href="/tonight/bdetail?bnum=<%= b.getBoardNum() %>&page=<%= currentPage %>">
			<%= b.getBoardTitle() %>
			</a>
		<% }else{ %>
			<%= b.getBoardTitle() %>
		<% } %>
	</td>
	<td align="center"><%= b.getBoardWriter() %></td>
	<td align="center"><%= b.getBoardDate() %></td>
	<td align="center"><%= b.getBoardReadCount() %></td>

</tr>
<%  } %>
</table>
</div>
	<div class="col-md-12" align="center">
		<ul class="pagination">
			<%
				if (currentPage <= 1) {
			%>

			<%
				} else {
			%>
			<li><a href="/tonight/blist?page=<%=currentPage - 1%>"><</a></li>
			<%
				}
			%>
			<%-- 현재 페이지 숫자 보여주기 --%>

			<%
				for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
			%>
			<li><a id="nowpage" href="/tonight/blist?page=<%=p%>"><%=p%></a></li>
			<%
				} else {
			%>
			<li><a href="/tonight/blist?page=<%=p%>"><%=p%></a></li>
			<%
				}
				}
			%>
			<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
			<%
				if (currentPage >= maxPage) {
			%>
			<%
				} else {
			%>
			<li><a href="/tonight/blist?page=<%=currentPage + 1%>">></a></li>
			<%
				}
			%>
		</ul>
	</div>

<div name="container" align="center">
	<form action="/tonight/bsearch" method="post">
	<input type="search" autocomplete name="keyword" length="50"> &nbsp;
	<input class="btn btn-default dropdown-toggle btn-select" href="#" type="submit" value="제목검색">
	</form>
</div>
<% if(member != null){ %>
	<div align="center">
	<button  class="btn btn-default dropdown-toggle btn-select" onclick="showWriteBoard();">글쓰기</button>
	</div>
<% } %>
<br><br><br>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>









