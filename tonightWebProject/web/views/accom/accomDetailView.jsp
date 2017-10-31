<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accom.model.vo.Accommodation, accom.model.vo.Room, accom.model.vo.AccomReview, accom.model.vo.AccomImage, java.util.*, java.sql.Date" %>
<%
   Accommodation accom = (Accommodation)request.getAttribute("accom");
   ArrayList<Room> list = (ArrayList<Room>)request.getAttribute("list");
   ArrayList<AccomReview> areviewList = (ArrayList<AccomReview>) request.getAttribute("areviewList");
   ArrayList<AccomImage> aimageList = (ArrayList<AccomImage>) request.getAttribute("aimageList");
   double gradeAvg = Double.parseDouble(String.valueOf(request.getAttribute("gradeAvg")));
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
<link rel="stylesheet" type="text/css"
	href="/tonight/css/pignose.calendar.min.css" />
<style type="text/css">
.soomgim {
   background-color: red;
}

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

/**/
@media ( min-width : 768px) {
	.pignose-calendar {
		margin-right: 0 !important;
		padding: 0 !important;
		width: 100% !important;
	}
	
	.pignose-calendar-light {
		margin: 0 0 0 0 !important;
		padding: 0 !important;
	}
	
	.pignose-calendar-default {
		margin: 0 0 0 0 !important;
		padding: 0 !important;
	}
}
   
