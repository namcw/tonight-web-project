<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, qna.model.vo.Qna" %>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>qnaUpdateView</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr>
<br>
<h2 align="center"><%= qna.getQnaNo() %>번 공지글 수정 페이지</h2>
<br>
<section align="center">
	<form action="/tonight/fupdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%= qna.getQnaNo() %>">
	<table align="center" width="600">
	<tr><th width="150" bgcolor="gray">질문 카테고리</th>
		<td align="left"><input type="text" name="writer" value="<%= qna.getQnaCategory() %>" readonly></td>
	</tr>
	<tr><th width="150" bgcolor="gray">제목</th>
		<td align="left"><input type="text" name="title" value="<%= qna.getQnaTitle() %>"></td>
	</tr>
	

	<tr><th width="150" bgcolor="gray">내용</th>
		<td align="left">
			<textarea rows="5" cols="50" name="content">
				<%= qna.getQnaAnswer() %>
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
	<a href="/tonight/qlist">목록으로 이동</a>
</section>

<br>
<hr>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>