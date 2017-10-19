<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, faq.model.vo.Faq" %>
<% ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list"); %>
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

<table align="center" width="1000" border="1" cellspacing="0">
<th>번호</th><th>제목</th><th>질문내용</th><th>답변</th><th>조회수</th>
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
<hr>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>