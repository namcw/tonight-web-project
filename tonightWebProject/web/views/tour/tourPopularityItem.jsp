<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, tour.model.vo.Tour, accom.model.vo.Accommodation"%>
    
<%
//import할때 tourpopularity.java는 sql문에서 이미처리되었기 때문에 tour만 import
	ArrayList<Tour> list = (ArrayList<Tour>)request.getAttribute("tpopul");
	ArrayList<Accommodation> list1=(ArrayList<Accommodation>)request.getAttribute("apopul");
	
%>
<!DOCTYPE html >
<html>
<head>

<link href="styles/ihover.css" rel="stylesheet">
<meta charset=UTF-8>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

 #h3{
 font-family: 'Nanum Pen Script'; 
 font-size: 50px;
}


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

	
.thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail p {
      margin-top: 15px;
      color: #555;
  }


	
.ih-item {
  position: relative;
  -webkit-transition: all 0.35s ease-in-out;
  -moz-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
}
.ih-item,
.ih-item * {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.ih-item a {
  color: #333;
}
.ih-item a:hover {
  text-decoration: none;
}
.ih-item img {
  width: 100%;
  height: 100%;
}

.ih-item.circle {
  position: relative;
  width: 220px;
  height: 220px;
  border-radius: 50%;
}
.ih-item.circle .img {
  position: relative;
  width: 220px;
  height: 220px;
  border-radius: 50%;
}
.ih-item.circle .img:before {
  position: absolute;
  display: block;
  content: '';
  width: 100%;
  height: 100%;
  border-radius: 50%;
  box-shadow: inset 0 0 0 16px rgba(255, 255, 255, 0.6), 0 1px 2px rgba(0, 0, 0, 0.3);
  -webkit-transition: all 0.35s ease-in-out;
  -moz-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
}
.ih-item.circle .img img {
  border-radius: 50%;
}
.ih-item.circle .info {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  text-align: center;
  border-radius: 50%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.ih-item.circle.effect5 {
  -webkit-perspective: 900px;
  -moz-perspective: 900px;
  perspective: 900px;
}
.ih-item.circle.effect5.colored .info .info-back {
  background: #1a4a72;
  background: rgba(26, 74, 114, 0.6);
}
.ih-item.circle.effect5 .info {
  -webkit-transition: all 0.35s ease-in-out;
  -moz-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
  -webkit-transform-style: preserve-3d;
  -moz-transform-style: preserve-3d;
  -ms-transform-style: preserve-3d;
  -o-transform-style: preserve-3d;
  transform-style: preserve-3d;
}
.ih-item.circle.effect5 .info .info-back {
  visibility: hidden;
  border-radius: 50%;
  width: 100%;
  height: 100%;
  background: #333333;
  background: rgba(0, 0, 0, 0.6);
  -webkit-transform: rotate3d(0, 1, 0, 180deg);
  -moz-transform: rotate3d(0, 1, 0, 180deg);
  -ms-transform: rotate3d(0, 1, 0, 180deg);
  -o-transform: rotate3d(0, 1, 0, 180deg);
  transform: rotate3d(0, 1, 0, 180deg);
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}
.ih-item.circle.effect5 .info h3 {
  color: #fff;
  text-transform: uppercase;
  position: relative;
  letter-spacing: 2px;
  font-family: 'Nanum Pen Script';
  font-size: 28px;
  margin: 0 30px;
  padding: 55px 0 0 0;
  height: 110px;
  text-shadow: 0 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.3);
}
.ih-item.circle.effect5 .info p {
  color: #bbb;
  padding: 10px 5px;
  font-style: italic;
  margin: 0 30px;
  font-size: 12px;
  border-top: 1px solid rgba(255, 255, 255, 0.5);
}
.ih-item.circle.effect5 a:hover .info {
  -webkit-transform: rotate3d(0, 1, 0, -180deg);
  -moz-transform: rotate3d(0, 1, 0, -180deg);
  -ms-transform: rotate3d(0, 1, 0, -180deg);
  -o-transform: rotate3d(0, 1, 0, -180deg);
  transform: rotate3d(0, 1, 0, -180deg);
}
.ih-item.circle.effect5 a:hover .info .info-back {
  visibility: visible;
}


.ih-item.circle.effect10 .img {
  z-index: 11;
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transform: scale(1);
  -webkit-transition: all 0.35s ease-in-out;
  -moz-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
}
.ih-item.circle.effect10.colored .info {
  background: #1a4a72;
}
.ih-item.circle.effect10 .info {
  background: #333333;
  opacity: 0;
  -webkit-transform: scale(0);
  -moz-transform: scale(0);
  -ms-transform: scale(0);
  -o-transform: scale(0);
  transform: scale(0);
  -webkit-transition: all 0.35s ease-in-out;
  -moz-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
}
.ih-item.circle.effect10 .info h3 {
  color: #fff;
  text-transform: uppercase;
  position: relative;
  letter-spacing: 2px;
  font-size: 40px;
  font-family: 'Nanum Pen Script'; 
  text-shadow: 0 0 1px white, 0 1px 2px rgba(0, 0, 0, 0.3);
}
.ih-item.circle.effect10 .info p {
  color: #bbb;
  font-family: 'Nanum Pen Script'; 
  font-size: 20px;
  border-top: 1px solid rgba(255, 255, 255, 0.5);
}
.ih-item.circle.effect10 a:hover .info {
  visibility: visible;
  opacity: 1;
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transform: scale(1);
}

.ih-item.circle.effect10.top_to_bottom .info h3 {
  margin: 0 30px;
  padding: 25px 0 0 0;
  height: 78px;
}
.ih-item.circle.effect10.top_to_bottom .info p {
  margin: 0 30px;
  padding: 5px;
}
.ih-item.circle.effect10.top_to_bottom a:hover .img {
  -webkit-transform: translateY(50px) scale(0.5);
  -moz-transform: translateY(50px) scale(0.5);
  -ms-transform: translateY(50px) scale(0.5);
  -o-transform: translateY(50px) scale(0.5);
  transform: translateY(50px) scale(0.5);
}

.ih-item.circle.effect10.bottom_to_top .info h3 {
  margin: 95px 30px 0;
  padding: 25px 0 0 0;
  height: 78px;
}
.ih-item.circle.effect10.bottom_to_top .info p {
  margin: 0 30px;
  padding: 5px;
}
.ih-item.circle.effect10.bottom_to_top a:hover .img {
  -webkit-transform: translateY(-50px) scale(0.5);
  -moz-transform: translateY(-50px) scale(0.5);
  -ms-transform: translateY(-50px) scale(0.5);
  -o-transform: translateY(-50px) scale(0.5);
  transform: translateY(-50px) scale(0.5);
  }
  
 
</style>
<title>인기</title>
</head>

<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">
  <div class="container text-center">
    <h1>인기상품</h1>      
    
  </div>
</div><br><br>

 <div class="container-fluid bg-3 text-center" id="tour" >

<h3 id="h3"><img alt="img" src="/tonight/img/gg.png" width="50px" height="50px"> 인기 여행 상품 <img alt="img" src="/tonight/img/gg.png" width="50px" height="50px"></h3><br>

<%-- <div class="row">
  	 <div class="col-sm-4"> 
  	 
  	  	
      <p><%=tour.getTourId() %></p>
      <div class="ih-item circle effect5"><a href="/tonight/tdetail?tid=<%= tour.getTourId() %>">
      <div><img src="<%=tour.getTourThumnailPath() %>" class="img-responsive" width="400" height="300" alt="Image"></div>
      <div class="info">
      <div class="info-back">
       <p><strong><%=tour.getTourTitle() %></strong></p>
      </div>
      </div>
      </a></div>
    
    </div>
</div>	 --%>
<div class="row" >
	<div class="col-md-2"></div>
	<div class="col-md-8">
	<% for(Tour tour : list) { %>
	
	  <div class="col-xs-4" style="border-style:outset; border-width:2px">
	 	
	    <div class="ih-item circle effect5"><a href="/tonight/tdetail?tid=<%= tour.getTourId() %>">
	    <div class="spinner"></div>
	        <div class="img"><img src="<%=tour.getTourThumnailPath() %>"alt="img"></div>
	        <div class="info">
	          <div class="info-back">
	            <h3>여행 패키지 Top 3</h3>
	          <p><%=tour.getTourTitle() %></p>
	          </div>
	        </div></a>
	    </div>
	    
	  <br>
	  </div>
	  <br>
	 <%} %>
	
	</div>
	
	
	<div class="col-md-2"></div>
	
	
	
</div>
<br><br>
</div>


 <div class="container-fluid bg-3 text-center" id="accom">
<h3 id="h3"><img alt="img" src="/tonight/img/sleep.PNG" width="50px" height="50px">인기 숙소 상품<img alt="img" src="/tonight/img/sleep.PNG" width="50px" height="50px"></h3><br>

<div class="row" >
	<div class="col-md-2" id="hmm"></div>
	<div class="col-md-8">


<div class="row text-center">
<% for(Accommodation accom : list1) { %>
  	<%--  <div class="col-sm-4"> 
  	  <div class="thumbnail">
  	  
      <p><%=accom.getAccId() %></p>
      <a href="/tonight/adetail?accomId=<%= accom.getAccId() %>">
      <img src="<%=accom.getAccImagePath() %>" class="img-responsive" style="width:100%" alt="Image">
      </a>
    <p><strong><%=accom.getAccName() %></strong></p>
   </div>
    </div> --%>
    <!-- Top to bottom-->

  <div class="col-sm-4" style="border-style:outset; border-width:2px">
 
    <!-- normal -->
    <div class="ih-item circle effect10 top_to_bottom"><a href="/tonight/adetail?accomId=<%= accom.getAccId() %>">
        <div class="img"><img src="<%=accom.getAccImagePath() %>" alt="img"></div>
        <div class="info">
          <h3 >숙소 Top 3</h3>
           <p><%=accom.getAccName() %></p>
        </div></a></div>
    <!-- end normal -->
 <br>
  </div>
  <br>
<%} %>

</div>	
<div class="col-md-2"></div> 
</div>
</div> 
</div>
<div class="container">
	<br><br>
</div>

<%@ include file="../includes/footer.jsp" %>
</body>
</html>