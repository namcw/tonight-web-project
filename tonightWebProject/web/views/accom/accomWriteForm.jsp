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
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">

</div>
	<h3>1단계 숙소 등록</h3>
<div class="progress">
  <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<form action="/tonight/ainsert" method="post" enctype="multipart/form-data">
	<div class="container" id="toTop">
		<h3 class="text-center"><%=member.getMemberId()%> 회원님의 숙소등록을 도와드리겠습니다</h3>
		<br>
		<div class="row">
			<div class="col-md-10">
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 이름</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="aname" placeholder="숙소 이름을 입력하세요.">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>사업자 아이디</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" readonly name="awriter" value="<%= member.getMemberId()%>">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 등급</p>
					</div>
					<div class="col-xs-8">
						<select class="form-control" name="arank">
						  <option value="SILVER">SILVER</option>
						  <option value="GOLD">GOLD</option>
						  <option value="PLATINUM">PLATINUM</option>
						  <option value="DIAMOND">DIAMOND</option>
						</select>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 타입</p>
					</div>
					<div class="col-xs-8">
						<select class="form-control" name="atype">
						  <option value="H">호텔</option>
						  <option value="M" >모텔</option>
						  <option value="G" >게스트하우스</option>
						  <option value="P">펜션</option>
						</select>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 주소</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="aaddress" placeholder="숙소 주소를 입력하세요.">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>연락처</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="acontact" placeholder="연락처를 입력하세요.">
					</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 소개</p>
					</div>
					<div class="col-xs-8">
						<textarea class="form-control" rows="7" name="ainfo"></textarea>
					</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 대표 이미지</p>
					</div>
					<div class="col-xs-8">
						<div class="form-group">
    						<label for="exampleInputFile">이미지 파일 업로드</label>
    						<input type="file" id="exampleInputFile" name="aupfile1">
    						<p class="help-block">여기에 숙소 대표 이미지를 올려주세요.</p>
 						 </div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 상세화면 이미지</p>
					</div>
					<div class="col-xs-8">
						<div class="form-group">
    						<label for="exampleInputFile">이미지 파일 업로드</label>
    						<input type="file" id="exampleInputFile" name="aupfile2">
    						<p class="help-block">여기에 숙소 상세페이지에 올라갈 이미지를 올려주세요.</p>
 						 </div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>편의시설</p>
					</div>
					<div class="col-xs-8">
						<label class="checkbox-inline">
							<input type="checkbox" id="inlineCheckbox1" name="afacilities" value="주차장"> 주차장
						</label>
						<label class="checkbox-inline">
  							<input type="checkbox" id="inlineCheckbox2" name="afacilities" value="수영장"> 수영장
						</label>
						<label class="checkbox-inline">
  							<input type="checkbox" id="inlineCheckbox3" name="afacilities" value="엘레베이터"> 엘레베이터
						</label>
						<br><br>
						<label class="checkbox-inline">
							<input type="checkbox" id="inlineCheckbox1" name="afacilities" value="무선인터넷"> 무선인터넷
						</label>
						<label class="checkbox-inline">
  							<input type="checkbox" id="inlineCheckbox2" name="afacilities" value="부엌"> 부엌
						</label>
						<label class="checkbox-inline">
  							<input type="checkbox" id="inlineCheckbox3" name="afacilities" value="욕조"> 욕조
						</label>
						<br><br>
						<label class="checkbox-inline">
							<input type="checkbox" id="inlineCheckbox1" name="afacilities" value="air"> 에어컨
						</label>
						<label class="checkbox-inline">
  							<input type="checkbox" id="inlineCheckbox2" name="afacilities" value="wash"> 세탁기
						</label>
						<label class="checkbox-inline">
  							<input type="checkbox" id="inlineCheckbox3" name="afacilities" value="tv"> TV
						</label>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>이용규칙</p>
					</div>
					<div class="col-xs-8">
						<textarea class="form-control" rows="7" name="arules"></textarea>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>환불규정</p>
					</div>
					<div class="col-xs-8">
						<textarea class="form-control" rows="7" name="arefund"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div><!-- end <div class="container" id="toTop"> -->
	<input class="btn btn-default" type="submit" value="숙소등록하기"> &nbsp;
	<input class="btn btn-default" type="reset" value="취소하기">
</form>
<div id="fake-footer"></div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>