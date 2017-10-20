<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accom.model.vo.Accommodation, java.util.*" %>
<%
	Accommodation accom = (Accommodation)request.getAttribute("accom");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accomDetailView</title>
</head>
<body>
<%@ include file="../includes/header.jsp" %>
<hr style="clear:both">
<h2 align="center"><%= accom.getAccName() %></h2>
<br>
<table align="center" cellspacing="0" cellpadding="10" border="1" width="700">
<tr><td rowspan="4"><%= accom.getAccImagePath() %></td><td>숙소 주소 : <%= accom.getAccAddress() %></td></tr>
<tr><td>성급 : <%= accom.getAccRank() %></td></tr>
<tr><td>연락처 : <%= accom.getAccContact() %></td></tr>
<tr><td><button>쪽지남기기</button>&nbsp;&nbsp;&nbsp;<button>장바구니</button></td></tr>
</table>
<br><br>
<table align="center" cellspacing="0" cellpadding="10" border="1" width="700">
<tr><td>숙소이용규칙</td></tr>
<tr><td><%= accom.getAccRules() %></td></tr>
</table>
<br>
<table align="center" cellspacing="0" cellpadding="10" border="1" width="700">
<tr><td>숙소위치정보</td></tr>
<tr><td><%= accom.getAccLocationInfo() %></td></tr>
</table>
<br>
<table align="center" cellspacing="0" cellpadding="10" border="1" width="700">
<tr><td>환불규정</td></tr>
<tr><td><%= accom.getAccRefund() %></td></tr>
</table>
<br>
<h3 align="center">객실 상세 정보</h3>
<br>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>