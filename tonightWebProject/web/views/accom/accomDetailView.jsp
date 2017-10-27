<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accom.model.vo.Accommodation, accom.model.vo.Room, java.util.*, java.sql.Date" %>
<%
   Accommodation accom = (Accommodation)request.getAttribute("accom");
	ArrayList<Room> list = (ArrayList<Room>)request.getAttribute("list");
   int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
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

.container {
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

/**/
.box-info.full {
   padding: 0px;
}

.box-info:hover {
   color: #393E48;
}

.box-info {
   position: relative;
   padding: 15px;
   background: #fff;
   color: #5b5b5b;
   margin-bottom: 20px;
   -webkit-transition: All 0.4s ease;
   -moz-transition: All 0.4s ease;
   -o-transition: All 0.4s ease;
   background: #FFFFFF;
   margin-top: 20px;
}

.box-info .nav-tabs {
   background: #1B1E24;
}

.box-info .nav-tabs  li.active  a, .box-info .nav-tabs  li.active  a:hover,
   .box-info .nav-tabs  li.active  a:focus {
   cursor: default;
   border-top: none;
   border-right: none;
   border-left: none;
   border-bottom: none;
   background-color: #ffffff;
   color: #1B1E24;
}

.box-info .nav-tabs  li.active  a i, .box-info .nav-tabs  li.active  a:hover i,
   .box-info .nav-tabs  li.active  a:focus i {
   color: #212121;
}

.box-info .nav-tabs  li  a i {
   color: #fff;
}

.box-info.full .box-footer {
   padding: 20px 20px 15px 20px;
}

.box-info .media-list {
   margin-top: 30px;
}

.box-info .media-list .media {
   padding: 5px 20px;
   border-bottom: 1px solid #eaeaea;
}

.box-info .media-list .media .media-object {
   width: 50px;
}
.scroll-widget{
    overflow: hidden;
    width: auto;
}
</style>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron">

</div>
   <div class="container" id="toTop">
      <h3 class="text-center"><%=accom.getAccName()%></h3>
      <br>
      <div class="row">
   
         <div id="myCarousel" class="carousel slide col-md-8" data-ride="carousel"><!-- 이미지슬라이더 -->
            <!-- Indicators -->
            <ol class="carousel-indicators">
               <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
               <li data-target="#myCarousel" data-slide-to="1"></li>
               <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
               <div class="item active">
                  <img src="/tonight/uploadfiles/la.jpg" alt="Los Angeles" style="width: 100%;">
                  <div class="carousel-caption">
                     <h3>New York</h3>
                     <p>The atmosphere in New York is lorem ipsum.</p>
                  </div>
               </div>

               <div class="item">
                  <img src="/tonight/uploadfiles/chicago.jpg" alt="Chicago" style="width: 100%;">
                  <div class="carousel-caption">
                     <h3>Chicago</h3>
                     <p>Thank you, Chicago - A night we won't forget.</p>
                  </div>
               </div>

               <div class="item">
                  <img src="/tonight/uploadfiles/ny.jpg" alt="New york" style="width: 100%;">
                  <div class="carousel-caption">
                     <h3>LA</h3>
                     <p>Even though the traffic was a mess, we had the best time
                        playing at Venice Beach!</p>
                  </div>
               </div>


               <!-- Left and right controls -->
               <a class="left carousel-control" href="#myCarousel" data-slide="prev"> 
               <span class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">Previous</span>
               </a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
               <span class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">Next</span>
               </a>
            </div>
         </div><!-- end 이미지슬라이더 -->
         <div class="col-md-4">
            <hr>
            <div class="row">
               <div class="col-xs-4">
                  <p>숙소 주소</p>
               </div>
               <div class="col-xs-8">
                  <p><%=accom.getAccAddress()%></p>
               </div>
            </div>
            <hr>
            <div class="row">
               <div class="col-xs-4">
                  <p>숙소 등급</p>
               </div>
               <div class="col-xs-8">
                  <p><%=accom.getAccRank()%></p>
               </div>
            </div>
            <hr>
            <div class="row">
               <div class="col-xs-4">
                  <p>연락처</p>
               </div>
               <div class="col-xs-8">
                  <p><%=accom.getAccContact()%></p>
               </div>
            </div>
            <hr>   
         <div class="row">

               <div class="col-xs-4">
                  <a href="#"> <img src="/tonight/uploadfiles/bandmember.jpg"
                     class="img-circle person" alt="Random Name"></a>

               </div>
               <div class="col-xs-8">
                  <p></p>
                  <p>사업자 소개글 공간 입니다</p>
                  <button>쪽지남기기</button>
               </div>
            </div>
            <hr>
         </div>
      </div><!-- end <div class="row">  -->
   </div><!-- end <div class="container" id="toTop"> -->
   <div class="container">
      <div class="row">
         <div class="col-md-8">
            <div class="panel panel-default">
               <div class="panel-heading">달력 공간</div>
               <div class="panel-body">
                  <img src="https://placehold.it/150x80?text=IMAGE"
                     class="img-responsive" style="width: 100%" alt="Image">
                  <h5>여행 가능 날짜</h5>
                  <%-- <% for(TourConf tconf : tconfList) { %>
                     <p>시작일: <%= tconf.getStartDate() %>, 도착일: <%= tconf.getArriavlaDate() %>, 성인금액:<%= tconf.getTourAdultPrice() %>, 소인가격: <%= tconf.getTourChildPrice() %> </p>
                  <% } %> --%>
               </div>
            </div>
            <div class="panel panel-default hidden-md hidden-lg">
               <div class="panel-heading">선택 확인/예약 공간</div>
               <div class="panel-body">
                  <img src="https://placehold.it/150x80?text=IMAGE"
                     class="img-responsive" style="width: 100%" alt="Image">
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">숙소상세정보</div>
               <div class="panel-body">
                  <%=accom.getAccInfo()%>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">지도</div>
               <div class="panel-body">
                  <%=accom.getAccAddress()%>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">이용규칙</div>
               <div class="panel-body">
                  <%=accom.getFacilities()%>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">편의시설</div>
               <div class="panel-body">
                  <%=accom.getFacilities()%>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">환불규정</div>
               <div class="panel-body">
                  <%=accom.getAccRefund()%>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">객실상세정보</div>
               <div class="panel-body">
                  <!-- 객실추가 -->
                  <table align="center" border="1" cellspacing="0" width="600">
						<tr bgcolor="gray"><th>객실명	</th><th>성인가격</th><th>소인가격</th><th>할인율</th><th>객실 예약상태</th>
						   <th>상세정보</th></tr>
						<%
							for(Room r : list){
						%>
							<tr height="30">
							<td align="center"><%= r.getRoomName() %></td>
							<td align="center"><%= r.getAdult_Price() %></td>
							<td align="center"><%= r.getChild_Price() %></td>
							<td align="center"><%= r.getDiscount() %></td>
							<td align="center"><%= r.getRoomState() %></td>
							<td align="center"><%= r.getRoomDetails() %></td>
						<!--<input type="radio" name="test" value="1" onclick="chk()">상세보기
							<input type="radio" name="test" value="2" onclick="chk()">접기 -->
							</tr>
						<%  } %>
						</table>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">후기
                  <%-- <% if(treviewList.size() > 0) {%>
                     <p class="pull-right">(<%= treviewList.size() %>)</p>
                     <p class="pull-right"><%= gradeAvg %></p>
                     <img src="/tonight/img/starGrade<%= Math.round(gradeAvg) %>.png" class="col-xs-3 pull-right" style="margin-top:-10px">
                  <% } %> --%>
               </div>
               <div class="panel-body box-info">
					<a href="/tonight/rreview"><h2>후기게시판</h2></a>
               <%-- <div class="tab-pane active animated fadeInRight" id="comments">
                  <div class="scroll-widget">
                     <ul class="media-list">
                     <% if (treviewList.isEmpty()) {   %>
                        <li class="media">
                           <p>후기가 없습니다.</p>
                        </li>
                     <% } else if(treviewList.size() < 4){ %>
                        <% for (TourReview treview : treviewList) { %>
                           <li class="media">
                              <a class="pull-left" href="#fakelink">
                                    <img class="media-object"
                                    src="https://bootdey.com/img/Content/User_for_snippets.png"
                                    alt="Avatar">
                              </a>
                              <div class="media-body">
                                    <h4 class="media-heading">
                                       <a href="#fakelink"><%=treview.getTrWriterId() %></a>
                                       <small><%=treview.getTrDate() %></small>
                                    </h4>
                                    <div class="row">
                                    <img src="/tonight/img/starGrade<%= Math.round(treview.getTrGrade()) %>.png" class="col-xs-3" style="margin-top:-10px">
                                    <div class="col-xs-9"></div>
                                    </div>
                                    <p><%=treview.getTrContent() %></p>
                                 </div>
                              <p></p>
                           </li>
                        <% } %>
                     <% } else {%>
                        <% for (int i=0; i < 3; i++) { %>
                           <li class="media">
                              <a class="pull-left" href="#fakelink">
                                    <img class="media-object"
                                    src="https://bootdey.com/img/Content/User_for_snippets.png"
                                    alt="Avatar">
                              </a>
                              <div class="media-body">
                                 <h4 class="media-heading">
                                    <a href="#fakelink"><%= treviewList.get(i).getTrWriterId() %></a>
                                    <small><%=treviewList.get(i).getTrDate() %></small>
                                    <small>grade <%=treviewList.get(i).getTrGrade() %></small>
                                 </h4>
                                 <div class="row">
                                 <img src="/tonight/img/starGrade<%= Math.round(treviewList.get(i).getTrGrade()) %>.png" class="col-xs-3" style="margin-top:-10px">
                                 <div class="col-xs-9"></div>
                                 </div>
                                 
                                 <p><%= treviewList.get(i).getTrContent() %></p>
                              </div>
                           </li>
                        <% } %>
                        <li class="media"><a data-toggle="modal" data-target="#addReview"><%= treviewList.size()-3 %>개 더보기..</a></li>
                     <% } %>
                     </ul>
                  </div>
            </div> --%>
               </div>
            </div>
         </div>
         
         <div class="col-md-4 hidden-sm hidden-xs">
            <div class="panel panel-default panel-affix" id="myScrollspy">

               <div class="panel-heading">결제 공간</div>
               <div class="panel-body">
                  <div class="nav nav-pills nav-stacked">
                     <img src="https://placehold.it/150x80?text=IMAGE"
                        class="img-responsive" style="width: 100%" alt="Image"> <a
                        href="#toTop">Back To Top </a>
                  </div>
               </div>
            </div>
         </div>


      </div>
   </div>
   
<div class="modal fade" id="addReview" role="dialog">
    <div class="modal-dialog">
    
     <%--  <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">후기</h4>
        </div>
        <div class="modal-body box-info">
           <div class="tab-pane active animated fadeInRight" id="comments">
            <div class="scroll-widget">
               <ul class="media-list">
                  <% for (TourReview treview : treviewList) { %>
                     <li class="media">
                        <a class="pull-left" href="#fakelink">
                              <img class="media-object"
                              src="https://bootdey.com/img/Content/User_for_snippets.png"
                              alt="Avatar">
                        </a>
                        <div class="media-body">
                              <h4 class="media-heading">
                                 <a href="#fakelink"><%=treview.getTrWriterId() %></a>
                                 <small><%=treview.getTrDate() %></small>
                              </h4>
                              <div class="row">
                                 <img src="/tonight/img/starGrade<%= Math.round(treview.getTrGrade()) %>.png" class="col-xs-3" style="margin-top:-10px">
                                 <div class="col-xs-9"></div>
                              </div>
                              <p><%=treview.getTrContent() %></p>
                           </div>
                        <p></p>
                     </li>
                  <% } %>
               </ul>
            </div>
         </div>
        </div>
           <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
         </div>
      </div>
      
   </div>
</div> --%>

<div id="fake-footer"></div>
<%@ include file="../includes/footer.jsp" %>
</body>
</html>