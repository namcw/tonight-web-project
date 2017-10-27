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
</body>
</html>