</style>
<script type="text/javascript">
function delete_event() {
	if(confirm("정말 삭제하시겠습니까?") == true) {
		location.href='/tonight/adelete?anum=<%=accom.getAccId()%>';
	}
}
</script>
<body>
<%@ include file="../includes/header.jsp" %>
<div class="jumbotron"></div>
   <div class="container" id="toTop">
      <h3 class="text-center"><%=accom.getAccName()%></h3>
      <br>
      <div class="row">
   
         <div id="myCarousel" class="carousel slide col-md-8" data-ride="carousel"><!-- 이미지슬라이더 -->
           <!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<% for(int i = 1; i < aimageList.size()+1 ; i++) { %>
					<li data-target="#myCarousel" data-slide-to="<%= i %>"></li>
				<% } %>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="/tonight/auploadfiles/<%= accom.getAccRname() %>"
						style="width: 100%;"> 
				</div>
			<% for(AccomImage aimage : aimageList) { %>
					<div class="item">
					<img src="/tonight/auploadfiles/<%= aimage.getImageRname() %>"
						style="width: 100%;">
					</div>
				<% } %> 


				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>

         <div class="col-md-4">
            <hr>
            <div class="row">
               <div class="col-xs-4">
                  <p>숙소 타입</p>
               </div>  
               <div class="col-xs-8">
               	  
               	  <% if(accom.getAccType().equals("H")) { %>
               	  		<p>호텔</p>
               	  <% } else if(accom.getAccType().equals("M")) { %>
               	  		<p>모텔</p>
               	  <% } else if(accom.getAccType().equals("G")) { %>
               	  		<p>게스트하우스</p>
               	  <% } else{ %>
               	  		<p>펜션</p>
               	  <% } %>
                  <%-- <p><%=accom.getAccType()%></p> --%>
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
               <hr>
               <div class="col-xs-12">
               <%  if(member != null){ %>
			   <% if(member.getMemberId().equals(accom.getBizId())) { %>
			   <div align="center">
			   <a class="btn btn-default" role="button" href="/tonight/aupview?anum=<%=accom.getAccId()%>">수정하기</a>
				&nbsp; 
			   <a class="btn btn-default" role="button" onclick="delete_event();">삭제하기</a>
			   </div>
				<%  }} %>
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
               <div class="panel-heading">날짜 및 객실정보</div>
               <div class="panel-body row">
                  <div class="col-sm-6">
                     <div id="schedules">
                        <div class="calendar-schedules"></div>
                     </div>
                  </div>

                  <div class="col-sm-6 text-center">

                                          <hr>
                     <%
                        for (Room room : list) {
                     %>
                     <div class="soomgim">
                        <div>
                           <%=room.getRoomName()%>
                        </div>
                     </div>

                     <div style="display: none;">
                        <hr>
                        <div class="row">
                           <div class="col-xs-4">상세정보</div>
                           <div id="tconf2" class="col-xs-8">
                              <%=room.getRoomDetails()%>
                           </div>
                        </div>
                        <hr>
                        <div class="row">
                           <div class="col-xs-4">성인 가격</div>
                           <div id="tconf4" class="col-xs-8">
                              <%=room.getWeekdaysAdultPrice()%>

                           </div>
                        </div>
                        <hr>
                        <div class="row">
                           <div class="col-xs-4">소인 가격</div>
                           <div id="tconf5" class="col-xs-8">
                              <%=room.getWeekdaysChildPrice()%>
                           </div>
                        </div>
                        <hr>
                        <div class="row">
                           <div class="col-xs-4">성인 가격</div>
                           <div id="tconf4" class="col-xs-8">
                              <%=room.getWeekendAdultPrice()%>

                           </div>
                        </div>
                        <hr>
                        <div class="row">
                           <div class="col-xs-4">소인 가격</div>
                           <div id="tconf5" class="col-xs-8">
                              <%=room.getWeekendChildPrice()%>
                           </div>
                        </div>
                     </div>
                     <hr>
                     <%
                        }
                     %>
                  </div>
                  <br> <br> <br> <br>
                          <%--   <table class="table table-hover">
                            <tr><th>객실명</th><th>객실상세정보</th><th>주말성인가격</th><th>주말소인가격</th><th>주중성인가격</th><th>주중소인가격</th></tr>
                           <%
                              for(Room r : list){
                           %>
                              <tr height="30">
                              <td><%= r.getRoomName() %></td>
                              <td><%= r.getRoomDetails() %></td>
                              <td><%= r.getWeekendAdultPrice() %></td>
                              <td><%= r.getWeekendChildPrice()%></td>
                              <td><%= r.getWeekdaysAdultPrice() %></td>
                              <td><%= r.getWeekdaysChildPrice() %></td>
                           <!--<input type="radio" name="test" value="1" onclick="chk()">상세보기
                              <input type="radio" name="test" value="2" onclick="chk()">접기 -->
                              </tr>
                           <%  } %>
                           </table> --%>
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
                <div id="map" style="height:350px; width:auto;"></div>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">이용규칙</div>
               <div class="panel-body">
                  <%=accom.getAccRules() %>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">편의시설</div>
               <div class="panel-body">
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
                  <%   if(checked[0] == true){ %>
                  <td><input type="checkbox" name="afacilities" value="주차장" checked> 주차장</td>
                  <%  }else{  %>
                  <td><input type="checkbox" name="afacilities" value="주차장"> 주차장</td>   
                  <%  } %>
                  <%   if(checked[1] == true){ %>
                  <td><input type="checkbox" name="afacilities" value="수영장" checked> 수영장</td>
                  <%  }else{  %>
                  <td><input type="checkbox" name="afacilities" value="수영장"> 수영장</td>
                  <%  } %>
                  <%   if(checked[2] == true){ %>
                  <td><input type="checkbox" name="afacilities" value="엘레베이터" checked> 엘레베이터</td>
                  <%  }else{  %>
                  <td><input type="checkbox" name="afacilities" value="엘레베이터"> 엘레베이터</td>
                  <%  } %>
                  </tr>
                  <tr>
                  <%   if(checked[3] == true){ %>
                  <td><input type="checkbox" name="afacilities" value="무선인터넷" checked> 무선인터넷</td>
                  <%  }else{  %>
                  <td><input type="checkbox" name="afacilities" value="무선인터넷" > 무선인터넷</td>
                  <%  } %>
                  <%   if(checked[4] == true){ %>
                  <td><input type="checkbox" name="afacilities" value="부엌" checked> 부엌</td>
                  <%  }else{  %>
                  <td><input type="checkbox" name="afacilities" value="부엌" > 부엌</td>
                  <%  } %>
                  <%   if(checked[5] == true){ %>
                  <td><input type="checkbox" name="afacilities" value="욕조" checked> 욕조</td>
                  <%  }else{  %>
                  <td><input type="checkbox" name="afacilities" value="욕조" > 욕조</td>
                  <%  } %>
                  </tr>
                  <tr>
                  <%   if(checked[6] == true){ %>
                  <td><input type="checkbox" name="afacilities" value="에어컨" checked> 에어컨</td>
                  <%  }else{  %>
                  <td><input type="checkbox" name="afacilities" value="에어컨" > 에어컨</td>
                  <%  } %>
                  <%   if(checked[7] == true){ %>   
                  <td><input type="checkbox" name="afacilities" value="세탁기" checked> 세탁기</td>
                  <%  }else{  %>
                  <td><input type="checkbox" name="afacilities" value="세탁기" > 세탁기</td>
                  <%  } %>
                  <%   if(checked[8] == true){ %>
                  <td><input type="checkbox" name="afacilities" value="TV" checked> TV</td>
                  <%  }else{  %>
                  <td><input type="checkbox" name="afacilities" value="TV" > TV</td>
                  <%  } %>
                  </tr>
               </table>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">환불규정</div>
               <div class="panel-body">
                  <%=accom.getAccRefund()%>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">
                  후기
                  <%
                  if (areviewList.size() > 0) {
               %>
                  <p class="pull-right">
                     (<%=areviewList.size()%>)
                  </p>
                  <p class="pull-right">
                     <b><%=gradeAvg%></b>
                  </p>
                  <img src="/tonight/img/starGrade<%=Math.round(gradeAvg)%>.png"
                     class="col-xs-3 pull-right" style="margin-top: -6px">
                  <%
                     }
                  %>
               </div>
               <div class="panel-body box-info">

                  <div class="tab-pane active animated fadeInRight" id="comments">

                     <div class="scroll-widget">
                        <ul class="media-list">
                           <%
                              if (member != null) {
                           %>
                           <li id="reviewst" class="media"><a class="pull-left"
                              href="#fakelink"> <img class="media-object"
                                 src="https://bootdey.com/img/Content/User_for_snippets.png"
                                 alt="Avatar">
                           </a>
                              <div class="media-body">
                                 <form action="/tonight/arinsert" method="post" id="submit">
                                    <input type="hidden" name="aid"
                                       value="<%=accom.getAccId()%>">


                                    <div class="row">
                                       <div class="col-xs-9 form-group">
                                          <input type="text" name="writerid"
                                             class="form-control col-xs-3"
                                             value="<%=member.getMemberId()%>" readonly>
                                       </div>
                                       <div class="col-xs-3 form-group pull-right">
                                          <select class="selectpicker form-control col-xs-3"
                                             name="grade">
                                             <option>10</option>
                                             <option>9</option>
                                             <option>8</option>
                                             <option>7</option>
                                             <option>6</option>
                                             <option>5</option>
                                             <option>4</option>
                                             <option>3</option>
                                             <option>2</option>
                                             <option>1</option>
                                          </select>
                                       </div>
                                    </div>
                                    <textarea class="form-control" id="comments" name="comments"
                                       placeholder="Comment" rows="5"></textarea>
                                    <br>
                                    <div class="row">
                                       <div class="col-md-12 form-group">
                                          <input class="btn pull-right" type="submit">
                                       </div>
                                    </div>
                                 </form>

                              </div>
                              <p></p></li>
                           <%
                              }
                           %>
                           <%
                              if (areviewList.isEmpty()) {
                           %>
                           <li class="media">
                              <p>후기가 없습니다.</p>
                           </li>
                           <%
                              } else if (areviewList.size() < 4) {
                           %>
                           <%
                              for (AccomReview areview : areviewList) {
                           %>
                           <li class="media"><a class="pull-left" href="#fakelink">
                                 <img class="media-object"
                                 src="https://bootdey.com/img/Content/User_for_snippets.png"
                                 alt="Avatar">
                           </a>
                              <div class="media-body">
                                 <h4 class="media-heading">
                                    <a href="#fakelink"><%=areview.getArWriterId()%></a> <small><%=areview.getArDate()%></small>

                                 </h4>
                                 <div class="row">
                                    <img
                                       src="/tonight/img/starGrade<%=Math.round(areview.getArGrade())%>.png"
                                       class="col-xs-3" style="margin-top: -10px">
                                    <div class="col-xs-9"></div>
                                 </div>
                                 <p><%=areview.getArContent()%></p>
                              </div>
                              <p></p></li>
                           <%
                              }
                           %>
                           <%
                              } else {
                           %>
                           <%
                              for (int i = 0; i < 3; i++) {
                           %>
                           <li class="media"><a class="pull-left" href="#fakelink">
                                 <img class="media-object"
                                 src="https://bootdey.com/img/Content/User_for_snippets.png"
                                 alt="Avatar">
                           </a>
                              <div class="media-body">
                                 <h4 class="media-heading">
                                    <a href="#fakelink"><%=areviewList.get(i).getArWriterId()%></a>
                                    <small><%=areviewList.get(i).getArDate()%></small>
                                 </h4>
                                 <div class="row">
                              
                              
                              
                              
                              
                                    <img
                                       src="/tonight/img/starGrade<%=Math.round(areviewList.get(i).getArGrade())%>.png"
                                       class="col-xs-3" style="margin-top: -10px">
                                    <div class="col-xs-9"></div>
                                 </div>

                                 <p><%=areviewList.get(i).getArContent()%></p>
                              </div></li>
                           <%
                              }
                           %>
                           <li class="media"><a class="pull-right"
                              data-toggle="modal" data-target="#addReview"><%=areviewList.size() - 3%>개
                                 더보기..</a></li>
                           <%
                              }
                           %>
                        </ul>
                     </div>
                  </div>
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

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">후기</h4>
            </div>
            <div class="modal-body box-info">
               <div class="tab-pane active animated fadeInRight" id="comments">
                  <div class="scroll-widget">
                     <ul class="media-list">
                        <%
                           for (AccomReview areview : areviewList) {
                        %>
                        <li class="media"><a class="pull-left" href="#fakelink">
                              <img class="media-object"
                              src="https://bootdey.com/img/Content/User_for_snippets.png"
                              alt="Avatar">
                        </a>
                           <div class="media-body">
                              <h4 class="media-heading">
                                 <a href="#fakelink"><%=areview.getArWriterId()%></a> <small><%=areview.getArDate()%></small>
                              </h4>
                              <div class="row">
                                 <img
                                    src="/tonight/img/starGrade<%=Math.round(areview.getArGrade())%>.png"
                                    class="col-xs-3" style="margin-top: -10px">
                                 <div class="col-xs-9"></div>
                              </div>
                              <p><%=areview.getArContent()%></p>
                           </div>
                           <p></p></li>
                        <%
                           }
                        %>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
         </div>

      </div>
   </div>
   
   
   <div id="fake-footer"></div>
   <%@ include file="../includes/footer.jsp"%>
   <script src="/tonight/js/jquery-3.2.1.min.js"></script>
   <script src="/tonight/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="/tonight/js/moment.latest.min.js"></script>
   <script type="text/javascript"
      src="/tonight/js/pignose.calendar.min.js"></script>
   <script
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1524280cea98188e73c2051d02dc247c&libraries=services"></script>
   <script type="text/javascript">
