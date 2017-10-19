<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqWriteForm</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr>
<br>
<h2 align="center">FAQ글쓰기 페이지</h2>
<br>
<section align="center">
	<form action="/tonight/finsert" method="post">
	<table align="center" width="600">
	<tr><th width="150" bgcolor="gray">제목</th>
		<td align="left"><input type="text" name="faqTitle"></td>
	</tr>
	<tr><th width="150" bgcolor="gray">카테고리</th>
		<td align="left"><input type="text" name="faqCategory"></td>
	</tr>
	<tr><th width="150" bgcolor="gray">내용</th>
		<td align="left"><textarea rows="5" cols="50" name="faqAnswer"></textarea></td>
	</tr>
	<tr><th width="150" bgcolor="gray" colspan="2">
		<input type="submit" value="등록하기"> &nbsp;
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