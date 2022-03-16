<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!-- 지도가 나오는 배경 -->
<div class="kakaoMap"  id="mainMap" style="width:100%; height:92vh; position: absolute; left: 0; z-index: 1;">
    <div class="row my-3 mx-1">
        <div class="col input-group btn-group dropstart" >
            <button style="z-index: 2;" class="input-group-text bg-primary" id="basic-addon2" onclick="panTo()">
                <i class="bi bi-search text-white"></i>
            </button>
            <input style="border: 0px; z-index: 2;" name="postcodeName" id="postcodeName" type="text" class="form-control" placeholder="지역명, 위치를 검색하세요" onclick="DaumPostcode()" readonly>
            </div>
        <div class="col-2 d-flex flex-row-reverse" style="z-index: 2;">
            <a href="mainList.html"><button type="button" class="btn btn-primary" style="height: 38px;"><i class="bi bi-list-check"></i></button></a>
        </div>
    </div>
    <div class="col" id="wrap" style="display: none; position: relative; z-index: 99;">
        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
    </div>
</div>

<input type="hidden" id="postcodeX" value=${data.postcodeX }>
<input type="hidden" id="postcodeY" value=${data.postcodeY }>


<!-- 왼쪽 정보 팝업창 -->
<div class="info">
    <div class="container-fluid">
        <header>
            <div class="row headerBox py-2 px-0">
                <div class="col-1 px-0" onclick="infoClose();"><i class="bi bi-arrow-left fs-5"></i></div>
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
                            <img class="mainContentImg" src="/img/p1.jpg" alt="">
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
                    <div class="row" style="margin-top: 10px; border-top: 3px solid #EEEEEE;">
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
                    <!-- 리뷰 작성-->
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
</div>
