<%--
  Created by IntelliJ IDEA.
  User: blueg
  Date: 2022-03-13
  Time: 오후 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5"></i></div>
            <div class="col px-0">
                <h5 class="title">예약 상세</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
        <!-- 수정 해야되는 부분-->
        <div class="row topBox" style="margin-top: auto;">
            <div class="col">

                <div class="row" style="margin-top: 10px;">
                    <div class="col"><span class="mainContentTitle">OOO 주차장</span></div>
                </div>
                <div class="row">
                    <div class="col"><span class="mainContentSubNg">총 공간 : 50면 | </span><span class="mainContentSubNg">주차면: 일반 여성 장애인 전기차</span></div>
                </div>

                <div class="row" >
                    <div class="col px-0" style="margin-top: 10px;">
                        <img class="mainContentImg" src="../img/p1.jpg" alt="">
                    </div>
                </div>

                <div class="wraper" style="margin-top: 10px;">
                    <div class="row" style="margin-top: 10px;">
                        <div class="col">
                            <span class="cardTitleNg"><i class="bi bi-geo-alt"></i> 서울 강남구 대치동 317-2</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <span class="cardTitleNg"><i class="bi bi-telephone"></i> 000-000-0000</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <span class="cardTitleNg"><i class="bi bi-watch"></i> 상주시간 : 04시~24시</span>
                        </div>
                    </div>
                </div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col">
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary areaBtn" type="button"  data-bs-toggle="collapse" data-bs-target="#choiceTime" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation" style="margin-top: 15px; margin-bottom: 15px;">예약 시간 선택</button>
                        </div>
                    </div>
                </div>

                <!-- 예약 시간 선택 메뉴 접기 부분-->
                <div class="collapse" id="choiceTime">


                    <div class="row my-2" style="border-top: 3px solid #EEEEEE; height: 37px;">
                        <div class="col-5 align-self-center"><span class="mainContentSubTitle">예약 일시 선택</span></div>
                        <div class="col align-self-center" style="margin: auto;"></div>
                    </div>
                    <div class="row" style="margin-top: 10px;">
                        <div class="col d-grid">
                            <input id="datepickerR" type="text" name="daterange" class="datepicker" id="datepickerR" style="font-size: 14px; color: #A6A6A6;">
                        </div>
                    </div>

                    <div class="row" style="margin-top: 10px;">
                        <div class="col-5 areaList align-self-center"><span class="mainContentSubTitle">시간  요금</span></div>
                        <div class="col areaList align-self-center">
                            <div class="row">
                                <div class="col-7 discountTitleNg">
                                    <span class="mainContentSubSubNg">1시간당</span>
                                </div>
                                <div class="col">
                                    <span class="mainContentSubSubNg">1000원</span>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row" style="margin-top: 10px;">
                        <div class="col-5"><span class="mainContentSubTitle">할 인 율</span></div>
                        <div class="col align-self-center">
                            <div class="row">
                                <div class="col-7 discountTitleNg">
                                    <span class="mainContentSubSubNg">여성 전용</span>
                                </div>
                                <div class="col text-center">
                                    <span class="mainContentSubSubNg">10 %</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-7 discountTitleNg">
                                    <span class="mainContentSubSubNg">장애인 전용</span>
                                </div>
                                <div class="col text-center">
                                    <span class="mainContentSubSubNg">50 %</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-7 discountTitleNg">
                                    <span class="mainContentSubSubNg">전기차 전용</span>
                                </div>
                                <div class="col text-center">
                                    <span class="mainContentSubSubNg">10 %</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row my-3">
                        <div class="col">
                            <div class="d-grid gap-2">
                                <button class="btn btn-warning mb-2 areaBtn text-white" type="button" data-bs-toggle="collapse" data-bs-target="#choiceArea"
                                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" style="margin-top: 15px; margin-bottom: 15px;">구역 선택</button>
                            </div>
                        </div>
                    </div>

                    <!-- 구역 선택 메뉴 접기 부분-->
                    <div class="collapse" id="choiceArea">
                        <div class="row my-4 areaList"  style="border-bottom: #EEEEEE solid 3px;">
                            <div class="col">
                                <div class="btn-group mb-3 areaSelect" role="group" aria-label="Basic example">
                                    <button type="button" class="btn bubble fw-bold text-primary">일반</button>
                                    <button type="button" class="btn fw-bold text-white">여성</button>
                                    <button type="button" class="btn fw-bold text-white">장애인</button>
                                    <button type="button" class="btn fw-bold text-white">전기차</button>
                                </div>
                            </div>
                        </div>
                        <div class="row my-2 areaList">
                            <div class="col-5"><span class="mainContentSubTitle">남은 주차 구역</span></div>
                            <div class="col align-self-center">
                                <div class="row my-2">
                                    <div class="col">
                                        <span class="mainContentSubSubNg">일반 전용</span>
                                    </div>
                                    <div class="col text-end parkingSectionNg">
                                        <span class="mainContentSubSubNg">10칸</span>
                                    </div>
                                </div>
                                <div class="row my-2">
                                    <div class="col">
                                        <span class="mainContentSubSubNg">여성 전용</span>
                                    </div>
                                    <div class="col text-end parkingSectionNg">
                                        <span class="mainContentSubSubNg">10칸</span>
                                    </div>
                                </div>
                                <div class="row my-2">
                                    <div class="col parkingSectionNameNg">
                                        <span class="mainContentSubSubNg">장애인 전용</span>
                                    </div>
                                    <div class="col text-end parkingSectionNg">
                                        <span class="mainContentSubSubNg">0칸</span>
                                    </div>
                                </div>
                                <div class="row my-2">
                                    <div class="col parkingSectionNameNg">
                                        <span class="mainContentSubSubNg">전기차 전용</span>
                                    </div>
                                    <div class="col text-end parkingSectionNg">
                                        <span class="mainContentSubSubNg">10칸</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row my-2 areaList">
                            <div class="col-5">
                                <span class="mainContentSubTitle">예약 시간</span>
                            </div>
                            <div class="col">
                                <div class="row my-2">
                                    <div class="col">
                                        <span class="mainContentSubSubNg">입차시간</span>
                                    </div>
                                </div>
                                <div class="row my-2">
                                    <div class="col-3 text-end">
                                        <span class="mainContentSubSubNg"><i class="bi bi-forward"></i></span>
                                    </div>
                                    <div class="col ps-0">
                                        <span class="mainContentSubSubNg">2022-02-27 15시</span>
                                    </div>
                                </div>

                                <div class="row my-2">
                                    <div class="col">
                                        <span class="mainContentSubSubNg">출차시간</span>
                                    </div>
                                </div>
                                <div class="row my-2">
                                    <div class="col-3 text-end">
                                        <span class="mainContentSubSubNg"><i class="bi bi-forward"></i></span>
                                    </div>
                                    <div class="col ps-0">
                                        <span class="mainContentSubSubNg">2022-02-27 18시</span>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row my-2 areaList">
                            <div class="col-5">
                                <span class="mainContentSubTitle">선택한 주차 구역</span>
                            </div>
                            <div class="col text-center">
                                <span class="mainContentSubSubNg">일반</span>
                            </div>
                        </div>
                        <div class="row my-2 areaList">
                            <div class="col-5">
                                <span class="mainContentSubTitle">핸드폰 번호</span>
                            </div>
                            <div class="col numberSectionNg">
                                <input class="form-control form-control-sm d-grid" type="text" placeholder="000-000-0000" aria-label=".form-control-sm example">
                            </div>
                        </div>
                        <div class="row my-2 areaList">
                            <div class="col-5">
                                <span class="mainContentSubTitle">차량 번호</span>
                            </div>
                            <div class="col numberSectionNg">
                                <input class="form-control form-control-sm" type="text" placeholder="123가-0000" aria-label=".form-control-sm example">
                            </div>
                        </div>
                        <div class="row my-2 areaList">
                            <div class="col-5">
                                <span class="mainContentSubTitle">결제 수단</span>
                            </div>
                            <div class="col">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                    <label class="form-check-label mainContentSubSubNg" for="inlineRadio1">카카오페이<img src="../img/KaKao.png" alt=""></label>
                                </div>
                            </div>
                        </div>
                        <div class="row my-2 areaList">
                            <div class="col">
                                <div class="d-grid gap-2">
                                    <button type="button" class="btn btn-danger mb-2 areaBtn" style="margin-top: 15px; margin-bottom: 15px;">결제하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 리뷰 부분-->
                <div class="row my-4" style="border-bottom: 3px solid #EEEEEE; border-top: 3px solid #EEEEEE; margin-top: 10px; height: 40px;">
                    <div class="col align-self-center">
                        <span class="mainContentSubSubNg">리뷰(10)</span>
                    </div>
                </div>

                <div class="row mt-2" style="margin: 1px;">
                    <div class="col d-flex justify-content-between">
                        <span class="mainContentSubSubNg">UserNickName</span>
                        <span class="mainContentSubSubNg">2022-02-27 12:12</span>
                    </div>
                </div>
                <div class="row" style="margin-left: 1px;">
                    <div class="col">
                        <p>★★★★★</p>
                    </div>
                </div>
                <div class="row mb-2 pb-1" style="margin: 1px; border-bottom: 1px solid #EEEEEE;">
                    <div class="col">
                        <span class="commentContentNg">댓글내용</span>
                    </div>
                    <div class="col d-flex justify-content-end">
                        <a class="commentBtn" href="#"><i class="bi bi-pencil-square"></i></a>
                        <a class="commentBtn" href="#"><i class="bi bi-trash-fill"></i></a>
                    </div>
                </div>


                <div class="row mt-2" style="margin: 1px;">
                    <div class="col d-flex justify-content-between">
                        <span class="mainContentSubSubNg">UserNickName</span>
                        <span class="mainContentSubSubNg">2022-02-27 12:12</span>
                    </div>
                </div>
                <div class="row" style="margin-left: 1px;">
                    <div class="col">
                        <p>★★★★★</p>
                    </div>
                </div>
                <div class="row mb-2 pb-1" style="margin: 1px; border-bottom: 1px solid #EEEEEE;">
                    <div class="col">
                        <span class="commentContentNg">댓글내용</span>
                    </div>
                    <div class="col d-flex justify-content-end">
                        <a class="commentBtn" href="#"><i class="bi bi-pencil-square"></i></a>
                        <a class="commentBtn" href="#"><i class="bi bi-trash-fill"></i></a>
                    </div>
                </div>

                <div class="row mt-2" style="margin: 1px;">
                    <div class="col d-flex justify-content-between">
                        <span class="mainContentSubSubNg">UserNickName</span>
                        <span class="mainContentSubSubNg">2022-02-27 12:12</span>
                    </div>
                </div>
                <div class="row" style="margin-left: 1px;">
                    <div class="col">
                        <p>★★★★★</p>
                    </div>
                </div>
                <div class="row mb-2 pb-1" style="margin: 1px; border-bottom: 1px solid #EEEEEE;">
                    <div class="col">
                        <span class="commentContentNg">댓글내용</span>
                    </div>
                    <div class="col d-flex justify-content-end">
                        <a class="commentBtn" href="#"><i class="bi bi-pencil-square"></i></a>
                        <a class="commentBtn" href="#"><i class="bi bi-trash-fill"></i></a>
                    </div>
                </div>


            </div>
        </div>
    </main>
</div>
