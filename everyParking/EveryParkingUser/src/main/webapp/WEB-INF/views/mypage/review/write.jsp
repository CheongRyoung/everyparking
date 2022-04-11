<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <form action="/mypage/review/insertReviewProcess" method="get" onsubmit="return checkForm()">
                	<input type="hidden" name="RESE_SEQ" value="${data.RESE_SEQ}">
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
                            <label class="star fs-1" for="star1">★</label><input type="radio" class="checkStar" id="star1" value="1" name="REV_STAR">
                            <label class="star fs-1" for="star2">★</label><input type="radio" class="checkStar" id="star2" value="2" name="REV_STAR">
                            <label class="star fs-1" for="star3">★</label><input type="radio" class="checkStar" id="star3" value="3" name="REV_STAR">
                            <label class="star fs-1" for="star4">★</label><input type="radio" class="checkStar" id="star4" value="4" name="REV_STAR">
                            <label class="star fs-1" for="star5">★</label><input type="radio" class="checkStar" id="star5" value="5" name="REV_STAR">
                        </div>
                    </div>
                    <div class="row pt-3 pb-1">
                        <div class="col">
                            <textarea id="textBox" class="form-control formFontSize" name="REV_CONT" style="width: 100%; height: 300px;"></textarea>
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
                            <button type="submit" class="longBtn" style="width:5.5rem;">등록</button>
                            <button class="cancelBtn" style="height:2.5rem; border-radius:0.5rem;" onclick="javascript:history.back();">취소</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
<script type="text/javascript" src="/js/mypage/write.js"></script>