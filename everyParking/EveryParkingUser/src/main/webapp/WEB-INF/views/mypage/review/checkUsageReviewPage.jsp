<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col px-0">
                <h5 class="title">예약 후기</h5>
            </div>
        </div>
    </header>
    <main>
        <div class="row pt-2 pb-5 m-0" style="width: 100%;">
            <div class="col px-0">
                <c:if test="${empty list}">
                    <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                        <div class="col text-center">
                            <div class="row">
                                <div class="col parkingSpot pe-0">
                                    작성한 후기가 없습니다.
                                </div>
                            </div>
                            <div class="row my-3">
                                <div class="col">
                                    <a href="/mypage/reservation/list">지난 내역 확인하기</a>
                                </div>
                            </div>
                        </div>
                </c:if>
            	<c:forEach items="${list}" var="data">
                <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                    <div class="col">
                        <div class="row">
                            <div class="col parkingSpot pe-0">${data.PARK_NAME }
                                <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                <c:choose>
	                                <c:when test="${data.PARK_ADDR2 } != null">
	                                	<div class="addressInfo"><p><i class="bi bi-map"></i>${data.PARK_ADDR1 } ${data.PARK_ADDR2 }</p></div>
	                                </c:when>
	                                <c:otherwise>
	                                	<div class="addressInfo"><p><i class="bi bi-map"></i>${data.PARK_ADDR1 }</p></div>
	                                </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="col p-0">
                                <span class="reviewState">결제일 | ${data.REG_DATE }</span>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <span class="carNo">예약차량번호</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <span class="carNo">${data.RESE_CAR_NO }</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                            </div>
                            <div class="col usageTime text-start p-0">
                                <div class="row">
                                    <div class="col">
                                        ${data.RESE_START }
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        ${data.RESE_END }
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                            <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                <a class="btn" href="./writeRevise?REV_SEQ=${data.REV_SEQ }&RESE_SEQ=${data.RESE_SEQ}">리뷰수정</a>
                            </div>
                            <div class="col buyDate d-grid p-0">
                                <button class="btn" onclick="deleteReview(${data.REV_SEQ})">리뷰삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
				</c:forEach>
            </div>
        </div>
    </main>
</div>
<script type="text/javascript" src="/js/mypage/review.js"></script>
