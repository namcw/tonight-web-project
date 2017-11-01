<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="member.model.vo.Member"%>
<% Member member = (Member)session.getAttribute("member"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/tonight/css/bootstrap.min.css">
<style type="text/css">
	.navbar {
		background-color: transparent;
		border-color: transparent;
	}
	.navbar:hover {
		background-color: black !important;
	}
	.navbar a {
	    color: white !important;
	}
	.navbar a:hover { color: red !important; }
	
	
	@media (min-width: 768px) {
	  .navbar-nav.navbar-center {
	    position: absolute;
	    left: 50%;
	    transform: translatex(-50%);
	  }
	  #mobile-logo {
	  	display: none !important;
	  	visibility: hidden !important;
	  }
	}
	@media (max-width: 767px) {
	  #logo {
	  	display: none !important;
	  	visibility: hidden !important;
	  }
	  
	}
	
</style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" id="mobile-logo"href="/tonight/index.jsp"><img width="30" src="/tonight/img/logo.png"></a>
    </div>
    
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-center">
        <li><a href="/tonight/tpopul">인기</a></li>
        <li><a href="/tonight/tlist">여행&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li><a id="logo" class="navbar-brand" href="/tonight/tpopul"><img width="65" src="/tonight/img/logo.png"></a>
        <li><a href="/tonight/alist">숙소</a></li>
        <li class="dropdown">
        	<a class="dropdown-toggle" data-toggle="dropdown">고객센터
        	</a>
        	<ul class="dropdown-menu" style="background-color:black">
      		<li><a href="/tonight/flist">FAQ</a></li>
      		<li><a href="/tonight/qlist">Q&A</a></li>
      		</ul>
        	
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<% if(member == null) { %>
        	<li><a href="/tonight/views/member/loginForm.jsp">로그인&nbsp;&nbsp;</a></li>
        <% } else { %>
        	<li><a href="minfo?memberid=<%= member.getMemberId() %>">마이페이지</a></li>
        	<li><a href="/tonight/logout">로그아웃&nbsp;&nbsp;</a></li>
        <% } %>
        </ul>
    </div>
  </div>
</nav>
<div id="startchange"></div>

<script src="/tonight/js/jquery-3.2.1.min.js"></script>
<script src="/tonight/js/bootstrap.min.js"></script>
<script>
	
</script>
<script>
	$(function(){
		var scroll_start = 0;
		var startchange = $('#startchange');
		var offset = startchange.offset();

		if (startchange.length){
			$(document).scroll(function() { 
				scroll_start = $(this).scrollTop();
				if(scroll_start > offset.top) {
					$('.navbar').css('background-color', 'rgba(0, 0, 0, 0.7)');
				}
				else {
					$('.navbar').css('background-color', 'transparent');
				}
			});
		}
		$('.dropdown-toggle').dropdown();
	});
</script>
<script src="/tonight/js/jquery-3.2.1.min.js"></script>
<script src="/tonight/js/bootstrap.min.js"></script>
</body>
</html>