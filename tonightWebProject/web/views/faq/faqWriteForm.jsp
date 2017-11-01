<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqWriteForm</title>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <style>
  resize:none;
  
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
  <script type="text/javascript">

</script>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr>
<br>
<h2 align="center">FAQ글쓰기 페이지</h2>
<br>
<div class="container">
<section align="center">
	<form action="/tonight/finsert" method="post">
	<table border="1" cellspacing="0" width="600" align="center" class="table table-striped table-bordered">
	<tr><th width="150">제목</th>
		<td align="left"><input type="text" name="faqTitle"></td>
	</tr>
	<tr><th width="150" >카테고리</th>
		<td align="left">
		<select name="faqCategory" class="btn btn-default dropdown-toggle btn-select" href="#" data-toggle="dropdown">
		<span class="caret"></span>
		<ul class="dropdown-menu">
			<option value="" selected>카테고리설정</option>
			<option value="숙소">숙소</option>
			<option value="패키지상품">패키지상품</option>
			<option value="가이드">가이드</option>
			<option value="예약/결제">예약/결제</option>
			<option value="환불/변경">환불/변경</option>
			<option value="이벤트">이벤트</option>
			<option value="회원관리">회원관리</option>
			<option value="기타">기타</option>
			</ul>
		</select>
		</td>
	</tr>
	<tr><th width="150" >내용</th>
		<td align="left"><textarea style="resize:none;" cols="40" rows="10" rows="5" cols="50" name="faqAnswer" class="form-control"></textarea></td>
	</tr>
	<tr><th width="150" bgcolor="gray" colspan="2">
		<input type="submit" value="등록하기"> &nbsp;
		<input type="reset" value="다시입력"><Br><Br>
		<button type="button" onclick="location.href='/tonight/flist' " class="btn btn-info">목록으로 이동</button>
	</th></tr>
	</table>
	</form>
	<br>
	
</section>
<br>
<hr>
<%@ include file="../includes/footer.jsp" %>
</div>
</body>
</html>