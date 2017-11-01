<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, faq.model.vo.Faq"%>
<%
	ArrayList<Faq> list = (ArrayList<Faq>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>

<meta charset=UTF-8">
<title>faqListView</title>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
	function insertPage() {
		location.href = "views/faq/faqWriteForm.jsp";
	}
	$(document).ready(
			function() {

				$('.faq_question').click(
						function() {

							if ($(this).parent().is('.open')) {
								$(this).closest('.faq').find(
										'.faq_answer_container').animate({
									'height' : '0'
								}, 500);
								$(this).closest('.faq').removeClass('open');

							} else {
								var newHeight = $(this).closest('.faq').find(
										'.faq_answer').height()
										+ 'px';
								$(this).closest('.faq').find(
										'.faq_answer_container').animate({
									'height' : newHeight
								}, 500);
								$(this).closest('.faq').addClass('open');
							}

						});

			});
	function submitform()
	{
	  document.myform.submit();
	}
</script>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style>

.jumbotron {
		margin-bottom: 0px;
	    background-image: url(/tonight/img/service.jpg);
	    background-position: 90% 25%;
	    background-size: inherit;
	    background-repeat: no-repeat;
	    color: white !important;
	    min-height: 100px;
	     	}
.jumbotron > div {
		margin-top: 30px;
	}

 .jumbotron>div>h3{
 font-family: 'Nanum Pen Script';
 font-size:60px;
 color:black;
 }
 
/*FAQS*/

	p.FAQTITLE{
	font-size:25px;
	 font-style: italic;
	}
    #nowpage{
     background-color: lightgray;
    }
.faq {

	font-size: 18px;
	font-weight: bold;
}

.faq_question {

	display: block;
	text-align: left;
	padding: 0 0 0 35px;
	font-size: 18px;
	
	font-weight: bold;
	line-height: 27px;
	cursor: pointer;
	margin: 10px 0;	
}

.faq_answer_container {
	background-color: lightgray;
	height: 0px;
	overflow: hidden;
	padding: 0 0 0 50px;
	display: block;
	text-align: left;
	font-size: 18px;
	color: #5e5e5e;
	font-weight: bold;
}
.a{
	font-size: 30px;
	color: black;
}
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
</style>
<body>

	<%@ include file="../includes/header.jsp"%>
<div class="jumbotron">
<div class="container text-center">
<h3 >FAQ게시판</h3>
</div>
</div>
	<br>
	<br>

	<div class="container">
		<form name="myform" action="/tonight/fsearch" method="post">
			<select align="left" autocomplete name="keyword"
				class="btn btn-default dropdown-toggle btn-select" href="#"
				data-toggle="dropdown" onchange="submitform();" >
				<span style="float: left" class="caret">
					<ul class="dropdown-menu">
						<option value="" selected>카테고리설정</option>
						<option value="숙소">숙소</option>
						<option value="패키지상품">패키지상품</option>
						<option value="가이드">가이드</option>
						<option value="예약/결제">예약/결제</option>
						<option value="환불/변경">환불/변경</option>
						<option value="이벤트">이벤트</option>
						<option value="회원관리">회원관리</option>
						<option value="기타">기타</option>
					</ul>
			</select></span> 
			<span style="float: right">
				<button type="button" onclick="insertPage();" class="btn btn-info">글쓰기</button>
			</span>
		</form>
	</div>
	</div>
	</div>
	<%
		for (Faq faq : list) {
	%>
	<div class="container">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	<div class="panel panel-default"> <div class="panel-heading" role="tab" id="headingOne">
		<div class="faq">
			<p class="FAQTITLE">Category  <%=faq.getFaqCategory()%>
			<span style="float: right">
			<a href="/tonight/fupdateview?no=<%=faq.getFaqNo()%>">
			<i class="fa fa-pencil-square"></i></a>&nbsp
			<a href="/tonight/fdelete?no=<%=faq.getFaqNo()%>">
			<i class="fa fa-trash"></i></a></span>
				&nbsp; </p></p>
			<div class="faq_question">
				Q:<%=faq.getFaqTitle()%><span style="float: right">
				<a class="a"><i class="fa fa-angle-double-down" aria-hidden="true"></i></a></span>
			</div>
			<div align="right" class="faq_answer_container">
				<div class="faq_answer">
					<th>A:</th><%=faq.getFaqAnswer()%></div>
			</div>
		</div></div>
		</div>
	</div>
	</div>
	<%
		}
	%>

	<div class="col-md-12" align="center">
		<ul class="pagination">
			<%
				if (currentPage <= 1) {
			%>

			<%
				} else {
			%>
			<li><a href="/tonight/flist?page=<%=currentPage - 1%>"><</a></li>
			<%
				}
			%>
			<%-- 현재 페이지 숫자 보여주기 --%>

			<%
				for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
			%>
			<li><a id="nowpage" href="/tonight/flist?page=<%=p%>"><%=p%></a></li>
			<%
				} else {
			%>
			<li><a href="/tonight/flist?page=<%=p%>"><%=p%></a></li>
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
			<li><a href="/tonight/flist?page=<%=currentPage + 1%>">></a></li>
			<%
				}
			%>
		</ul>
	</div>
	<br>
	<br>
	<br>
	<hr>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>