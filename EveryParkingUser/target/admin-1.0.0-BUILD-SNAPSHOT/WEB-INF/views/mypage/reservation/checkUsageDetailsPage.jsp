<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5"></i></div>
            <div class="col px-0">
                <h5 class="title">현재 내역</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
        <!-- 수정 해야되는 부분-->
        <div class="row pt-2 pb-5 topBox" style="margin-top: auto;">
            <div class="col px-0">
                <div class="row mt-2 mb-3 mx-2 py-2 usageBox">
                    <div class="col">
                        <div class="row">
                            <div class="col parkingSpot">강남 지나주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울시 강남구 밤고개로 99</p></div>
                            </div>
                            <div class="col reservationStateBox">
                                <h6 style="float:right"><span class="badge bg-primary state">이용중</span></h6>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col usageTime">2022.02.24 18:00 ~ 2022.02.24 21:00</div>
                        </div>
                        <div class="row pt-1">
                            <div class="col buyDate">구매 | 2022.02.20</div>
                        </div>
                    </div>
                </div>
                <div class="row my-3 mx-2 py-2 usageBox">
                    <div class="col">
                        <div class="row">
                            <div class="col parkingSpot">서초 청룡주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i><span class="carNo">(123하 4567)</span></span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울시 서초구 원지동 355-1</p></div>
                            </div>
                            <div class="col reservationStateBox">
                                <h6 style="float:right"><span class="badge bg-primary state">이용중</span></h6>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col usageTime">2022.02.24 20:00 ~ 2022.02.24 23:00</div>
                        </div>
                        <div class="row pt-1">
                            <div class="col buyDate">구매 | 2022.02.20</div>
                        </div>
                    </div>
                </div>
                <div class="row my-3 mx-2 py-2 usageBox">
                    <div class="col">
                        <div class="row">
                            <div class="col parkingSpot">홍대 민규주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 마포구 양화로 72</p></div>
                            </div>
                            <div class="col reservationStateBox">
                                <h6 style="float:right"><span class="badge bg-primary state" onmouseover="cancel(this)">예약완료</span></h6>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col usageTime">2022.03.01 11:00 ~ 2022.03.01 18:00</div>
                        </div>
                        <div class="row pt-1">
                            <div class="col buyDate">구매 | 2022.02.20</div>
                        </div>
                    </div>
                </div>
                <div class="row my-3 mx-2 py-2 usageBox">
                    <div class="col">
                        <div class="row">
                            <div class="col parkingSpot">홍대 민규주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 마포구 양화로 72</p></div>
                            </div>
                            <div class="col reservationStateBox">
                                <h6 style="float:right"><span class="badge bg-primary state" onmouseover="cancel(this)">예약완료</span></h6>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col usageTime">2022.03.01 11:00 ~ 2022.03.01 18:00</div>
                        </div>
                        <div class="row pt-1">
                            <div class="col buyDate">구매 | 2022.02.20</div>
                        </div>
                    </div>
                </div>
                <div class="row my-3 mx-2 py-2 usageBox">
                    <div class="col">
                        <div class="row">
                            <div class="col parkingSpot">홍대 민규주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 마포구 양화로 72</p></div>
                            </div>
                            <div class="col reservationStateBox">
                                <h6 style="float:right"><span class="badge bg-primary state" onmouseover="cancel(this)">예약완료</span></h6>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col usageTime">2022.03.01 11:00 ~ 2022.03.01 18:00</div>
                        </div>
                        <div class="row pt-1">
                            <div class="col buyDate">구매 | 2022.02.20</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
