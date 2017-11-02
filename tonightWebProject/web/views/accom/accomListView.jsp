<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accom.model.vo.Accommodation, java.util.ArrayList" %>
<%
	ArrayList<Accommodation> list = (ArrayList<Accommodation>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	ArrayList<Integer> arCntList = (ArrayList<Integer>)request.getAttribute("arCntList");
	ArrayList<Double> arAvgList = (ArrayList<Double>)request.getAttribute("arAvgList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accomListView</title>
<script type="text/javascript">
	function showWriteAccom(){
		location.href = "views/accom/accomWriteForm.jsp";
	}
</script>
<style type="text/css">
	.jumbotron {
		margin-bottom: 0px;
	    background-image: url(img/jumbotronbackground.jpg);
	    background-position: 0% 25%;
	    background-size: cover;
	    background-repeat: no-repeat;
	    color: white !important;
	    min-height: 100px;
	    -webkit-filter: grayscale(40%);
      	filter: grayscale(40%);
	    
	}
	.jumbotron > div {
		margin-top: 30px;
	}
	.container-fluid {
		max-width: 1280px;
	}
	.col-sm-4 > #title {
		font-weight: bold; 
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		text-align: left;
	}
	.col-sm-4 > .else {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		text-align: left !important;
	}
	
	.img-responsive {
	width: 310px !important;
	
	height: 200px !important;
}
	
.ih-item.square {
  position: relative;
  width: 316px;
  height: 240px;
  border: 8px solid #fff;
  border-right: 0px !important;
  box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
}
.ih-item.square .info {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  text-align: center;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.ih-item.square.effect3 {
  overflow: hidden;
}
.ih-item.square.effect3.colored .info {
  background: #1a4a72;
}
.ih-item.square.effect3 .img {
  -webkit-transform: translateY(0);
  -moz-transform: translateY(0);
  -ms-transform: translateY(0);
  -o-transform: translateY(0);
  transform: translateY(0);
  -webkit-transition: all 0.35s ease-in-out;
  -moz-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
}
.ih-item.square.effect3 .info {
  height: 95px;
  background: #333333;
  opacity: 0;
  -webkit-transition: all 0.35s ease-in-out;
  -moz-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
}
.ih-item.square.effect3 .info h3 {
  text-transform: uppercase;
  color: #fff;
  text-align: center;
  font-size: 17px;
  padding: 10px 10px 0 4px;
  margin: 4px 0 0 0;
}
.ih-item.square.effect3 .info p {
  font-style: italic;
  font-size: 12px;
  position: relative;
  color: #bbb;
  padding: 5px;
  text-align: center;
}
.ih-item.square.effect3 #atag:hover .info {
  visibility: visible;
  opacity: 1;
}

.ih-item.square.effect3.bottom_to_top .info {
  top: auto;
  -webkit-transform: translateY(100%);
  -moz-transform: translateY(100%);
  -ms-transform: translateY(100%);
  -o-transform: translateY(100%);
  transform: translateY(100%);
}
.ih-item.square.effect3.bottom_to_top #atag:hover .img {
  -webkit-transform: translateY(0px);
  -moz-transform: translateY(0px);
  -ms-transform: translateY(0px);
  -o-transform: translateY(0px);
  transform: translateY(0px);
  
   -webkit-filter: grayscale(40%);
      filter: grayscale(40%);
}
.ih-item.square.effect3.bottom_to_top #atag:hover .info {
  -webkit-transform: translateY(0);
  -moz-transform: translateY(0);
  -ms-transform: translateY(0);
  -o-transform: translateY(0);
  transform: translateY(0);
}

</style>

</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">
  <div class="container text-center">
    <h3>강원도 숙소</h3>      
  </div>
</div>
<form action="/tonight/asearch" method="post">
<div class="col-md-4"></div>
<div class="row" >
  <div class="col-md-1">
  	<select class="form-control" name="astype">
  		<option value="H">호텔</option>
  		<option value="M">모텔</option>
  		<option value="G">게스트하우스</option>
  		<option value="P">펜션</option>
	</select>
  </div>
  <div class="col-md-2">
	<input type="search" class="form-control" name="keyword" placeholder="숙소 이름 검색">
  </div>
  <div class="col-md-2">
  	<input class="btn btn-default" type="submit" value="숙소검색">
  </div> 
</div>
<div class="col-md-3"></div>
</form>

<div class="container-fluid bg-3 text-center">
	<br><br>
	<% int cnt = 0; %>
	<% for(Accommodation a : list){ %>
		<div class="col-sm-6 col-md-4">
		<!-- normal -->
    		<div class="ih-item square effect3 bottom_to_top" onclick="location.href='/tonight/adetail?accomId=<%= a.getAccId() %>'">
        		<div id="atag" style="cursor:pointer;">
	        		<div class="img">
	        			<img src="/tonight/auploadfiles/<%= a.getAccRname() %>" class="img-responsive"  alt="Image">
	        		</div>
	        		<div class="info">
	          			<p id="title"><%= a.getAccName() %></p>
	          			<p class="else"><%= a.getAccAddress() %></p>
						<p class="else"><%= a.getAccRank() %></p>
	          		</div>
          			<div class="row" style="padding-top:4px">
						<img src="/tonight/img/starGrade<%= Math.round(arAvgList.get(a.getAccId()-1)) %>.png" class="col-xs-4">
						<p class="col-xs-4 col-xs-offset-4">review <span class="badge"><%= arCntList.get(a.getAccId()-1) %></span></p>
					</div>
					<p style="position:absolute; bottom:-12px; left:90px; color:white"><%= arAvgList.get(a.getAccId()-1) %></p>
				</div>
		 	</div>
    	<!-- end normal -->
		 <br>
		</div>
	    <% if(++cnt % 3 == 0) { %>
	    	<br><br>
	    <% } %>
    <% } %>
</div>


<br>
<%-- 페이지 번호 처리 --%>
<div align="center">
<%-- 이전 페이지 있을 경우에 대한 처리 --%>
<ul class="pagination pagination-sm">
<% if(currentPage <= 1){ %>
	<li class="disabled"><span class="glyphicon glyphicon-menu-left"></span></li>
<% }else{ %>
	<li><a href="/tonight/alist?page=<%= currentPage - 1 %>"><span class="glyphicon glyphicon-menu-left"></span></a></li>
<% } %>
<%-- 현재 페이지 숫자 보여주기 --%>
<% for(int p = startPage; p <= endPage; p++){ 
	if(p == currentPage){
%>
	<li><a style="background-color:lightgray"><%= p %></a></li>
<%     }else{ %>
	<li><a href="/tonight/alist?page=<%= p %>"><%= p %></a></li>
<% }} %>
<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
<% if(currentPage >= maxPage){ %>
	<li class="disabled"><span class="glyphicon glyphicon-menu-right"></span></li>
<% }else{ %>
	<li><a href="/tonight/alist?page=<%= currentPage + 1 %>"><span class="glyphicon glyphicon-menu-right"></span></a></li>
<% } %>
</ul>
</div>
<br>
<% if(member != null /* && member.getMemberType() =="B" */){ %>
	<div align="center">
	<%if(member.getMemberType().equals("B")){ %>
	<button class="btn btn-default" onclick="showWriteAccom();">숙소추가</button>
	</div>
<% } %>
<% } %>
<br><br><br>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>