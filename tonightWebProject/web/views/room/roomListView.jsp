<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="accom.model.vo.Room, java.util.ArrayList, java.sql.Date" %>

<%
	ArrayList<Room> list = (ArrayList<Room>)request.getAttribute("list");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomListView</title>  

</head>
<body>
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script language="javascript">
function chk(){
 if(document.all.test[1].checked == true)
	 hidden.style.display = 'none';
 else
  
}
</script>


<a href="/tonight/rreply"><h2>객실 이미지</h2></a>









<hr style="clear:both">
<h2 align="center">객실 목록</h2>
<br>
<table align="center" border="1" cellspacing="0" width="200">
<tr bgcolor="gray"><th>객실명	</th></tr>
<%
	for(Room b : list){
%>
	<tr height="30">
	<td align="center"><%= b.getRoomName() %>
	<input type="radio" name="test" value="1" onclick="chk()">상세보기
	<input type="radio" name="test" value="2" onclick="chk()">접기
	</td>
	</tr>
<%  } %>
</table>

<table id="hidden" style="display:none" align="center" border="1" cellspacing="0" width="700">
<tr bgcolor="gray"><th>성인가격</th><th>소인가격</th><th>할인율</th><th>객실 예약상태</th>
   <th>상세정보</th></tr>
<%
	for(Room r : list){
%>
	<tr height="30">
	<td align="center"><%= r.getAdult_Price() %></td>
	<td align="center"><%= r.getChild_Price() %></td>
	<td align="center"><%= r.getDiscount() %></td>
	<td align="center"><%= r.getRoomState() %></td>
	<td align="center"><%= r.getRoomDetails() %></td>
	</tr>
<%  } %>
</table>
<br>









<a href="/tonight/rreview"><h2>후기 계시판</h2></a>



</body>
</html>









