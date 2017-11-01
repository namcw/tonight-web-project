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
	.jumbotron {
		margin-bottom: 0px;
	    background-image: url(img/jumbotronbackground.jpg);
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
	
	@media ( min-width : 767px) {
	.thumb { display: block; overflow: hidden; height: 250px; width: 340px; } 
	
	.thumb a img { display: block; /* Otherwise it keeps some space around baseline */ min-width: 100%; /* Scale up to fill container width */ min-height: 100%; /* Scale up to fill container height */ -ms-interpolation-mode: bicubic; /* Scaled images look a bit better in IE now */ }
	}
	@media ( min-width : 1200px) {
	.thumb { display: block; overflow: hidden; height: 300px; width: 400px; } 
	
	.thumb a img { display: block; /* Otherwise it keeps some space around baseline */ min-width: 100%; /* Scale up to fill container width */ min-height: 100%; /* Scale up to fill container height */ -ms-interpolation-mode: bicubic; /* Scaled images look a bit better in IE now */ }
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
			<div class="thumb">
			<a href="/tonight/tdetail?tid=<%= tour.getTourId() %>">
				<img src="/tonight/tuploadfiles/<%= tour.getTourRname() %>" class="img-responsive">
			</a>
			</div>
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
<div class="container" align="center">
<button type="button" id="register" class="btn btn-default pull-right">등록하기</button>
<%-- 이전 페이지 있을 경우에 대한 처리 --%>
<ul class="pagination pagination-lg">
<% if(currentPage <= 1){ %>
	
<% }else{ %>
	<li><a href="/tonight/tlist?page=<%= currentPage - 1 %>"><span class="glyphicon glyphicon-menu-left"></span></a></li>
<% } %>
<%-- 현재 페이지 숫자 보여주기 --%>
<% for(int p = startPage; p <= endPage; p++){ 
	if(p == currentPage){
%>
	<li><a style="background-color:lightgray"><%= p %></a></li>
<%     }else{ %>
	<li><a href="/tonight/tlist?page=<%= p %>"><%= p %></a></li>
<% }} %>
<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
<% if(currentPage >= maxPage){ %>
	
<% }else{ %>
	<li><a href="/tonight/tlist?page=<%= currentPage + 1 %>"><span class="glyphicon glyphicon-menu-right"></span></a></li>
<% } %>
</ul>
</div>
<%@ include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(register).click(function() {
		<% if(member == null) { %>
			alert("로그인해야됩니다.");
			location.href="/tonight/views/member/loginForm.jsp";
		<% } else if(member.getMemberType().equals("G")) { %>
			location.href="/tonight/views/tour/tourInsertView.jsp";
		<% } else { %>
			alert("가이드 회원만 등록할 수 있습니다.");
		<% } %>
	});
</script>
</body>
</html>