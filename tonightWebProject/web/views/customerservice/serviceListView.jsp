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
 font-size:60px;
 color:black;
 }
 body{
  padding-top: 60px;
  padding-bottom: 40px;
 }
 
 .col-centered{
    float: none !important;
    margin: 0 auto !important;
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
<div class="container text-center">
<div class="col-centered">
<!--  -->
<div>
  <div class="col-xs-6" >
  <a href="/tonight/qlist"><img src="/tonight/img/q&a.PNG" height="230px" width="230px"></a>
  			</div>
  <div class="col-xs-6" >
  <a href="/tonight/flist"><img src="/tonight/img/faq.PNG" height="190px" width="190px"></a>
  </div>
</div>
  <!-- Add the extra clearfix for only the required viewport -->
 
   <div class="clearfix hidden-sm-up"></div>
  <div>
	  <div class="col-xs-6" >
	  <a href="/tonight/qlist"><img src="/tonight/img/q&a.PNG" height="230px" width="230px"></a>
	  </div>
	  
	  <div class="col-xs-6" >
	  <a href="/tonight/qlist"> <img src="/tonight/img/faq.PNG" height="190px" width="190px"></a>
	  </div>
	</div> 
</div>
</div>
       
</body>


</html>