<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
    <%
	
	Member member = (Member)request.getAttribute("member");
%>    
<!DOCTYPE html >
<html>
<head>
<meta charset=UTF-8>
<title>myInformation</title>
<style>
	th { background: lightgray; }
</style>
<script type="text/javascript">
	function mdel(){
		location.href = "/tonight/mdelete?userid=<%= member.getMemberId() %>";
		return false;
	}
</script>
</head>
<body>
<h2 align="center"><%= member.getMemberName() %> 님 정보보기</h2>
<br><br>
<form action="/tonight/mupdate" method="post">
<table align="center" width="600" height="350">
<tr><th width="150">아이디</th>
	<td width="450"><input name="memberid" value="<%= member.getMemberId() %>" readonly></td>
</tr>
<tr><th>이 름</th>
	<td><input type="text" name="membername" value="<%= member.getMemberName() %>" ></td>
</tr>

</tr>
<tr><th>생년월일</th>
	<td><input type="text" name="birthdate" value="<%= member.getBirthDate() %>" readonly></td>
</tr>

<tr><th>암 호</th>
	<td><input type="password" name="memberpwd" value="<%= member.getMemberPwd() %>"></td>
</tr>
<tr><th>암호확인</th><td><input type="password"></td></tr>

<tr><th>전화번호</th>
	<td><input type="tel" name="phone" value="<%=member.getPhone() %>"></td>
</tr>
<tr><th>이메일</th>
	<td><input type="email" name="email" value="<%= member.getEmail() %>"></td>
</tr>
<tr><th>주 소</th>
	<td><input type="text" name="address" value="<%= member.getAddress() %>"></td>
</tr>


<tr><th colspan="2">
	<input type="submit" value="수정하기"> &nbsp;
	<input type="reset" value="취소"> &nbsp;
	<button onclick="return mdel();">탈퇴하기</button>
</th></tr>
</table>
</form>
<br><br>
<div align="center">
	<a href="/tonight/index.jsp">시작페이지로 이동</a>
</div>



</body>
</html>





