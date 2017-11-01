<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, qna.model.vo.Qna"%>
<% ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list"); 
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	%>
<!DOCTYPE html>
<html>
<head>

<meta charset=UTF-8">
<title>qnaListView</title>
<script type="text/javascript">
	function insertPage(){
		location.href="views/qna/qnaWriteForm.jsp";
	}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style>
.jumbotron {
		margin-bottom: 0px;
	    background-image: url(img/service.jpg);
	    background-position: 90% 25%;
	    background-size: inherit;
	    background-repeat: no-repeat;
	    color: white !important;
	    min-height: 100px;
	     	}
	.jumbotron > div {
		margin-top: 30px;
	}


.jumbotron >div>h3{
	
	font-family: 'Nanum Pen Script';
	font-size: 60px;
	color:black;
	
	}
    #nowpage{
     background-color: lightgray;
    }
    #contentForm {
      width: 40%;
      margin: 0 auto;
      padding-top: 12%;
    }
 
    .table > div > tr > th, .table > tbody > tr > th {
    
      background-color: #e6ecff;
      text-align: center;
    }
   .a{
   font-family: "맑은 고딕";
    text-shadow: 4px 2px;
	font-size: 30px;
	color: black;
}
  </style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">
<div class="container text-center">
<h3>Q&A 게시판</h3>
</div>
</div>
<br><br>
<div class="container">
<table align="center" width="1000" border="1" cellspacing="0" class="table table-striped table-bordered">
<th>번호</th><th>제목</th><th>질문내용</th><th>작성자</th><th>조회수</th>
<% 
	for(Qna qna : list){
%>
<tr height="30">
	<td align="center"><%= qna.getQnaNo() %></td>
	<td>
	<%-- 답글일 때는 들여쓰기하면서 앞에 ▶ 표시함 --%>
		<% if(qna.getQnaLevel() == 1){  //원글의 댓글일 때 %>
		&nbsp; &nbsp; ▶
		<% }else if(qna.getQnaLevel() == 2){  //댓글의 댓글일 때 %>
		&nbsp; &nbsp; &nbsp; &nbsp; ▶▶
		<% } %>
	<%-- 로그인한 경우 상세보기 가능하게 처리함 --%>
		<% if(member != null){ %>
			<a href="/tonight/qdetail?bnum=<%= qna.getQnaNo() %>&page=<%= currentPage %>">
			<%= qna.getQnaTitle() %>
			</a>
		<% }else{ %>
			<%= qna.getQnaTitle() %>
		<% } %>
	</td>
	<td>
	<% if(member != null){ %>
		<a href="/tonight/qdetail?no=<%= qna.getQnaNo() %>">
			<%= qna.getQnaTitle() %>
		</a>
	<% }else{ %>
		<%= qna.getQnaTitle() %>
	<% } %>
	</td>
<td align="center"><%= qna.getWriterId() %></td>
<td align="center"><%= qna.getqnaReadcount() %></td>
<% } %>


	</tr>
</table>
</div>
	<div class="col-md-12" align="center">
		<ul class="pagination">
			<%
				if (currentPage <= 1) {
			%>

			<%
				} else {
			%>
			<li><a href="/tonight/qlist?page=<%=currentPage - 1%>"><</a></li>
			<%
				}
			%>
			<%-- 현재 페이지 숫자 보여주기 --%>
			<%
				for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
			%>
			<li><a id="nowpage" href="/tonight/qlist?page=<%=p%>"><%=p%></a></li>
			<%
				} else {
			%>
			<li><a href="/tonight/qlist?page=<%=p%>"><%=p%></a></li>
			<%
				}
				}
			%>
			<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
			<%
				if (currentPage >= maxPage) {
			%>
			<%
				} else {
			%>
			<li><a href="/tonight/qlist?page=<%=currentPage + 1%>">></a></li>
			<%
				}
			%>
		</ul>
	</div>
<br><br>
<div name="container" align="center">
	<form action="/tonight/qsearch" method="post">
	<input type="search" autocomplete name="keyword" length="50"> &nbsp;
	<input class="btn btn-default dropdown-toggle btn-select" href="#" type="submit" value="제목검색">
	
	</form>
</div>
<div name="container" align="center">
<button type="button" onclick="insertPage();" class="btn btn-info">글쓰기</button>
</div>

<br><br>
<div align="center">
	<a href="/tonight/index.jsp">시작페이지로 이동</a>
</div>
<br>
<hr>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>