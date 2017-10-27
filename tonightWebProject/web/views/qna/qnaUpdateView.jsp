<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, qna.model.vo.Qna" %>
<%
	Qna qna = (Qna)request.getAttribute("qna");
%>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8">
<title>qnaUpdateView</title>
  <style>
    #contentForm {
      width: 40%;
      margin: 0 auto;
      padding-top: 12%;
    }
 
    .table > thead > tr > th, .table > tbody > tr > th {
      background-color: #e6ecff;
      text-align: center;
    }
  </style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr>
<br>
<form action="/tonight/qupdate" method="post">
	<h2 align="center"><input type="hidden" name="qnaNo" value="<%= qna.getQnaNo() %>"></input> <%= qna.getQnaNo() %> 번 게시글</h2>
	<table align="center" width="600">
		<tr><th width="150" bgcolor="gray">제목</th>
		<td align="left"><input type="text" name="qnaTitle" value="<%= qna.getQnaTitle() %>"></td>
	</tr>
		<tr><th width="150" bgcolor="gray">아이디</th>
		<td align="left"><input type="text" name="writerId" value="<%= qna.getWriterId() %>" readonly></td>
	</tr>
	<tr><th width="150" bgcolor="gray">내용</th>
		<td align="left">
			<textarea rows="5" cols="50" name="question">
				<%= qna.getQuestion() %>
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