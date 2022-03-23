<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <header>
        <div class="row px-0">
            <div class="col">
                <div class="row py-2">
                    <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5"></i></div>
                    <div class="col px-0">
                        <h5 class="title">예약 확인</h5>
                    </div>
                    <div class="col-1 px-0"></div>
                </div>
                <div class="row text-center">
                    <div class="navColor col pb-2 activeBox">예약내역</div>
                    <div class="navColor col pb-2">과거내역</div>
                    <div class="navColor col pb-2">취소내역</div>
                </div>
                <div id="bbline" style="height: 1px; background-color: #1187CF; width: 33%;"></div>
            </div>
        </div>
    </header>

    <div class="scroll-container">
        <div class="inner">
            <main class="section">
                <div class="row pt-2 pb-5 topBox m-0" style="width: 100%;">
                    <div class="col px-0">
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">예약취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">예약취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">예약취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">예약취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">예약취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <main class="section">
                <div class="row pt-2 pb-5 topBox m-0" style="width: 100%;">
                    <div class="col px-0">
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">리뷰작성</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">리뷰작성</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">리뷰작성</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">리뷰작성</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">리뷰작성</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <main class="section">
                <div class="row pt-2 pb-5 topBox m-0" style="width: 100%;">
                    <div class="col px-0">
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">취소완료</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">취소완료</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">취소완료</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">취소완료</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">취소완료</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">취소완료</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
                            <div class="col">
                                <div class="row">
                                    <div class="col parkingSpot pe-0">강남 OO주차장
                                        <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>
                                        <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>
                                    </div>
                                    <div class="col p-0">
                                        <span class="reviewState">결제일 | 2022.02.20</span>
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
                                                <span class="carNo">123하 4567</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-1 p-1 text-center" style="margin-top: 3px;">
                                        <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">
                                    </div>
                                    <div class="col usageTime text-start p-0">
                                        <div class="row">
                                            <div class="col">
                                                02-24 18:00
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                02-24 21:00
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
                                    <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">
                                        <button class="btn">결제내역</button>
                                    </div>
                                    <div class="col buyDate d-grid p-0">
                                        <button class="btn">취소완료</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</div>
<script src="/js/mypage/reservation.js"></script>
