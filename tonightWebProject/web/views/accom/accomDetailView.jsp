<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="accom.model.vo.Accommodation, accom.model.vo.Room, accom.model.vo.AccomReview, java.util.*, java.sql.Date" %>
<%
   Accommodation accom = (Accommodation)request.getAttribute("accom");
   ArrayList<Room> list = (ArrayList<Room>)request.getAttribute("list");
   ArrayList<AccomReview> areviewList = (ArrayList<AccomReview>) request.getAttribute("areviewList");
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
<script type="text/javascript">
function delete_event() {
	if(confirm("정말 삭제하시겠습니까?") == true) {
		location.href='/tonight/adelete?anum=<%=accom.getAccId()%>';
	}
}
</script>
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
               <div class="panel-heading">달력 공간</div>
               <div class="panel-body">
	                  <img src="https://placehold.it/150x80?text=IMAGE"
	                     class="img-responsive" style="width: 50%" alt="Image">
	                     <br>
			                   <table class="table table-hover">
			                   <tr><th>객실명</th><th>성인가격</th><th>소인가격</th><th>할인율</th><th>객실 예약상태</th>
									   <th>상세정보</th></tr>
									<%
										for(Room r : list){
									%>
										<tr height="30">
										<td><%= r.getRoomName() %></td>
										<td><%= r.getAdult_Price() %></td>
										<td><%= r.getChild_Price() %></td>
										<td><%= r.getDiscount() %></td>
										<td><%= r.getRoomState() %></td>
										<td><%= r.getRoomDetails() %></td>
									<!--<input type="radio" name="test" value="1" onclick="chk()">상세보기
										<input type="radio" name="test" value="2" onclick="chk()">접기 -->
										</tr>
									<%  } %>
									</table>
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
            <div class="panel panel-default">
               <div class="panel-heading">환불규정</div>
               <div class="panel-body">
                  <%=accom.getAccRefund()%>
               </div>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">후기
                 <% if(areviewList.size() > 0) {%>
                     <p class="pull-right">(<%= areviewList.size() %>)</p>
                     <p class="pull-right"><%= gradeAvg %></p>
                     <img src="/tonight/img/starGrade<%= Math.round(gradeAvg) %>.png" class="col-xs-3 pull-right" style="margin-top:-10px">
                  <% } %>
               </div>
               <div class="panel-body box-info">

					<div class="tab-pane active animated fadeInRight" id="comments">
						<div class="scroll-widget">
							<ul class="media-list">
							<% if (areviewList.isEmpty()) {	%>
								<li class="media">
									<p>후기가 없습니다.</p>
								</li>
							<% } else if(areviewList.size() < 4){ %>
								<% for (AccomReview areview : areviewList) { %>
									<li class="media">
										<a class="pull-left" href="#fakelink">
												<img class="media-object"
												src="https://bootdey.com/img/Content/User_for_snippets.png"
												alt="Avatar">
										</a>
										<div class="media-body">
												<h4 class="media-heading">
													<a href="#fakelink"><%=areview.getArWriterId() %></a>
													<small><%=areview.getArGrade() %></small>
												</h4>
												<div class="row">
												<img src="/tonight/img/starGrade<%= Math.round(areview.getArGrade()) %>.png" class="col-xs-3" style="margin-top:-10px">
												<div class="col-xs-9"></div>
												</div>
												<p><%=areview.getArContent() %></p>
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
												<a href="#fakelink"><%= areviewList.get(i).getArWriterId() %></a>
												<small><%=areviewList.get(i).getArDate() %></small>
												<small>grade <%=areviewList.get(i).getArGrade() %></small>
											</h4>
											<div class="row">
											<img src="/tonight/img/starGrade<%= Math.round(areviewList.get(i).getArGrade()) %>.png" class="col-xs-3" style="margin-top:-10px">
											<div class="col-xs-9"></div>
											</div>
											
											<p><%= areviewList.get(i).getArContent() %></p>
										</div>
									</li>
								<% } %>
								<li class="media"><a data-toggle="modal" data-target="#addReview"><%= areviewList.size()-3 %>개 더보기..</a></li>
							<% } %>
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
                  <% for (AccomReview areview : areviewList) { %>
                     <li class="media">
                        <a class="pull-left" href="#fakelink">
                              <img class="media-object"
                              src="https://bootdey.com/img/Content/User_for_snippets.png"
                              alt="Avatar">
                        </a>
                        <div class="media-body">
                              <h4 class="media-heading">
                                 <a href="#fakelink"><%=areview.getArWriterId() %></a>
                                 <small><%=areview.getArDate() %></small>
                              </h4>
                              <div class="row">
                                 <img src="/tonight/img/starGrade<%= Math.round(areview.getArGrade()) %>.png" class="col-xs-3" style="margin-top:-10px">
                                 <div class="col-xs-9"></div>
                              </div>
                              <p><%=areview.getArContent() %></p>
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
</div> 
<div id="fake-footer"></div>
<%@ include file="../includes/footer.jsp"%>
<script src="/tonight/js/jquery-3.2.1.min.js"></script>
<script src="/tonight/js/bootstrap.min.js"></script>
<script>
	$(function() {

		// name your elements here
		var stickyElement = '.panel-affix', // the element you want to make sticky
		bottomElement = '#fake-footer'; // the bottom element where you want the sticky element to stop (usually the footer) 

		// make sure the element exists on the page before trying to initalize
		if ($(stickyElement).length) {
			$(stickyElement).each(
				function() {

					// let's save some messy code in clean variables
					// when should we start affixing? (the amount of pixels to the top from the element)
					var fromTop = $(this).offset().top,
					// where is the bottom of the element?
					fromBottom = $(document).height()
							- ($(this).offset().top + $(this)
									.outerHeight()),
					// where should we stop? (the amount of pixels from the top where the bottom element is)
					// also add the outer height mismatch to the height of the element to account for padding and borders
					stopOn = $(document).height()
							- ($(bottomElement).offset().top)
							+ ($(this).outerHeight() - $(this)
									.height());

					// if the element doesn't need to get sticky, then skip it so it won't mess up your layout
					if ((fromBottom - stopOn) > 200) {
						// let's put a sticky width on the element and assign it to the top
						$(this).css('width', $(this).width())
								.css('top', 0).css('position',
										'');
						// assign the affix to the element
						$(this)
								.affix({
									offset : {
										// make it stick where the top pixel of the element is
										top : fromTop - 80,
										// make it stop where the top pixel of the bottom element is
										bottom : stopOn
									}
								// when the affix get's called then make sure the position is the default (fixed) and it's at the top
								})
								.on(
									'affix.bs.affix',
									function() {
										$(this)
											.css('top',
													'80px')
											.css(
													'position',
													'');
									});
					}
					// trigger the scroll event so it always activates 
					$(window).trigger('scroll');
				});
		}

	});
</script>
</body>
</html>