<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, faq.model.vo.Faq" %>
<% ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list"); 
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
<title>faqListView</title>
<script type="text/javascript">
	function insertPage(){
		location.href="views/faq/faqWriteForm.jsp";
	}
</script>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<h2 align="center">Faq게시판</h2>
<br><br>

<table align="center" height=150 width="1000" border="1" cellspacing="0">
<th valign="middel">번호</th><th valign="middel">카테고리</th><th>질문내용</th><th>답변</th><th>조회수</th>
<% 
	for(Faq faq : list){
%>
<tr height="30">
	<td align="center"><%= faq.getFaqNo() %></td>
<td align="center"><%= faq.getFaqCategory() %></td>
	<td>
	<% if(member != null){ %>
		<a href="/tonight/fdetail?no=<%= faq.getFaqNo() %>">
			<%= faq.getFaqTitle() %>
		</a>
	<% }else{ %>
		<%= faq.getFaqTitle() %>
	<% } %>
	</td>
<td align="center"><%= faq.getFaqAnswer() %></td>
<td align="center"><%= faq.getFaqReadCount() %></td>
<% } %>


	</tr>
</table>
<div align="center">
<% if(currentPage <= 1){ %>
	[이전] &nbsp;
<% }else{ %>
	<a href="/tonight/flist?page=<%= currentPage - 1 %>">[이전]</a>
<% } %>
<%-- 현재 페이지 숫자 보여주기 --%>
<% for(int p = startPage; p <= endPage; p++){ 
		if(p == currentPage){
%>
	<b><font size="4" color="red">[<%= p %>]</font></b>
<%     }else{ %>
	<a href="/tonight/flist?page=<%= p %>"><%= p %></a>
<% }} %>
<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
<% if(currentPage >= maxPage){ %>
	[다음]
<% }else{ %>
	<a href="/tonight/flist?page=<%= currentPage + 1 %>">[다음]</a>
<% } %>
</div>
<br><br>
<div align="center">
	<form action="/tonight/fsearch" method="post">
	<input type="search" autocomplete name="keyword" length="50"> &nbsp;
	<input type="submit" value="제목검색">
	</form>
</div>
<br>
<div align="center">
	<button onclick="insertPage();">글쓰기</button>
</div>
<br><br>
<div align="center">
	<a href="/tonight/index.jsp">시작페이지로 이동</a>
</div>
<br>
<hr> ``
<%@ include file="../includes/footer.jsp" %>
</body>
</html>