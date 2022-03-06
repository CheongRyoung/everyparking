<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="../css/adminCss.css">
<link rel="stylesheet" href="../css/modalCss.css">
<!-- datepicker -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="../js/datepickerTime.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script type="text/javascript" src="../js/ckeditor.js"></script>
<script type="text/javascript" src="../js/ko.js"></script>
<title><tiles:getAsString name="title"/></title>
</head>
<body style="background-color: #e0e0e0;">
	<div style="margin: auto" class="mb-5">
		<div class="container-fluid">
			<div class="row mt-5 bodyBox">
	<!--  aside 부분  -->
	<tiles:insertAttribute name="aside"/>
	<tiles:insertAttribute name="body"/>
	
			</div>
		</div>
	</div>
	



            <script>
                $('input[name="daterange"]').daterangepicker({
                    minDate: new Date(),
                    autoUpdateInput: true,
                    timePicker: true,
                    locale: {
                    "separator": " ~ ",                     // 시작일시와 종료일시 구분자
                    "format": 'YYYY년 MM월 DD일 hh시',                 // 일시 노출 포맷
                    "applyLabel": "확인",                    // 확인 버튼 텍스트
                    "cancelLabel": "취소",                   // 취소 버튼 텍스트
                    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
                    },
                                         
                    showDropdowns: true                   // 년월 수동 설정 여부
                                     
                });
                
                $('input[name="daterange"]').on('show.daterangepicker', function (ev, picker) {
                    handlerTime();
                    $(".yearselect").css("float", "left");
                    $(".monthselect").css("float", "right");
                    $(".cancelBtn").css("float", "right");
                    
                });
                var timepickerReviseList = document.querySelectorAll(".calendar-time");
                    function handlerTime() {
                        for(timepickerRevise of timepickerReviseList) {
                        timepickerRevise.setAttribute("style", "text-align: right;");
                        timepickerRevise.childNodes[2].setAttribute('disabled',true);
                        timepickerRevise.childNodes[2].value=0;
                    }
                    }
        
            </script>
        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<tiles:insertAttribute name="modal"/>
</html>