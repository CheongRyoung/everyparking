<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5"></i></div>
            <div class="col px-0">
                <h5 class="title">예약 후기</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
        <div class="row py-2 topBox" style="margin-top: auto;">
            <div class="col px-0">
                <div class="row mt-2 mb-3 mx-2 py-2 usageBox">
                    <div class="col">
                        <div class="row">
                            <div class="col parkingSpot">강남 남곤주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                            </div>
                            <div class="col reviewBtnBox">
                                <button class="btn btn-primary reviewBtn">후기작성</button>
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
                            <div class="col parkingSpot">서초 장문주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 서초구 원지동 355-1</p></div>
                            </div>
                            <div class="col reviewBtnBox">
                                <button class="btn btn-primary reviewBtn">수정</button>
                                <button class="btn btn-primary deleteBtn" onclick="cmm.confirm('리뷰', '삭제하시겠습니까?', 'review', 15)">삭제</button>
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
                            <div class="col parkingSpot">서초 장문주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 서초구 원지동 355-1</p></div>
                            </div>
                            <div class="col reviewBtnBox">
                                <button class="btn btn-primary reviewBtn">수정</button>
                                <button class="btn btn-primary deleteBtn" onclick="cmm.confirm('나도', '삭제각?')">삭제</button>
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
                <div class="row mt-2 mb-3 mx-2 py-2 usageBox">
                    <div class="col">
                        <div class="row">
                            <div class="col parkingSpot">서초 장문주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 서초구 원지동 355-1</p></div>
                            </div>
                            <div class="col reviewBtnBox">
                                <button class="btn btn-primary reviewBtn">수정</button>
                                <button class="btn btn-primary deleteBtn">삭제</button>
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
                            <div class="col parkingSpot">서초 장문주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 서초구 원지동 355-1</p></div>
                            </div>
                            <div class="col reviewBtnBox">
                                <button class="btn btn-primary reviewBtn">수정</button>
                                <button class="btn btn-primary deleteBtn">삭제</button>
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
                            <div class="col parkingSpot">서초 장문주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 서초구 원지동 355-1</p></div>
                            </div>
                            <div class="col reviewBtnBox">
                                <button class="btn btn-primary reviewBtn">수정</button>
                                <button class="btn btn-primary deleteBtn">삭제</button>
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
                            <div class="col parkingSpot">서초 장문주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 서초구 원지동 355-1</p></div>
                            </div>
                            <div class="col reviewBtnBox">
                                <button class="btn btn-primary reviewBtn">수정</button>
                                <button class="btn btn-primary deleteBtn">삭제</button>
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
                            <div class="col parkingSpot">서초 장문주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 서초구 원지동 355-1</p></div>
                            </div>
                            <div class="col reviewBtnBox">
                                <button class="btn btn-primary reviewBtn">수정</button>
                                <button class="btn btn-primary deleteBtn">삭제</button>
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
                            <div class="col parkingSpot">서초 장문주차장
                                <span onclick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span><span class="carNo">(123하 4567)</span>
                                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 서초구 원지동 355-1</p></div>
                            </div>
                            <div class="col reviewBtnBox">
                                <button class="btn btn-primary reviewBtn">수정</button>
                                <button class="btn btn-primary deleteBtn">삭제</button>
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
            </div>
        </div>
    </main>
</div>