$(function() {

   /* affix 스크롤 */
   var stickyElement = '.panel-affix', bottomElement = '#fake-footer';
   if ($(stickyElement).length) {
      $(stickyElement).each(function() {
         var fromTop = $(this).offset().top,
         fromBottom = $(document).height() - ($(this).offset().top + $(this).outerHeight()),
         stopOn = $(document).height() - ($(bottomElement).offset().top) + ($(this).outerHeight() - $(this).height());
   
         if ((fromBottom - stopOn) > 200) {
            $(this).css('width', $(this).width()).css('top', 0).css('position', '');
            $(this).affix({
               offset : {top : fromTop - 80, bottom : stopOn}
            }).on('affix.bs.affix', function() {
               $(this).css('top', '80px').css('position', '');
            });
         }
         $(window).trigger('scroll');
      });
   }
   
   
    /* calendar */
   var dateObj = new Date();
   var year = dateObj.getFullYear();
   var month = dateObj.getMonth()+1;
   var day = dateObj.getDate();
   var today = year + "-" + month + "-" + day;
   
   $('.calendar-schedules').pignoseCalendar({
        scheduleOptions: {
            colors: {
                Y: '#2fabb7',
                N: 'red'
            }
        },
        
        select: function (date, context) {
           var sdate = (date[0] === null ? 'null' :date[0].format('YYYY-MM-DD'));
           
         <%-- <% for (TourConf tconf : tconfList) { %>
            if(sdate == "<%= tconf.getStartDate() %>") {
               var dur = <%= (int)((tconf.getArrivalDate().getTime()-tconf.getStartDate().getTime())/(1000 * 60 * 60 * 24)) %>;
               $('#tconf1').text(dur+"박"+(dur+1)+"일");
               $('#tconf2').text("<%= tconf.getStartDate() %>");
               $('#tconf3').text("<%= tconf.getArrivalDate() %>");
               $('#tconf4').text("<%= tconf.getTourAdultPrice() %> 원");
               $('#tconf5').text("<%= tconf.getTourChildPrice() %> 원");
            }
           <% } %> --%>
           
        },
        lang: 'ko',
        minDate: today
    });
   
   
   <%-- function moveCalendar() {
      var months = (parseInt('<%=tconfList.get(0).getStartDate()%>'.substring(0,4))-parseInt(today.substring(0,4)))*12;
      months += (parseInt('<%=tconfList.get(0).getStartDate()%>'.substring(5,7))-parseInt(today.substring(5,7)));
      
      $('.pignose-calendar-unit-active').removeClass('pignose-calendar-unit-active');
      $('.pignose-calendar-unit-first-active').removeClass('pignose-calendar-unit-first-active');
      for(var i = 0; i < months; i++) {
         $('.pignose-calendar-top-next').click();
      }
      $('[data-date='+"<%=tconfList.get(0).getStartDate()%>"+']').addClass('pignose-calendar-unit-active');
      $('[data-date='+"<%=tconfList.get(0).getStartDate()%>"+']').addClass('pignose-calendar-unit-first-active');
      var dur = <%= (int)((tconfList.get(0).getArrivalDate().getTime()-tconfList.get(0).getStartDate().getTime())/(1000 * 60 * 60 * 24)) %>;
      $('#tconf1').text(dur+"박"+(dur+1)+"일");
      $('#tconf2').text("<%= tconfList.get(0).getStartDate() %>");
      $('#tconf3').text("<%= tconfList.get(0).getArrivalDate() %>");
      $('#tconf4').text("<%= tconfList.get(0).getTourAdultPrice() %> 원");
      $('#tconf5').text("<%= tconfList.get(0).getTourChildPrice() %> 원");
   }
   
   moveCalendar();  --%>

});
</script>
   <script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);   

// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new daum.maps.ZoomControl();

// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('<%=accom.getAccAddress()%>', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">숙소위치</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>

   <script>
/*  
 var $target = $('.soomgim'),
 isClass = null;

$target.on('click', function () {
 */
/*  var _$self = $(this),
 oldClass = _$self.siblings('.' + isClass);

 if(!!oldClass) {
     oldClass.removeClass(isClass).next().slideUp();
 }

 if(!_$self.is(isClass)) {
    _$self.addClass('on').next().slideDown();
 }

 isClass = _$self.attr('class');

}); */
$('.soomgim').on('click', function() {

     function slideDown(target) {
       slideUp();
       $(target).addClass('on').next().slideDown();
     }

     function slideUp() {
       $('.soomgim').removeClass('on').next().slideUp();
     }
     $(this).hasClass('on') ? slideUp() : slideDown(this);
 }); 
  </script>
  
 <script type="text/javascript">
   $("#submit").submit(function(e) {
      var postData = $(this).serializeArray();
       var formURL = $(this).attr("action");
      $.ajax({
           url: formURL,
           data: postData,
           type: 'POST',
           success: function(result){
              var tag =
                 '<li class="media">' +
                 '<a class="pull-left" href="#fakelink">' +
                 '<img class="media-object" src="https://bootdey.com/img/Content/User_for_snippets.png" alt="Avatar"></a>' +
                 '<div class="media-body">' +
                 '<h4 class="media-heading">' +
                 '<a href="#fakelink">' +
                 result["writerId"]+
                 '</a> <small>'+
                 result["today"]+
                 '</small></h4>' +
                 '<div class="row">' +
                 '<img src="/tonight/img/starGrade'+
                 result["grade"]+
                 '.png" class="col-xs-3" style="margin-top: -10px">' +
                 '<div class="col-xs-9"></div></div>' +
                 '<p>'+
                 result["comment"]+
                 '</p>' +
                 '</div><p></p></li>';
              $('#reviewst').after(tag);
           },
           error: function(result){
           }
       });
      e.preventDefault();
      //e.unbind();
   });
   
</script>
</body>
</html>