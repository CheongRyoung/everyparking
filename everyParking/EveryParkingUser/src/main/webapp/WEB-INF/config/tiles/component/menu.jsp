<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 푸터 박스 + 하단 네비 구역-->
<div class="col" id="wrap" style="display: none; position: absolute; z-index: 99; height: 400px; top: 10%; width: 100%;">
    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<div class="footer-nav">
    <!-- 하단 네비바 -->
    <div class="row m-0 fixBottomNav">
        <div class="col">
            <div class="row">
                <div class="col">
                    <i class="bi bi-list fs-3 navIcon category-btn"></i>
                </div>
            </div>
            <div class="row">
                <div class="col navTitle">카테고리</div>
            </div>
        </div>
        <div class="col">
            <div class="row">
	            <div class="col">
	                <form class="p-0 m-0" id="navSearch" action="/main/map" method="post" class="p-0 m-1" onclick="DaumPostcode(this)">
	                    <input id="navpostcodeX" name="postcodeX" type="hidden" value="127.047059839521">
	                    <input id="navpostcodeY" name="postcodeY" type="hidden" value="37.5179681611717">
	                <i class="bi bi-search fs-3 navIcon"></i>
	                </form>
	            </div>
            </div>
            <div class="row">
                <div class="col navTitle" >검색</div>
            </div>
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
            <div class="row">
                <div class="col"><i class="bi bi-person-circle fs-3 navIcon my-btn"></i></div>
            </div>
            <div class="row">
                <div class="col navTitle">MY</div>
            </div>
        </div>
    </div>
</div>

<!-- 카테고리 클릭시, 사이드바 -->
<div id="sideBox" class="cate-sideBar">
    <div class="row py-2 mt-3 mb-4">
        <div class="col px-0 py-3 sideLogoBox">
            <img src="/img/newLogo.png" style="width:5rem ;height:5rem;">
        </div>
    </div>
    <div class="row sideTitleBox">
        <div class="col">
            <button class="categoryName btn btn-toggle align-items-center rounded" data-bs-toggle="collapse" data-bs-target="#searchLocation" aria-expanded="false">
                <i class="bi bi-chevron-right"></i>지역구
            </button>
            <div class="collapse" id="searchLocation">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
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
                            <input name="postcodeX" type="hidden" value="126.849532173376">
                            <input name="postcodeY" type="hidden" value="37.5509655144007">
                            <button class="link-dark rounded btn p-0 cate-sideBarFont" type="submit">강서구</button>
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
    <div class="row mt-2 mb-3">
        <div class="col cateSideLine"></div>
    </div>
    <div class="row">
        <div class="col">
            <button class="categoryName btn btn-toggle align-items-center rounded" data-bs-toggle="collapse" data-bs-target="#searchNotice" aria-expanded="false">
                <i class="bi bi-chevron-right"></i>고객센터
            </button>
            <div class="collapse" id="searchNotice">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li>
                        <a href="/operation/notice/list" class="link-dark rounded">공지사항</a>
                    </li>
                    <li>
                        <a href="/operation/QNA/list" class="link-dark rounded">문의하기</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--사이드 끝 -->

<!-- my 클릭시, 사이드바 -->
<div id="mySideBox" class="my-sideBar">
    <div class="row py-2 mt-3 mb-4" style="margin-left: 0%;">
        <div class="col p-0 myPageSideTitle">
            MY PAGE
        </div>
    </div>
    <div class="row" style="margin-left: 5%;">
        <div class="col">
            <div class="row sideTitleBox mb-2">
                <div class="col categoryName">
                    My 회원 정보
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <ul class="myList-liStyle list-unstyled">
                        <li>
                            <a href="/mypage/myinfo/confirmPw" class="link-dark rounded">회원 정보 수정</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-2 mb-3" style="margin-left: 0%;">
        <div class="col sideLine"></div>
    </div>
    <div class="row" style="margin-left: 5%;">
        <div class="col">
            <div class="row sideTitleBox mb-2">
                <div class="col categoryName">
                    이용 현황
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <ul class="myList-liStyle list-unstyled">
                        <li>
                            <a href="/mypage/reservation/list" class="link-dark rounded">예약 내역</a>
                        </li>
                        <li>
                            <a href="/mypage/review/list" class="link-dark rounded">작성 후기</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-2 mb-3" style="margin-left: 0%;">
        <div class="col sideLine"></div>
    </div>
    <div class="row" style="margin-left: 0%;">
        <c:choose>
            <c:when test="${!empty sessionUser}">
                <div class="col pt-2 logoutBox"style="cursor: pointer;" onclick="location.href = '/login/logout'">
                    <i class="bi bi-unlock" style="color:#2c0eee;"></i>로그아웃
                </div>
            </c:when>
            <c:otherwise>
                <div class="col pt-2 logoutBox" style="cursor: pointer;" onclick="location.href = '/login/loginPage'">
                    <i class="bi bi-unlock" style="color:#2c0eee;"></i>로그인
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>