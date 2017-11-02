<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
    int currentPage = Integer.parseInt(request.getParameter("page"));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardReployForm</title>
<style>

  	resize:none;
    .table > div > tr > th, .table > tbody > tr > th {
      background-color: #e6ecff;
      text-align: center;
    }
</style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr style="clear:both;">
<h2 align="center"><%= bnum %> 번글 댓글달기</h2>
<br>

<form action="/tonight/breply" method="post" >
<input type="hidden" name="page" value="<%= currentPage %>">
<input type="hidden" name="bnum" value="<%= bnum %>">
<div class="container">
<table align="center" cellspacing="0" border="1" width="500" class="table table-striped table-bordered">
<tr><th>제목</th><td><input type="text" name="btitle"></td></tr>
<tr><th>작성자</th>
<td>
<input type="text" name="bwriter" value="<%= member.getMemberId() %>" readonly></td></tr>
<tr><th>내용</th><td><textarea name="bcontent" style="resize:none;" cols="40" rows="10" rows="5" cols="50"  class="form-control"></textarea></td></tr>
<tr><th colspan="2" align="center">
	<input class="btn btn-info" type="submit" value="댓글등록"> &nbsp;
	<button type="button" onclick="location.href='javascript:history.go(-1);' " class="btn btn-info">이전페이지로</button>
	<button type="button" onclick="location.href='/tonight/blist' " class="btn btn-info">목록으로 이동</button>
</th></tr>
</table>
</form>
</div>
<br>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>














