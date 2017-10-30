<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int aid = (int) request.getAttribute("aid");
%>
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

.person {
	border: 10px solid transparent;
	margin-bottom: 25px;
	width: 80%;
	height: 80%;
	opacity: 0.7;
}

.person:hover {
	border-color: #f1f1f1;
}

.carousel-inner img {
	-webkit-filter: grayscale(90%);
	filter: grayscale(90%); /* make all photos black and white */
	width: 100%; /* Set width to 100% */
	margin: auto;
}

.carousel-caption h3 {
	color: #fff !important;
}

@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}
</style>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="jumbotron"></div>
	<h3>2단계 객실 등록</h3>
	<div class="progress">
		<div class="progress-bar bg-success" role="progressbar"
			style="width: 100%" aria-valuenow="25" aria-valuemin="0"
			aria-valuemax="100"></div>
	</div>
	<form action="/tonight/rinsert" method="post"
		enctype="multipart/form-data">

		<input type="hidden" name="aid" value=<%=aid%>>
		<div class="container" id="toTop">
			<h3 class="text-center"><%=member.getMemberId()%>
				회원님의 객실등록을 도와드리겠습니다
			</h3>
			<br>
			<div class="row">
				<div class="col-xs-4">
					<p>사업자 아이디</p>
				</div>
				<div class="col-xs-8">
					<input type="text" class="form-control" readonly name="rwriter"
						value="<%=member.getMemberId()%>">
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-4">
					<p>객실 이름</p>
				</div>
				<div class="col-xs-8">
					<input type="text" class="form-control" name="rname"
						placeholder="객실 이름을 입력하세요.">
				</div>
			</div>
		
		<hr>
		<div class="row">
			<div class="col-xs-4">
				<p>객실 상세정보</p>
			</div>
			<div class="col-xs-8">
				<input type="text" class="form-control" name="rdetail"
					placeholder="객실 상세정보를 입력하세요.">
			</div>
		</div>
			<hr>	
	
		<div class="row">
			<div class="col-xs-4">
				<p>주중 성인 요금</p>
			</div>
			<div class="col-xs-8">
				<input type="text" class="form-control" name="wkadult"
					placeholder="성인 요금을 입력하세요.">
			</div>
		</div>
		
		<br>
		<div class="row">
			<div class="col-xs-4">
				<p>주중 미성년자 요금</p>
			</div>
			<div class="col-xs-8">
				<input type="text" class="form-control" name="wkchild"
					placeholder="미성년자 요금을 입력하세요.">
			</div>
		</div>
		

		<br>
		<div class="row">
			<div class="col-xs-4">
				<p>주말 성인 요금</p>
			</div>
			<div class="col-xs-8">
				<input type="text" class="form-control" name="wddult"
					placeholder="성인 요금을 입력하세요.">
			</div>
		</div>
		
		<br>
		<div class="row">
			<div class="col-xs-4">
				<p>주말 미성년자 요금</p>
			</div>
			<div class="col-xs-8">
				<input type="text" class="form-control" name="wdchild"
					placeholder="미성년자 요금을 입력하세요.">
			</div>
		</div>
		
		<hr>
		</div>
		<!-- end <div class="container" id="toTop"> -->


		<input class="btn btn-default" type="submit" value="객실등록하기">&nbsp;
		<input class="btn btn-default" type="reset" value="취소하기">
	</form>
	<div id="fake-footer"></div>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>