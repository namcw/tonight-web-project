<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, qna.model.vo.Qna"%>
<% ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list"); 
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	%>
<!DOCTYPE html>
<html>
<head>

<meta charset=UTF-8">
<title>qnaListView</title>
<script type="text/javascript">
	function insertPage(){
		location.href="views/qna/qnaWriteForm.jsp";
	}
</script>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<h2 align="center">Qna 게시판</h2>
<br><br>

<table align="center" width="1000" border="1" cellspacing="0">
<th>번호</th><th>제목</th><th>질문내용</th><th>작성자</th><th>조회수</th>
<% 
	for(Qna qna : list){
%>
<tr height="30">
	<td align="center"><%= qna.getQnaNo() %></td>
<td align="center"><%= qna.getQnaTitle() %></td>
	<td>
	<% if(member != null){ %>
		<a href="/tonight/qdetail?no=<%= qna.getQnaNo() %>">
			<%= qna.getQnaTitle() %>
		</a>
	<% }else{ %>
		<%= qna.getQnaTitle() %>
	<% } %>
	</td>
<td align="center"><%= qna.getWriterId() %></td>
<td align="center"><%= qna.getqnaReadcount() %></td>
<% } %>


	</tr>
</table>
<div align="center">
<% if(currentPage <= 1){ %>
	[이전] &nbsp;
<% }else{ %>
	<a href="/tonight/qlist?page=<%= currentPage - 1 %>">[이전]</a>
<% } %>
<%-- 현재 페이지 숫자 보여주기 --%>
<% for(int p = startPage; p <= endPage; p++){ 
		if(p == currentPage){
%>
	<b><font size="4" color="red">[<%= p %>]</font></b>
<%     }else{ %>
	<a href="/tonight/qlist?page=<%= p %>"><%= p %></a>
<% }} %>
<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
<% if(currentPage >= maxPage){ %>
	[다음]
<% }else{ %>
	<a href="/tonight/qlist?page=<%= currentPage + 1 %>">[다음]</a>
<% } %>
</div>
<br>
<div align="center">
	<button onclick="insertPage();">글쓰기</button>
</div>
<br><br>
<div align="center">
	<form action="/tonight/qsearch" method="post">
	<input type="search" autocomplete name="keyword" length="50"> &nbsp;
	<input type="submit" value="제목검색">
	</form>
</div>

<br><br>
<div align="center">
	<a href="/tonight/index.jsp">시작페이지로 이동</a>
</div>
<br>
<hr>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>