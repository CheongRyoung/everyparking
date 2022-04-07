<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse" style="background-color: #313a46;">
    <div class="position-sticky pt-3">
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            <span><i class="bi bi-house"></i> 주차장 정보</span>
        </h6>
        <ul class="nav flex-column mt-3">
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="/parkingManage/parkingZone">
                    <span data-feather="home"></span>
                    주차장 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/profitCost/costTable">
                    <span data-feather="file"></span>
                    유지비용 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/parkingManage/userHistory">
                    <span data-feather="shopping-cart"></span>
                    이용 내역 조회
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/profitCost/profitChart">
                    <span data-feather="users"></span>
                    순 수익 조회
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/parkingBlock/parkingBlock">
                    <span data-feather="bar-chart-2"></span>
                    차단 시간 관리
                </a>
            </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            <span><i class="bi bi-headphones"></i>고객센터</span>
        </h6>
        <ul class="nav flex-column mb-2 mt-3">
            <li class="nav-item">
                <a class="nav-link" href="/noticeManagement/noticeManagement">
                    <span data-feather="file-text"></span>
                    공지사항
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/qnaManage/qnaManage">
                    <span data-feather="file-text"></span>
                    문의내역
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/couponManagement/couponManagement">
                    <span data-feather="file-text"></span>
                    쿠폰발급
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/chat/adminChat">
                    <span data-feather="file-text"></span>
                    1:1 문의
                </a>
            </li>
        </ul>
    </div>
</nav>