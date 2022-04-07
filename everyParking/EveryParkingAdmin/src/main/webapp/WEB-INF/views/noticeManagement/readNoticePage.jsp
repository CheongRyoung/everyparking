<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="col mx-3"><!-- 실질적 내용 변경 구역-->
		<div class="row mt-3">
		<!-- top title-->
			<div class="col px-0 text-start">
				<h2 style="font-weight: bold;">공지사항 관리</h2>
			</div>
		</div>
		<div class="row">
			<div class="col px-0 text-start" style="margin: 0;">
				<span class="fs-7 fw-light">고객 센터 > 공지사항</span>
			</div>
		</div>			
    <!-- 흰 내용 부분 -->
    <div class="row mt-4 backgroundColorwhite rounded shadow-sm">
        <div class="col mx-3">
            <div class="row mt-4">
                <div class="col">
                    <h4 style="font-weight: bold;">${noti.NOTI_TITLE }</h4>
                </div>
            </div>
            <div class="row my-4">
                <div class="col">
                    <span style="font-weight: bold;">작성자 </span>
                    <span>${noti.USER_NAME }</span>
                    <span>|</span>
                    <span style="font-weight: bold;">등록일 </span>
                    <span>${noti.REG_DATE }</span>
                    <span>|</span>
                    <span style="font-weight: bold;">조회수 </span>
                    <span>${noti.NOTI_COUNT }</span>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col" style="border-top: solid 1px #EEEEEE;"></div>
            </div>
            <div class="row my-3">
                <div class="col mt-3">
                  		${noti.NOTI_CONT }
                </div>
            </div>

            <div class="row my-4">
                <div class="col-5">
                    <a href="./noticeManagement"><button class="insertBtn btn btn-outline-primary">목록</button></a>
                </div>
                <div class="col">
	                <c:if test="${!empty move.NOTI_PREV}">
	                    <a href="./readNoticePage?NOTI_SEQ=${move.NOTI_PREV}"><button class="insertBtn btn btn-outline-primary me-2" style="float: right;">다음글</button></a>
	                </c:if>
	                <c:if test="${!empty move.NOTI_NEXT}">                
	                    <a href="./readNoticePage?NOTI_SEQ=${move.NOTI_NEXT}"><button class="insertBtn btn btn-outline-primary me-5" style="float: right;">이전글</button></a>
	                </c:if>    
                </div>
            </div>
        </div>
    </div>
</div>