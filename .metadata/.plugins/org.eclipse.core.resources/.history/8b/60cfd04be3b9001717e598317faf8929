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
</style>

</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">
  <div class="container text-center">
    <h3>강원도 숙소</h3>      
    <p>가나다라마바사아자차카타파하</p>
  </div>
</div>
<div align="center">
	<form action="/tonight/asearch" method="post">
	<input type="search" autocomplete name="keyword" length="50"> &nbsp;
	<input type="submit" value="숙소검색">
	</form>
</div>
<div class="container-fluid bg-3 text-center">
	<br><br>
	<% int cnt = 0; %>
	<%
		for(Accommodation a : list){
	%>
		<div class="col-sm-4">
				<a href="/tonight/adetail?accomId=<%= a.getAccId() %>&page=<%= currentPage %>"><img src="<%= a.getAccImagePath() %>" class="img-responsive" style="width:100%" alt="Image"></a>
				<p id="title"><%= a.getAccName() %></p>
				<p class="else"><%= a.getAccAddress() %></p>
				<p class="else"><%= a.getAccRank() %></p>
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
	<a href="/tonight/alist?page=<%= currentPage - 1 %>">[이전]</a>
<% } %>
<%-- 현재 페이지 숫자 보여주기 --%>
<% for(int p = startPage; p <= endPage; p++){ 
	if(p == currentPage){
%>
	<b><font size="4" color="blue">[<%= p %>]</font></b>
<%     }else{ %>
	<a href="/tonight/alist?page=<%= p %>"><%= p %></a>
<% }} %>
<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
<% if(currentPage >= maxPage){ %>
	[다음]
<% }else{ %>
	<a href="/tonight/alist?page=<%= currentPage + 1 %>">[다음]</a>
<% } %>
</div>
<br>
<% if(member != null){ %>
	<div align="center">
	<button class="btn btn-outline-secondary" onclick="showWriteAccom();">숙소추가</button>
	</div>
<% } %>
<br><br><br>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>