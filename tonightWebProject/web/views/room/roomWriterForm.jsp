<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/tonight/css/bootstrap.min.css">
</head>
<style type="text/css">

.jumbotron {
		margin-bottom: 0px;
	    background-image: url(img/loginbackground.jpg);
	    background-position: 0% 25%;
	    background-size: cover;
	    background-repeat: no-repeat;
	    color: white !important;
	    height: 20px;
	}

container {
	padding: 80px 60px;
} 

</style>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">

</div>
	<h3>2단계 객실 등록</h3>
<div class="progress">
  <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
</div>
	<div class="container" id="toTop">
		<h3 class="text-center"><%=member.getMemberId()%> 회원님의 객실등록을 도와드리겠습니다</h3>
	</div>
<div id="fake-footer"></div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>