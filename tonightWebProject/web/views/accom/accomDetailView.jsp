<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accom.model.vo.Accommodation,accom.model.vo.Room, java.util.ArrayList,  java.util.*,java.sql.Date" %>

<%-- <%@ page import="room.model.vo.RoomReview, java.util.ArrayList, java.sql.Date" %> --%>

<%
	Accommodation accom = (Accommodation)request.getAttribute("accom");
	ArrayList<Room> list = (ArrayList<Room>)request.getAttribute("list");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();  	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accomDetailView</title>
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
<a href="/tonight/adetail"></a><h3 align="center">객실 상세 정보</h3></a>
<a href="/tonight/rreply"><h2>객실 이미지</h2></a>
<hr style="clear:both">

<h2 align="center">객실 목록</h2>
<br>
<table align="center" border="1" cellspacing="0" width="200">
<tr bgcolor="gray"><th>객실명	</th></tr>
<%
	for(Room r : list){
%>
	<tr height="30">
	<td align="center"><%= r.getRoomName() %>
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
<!-- <a href="/tonight/rreview"><h2>test</h2></a> -->
<br>
<a href="/tonight/rreview"><h2>후기 게시판</h2></a>

<%-- <%@ include file="../room/roomListView.jsp" %>    --%>

<%@ include file="../includes/footer.jsp" %>
</body>
</html>