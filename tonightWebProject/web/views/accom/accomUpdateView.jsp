<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accom.model.vo.Accommodation" %>
<%
	Accommodation accom = (Accommodation)request.getAttribute("accom");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/tonight/css/bootstrap.min.css">
</head>
<style type="text/css">

.jumbotron {
		margin-bottom: 0px;
	    background-image: url(img/loginbackground.jpg);
	    background-position: 0% 25%;
	    background-size: cover;
	    background-repeat: no-repeat;
	    color: white !important;
	    height: 20px;
	}

container {
	padding: 80px 60px;
} 

.person {
	border: 10px solid transparent;
	margin-bottom: 25px;
	width: 80%;
	height: 80%;
	opacity: 0.7;
}

.person:hover {
	border-color: #f1f1f1;
}

.carousel-inner img {
	-webkit-filter: grayscale(90%);
	filter: grayscale(90%); /* make all photos black and white */
	width: 100%; /* Set width to 100% */
	margin: auto;
}

.carousel-caption h3 {
	color: #fff !important;
}

@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}
</style>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">

</div>
	<h3>1단계 숙소 수정</h3>
<div class="progress">
  <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<form action="/tonight/aupdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="aid" value="<%=accom.getAccId()%>">
	<div class="container" id="toTop">
		<h3 class="text-center"><%=member.getMemberId()%> 회원님의 숙소수정을 도와드리겠습니다</h3>
		<br>
		<div class="row">
			<div class="col-md-10">
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 이름</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="aname" placeholder="숙소 이름을 입력하세요." value="<%=accom.getAccName()%>">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>사업자 아이디</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" readonly name="awriter" value="<%=member.getMemberId()%>">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 등급</p>
					</div>
					<div class="col-xs-8">
						<select class="form-control" name="arank">
						  <% if(accom.getAccRank().equals("SILVER")) { %>
						  <option value="SILVER" selected="selected">SILVER</option>
						  <% }else{ %> 
						  <option value="SILVER">SILVER</option>
						  <% } %>
						  <% if(accom.getAccRank().equals("GOLD")) { %>
						  <option value="GOLD" selected="selected">GOLD</option>
						  <% }else{ %> 
						  <option value="GOLD">GOLD</option>
						  <% } %>
						  <% if(accom.getAccRank().equals("PLATINUM")) { %>
						  <option value="PLATINUM" selected="selected">PLATINUM</option>
						  <% }else{ %> 
						  <option value="PLATINUM">PLATINUM</option>
						  <% } %>
						  <% if(accom.getAccRank().equals("DIAMOND")) { %>
						  <option value="DIAMOND" selected="selected">DIAMOND</option>
						  <% }else{ %> 
						  <option value="DIAMOND">DIAMOND</option>
						  <% } %> 	 	
						</select>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 타입</p>
					</div>
					<div class="col-xs-8">
						<select class="form-control" name="atype">
						  <% if(accom.getAccType().equals("H")) { %>
						  <option value="H" selected="selected">호텔</option>
						  <% }else{ %> 
						  <option value="H">호텔</option>
						  <% } %>
						  <% if(accom.getAccType().equals("M")) { %>
						  <option value="M" selected="selected">모텔</option>
						  <% }else{ %> 
						  <option value="M">모텔</option>
						  <% } %>
						  <% if(accom.getAccType().equals("G")) { %>
						  <option value="G" selected="selected">게스트하우스</option>
						  <% }else{ %> 
						  <option value="G">게스트하우스</option>
						  <% } %>
						  <% if(accom.getAccType().equals("P")) { %>
						  <option value="P" selected="selected">펜션</option>
						  <% }else{ %> 
						  <option value="P">펜션</option>
						  <% } %> 	 	
						</select>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 주소</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="aaddress" placeholder="숙소 주소를 입력하세요." value="<%=accom.getAccAddress()%>">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>연락처</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="acontact" placeholder="연락처를 입력하세요." value="<%=accom.getAccContact()%>">
					</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 소개</p>
					</div>
					<div class="col-xs-8">
						<textarea class="form-control" rows="7" name="ainfo">
						<%=accom.getAccInfo() %>
						</textarea>
					</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 대표 이미지</p>
					</div>
					<div class="col-xs-8">
						<div class="form-group">
    						<label for="exampleInputFile">이미지 파일 업로드</label>
    						<input type="file" id="exampleInputFile" name="aupfile1" value="<%=accom.getAccImagePath()%>">
    						<p class="help-block">여기에 숙소 대표 이미지를 올려주세요.</p>
 						 </div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 상세화면 이미지</p>
					</div>
					<div class="col-xs-8">
						<div class="form-group">
    						<label for="exampleInputFile">이미지 파일 업로드</label>
    						<input type="file" id="exampleInputFile" name="aupfile2">
    						<p class="help-block">여기에 숙소 상세페이지에 올라갈 이미지를 올려주세요.</p>
 						 </div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>편의시설</p>
					</div>
					<div class="col-xs-8">
						 <%-- <%=accom.getFacilities()%> --%>
                  <% 
                  String[] facilitiess = accom.getFacilities().split(",");
                  boolean[] checked = new boolean[9];
                  for(int i = 0; i < facilitiess.length; i++) {
                	  if(facilitiess[i].equals("주차장"))
                		  checked[0] = true;
                      if(facilitiess[i].equals("수영장"))
                    	  checked[1] = true;
                      if(facilitiess[i].equals("엘레베이터"))
                    	  checked[2] = true;
                      if(facilitiess[i].equals("무선인터넷"))
                    	  checked[3] = true;
                      if(facilitiess[i].equals("부엌"))
                    	  checked[4] = true;
                      if(facilitiess[i].equals("욕조"))
                    	  checked[5] = true;
                      if(facilitiess[i].equals("에어컨"))
                    	  checked[6] = true;
                      if(facilitiess[i].equals("세탁기"))
                    	  checked[7] = true;
                      if(facilitiess[i].equals("TV"))
                    	  checked[8] = true;
                  }
                  %>
                  
                  <table width="100%">
						<tr>
						<%	if(checked[0] == true){ %>
						<td><input type="checkbox" name="afacilities" value="주차장" checked> 주차장</td>
						<%  }else{  %>
						<td><input type="checkbox" name="afacilities" value="주차장"> 주차장</td>	
						<%  } %>
						<%	if(checked[1] == true){ %>
						<td><input type="checkbox" name="afacilities" value="수영장" checked> 수영장</td>
						<%  }else{  %>
						<td><input type="checkbox" name="afacilities" value="수영장"> 수영장</td>
						<%  } %>
						<%	if(checked[2] == true){ %>
						<td><input type="checkbox" name="afacilities" value="엘레베이터" checked> 엘레베이터</td>
						<%  }else{  %>
						<td><input type="checkbox" name="afacilities" value="엘레베이터"> 엘레베이터</td>
						<%  } %>
						</tr>
						<tr>
						<%	if(checked[3] == true){ %>
						<td><input type="checkbox" name="afacilities" value="무선인터넷" checked> 무선인터넷</td>
						<%  }else{  %>
						<td><input type="checkbox" name="afacilities" value="무선인터넷" > 무선인터넷</td>
						<%  } %>
						<%	if(checked[4] == true){ %>
						<td><input type="checkbox" name="afacilities" value="부엌" checked> 부엌</td>
						<%  }else{  %>
						<td><input type="checkbox" name="afacilities" value="부엌" > 부엌</td>
						<%  } %>
						<%	if(checked[5] == true){ %>
						<td><input type="checkbox" name="afacilities" value="욕조" checked> 욕조</td>
						<%  }else{  %>
						<td><input type="checkbox" name="afacilities" value="욕조" > 욕조</td>
						<%  } %>
						</tr>
						<tr>
						<%	if(checked[6] == true){ %>
						<td><input type="checkbox" name="afacilities" value="에어컨" checked> 에어컨</td>
						<%  }else{  %>
						<td><input type="checkbox" name="afacilities" value="에어컨" > 에어컨</td>
						<%  } %>
						<%	if(checked[7] == true){ %>	
						<td><input type="checkbox" name="afacilities" value="세탁기" checked> 세탁기</td>
						<%  }else{  %>
						<td><input type="checkbox" name="afacilities" value="세탁기" > 세탁기</td>
						<%  } %>
						<%	if(checked[8] == true){ %>
						<td><input type="checkbox" name="afacilities" value="TV" checked> TV</td>
						<%  }else{  %>
						<td><input type="checkbox" name="afacilities" value="TV" > TV</td>
						<%  } %>
						</tr>
					</table>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>이용규칙</p>
					</div>
					<div class="col-xs-8">
						<textarea class="form-control" rows="7" name="arules">
						<%=accom.getAccRules()%>
						</textarea>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>환불규정</p>
					</div>
					<div class="col-xs-8">
						<textarea class="form-control" rows="7" name="arefund">
						<%=accom.getAccRefund()%>
						</textarea>
					</div>
				</div>
			</div>
		</div>
	</div><!-- end <div class="container" id="toTop"> -->
	<input class="btn btn-default" type="submit" value="숙소수정하기">
</form>
<div id="fake-footer"></div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>