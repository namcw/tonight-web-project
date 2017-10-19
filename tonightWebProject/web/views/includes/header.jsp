<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="member.model.vo.Member"%>
<% Member member = (Member)session.getAttribute("member"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/tonight/css/bootstrap.min.css">

</head>
<body>
<nav class="navbar navbar-fixed-top navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      	

      <a class="navbar-brand" href="#">Tonight</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="#">메뉴1</a></li>
        <li><a href="#">메뉴2</a></li>
        <li><a href="#">메뉴3</a></li>
        <li><a href="#">메뉴4</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">SIGN IN</a></li>
      </ul>
    </div>
  </div>
</nav>
<script src="/tonight/js/jquery-3.2.1.min.js"></script>
<script src="/tonight/js/bootstrap.min.js"></script>
</body>
</html>