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
	    background-image: url(/tongiht/img/loginbackground.jpg);
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
	<h3>1단계 여행 상품 등록</h3>
<div class="progress">
  <div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<h3 id="ment" class="text-center"><%=member.getMemberId()%> 회원님의 여행상품등록을 도와드리겠습니다</h3>
<div class="container" id="toTop">

	
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			<form action="/tonight/tinsert" method="post" enctype="multipart/form-data" name="tourform">
				<div class="step" data-step="1">
					<hr>
					<input type="hidden" name="guideid" value="<%= member.getMemberId() %>">
					<div class="row">
						<div class="col-sm-4">
							<p>여행 패키지명</p>
						</div>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="tourtitle" placeholder="여행 상품 이름을 입력하세요.">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<p>투어 소개</p>
						</div>
						<div class="col-sm-8">
							<textarea class="form-control" rows="4" name="tourinfo" placeholder="간단한 소개를 적어주세요."></textarea>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<p>투어 리스트</p>
						</div>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="tourlist">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<p>가이드의 한 마디</p>
						</div>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="tguidement">
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<p>상세일정</p>
						</div>
						<div class="col-sm-8">
							<textarea class="form-control" rows="7" name="tschedule"></textarea>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<p>모이는 장소</p>
						</div>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="tmeetingplace" placeholder="정확한 주소를 입력해주세요. 지도로 표시됩니다.">
						</div>
					</div>
					<hr>	
					<div class="row">
						<div class="col-sm-4">
							<p>포함내역</p>
						</div>
						<div class="col-sm-8">
							<textarea class="form-control" rows="7" name="thistory"></textarea>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<p>옵션</p>
						</div>
						<div class="col-sm-8">
							<textarea class="form-control" rows="7" name="toption"></textarea>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<p>환불규정</p>
						</div>
						<div class="col-sm-8">
							<textarea class="form-control" rows="7" name="tpolicy"></textarea>
						</div>
					</div>
					<hr>
				</div>
				<div class="step hidden" data-step="2">
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<p>날짜 및 가격 등록</p>
						</div>
						<div id="conftag" class="col-sm-8">
							<button type="button" id="addconf" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span>추가</button>
							<button type="button" id="delconf" class="btn btn-default"><span class="glyphicon glyphicon-minus"></span>삭제</button>
							
						</div>
						<input type="hidden" id="confcnt" name="confcnt" value="0">
					</div>
					<hr>
				</div>
				<div class="step hidden" data-step="3">
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<p>여행 상품 대표 이미지</p>
						</div>
						<div class="col-sm-8">
							<div class="form-group">
	    						<a id="img_btn1" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span>이미지 추가</a>
								<div id="output1"></div>
	 						</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<p>투어 상세 이미지</p>
						</div>
						<div class="col-sm-8">
							<div class="form-group">
								<a id="img_btn2" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span>이미지 추가</a>
								<div id="output2"></div>
	 						 </div>
						</div>
					</div>
					<hr>
					
					<button id="submit" class="btn btn-default" type="button">등록하기</button>
					<input class="btn btn-default" type="reset" value="취소하기">
					<hr>
				</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div><!-- end <div class="row">  -->



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
	var i = 1;
	$('#addconf').click(function() {
		$('#conftag').prepend('<div class="row"><div class="col-xs-3"><input type="text" name="sdate' + i + '" class="form-control input-calendar" onfocus="popupCalendar()" placeholder="출발일" /></div>'
							+'<div class="col-xs-3"><input type="text" name="adate' + i + '" class="form-control input-calendar" onfocus="popupCalendar()" placeholder="도착일" /></div>'
							+'<div class="col-xs-3"><input type="text" name="aprice' + i + '" class="form-control" placeholder="성인요금" /></div>'
							+'<div class="col-xs-3"><input type="text" name="cprice' + i + '" class="form-control" placeholder="소인요금" /></div></div>');
		$('#confcnt').val(i++);
	});
	
	$('#delconf').click(function() {
		$('#conftag .row:first').remove();
		if(i!=1) {
			i--;
			$('#confcnt').val(i);
		}
	});
	
	var dateObj = new Date();
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var day = dateObj.getDate();
	var today = year + "-" + month + "-" + day;
	
	function popupCalendar() {
		

	    // Input Calendar
	    $('.input-calendar').pignoseCalendar({
	        lang: 'ko',
	        minDate: today
	    });
		
	}
</script>
<script>
	var formData = new FormData();
	
	$('button[data-step=1]').click(function() {
		$('[data-step=1]').addClass('hidden');
		$('[data-step=2]').removeClass('hidden');
	});
	$('#pstep2').click(function() {
		$('[data-step=2]').addClass('hidden');
		$('[data-step=1]').removeClass('hidden');
	});
	$('#nstep2').click(function() {
		
		$('[data-step=2]').addClass('hidden');
		$('[data-step=3]').removeClass('hidden');
		formData = new FormData(document.forms.namedItem("tourform"));
	});
	$('button[data-step=3]').click(function() {
		$('[data-step=3]').addClass('hidden');
		$('[data-step=2]').removeClass('hidden');
	});
</script>
<script type="text/javascript">
$("#img_btn1").click(function() {
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
            formData.append('timg', f, f.name);
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
            formData.append('tdimg['+idx+"]", f, f.name);
        });
        $("#output2").html(text);
    }).on('cancel.bs.filedialog', function(ev) {
    });
});

$("#submit").click(function() {
	$.ajax({
        url: '/tonight/tinsert',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
        success: function(result){

            alert("상품등록이 완료되었습니다.");
            location.href="/tonight/tlist";
        },
        error: function(result){
            $('.container').addClass("hidden");
            $('#ment').html("<h2>상품 등록에 실패했습니다:D</h2>")

        }
    });
});
</script>
</body>
</html>