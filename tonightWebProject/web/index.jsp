<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, tour.model.vo.Tour" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tonight</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	.jumbotron {
		margin-bottom: 0px;
	    background-image: url(img/tonight.png);
	    background-position: 0% 25%;
	    background-size: cover;
	    background-repeat: no-repeat;
	    color: white !important;
	   height: 250px;
	}
	.jumbotron > div {
		margin-top: 50px;
		
		
		
	}
	.jumbotron >div>h1{
	font-family: 'Nanum Pen Script';
	font-size: 100px;
	}

#tour{

border : 1px solid gray;
padding: 5px;
}	

#house{

border : 1px solid gray;
padding: 5px;
}	

#house.clearfix {
    overflow: auto;
}

</style>
</head>
<body>
<%@ include file="views/includes/header.jsp" %>
<div class="jumbotron">
  <div class="container text-center">
    <h1>Tonight</h1>      
    
  </div>
</div>
  
<div class="container-fluid bg-3 text-center" id="tour">    
  <h3>인기 여행 상품</h3><br>
  <div class="row">
  	   <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  
    
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
   
  </div>
 
</div><br>


<div class="container-fluid bg-3 text-center" id="house">    
 <div class="clearfix">
  <h3>인기 숙소 상품</h3><br>
  <div class="row">
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br>
<div class="container-fluid bg-3 text-center">    
  <div class="row">
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div></div><br><br>
<%@ include file="views/includes/footer.jsp" %>

</body>
</html>

