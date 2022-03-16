<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 푸터 박스 + 하단 네비 구역-->
<div class="footer-nav">
    <!-- 하단 네비바 -->
    <div class="row m-0 fixBottomNav" style="margin-top: auto;">
        <div class="col">
            <div class="row">
                <div class="col"><i class="bi bi-list fs-3 navIcon category-btn"></i></div>
            </div>
            <div class="row">
                <div class="col navTitle">카테고리</div>
            </div>
        </div>
        <div class="col">
            <a href="#">
                <div class="row">
                    <div class="col"><i class="bi bi-search fs-3 navIcon"></i></div>
                </div>
                <div class="row">
                    <div class="col navTitle">검색</div>
                </div>
            </a>
        </div>
        <div class="col">
            <a href="./mainMap.html">
                <div class="row">
                    <div class="col"><i class="bi bi-geo-alt fs-3 navIcon"></i></div>
                </div>
                <div class="row">
                    <div class="col navTitle">지도</div>
                </div>
            </a>
        </div>
        <div class="col">
            <a href="#">
                <div class="row">
                    <div class="col"><i class="bi bi-house fs-3 navIcon"></i></div>
                </div>
                <div class="row">
                    <div class="col navTitle">홈</div>
                </div>
            </a>
        </div>
        <div class="col">
            <a href="#">
                <div class="row">
                    <div class="col"><i class="bi bi-person-circle fs-3 navIcon my-btn"></i></div>
                </div>
                <div class="row">
                    <div class="col navTitle">MY</div>
                </div>
            </a>
        </div>
    </div>
</div>

<!-- 카테고리 클릭시, 사이드바 -->
<div id="sideBox" class="cate-sideBar">
    <div class="row py-2 mt-3 mb-4">
        <div class="col p-0 sideLogoBox">
            <img src="../img/logo.png" style="width:130px;height:75px;">
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
                        <a href="#" class="link-dark rounded">강남구</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">강동구</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">강북구</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">강서구</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">관악구</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">광진구</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">구로구</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">금천구</a>
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
            <button class="categoryName btn btn-toggle align-items-center rounded" data-bs-toggle="collapse" data-bs-target="#searchUser" aria-expanded="false">
                <i class="bi bi-chevron-right"></i>사용자
            </button>
            <div class="collapse" id="searchUser">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li>
                        <a href="#" class="link-dark rounded">일반</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">여성전용</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">장애인전용</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">전기차</a>
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
                        <a href="#" class="link-dark rounded">공지사항</a>
                    </li>
                    <li>
                        <a href="#" class="link-dark rounded">문의하기</a>
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
            <div class="row sideTitleBox">
                <div class="col categoryName">
                    My 회원 정보
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <ul class="myList-liStyle list-unstyled">
                        <li>
                            <a href="#" class="link-dark rounded">회원 정보 수정</a>
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
            <div class="row sideTitleBox">
                <div class="col categoryName">
                    이용 내역
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <ul class="myList-liStyle list-unstyled">
                        <li>
                            <a href="#" class="link-dark rounded">예약 내역</a>
                        </li>
                        <li>
                            <a href="#" class="link-dark rounded">지난 내역</a>
                        </li>
                        <li>
                            <a href="#" class="link-dark rounded">취소 내역</a>
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
            <div class="row sideTitleBox">
                <div class="col categoryName">
                    이용 후기
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <ul class="myList-liStyle list-unstyled">
                        <li>
                            <a href="#" class="link-dark rounded">공지사항</a>
                        </li>
                        <li>
                            <a href="#" class="link-dark rounded">문의하기</a>
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
                    <i class="bi bi-unlock"></i>로그아웃
                </div>
            </c:when>
            <c:otherwise>
                <div class="col pt-2 logoutBox" style="cursor: pointer;" onclick="location.href = '/login/loginPage'">
                    <i class="bi bi-unlock"></i>로그인
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>