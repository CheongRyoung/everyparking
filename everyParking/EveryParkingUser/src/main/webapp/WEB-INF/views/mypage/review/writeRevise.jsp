<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0 pt-1"><i class="bi bi-arrow-left fs-5" onclick="history.back();"></i></div>
            <div class="col px-0">
                <h5 class="title">후기 작성</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
        <!-- 수정 해야되는 부분-->
        <div class="row topBox" style="margin-top: auto;">
            <div class="col">
                <form action="/mypage/review/updateReviewProcess" method="get" onsubmit="return checkForm()">
                	<input type="hidden" name="RESE_SEQ" value="${data.RESE_SEQ}">
                	<input type="hidden" name="REV_SEQ" value="${reviewInfo.REV_SEQ}">
                    <div class="row buyDetailLineBox">
                        <div class="col my-2 py-2">
                            <div class="row py-2">
                                <div class="col sectionName">구매 내역</div>
                            </div>
                            <div class="row pt-2">
                                <div class="col parkingName" id="PARK_NAME">${data.PARK_NAME}</div>
                            </div>
                            <div class="row ">
                                <div class="col reserveTime">
                                	<span id="RESE_START">${data.RESE_START}</span><span style="margin-left:7px;margin-right:7px">~</span><span id="RESE_END">${data.RESE_END}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-5 my-2 sectionName">후기 내용</div>
                        <div class="col text-end">
                        <c:forEach var="i" end="5" begin="1">
                            <c:choose>
                            	<c:when test="${reviewInfo.REV_STAR > i}">
                            	<label class="star fs-1 redStar" for="star${i}">★</label><input type="radio" class="checkStar" id="star${i}" value="${i}" name="REV_STAR">
                            	</c:when>
                            	<c:when test="${reviewInfo.REV_STAR == i }">
                            	<label class="star fs-1 redStar" for="star${i}">★</label><input type="radio" class="checkStar" id="star${i}" value="${i}" name="REV_STAR" checked>
                            	</c:when>
                            	<c:otherwise>
                            	<label class="star fs-1" for="star${i}">★</label><input type="radio" class="checkStar" id="star${i}" value="${i}" name="REV_STAR">
                            	</c:otherwise>
                            </c:choose>
						</c:forEach>
                        </div>
                    </div>
                    <div class="row pt-3 pb-1">
                        <div class="col">
                            <textarea id="textBox" class="form-control formFontSize" name="REV_CONT" style="width: 100%; height: 300px;">${reviewInfo.REV_CONT }</textarea>
                        </div>
                    </div>
                    <div class="row">
                    	<div class="col" style="color:#808080;text-align:right;">
                    		<span class="textCount">0 </span>
                    		<span class="textTotal">/ 300자</span>
                    	</div>
                    </div>
                    <div class="row py-4">
                        <div class="col-5"></div>
                        <div class="col btnBox">
                            <button type="submit" class="longBtn" style="width:5.5rem;">수정</button>
                            <button class="cancelBtn" onclick="javascript:history.back();" style="height:2.5rem; border-radius:0.5rem;">취소</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
<script type="text/javascript" src="/js/mypage/writeRevise.js"></script>