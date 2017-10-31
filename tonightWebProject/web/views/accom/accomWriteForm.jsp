<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/tonight/css/bootstrap.fd.css">
<link rel="stylesheet" type="text/css"
	href="/tonight/css/pignose.calendar.min.css" />
</head>
<style type="text/css">

.jumbotron {
		margin-bottom: 0px;
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
	<h3>1단계 숙소 등록</h3>
<div class="progress">
  <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<h3 class="text-center" id="ment"><%=member.getMemberId()%> 회원님의 숙소등록을 도와드리겠습니다</h3>
<div class="container" id="toTop">


<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	<form  method="post" enctype="multipart/form-data" name="accomForm">
		<div class="step" data-step="1">
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 이름</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="aname" placeholder="숙소 이름을 입력하세요.">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>사업자 아이디</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" readonly name="awriter" value="<%= member.getMemberId()%>">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 등급</p>
					</div>
					<div class="col-xs-8">
						<select class="form-control" name="arank">
						  <option value="SILVER">SILVER</option>
						  <option value="GOLD">GOLD</option>
						  <option value="PLATINUM">PLATINUM</option>
						  <option value="DIAMOND">DIAMOND</option>
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
						  <option value="H">호텔</option>
						  <option value="M" >모텔</option>
						  <option value="G" >게스트하우스</option>
						  <option value="P">펜션</option>
						</select>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 주소</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="aaddress" placeholder="숙소 주소를 입력하세요.">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>연락처</p>
					</div>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="acontact" placeholder="연락처를 입력하세요.">
					</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 소개</p>
					</div>
					<div class="col-xs-8">
						<textarea class="form-control" rows="7" name="ainfo"></textarea>
					</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-xs-4">
						<p>편의시설</p>
					</div>
					<div class="col-xs-8">
						<table width="100%">
						<tr>
							<td><input type="checkbox" id="inlineCheckbox1" name="afacilities" value="주차장"> 주차장</td>
							<td><input type="checkbox" id="inlineCheckbox2" name="afacilities" value="수영장"> 수영장</td>
							<td><input type="checkbox" id="inlineCheckbox3" name="afacilities" value="엘레베이터"> 엘레베이터</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="inlineCheckbox1" name="afacilities" value="무선인터넷"> 무선인터넷</td>
							<td><input type="checkbox" id="inlineCheckbox2" name="afacilities" value="부엌"> 부엌</td>
							<td><input type="checkbox" id="inlineCheckbox3" name="afacilities" value="욕조"> 욕조</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="inlineCheckbox1" name="afacilities" value="air"> 에어컨</td>
							<td><input type="checkbox" id="inlineCheckbox2" name="afacilities" value="wash"> 세탁기</td>
							<td><input type="checkbox" id="inlineCheckbox3" name="afacilities" value="tv"> TV</td>
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
						<textarea class="form-control" rows="7" name="arules"></textarea>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>환불규정</p>
					</div>
					<div class="col-xs-8">
						<textarea class="form-control" rows="7" name="arefund"></textarea>
					</div>
				</div>
				<hr>
			</div><!-- 1단계 -->
			
			<div class="step hidden" data-step="2">
				<hr>
				<div class="row">
					<div class="col-xs-4">
						<p>숙소 대표 이미지</p>
					</div>
					<div class="col-xs-8">
						<div class="form-group">
	    						<a id="img_btn1" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span>이미지 추가</a>
								<div id="output1"></div>
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
								<a id="img_btn2" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span>이미지 추가</a>
								<div id="output2"></div>
	 					</div>
					</div>
				</div>
			</div><!-- 2단계 -->
			
			<div class="step hidden" data-step="3">
			<hr>
				<div class="row">
					<button type="button" id="submit" class="btn btn-default" >숙소등록하기</button>
					<!-- <input class="btn btn-default" type="submit" value="숙소등록하기"> &nbsp; -->
					<input class="btn btn-default" type="reset" value="취소하기">
				</div>
				<hr>
			</div>
			</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	
	
<button class="btn btn-default pull-right" data-step="1">다음 단계</button>
<button class="btn btn-default hidden" id="pstep2" data-step="2">이전 단계</button>
<button class="btn btn-default pull-right hidden"  id="nstep2" data-step="2">다음 단계</button>
<button class="btn btn-default hidden" data-step="3">이전 단계</button>	
	
</div><!-- end <div class="container" id="toTop"> -->

<%@ include file="../includes/footer.jsp" %>
<script type="text/javascript" src="/tonight/js/moment.latest.min.js"></script>
<script type="text/javascript"
	src="/tonight/js/pignose.calendar.min.js"></script>
<script src="/tonight/js/bootstrap.fd.js"></script>
<script>
	var formData = new FormData();
	
	$('button[data-step=1]').click(function() {
		$('[data-step=1]').addClass('hidden');
		$('[data-step=2]').removeClass('hidden');
		formData = new FormData(document.forms.namedItem("accomForm"));
	});
	$('#pstep2').click(function() {
		$('[data-step=2]').addClass('hidden');
		$('[data-step=1]').removeClass('hidden');
	});
	$('#nstep2').click(function() {
		
		$('[data-step=2]').addClass('hidden');
		$('[data-step=3]').removeClass('hidden');
		
	});
	$('button[data-step=3]').click(function() {
		$('[data-step=3]').addClass('hidden');
		$('[data-step=2]').removeClass('hidden');
	});
</script>
<script type="text/javascript">
$("#img_btn1").click(function() {
	//var formData = new FormData(document.forms.namedItem("accomForm"));
    $.FileDialog({
    	title: "이미지 등록",
    	multiple: false,
    	drag_message: "파일을 드래그하세요!",
    	dropheight: 200,
    	ok_button:"확인",
    	cancel_button:"취소"
    }).on('files.bs.filedialog', function(ev) {
        var files = ev.files;
        var text = "";
        files.forEach(function(f) {
            text += f.name + "<br/>";
            formData.append('aimg', f, f.name);
            
        });
        $("#output1").html(text);
    }).on('cancel.bs.filedialog', function(ev) {
    });
});


$("#img_btn2").click(function() {
    $.FileDialog({
    	title: "이미지 등록",
    	multiple: true,
    	drag_message: "파일을 드래그하세요!",
    	dropheight: 200,
    	ok_button:"확인",
    	cancel_button:"취소"
    }).on('files.bs.filedialog', function(ev) {
        var files = ev.files;
        var text = "";
        files.forEach(function(f, idx) {
            text += f.name + "<br/>";
            formData.append('adimg['+idx+"]", f, f.name);
            
        });
        $("#output2").html(text);
    }).on('cancel.bs.filedialog', function(ev) {
    });
});

$("#submit").click(function() {
	$.ajax({
        url: '/tonight/ainsert',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
        success: function(result){
            /* $('.container').addClass("hidden"); */
           $('#ment').html("<h2>상품 등록이 완료되었습니다:D</h2>")
        }
    });
}); 
</script>
</body>
</html>