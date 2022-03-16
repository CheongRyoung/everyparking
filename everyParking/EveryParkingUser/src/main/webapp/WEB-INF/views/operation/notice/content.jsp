<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5"></i></div>
            <div class="col px-0">
                <h5 class="title">공지 사항</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
        <!-- 수정 해야되는 부분-->
        <div class="row" style="margin-top: auto;">
            <div class="col">
                <div class="row">
                    <div class="col p-0">
                        <img src="../img/notice.png" class="img-fluid">
                    </div>
                </div>

                <div class="row">
                    <div class="col" style="border-top: solid 3px #1187cf;"></div>
                </div>

                <dlv class="row mt-3">
                    <div class="col">
                        <h4 style="font-weight: bold;">2월 4주차 주차장 관리일지</h4>
                    </div>
                </dlv>

                <div class="row my-3">
                    <div class="col" style="font-size: 12px;">
                        <span style="font-weight: bold;">작성자 </span>
                        <span>아무개</span>
                        <span>|</span>
                        <span style="font-weight: bold;">등록일 </span>
                        <span>2022.02.26</span>
                        <span>|</span>
                        <span style="font-weight: bold;">조회수 </span>
                        <span>0</span>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col" style="border-top: solid 1px #a6a6a6;"></div>
                </div>

                <div class="row" style="height: 200px;">
                    <div class="col mt-3" id="readEditor">
                        안녕하세요. 우주관리자입니다. 2월 4주차 관리일지를 공개합니다.
                    </div>
                </div>

                <div class="row my-4">
                    <div class="col-5">
                        <button class="cancelBtn btn btn-primary" style="width: 80px;">목록</button>
                    </div>
                    <div class="col btnBox">
                        <button class="cancelBtn btn btn-primary">〈 이전글</button>
                        <button class="cancelBtn btn btn-primary">다음글 〉</button>
                    </div>
                </div>

            </div>
        </div>
    </main>
</div>
