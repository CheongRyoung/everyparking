<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <header>
        <div class="row py-2 px-0">
            <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5"></i></div>
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
                <form action="" method="post">
                    <div class="row buyDetailLineBox">
                        <div class="col my-2 py-2">
                            <div class="row py-2">
                                <div class="col sectionName">구매 내역</div>
                            </div>
                            <div class="row pt-2">
                                <div class="col parkingName">강남 지나주차장</div>
                            </div>
                            <div class="row ">
                                <div class="col reserveTime">2022.02.23 14:00 ~ 2022.02.23 17:00</div>
                            </div>
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-5 my-2 sectionName">후기 내용</div>
                        <div class="col text-end">
                            <label class="star fs-1" for="star1">★</label><input type="radio" class="checkStar" id="star1" value="1" name="selectstar">
                            <label class="star fs-1" for="star2">★</label><input type="radio" class="checkStar" id="star2" value="2" name="selectstar">
                            <label class="star fs-1" for="star3">★</label><input type="radio" class="checkStar" id="star3" value="3" name="selectstar">
                            <label class="star fs-1" for="star4">★</label><input type="radio" class="checkStar" id="star4" value="4" name="selectstar">
                            <label class="star fs-1" for="star5">★</label><input type="radio" class="checkStar" id="star5" value="5" name="selectstar">
                        </div>
                    </div>
                    <div class="row pt-1">
                        <div class="col">
                            <input type="text" class="form-control formFontSize" placeholder="후기 제목을 입력해주세요.">
                        </div>
                    </div>
                    <div class="row py-3">
                        <div class="col">
                            <textarea id="writeEditor" class="form-control formFontSize" value="" style="width: 100%; height: 200px;"></textarea>
                        </div>
                    </div>
                    <div class="row py-4">
                        <div class="col-5"></div>
                        <div class="col btnBox">
                            <button type="submit" class="insertBtn btn btn-primary">등록</button>
                            <button class="cancelBtn btn btn-primary">취소</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
