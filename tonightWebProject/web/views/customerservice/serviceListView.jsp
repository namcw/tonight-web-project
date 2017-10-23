<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<style type="text/css">
 @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
.jumbotron {
		margin-bottom: 0px;
	    background-image: url(/tonight/img/service.jpg);
	    background-position: 90% 25%;
	    background-size: inherit;
	    background-repeat: no-repeat;
	    color: white !important;
	    min-height: 100px;
	     	}

 .jumbotron>div>h3{
 font-family: 'Nanum Pen Script';
 font-size:50px;
 color:black;
 }
</style>
<title>고객센터</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">
  <div class="container text-center">
  		<h3>고객센터</h3>
  </div>
</div>
<ul>
	<li><a href="/tonight/qlist">QnA</a></li>
	<li><a href="/tonight/flist">FAQ</a></li>
</ul>

</body>


</html>