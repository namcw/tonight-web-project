<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>qnaWritheForm</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr>
<br>
<h2 align="center">QNA글쓰기 페이지</h2>
<br>
<section align="center">
	<form action="/tonight/qinsert" method="post">
	<table align="center" width="600">
	<tr><th width="150" bgcolor="gray">제목</th>
		<td align="left"><input type="text" name="qnaTitle"></td>
	</tr>	
	<tr><th width="150" bgcolor="gray">아이디</th>
		<td align="left"><input type="text" name="writerId" value="<%= member.getMemberId() %>" readonly></td>
	</tr>
	<tr><th width="150" bgcolor="gray">질문</th>
		<td align="left"><textarea rows="5" cols="50" name="question"></textarea>
		</td>
	</tr>
<!-- 	<tr><th width="150" bgcolor="gray">내용</th>
		<td align="left"><textarea rows="5" cols="50"></textarea></td>
	</tr> -->
	<tr><th width="150" bgcolor="gray" colspan="2">
		<input type="submit" value="등록하기"> &nbsp;
		<input type="reset" value="취소하기">
	</th></tr>
	</table>
	</form>
	<br>
	<a href="/tonight/qlist">목록으로 이동</a>
</section>

<br>
<hr>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>