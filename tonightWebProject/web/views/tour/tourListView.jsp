<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tour.model.vo.Tour, java.util.ArrayList" %>
<%
	ArrayList<Tour> list = (ArrayList<Tour>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	ArrayList<Integer> trCntList = (ArrayList<Integer>)request.getAttribute("trCntList");
	ArrayList<Double> trAvgList = (ArrayList<Double>)request.getAttribute("trAvgList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tour list</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	.jumbotron {
		margin-bottom: 0px;
	    background-image: url(img/tour.png);
	    background-position: 0% 25%;
	    background-size: cover;
	    background-repeat: no-repeat;
	    color: white !important;
	    min-height: 100px;
	     	}
	.jumbotron > div {
		margin-top: 30px;
	}
	.container-fluid {
		max-width: 1280px;
	}
	.col-md-4 > #title {
		font-weight: bold; 
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		text-align: left;
	}
	.col-md-4 > #gid {
		text-align: right;
	} 
	.jumbotron >div>h3{
	
	font-family: 'Nanum Pen Script';
	font-size: 60px;
	
	}
</style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">
  <div class="container text-center">
    <h3>강원도 패키지 여행</h3>      
    <p>가나다라마바사아자차카타파하</p>
  </div>
</div>
<div class="container-fluid bg-3 text-center">
	<br><br>
	<% int cnt = 0; %>
	<% for(Tour tour : list) { %>
		<div class="col-sm-6 col-md-4">
			<a href="/tonight/tdetail?tid=<%= tour.getTourId() %>&page=<%= currentPage %>">
				<img src="<%= tour.getTourThumnailPath() %>" class="img-responsive" style="width:100%" alt="Image">
			</a>
			<p id="title"><%= tour.getTourTitle() %></p>
			
			<div class="row">
				
				<img src="/tonight/img/starGrade<%= Math.round(trAvgList.get(tour.getTourId()-1)) %>.png" class="col-xs-4">
				
				<p class="col-xs-1">
				(<%= trCntList.get(tour.getTourId()-1) %>)
				
				</p>
			</div>
			<%-- <p id="gid"><%= tour.getTourId() %></p> --%>
			<br>
	    </div>
	    <% 
	    	cnt++;
	    	if(cnt % 3 == 0) { 
	    %>
	    	<br><br>
	    <% } %>
	<% } %>
</div>
<br>
<%-- 페이지 번호 처리 --%>
<div align="center">
<%-- 이전 페이지 있을 경우에 대한 처리 --%>
<% if(currentPage <= 1){ %>
	[이전] &nbsp;
<% }else{ %>
	<a href="/tonight/tlist?page=<%= currentPage - 1 %>">[이전]</a>
<% } %>
<%-- 현재 페이지 숫자 보여주기 --%>
<% for(int p = startPage; p <= endPage; p++){ 
	if(p == currentPage){
%>
	<b><font size="4" color="blue">[<%= p %>]</font></b>
<%     }else{ %>
	<a href="/tonight/tlist?page=<%= p %>"><%= p %></a>
<% }} %>
<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
<% if(currentPage >= maxPage){ %>
	[다음]
<% }else{ %>
	<a href="/tonight/tlist?page=<%= currentPage + 1 %>">[다음]</a>
<% } %>
</div>

</body>
</html>