<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWriteForm</title>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <style>
    #contentForm {
      width: 40%;
      margin: 0 auto;
      padding-top: 12%;
    }
 
    .table > div > tr > th, .table > tbody > tr > th {
      background-color: #e6ecff;
      text-align: center;
    }
  </style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr style="clear:both">
<h1 align="center"> QNA 글쓰기</h1>
<br>
<div class="container">
<form action="/tonight/binsert" method="post" enctype="multipart/form-data">
<table align="center" border="1" cellspacing="0" width="700" class="table table-striped table-bordered">
<tr><th>제목</th><td><input type="text" name="btitle"></td></tr>
<tr><th>작성자</th>
<td><input type="text" readonly name="bwriter" value="<%= member.getMemberId() %>"></td></tr>
<tr><th>내용</th><td><textarea style="resize:none;" cols="40" rows="10" rows="5" cols="50" name="faqAnswer" class="form-control"></textarea></td>
	</tr>
<tr><td colspan="2" align="center">
	<input  class="btn btn-info" type="submit" value="등록하기">
	<br><br>
	<button type="button" onclick="location.href='/tonight/blist' " class="btn btn-info">목록으로 이동</button>
	</td>
</tr>
</table>
</form>
</div>
<br>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>








