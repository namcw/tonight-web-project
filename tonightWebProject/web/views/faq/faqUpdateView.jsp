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
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
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

<br>
<div class="container">
	<form action="/tonight/fupdate" method="post">
	<h2 align="center"><input type="hidden" name="faqNo" value="<%= faq.getFaqNo() %>"></input> <%= faq.getFaqNo() %> 번 게시글</h2>
	<table align="center" width="300" class="table table-striped table-bordered">
		<tr><th width="150" bgcolor="gray" >제목</th>
		<td align="left"><input type="text" name="faqTitle" class="form-control" value="<%= faq.getFaqTitle() %>"></td>
	</tr>
	<tr><th width="150" bgcolor="gray">질문 카테고리</th>
		<td align="left"><input type="text" name="faqCategory" class="form-control" value="<%= faq.getFaqCategory() %>" readonly></td>
	</tr>


	<tr><th width="100" bgcolor="gray">내용</th>
		<td align="left">
				<textarea style="resize:none;" name="faqAnswer" class="form-control" value="<%= faq.getFaqAnswer() %>"><%= faq.getFaqAnswer() %></textarea>
		</td>
	</tr>

	<tr><th width="150" bgcolor="gray" colspan="2">
		<input type="submit" class="btn btn-default" value="수정하기"> &nbsp;
		<input type="reset" class="btn btn-default" value="취소하기">
	</th></tr>
	</table>
	</form>
	<br>
	<a href="/tonight/flist">목록으로 이동</a>
</div>

<br>
<hr>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>