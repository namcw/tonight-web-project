<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tour.model.vo.Tour, java.util.ArrayList" %>
<%
	ArrayList<Tour> list = (ArrayList<Tour>)session.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tour list</title>
</head>
<body>
<table>
<% for(Tour tour : list) { %>
	<tr><td><%= tour.getTourId() %></td><td><%= tour.getTourTitle() %></td></tr>
<% } %>
</table>
</body>
</html>