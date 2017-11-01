<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, java.text.SimpleDateFormat, tour.model.vo.Tour, tour.model.vo.TourDetail, tour.model.vo.TourReview, tour.model.vo.TourConf, tour.model.vo.TourImage, java.text.SimpleDateFormat"%>
<%
	Tour tour = (Tour) request.getAttribute("tour");
	TourDetail tdetail = (TourDetail) request.getAttribute("tdetail");
	ArrayList<TourReview> treviewList = (ArrayList<TourReview>) request.getAttribute("treviewList");
	double gradeAvg = Double.parseDouble(String.valueOf(request.getAttribute("gradeAvg")));
	ArrayList<TourConf> tconfList = (ArrayList<TourConf>) request.getAttribute("tconfList");
	ArrayList<TourImage> timageList = (ArrayList<TourImage>)request.getAttribute("timageList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/tonight/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/tonight/css/pignose.calendar.min.css" />
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
	width: 600px;
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

.scroll-widget {
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
<body>
<%@ include file="../includes/header.jsp"%>
<div class="jumbotron"></div>
<div class="container" id="toTop">
	<h3 class="text-center"><%=tour.getTourTitle()%></h3>
	<% if(member != null && member.getMemberId().equals(tour.getGuideId())) { %>
	<div class="pull-right">
		<button type="button" class="btn btn-default">수정</button>
		<a href="/tonight/tdelete?tid=<%= tour.getTourId() %>" type="button" class="btn btn-default">삭제</a>
	</div>
	<% } %>
	<br>
	<div class="row">

		<div id="myCarousel" class="carousel slide col-md-8"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<% for(int i = 1; i < timageList.size()+1 ; i++) { %>
					<li data-target="#myCarousel" data-slide-to="<%= i %>"></li>
				<% } %>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="/tonight/tuploadfiles/<%= tour.getTourRname() %>"
						style="width: 100%;">
				</div>
				<% for(TourImage timage : timageList) { %>
					<div class="item">
					<img src="/tonight/tuploadfiles/<%= timage.getImageRname() %>"
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
					<p>투어 소개</p>
				</div>
				<div class="col-xs-8">
					<p><%=tdetail.getTourInfo()%></p>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-4">
					<p>투어 리스트</p>
				</div>
				<div class="col-xs-8">
					<p><%=tdetail.getTourList()%></p>
				</div>
			</div>
			<hr>
			<div class="row">

				<div class="col-xs-4">
					<a href="#"> <img src="https://bootdey.com/img/Content/User_for_snippets.png"
						class="img-circle person" alt="Random Name"></a>

				</div>
				<div class="col-xs-8">
					<p></p>
					<p><%= tdetail.getTourGuideMent() %></p>
				</div>
			</div>
			<hr>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-8">
			<div class="panel panel-default">
				<div class="panel-heading">날짜</div>
				<div class="panel-body row">
					<div class="col-sm-6">
						<div id="schedules">
				        	<div class="calendar-schedules"></div>
				    	</div>
					</div>
					<div class="col-sm-6 text-center">
						<hr>
						<div class="row">
							<div class="col-xs-4">
								여행 기간
							</div>
							<div id="tconf1" class="col-xs-8">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-xs-4">
								출 &nbsp;발 &nbsp;일
							</div>
							<div id="tconf2" class="col-xs-8">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-xs-4">
								도 &nbsp;착 &nbsp;일
							</div>
							<div id="tconf3" class="col-xs-8">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-xs-4">
								성인 가격
							</div>
							<div id="tconf4" class="col-xs-8">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-xs-4">
								소인 가격
							</div>
							<div id="tconf5" class="col-xs-8">
							</div>
						</div>
						<hr>
						<div>
						<button class="btn btn-default pull-right" data-toggle="modal"
									data-target="#selectDate">날짜 모두 보기</button>
						</div>
						
					</div>
				</div>
			</div>
			<div class="panel panel-default hidden-md hidden-lg">
				<div class="panel-heading">예약/결제</div>

				<div class="panel-body">
				
				
				
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">상세일정</div>
				<div class="panel-body">
					<%=tdetail.getTourSchedule()%>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">모이는 장소</div>
				<div class="panel-body row">
					<div id="map" style="height:350px; width:auto;">
						
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">포함내역</div>
				<div class="panel-body">
					<%=tdetail.getTourHistory()%>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">옵션</div>
				<div class="panel-body">
					<%=tdetail.getTourOption()%>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">환불/취소 정책</div>
				<div class="panel-body">
					<%=tdetail.getTourPolicy()%>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					후기
					<%
					if (treviewList.size() > 0) {
					%>
					<p class="pull-right">
						(<%=treviewList.size()%>)
					</p>
					<p class="pull-right"><b><%=gradeAvg%></b></p>
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
								<% if(member != null) { %>
								<li id="reviewst" class="media"><a class="pull-left" href="#fakelink">
										<img class="media-object"
										src="https://bootdey.com/img/Content/User_for_snippets.png"
										alt="Avatar">
								</a>
									<div class="media-body">
										<form action="/tonight/trinsert" method="post" id="submit">
										
											<input type="hidden" name="tid" value="<%= tour.getTourId() %>">
											
											<div class="row">
										        <div class="col-xs-9 form-group">
										        	<input type="text" name="writerid" class="form-control col-xs-3" value="<%=member.getMemberId()%>" readonly>
										        </div>
										        <div class="col-xs-3 form-group pull-right">
										        	<select class="selectpicker form-control col-xs-3" name="grade">
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
										    	<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
										      	<br>
											    <div class="row">
											    	<div class="col-md-12 form-group">
											        	<input  class="btn pull-right" type="submit">
											        </div>
											   	</div>
											</form> 
										
										
										
									</div>
									<p></p></li>
									<% } %>
								<%
									if (treviewList.isEmpty()) {
								%>
								<li class="media">
									<p>후기가 없습니다.</p>
								</li>
								<%
									} else if (treviewList.size() < 4) {
								%>
								<%
									for (TourReview treview : treviewList) {
								%>
								<li class="media"><a class="pull-left" href="#fakelink">
										<img class="media-object"
										src="https://bootdey.com/img/Content/User_for_snippets.png"
										alt="Avatar">
								</a>
									<div class="media-body">
										<h4 class="media-heading">
											<a href="#fakelink"><%=treview.getTrWriterId()%></a> <small><%=treview.getTrDate()%></small>
										</h4>
										<div class="row">
											<img
												src="/tonight/img/starGrade<%=Math.round(treview.getTrGrade())%>.png"
												class="col-xs-3" style="margin-top: -10px">
											<div class="col-xs-9"></div>
										</div>
										<p><%=treview.getTrContent()%></p>
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
											<a href="#fakelink"><%=treviewList.get(i).getTrWriterId()%></a>
											<small><%=treviewList.get(i).getTrDate()%></small>
										</h4>
										<div class="row">
											<img
												src="/tonight/img/starGrade<%=Math.round(treviewList.get(i).getTrGrade())%>.png"
												class="col-xs-3" style="margin-top: -10px">
											<div class="col-xs-9"></div>
										</div>

										<p><%=treviewList.get(i).getTrContent()%></p>
									</div></li>
								<%
									}
								%>
								<li class="media"><a class="pull-right" data-toggle="modal"
									data-target="#addReview"><%=treviewList.size() - 3%>개
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

		<div class="col-md-4 hidden-sm hidden-xs text-center">
			<div class="panel-affix" id="myScrollspy">

				<div class="panel panel-default">
					<div class="panel-heading">예약/결제</div>
					<div class="panel-body">
					<form action="/tonight/treserve" method="post" onsubmit="return check()">
						<input type="hidden" name="tourid" value="<%= tour.getTourId() %>">
						<% if(member != null) { %>
							<input type="hidden" name="registerid" value="<%= member.getMemberId() %>">
						<% } %>
						<div class="form-group">
							<label class="control-label col-sm-4" style="padding-top:6px">출발일</label>
							<div class="input-group col-sm-8">
								<input type="hidden" name="sdatein" class="sdatein">
								<input type="text" disabled class="form-control text-center sdatein">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" style="padding-top:6px">도착일</label>
							<div class="input-group col-sm-8">
								<input type="hidden" name="adatein" class="adatein">
								<input type="text" disabled class="form-control text-center adatein">
							</div>
						</div>
						<div class="form-group">
		                     <label class="control-label col-sm-4" style="padding-top:6px">성인</label>
		                     <div class="input-group number-spinner col-sm-8">
		                        <span class="input-group-btn">
		                            <a class="btn btn-danger" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></a>
		                        </span>
		                        
		                        <input type="text" disabled id="adult" class="form-control text-center" value="1" max=9 min=1>
		                        <input type="hidden" name="adult" value="1">
		                        <span class="input-group-btn">
		                            <a class="btn btn-info" data-dir="up"><span class="glyphicon glyphicon-plus"></span></a>
		                        </span>
		                    </div>
		                </div>
		                <div class="form-group">
		                   <label class="control-label col-sm-4" style="padding-top:6px"><strong>소인</strong></label>
		                   <div class="input-group number-spinner col-sm-8">
		                        <span class="input-group-btn">
		                            <a class="btn btn-danger" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></a>
		                        </span>
		                        <input type="text" disabled id="child" class="form-control text-center" value="0" max=9 min=0>
		                        <input type="hidden" name="child" value="0">
		                        <span class="input-group-btn">
		                            <a class="btn btn-info" data-dir="up"><span class="glyphicon glyphicon-plus"></span></a>
		                        </span>
		                    </div>
		                </div>
		                <div class="form-group">
		                   <label class="control-label col-sm-4" style="padding-top:20px"><strong>총 가격</strong></label>
		                   <div class="input-group number-spinner col-sm-8">
		                   		<input type="hidden" name="totalPrice" id="totalPricein">
		                        <h3><b id="totalPrice"></b> 원</h3>
		                    </div>
		                </div>
		                <div>
		                	<input type="submit" class="btn btn-info col-sm-12" style="height:50px !important" value="예약">
		                </div>
		            </form>
					</div>
					<hr>
					<a href="#toTop"><span class="glyphicon glyphicon-menu-up"></span> </a>
				</div>
			</div>
		</div>


	</div>
</div>
<div class="modal fade" id="selectDate" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">선택 가능 날짜</h4>
			</div>
			<div class="modal-body box-info">
				<div class="tab-pane active animated fadeInRight" id="comments">
					<div class="scroll-widget">
						<ul class="media-list">
							<% for (TourConf tconf : tconfList) { %>
								<li class="media"><%= tconf.getStartDate() %> ~ <%= tconf.getArrivalDate() %></li>
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
								for (TourReview treview : treviewList) {
							%>
							<li class="media"><a class="pull-left" href="#fakelink">
									<img class="media-object"
									src="https://bootdey.com/img/Content/User_for_snippets.png"
									alt="Avatar">
							</a>
								<div class="media-body">
									<h4 class="media-heading">
										<a href="#fakelink"><%=treview.getTrWriterId()%></a> <small><%=treview.getTrDate()%></small>
									</h4>
									<div class="row">
										<img
											src="/tonight/img/starGrade<%=Math.round(treview.getTrGrade())%>.png"
											class="col-xs-3" style="margin-top: -10px">
										<div class="col-xs-9"></div>
									</div>
									<p><%=treview.getTrContent()%></p>
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
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1524280cea98188e73c2051d02dc247c&libraries=services"></script>
<script>
function check() {
	<% if(member != null) { %>
		$("#reserveform").submit();
		return true;
	<% } else { %>
		alert("로그인해야됩니다!");
		return false;
	<% } %>
}
</script>
<script>
$(document).on('click', '.number-spinner a', function () {
    var btn = $(this),
    input = btn.closest('.number-spinner').find('input'),
    oldValue = input.val().trim();

if (btn.attr('data-dir') == 'up') {
  if(oldValue < input.attr('max')){
    oldValue++;
  }
} else {
  if (oldValue > input.attr('min')) {
    oldValue--;
  }
}
input.val(oldValue);
input.next().val(oldValue);
changeTotalPrice();

});

function changeTotalPrice() {
	$('#totalPrice').text($('#tconf4').text().substring(0,$('#tconf4').text().length-1)*$('#adult').val()
			+ $('#tconf5').text().substring(0,$('#tconf5').text().length-1)*$('#child').val());
	$('#totalPricein').val($('#totalPrice').text());
}
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
        schedules: [
        
            <% for (TourConf tconf : tconfList) { %>
        	
        	{name: "<%= tconf.getTourState() %>", date:  "<%= tconf.getStartDate() %>"},
        	<% } %>
       	],
        
        select: function (date, context) {
        	var sdate = (date[0] === null ? 'null' :date[0].format('YYYY-MM-DD'));
        	
			<% for (TourConf tconf : tconfList) { %>
				if(sdate == "<%= tconf.getStartDate() %>") {
					var dur = <%= (int)((tconf.getArrivalDate().getTime()-tconf.getStartDate().getTime())/(1000 * 60 * 60 * 24)) %>;
					$('#tconf1').text(dur+"박"+(dur+1)+"일");
					$('#tconf2').text("<%= tconf.getStartDate() %>");
					$('.sdatein').val("<%= tconf.getStartDate() %>");
					$('#tconf3').text("<%= tconf.getArrivalDate() %>");
					$('.adatein').val("<%= tconf.getArrivalDate() %>");
					$('#tconf4').text("<%= tconf.getTourAdultPrice() %> 원");
					$('#tconf5').text("<%= tconf.getTourChildPrice() %> 원");
					$('#totalPrice').text($('#adult').val()*<%= tconf.getTourAdultPrice() %>
										+ $('#child').val()*<%= tconf.getTourChildPrice() %>);
					$('#totalPricein').val($('#totalPrice').text());
				}
	        <% } %>
	        
        },
        lang: 'ko',
        minDate: today
    });
	function moveCalendar() {
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
		$('.sdatein').val("<%= tconfList.get(0).getStartDate() %>");
		$('#tconf3').text("<%= tconfList.get(0).getArrivalDate() %>");
		$('.adatein').val("<%= tconfList.get(0).getArrivalDate() %>");
		$('#tconf4').text("<%= tconfList.get(0).getTourAdultPrice() %> 원");
		$('#tconf5').text("<%= tconfList.get(0).getTourChildPrice() %> 원");
		$('#totalPrice').text($('#adult').val()*<%= tconfList.get(0).getTourAdultPrice() %>
									+ $('#child').val()*<%= tconfList.get(0).getTourChildPrice() %>);
		$('#totalPricein').val($('#totalPrice').text());
	}
	moveCalendar();
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
geocoder.addressSearch('<%=tdetail.getTourMeetingPlace() %>', function(result, status) {

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
        content: '<div style="width:150px;text-align:center;padding:6px 0;">모임장소</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>

</body>
</html>