<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 푸터 박스 + 하단 네비 구역-->
<div class="col" id="wrap"
     style="display: none; position: absolute; z-index: 99; height: 400px; top: 10%; width: 100%;">
    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap"
         style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<div class="footer-nav">
    <!-- 하단 네비바 -->
    <div class="row m-0 fixBottomNav">
        <div class="col">
            <div class="row">
                <div class="col">
                    <i class="bi bi-list fs-2 navIcon category-btn" id="clickCateIcon"></i>
                </div>
            </div>
            <div class="row">
                <div class="col navTitle" id="clickCateText">카테고리</div>
            </div>
        </div>
        <div class="col">
            <div class="row">
                <div class="col">
                    <form class="p-0 m-0" id="navSearch" action="/main/map" method="post" class="p-0 m-1"
                          onclick="DaumPostcode(event)">
                        <input id="navpostcodeX" name="postcodeX" type="hidden" value="127.047059839521">
                        <input id="navpostcodeY" name="postcodeY" type="hidden" value="37.5179681611717">
                        <i class="bi bi-search fs-3 navIcon"></i>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col navTitle">검색</div>
            </div>
        </div>
        <div class="col">
            <a href="/main/home">
                <div class="row">
                    <div class="col"><i class="bi bi-house fs-3 navIcon"></i></div>
                </div>
                <div class="row">
                    <div class="col navTitle">홈</div>
                </div>
            </a>
        </div>
        <div class="col">
            <a href="/main/map">
                <div class="row">
                    <div class="col"><i class="bi bi-geo-alt fs-3 navIcon"></i></div>
                </div>
                <div class="row">
                    <div class="col navTitle">지도</div>
                </div>
            </a>
        </div>
        <div class="col">
            <div class="row">
                <div class="col"><i class="bi bi-person-circle fs-3 navIcon my-btn" id="clickMyIcon"></i></div>
            </div>
            <div class="row">
                <div class="col navTitle" id="clickMyText">MY</div>
            </div>
        </div>
    </div>
</div>

<!-- 카테고리 클릭시, 사이드바 -->
<div id="sideBox" class="cate-sideBar">
    <div class="row" style="height: 100%;">
        <div class="col">
            <div class="cate-sideBarBox">
                <div class="row py-2">
                    <div class="col px-0 py-3 sideLogoBox">
                        <img src="/img/logo2.png" style="width:5rem ;height:5rem;">
                    </div>
                </div>
                <div class="row sideTitleBox">
                    <div class="col d-grid">
                        <button class="categoryName btn btn-toggle align-items-center rounded" data-bs-toggle="collapse"
                                data-bs-target="#searchLocation" aria-expanded="false" style="display: flex; justify-content: space-between;">
                            <div><i class="bi bi-geo-alt" style="color:#3E4AB8;"></i> &nbsp;지역구</div><i class="bi bi-chevron-right fs-6"></i>
                        </button>
                        <div class="collapse" id="searchLocation">
                            <ul class="btn-toggle-nav list-unstyled fw-normal small">
                                <li>
                                    <form action="/main/map" method="post" class="p-0 m-1">
                                        <input name="postcodeX" type="hidden" value="127.047059839521">
                                        <input name="postcodeY" type="hidden" value="37.5179681611717">
                                        <button class="link-dark rounded btn p-0 cate-sideBarFont" type="submit">강남구</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="/main/map" method="post" class="p-0 m-1">
                                        <input name="postcodeX" type="hidden" value="127.12379233466">
                                        <input name="postcodeY" type="hidden" value="37.530160973856">
                                        <button class="link-dark rounded btn p-0 cate-sideBarFont" type="submit">강동구</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="/main/map" method="post" class="p-0 m-1">
                                        <input name="postcodeX" type="hidden" value="127.025449504014">
                                        <input name="postcodeY" type="hidden" value="37.6391856183931">
                                        <button class="link-dark rounded btn p-0 cate-sideBarFont" type="submit">강북구</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="/main/map" method="post" class="p-0 m-1">
                                        <input name="postcodeX" type="hidden" value="126.951501244173">
                                        <input name="postcodeY" type="hidden" value="37.4782106746327">
                                        <button class="link-dark rounded btn p-0 cate-sideBarFont" type="submit">관악구</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="/main/map" method="post" class="p-0 m-1">
                                        <input name="postcodeX" type="hidden" value="127.081912437816">
                                        <input name="postcodeY" type="hidden" value="37.5385399017325">
                                        <button class="link-dark rounded btn p-0 cate-sideBarFont" type="submit">광진구</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="/main/map" method="post" class="p-0 m-1">
                                        <input name="postcodeX" type="hidden" value="126.888289087243">
                                        <input name="postcodeY" type="hidden" value="37.4955112265472">
                                        <button class="link-dark rounded btn p-0 cate-sideBarFont" type="submit">구로구</button>
                                    </form>
                                </li>
                                <li>
                                    <form action="/main/map" method="post" class="p-0 m-1">
                                        <input name="postcodeX" type="hidden" value="126.896036850324">
                                        <input name="postcodeY" type="hidden" value="37.4570656519531">
                                        <button class="link-dark rounded btn p-0 cate-sideBarFont" type="submit">금천구</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col d-grid">
                        <button class="categoryName btn btn-toggle align-items-center rounded" data-bs-toggle="collapse"
                                data-bs-target="#searchNotice" aria-expanded="false" style="display: flex; justify-content: space-between;">
                            <div><i class="bi bi-headset" style="color:#3E4AB8;"></i> &nbsp;고객센터</div><i class="bi bi-chevron-right fs-6"></i>
                        </button>
                        <div class="collapse" id="searchNotice">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li>
                                    <a href="/operation/notice/list" class="link-dark rounded">공지사항</a>
                                </li>
                                <li style="margin-top:0.6rem;">
                                    <a href="/operation/QNA/list" class="link-dark rounded">문의하기</a>
                                </li>
                                <li style="margin-top:0.6rem;">
                                    <a href="/coupon/couponList" class="link-dark rounded">쿠폰발급</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-4" onclick="cateToggle()">
        </div>
    </div>
