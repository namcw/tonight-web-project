<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="faq.model.vo.Faq" %>
<%
	Faq faq = (Faq)request.getAttribute("faq");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqUpdateView</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr>
<br>
<h2 align="center"><%= faq.getFaqNo() %>번 공지글 수정 페이지</h2>
<br>
<section align="center">
	<form action="/tonight/fupdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%= faq.getFaqNo() %>">
	<table align="center" width="600">
	<tr><th width="150" bgcolor="gray">질문 카테고리</th>
		<td align="left"><input type="text" name="writer" value="<%= faq.getFaqCategory() %>" readonly></td>
	</tr>
	<tr><th width="150" bgcolor="gray">제목</th>
		<td align="left"><input type="text" name="title" value="<%= faq.getFaqTitle() %>"></td>
	</tr>
	

	<tr><th width="150" bgcolor="gray">내용</th>
		<td align="left">
			<textarea rows="5" cols="50" name="content">
				<%= faq.getFaqAnswer() %>
			</textarea>
		</td>
	</tr>
	<tr><th width="150" bgcolor="gray" colspan="2">
		<input type="submit" value="수정하기"> &nbsp;
		<input type="reset" value="취소하기">
	</th></tr>
	</table>
	</form>
	<br>
	<a href="/tonight/flist">목록으로 이동</a>
</section>

<br>
<hr>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>