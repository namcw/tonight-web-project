<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, faq.model.vo.Faq" %>
<% ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list"); 
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
<title>faqListView</title>
<style type="text/css">
	.jumbotron {
		margin-bottom: 0px;
	   /*  background-image: url(img/jumbotronbackground.jpg); */
	    background-color: white !important;
	    background-position: 0% 25%;
	    background-size: cover;
	    background-repeat: no-repeat;
	    color: black !important;
	    min-height: 200px;
	}
	.jumbotron > div {
		margin-top: 50px;
	}
</style>
<script type="text/javascript">
	function insertPage(){
		location.href="views/faq/faqWriteForm.jsp";
	}
</script>
 <link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <style>
    #container {
      width: 70%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
     
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    /* Bootstrap 수정 */
    .table > thead {
      background-color: #b3c6ff;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    div > #paging {
      text-align: center;
    }
     
    .hit {
      animation-name: blink;
      animation-duration: 1.5s;
      animation-timing-function: ease;
      animation-iteration-count: infinite;
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
  </style>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">
  <div class="container text-center">
    <h2>Faq게시판</h2>      

  </div>
</div>
<table align="center" height=150 width="1000" border="1" cellspacing="0" class="table table-striped table-bordered table-hover">
     <thead>
          <tr>
            <th width="10%">번호</th>
            <th width="10%">카테고리</th>
            <th width="20%">제목</th>
            <th width="50%">내용</th>
            <th width="10%">조회수</th>
          </tr>
        </thead>
<% 
	for(Faq faq : list){
%>
<tr height="30">
	<td align="center"><%= faq.getFaqNo() %></td>
<td align="center"><%= faq.getFaqCategory() %></td>
	<td>
	<% if(member != null){ %>
		<a href="/tonight/fdetail?no=<%= faq.getFaqNo() %>">
			<%= faq.getFaqTitle() %>
		</a>
	<% }else{ %>
		<%= faq.getFaqTitle() %>
	<% } %>
	</td>
<td align="center">
	<% if(member != null){ %>
		<a href="/tonight/fdetail?no=<%= faq.getFaqNo() %>">
			<%= faq.getFaqAnswer() %>
		</a>
	<% }else{ %>
		<%= faq.getFaqAnswer() %>
	<% } %>
</td>
<td align="center"><%= faq.getFaqReadCount() %></td>
<% } %>


	</tr>
</table>
<div align="center" >
<ul class="pagination">
<% if(currentPage <= 1){ %>
	<li>[이전] &nbsp;</li>
<% }else{ %>
	<li><a href="/tonight/flist?page=<%= currentPage - 1 %>">[이전]</a></li>
<% } %>
<%-- 현재 페이지 숫자 보여주기 --%>

<% for(int p = startPage; p <= endPage; p++){ 
		if(p == currentPage){
%>
	<li><b><font size="4" color="red">[<%= p %>]</font></b></li>
<%     }else{ %>
	<li><a href="/tonight/flist?page=<%= p %>"><%= p %></a></li>
<% }} %>
<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
<% if(currentPage >= maxPage){ %>
	<li>[다음]</li>
<% }else{ %>
	<li><a href="/tonight/flist?page=<%= currentPage + 1 %>">[다음]</a></li>
<% } %>
</ul>
</div>

<br><br>
<div align="center">
	<form action="/tonight/fsearch" method="post">
	<input type="search" autocomplete name="keyword" length="50"> &nbsp;
	<input type="submit" value="제목검색">
	</form>
</div>
<br>
<div align="center">
	<button onclick="insertPage();">글쓰기</button>
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