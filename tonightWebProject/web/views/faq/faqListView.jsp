<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, faq.model.vo.Faq" %>
<% ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
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
.jumbotron > div {
		margin-top: 30px;
	}

 .jumbotron>div>h3{
 font-family: 'Nanum Pen Script';
 font-size:60px;
 color:black;
 }
#STATICMENU { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}

#floatdiv a:hover, #floatdiv .menu  { color: red; }

.nav-sidebar { 
    width: 100%;
    padding: 8px 0; 
    border-right: 1px solid #ddd;
}
.nav-sidebar a {
    color: #333;
    -webkit-transition: all 0.08s linear;
    -moz-transition: all 0.08s linear;
    -o-transition: all 0.08s linear;
    transition: all 0.08s linear;
    border-radius: 0; 
}
.nav-sidebar .active a { 
    cursor: default;
    background-color: #428bca; 
    color: #fff;
    text-shadow: 1px 1px 1px #666; 
}
.nav-sidebar .active a:hover {
    background-color: #428bca;   
}


</style>

<meta charset=UTF-8">
<title>faqListView</title>
<script type="text/javascript">
	function insertPage(){
		location.href="views/faq/faqWriteForm.jsp";
	}
	
	//좌측 메뉴
	 var stmnLEFT = 10; // 오른쪽 여백
	 var stmnGAP1 = 0; // 위쪽 여백 
	 var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
	 var stmnBASE = 150; // 스크롤 시작위치 
	 var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
	 var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
	 var stmnTimer; 
	 
	 function RefreshStaticMenu() { 
	  var stmnStartPoint, stmnEndPoint; 
	  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
	  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
	  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
	  if (stmnStartPoint != stmnEndPoint) { 
	   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
	   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
	   stmnRefreshTimer = stmnScrollSpeed; 
	   }
	  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
	  } 
	 function InitializeStaticMenu() {
	  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
	  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
	  RefreshStaticMenu();
	  }
	 //좌측메뉴
	
</script>
</head>
<body onload="InitializeStaticMenu();">
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">
<div class="container text-center">
<h3 >FAQ게시판</h3>
</div>
</div>
<br><br>

<!--좌측메뉴  -->


<div id="floatdiv" class="col-sm-2">
 <nav class="nav-sidebar">
 <ul class="nav">  
  
  <li ><a class="active" href="/tonight/qlist">q&a</a></li>
  <li><a href="/tonight/flist">faq</a></li>
  
     </ul>
     </nav>
</div>
<!--좌측메뉴  -->


<table align="center" width="1000" border="1" cellspacing="0">
<th>번호</th><th>제목</th><th>질문내용</th><th>답변</th><th>조회수</th>
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
<td align="center"><%= faq.getFaqAnswer() %></td>
<td align="center"><%= faq.getFaqReadCount() %></td>
<% } %>


	</tr>
</table>
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