</div>
<!--사이드 끝 -->

<!-- my 클릭시, 사이드바 -->
<div id="mySideBox" class="my-sideBar">
    <div class="row m-0" style="height: 100%; width: 100%;">
        <div class="col-4 p-0" onclick="myPageToggle()">
        </div>
        <div class="col-8 mySideBarMain">
            <div class="row" style="margin-left: 0%;">
                <div class="col ps-4 myPageSideTitle fs-2">
                    MY PAGE
                </div>
            </div>
            <div>
                <div class="mb-4 ms-4 myPageWho">
                    <c:choose>
                        <c:when test="${!empty sessionUser}">
                            <div class="p-0 fs-4">
                                <span>${sessionUser.USER_NAME}</span> 님
                            </div>
                            <div class="p-0 fs-4">환영합니다!</div>
                        </c:when>
                        <c:otherwise>
                            <div class="p-0 fs-4">
                                로그인 하시면
                            </div>
                            <div class="p-0 fs-4">이용이 가능합니다.</div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="mytileFlexBox">
                    <div class="text-center p-1">
                        <a href="/mypage/myinfo/confirmPw">
                            <div class="myPageTile">
                                <i class="bi bi-person fs-1"></i>
                                <p>계정 정보</p>
                            </div>
                        </a>
                    </div>
                    <div class="text-center p-1">
                        <a href="/mypage/reservation/list">
                            <div class="myPageTile">
                                <i class="bi bi-calendar-week fs-1"></i>
                                <p>예약 내역</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="mytileFlexBox">
                    <div class="text-center p-1">
                        <a href="/mypage/review/list">
                            <div class="myPageTile">
                                <i class="bi bi-pencil-square fs-1"></i>
                                <p>작성 후기</p>
                            </div>
                        </a>
                    </div>
                    <div class="text-center p-1">
                    	<a href="/coupon/myCoupon">
                        <div class="myPageTile">
                            <i class="bi bi-ticket-perforated fs-1"></i>
                            <p>쿠폰</p>
                        </div>
                        </a>
                    </div>
                </div>
                <div class="mytileFlexBox">
                    <div class="text-center p-1">
                    	<a href="/chat/chatting">
                        <div class="myPageTile">
                            <i class="bi bi-chat-dots fs-1"></i>
                            <p>1:1 문의</p>
                        </div>
                        </a>
                    </div>
                    <c:choose>
                        <c:when test="${!empty sessionUser}">
                            <div class="text-center p-1" style="cursor: pointer;" onclick="location.href = '/login/logout'">
                                <div class="myPageTile">
                                    <i class="bi bi-box-arrow-right fs-1"></i>
                                    <p>로그아웃</p>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center p-1" style="cursor: pointer;" onclick="location.href = '/login/loginPage'">
                                <div class="myPageTile">
                                    <i class="bi bi-lock fs-1"></i>
                                    <p>로그인</p>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>