<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-2"><!-- 왼편 네비바 -->
    <div class="row backgroundColorwhite">
        <div class="col px-0 text-center adminBorder">
            <img src="/img/admin.png">
        </div>
    </div>
    <div class="row mb-5 backgroundColorwhite">
        <div class="col text-center pb-3 adminBorder borderBottom"><br>
        	<c:if test="${!empty sessionUser }">
        		<a href="/login/loginPage"><i class="bi bi-unlock"></i>로그아웃</a>
        	</c:if>
        </div>
    </div>
    <div class="row backgroundColorwhite adminBorder" style="font-size: 20px; font-weight: bold; color: green;">
        <div class="col-2 my-3"><i class="bi bi-house"></i></div>
        <div class="col my-3"><a href="/parkingManage/adminHome" style="color: green;">관리페이지 홈</a></div>
    </div>
    <div class="row adminBorder">
        <div class="col">
            <div class="row backgroundColorwhite" style="font-size: 20px; font-weight: bold;">
                <div class="col-2 mt-3 mb-2"><i class="bi bi-gear"></i></div>
                <div class="col mt-3 mb-2">주차장 관리</div>
            </div>
            <div class="row backgroundColorwhite">
                <div class="col-2"></div>
                <div class="col my-1"><a href="/parkingManage/parkingZone">주차장 홈</a></div>
            </div>
            <div class="row backgroundColorwhite">
                <div class="col-2"></div>
                <div class="col my-1"><a href="/profitCost/reservationInquiry">예약 여부 관리</a></div>
            </div>
            <div class="row backgroundColorwhite">
                <div class="col-2"></div>
                <div class="col my-1"><a href="/profitCost/costTable">유지 비용 관리</a></div>
            </div>
            <div class="row backgroundColorwhite">
                <div class="col-2"></div>
                <div class="col my-1"><a href="/parkingManage/userHistory">이용 내역 조회</a></div>
            </div>
            <div class="row backgroundColorwhite">
                <div class="col-2"></div>
                <div class="col my-1"><a href="/profitCost/profitChart">순 수익 조회</a></div>
            </div>
            <div class="row backgroundColorwhite">
                <div class="col-2"></div>
                <div class="col mt-1 mb-4"><a href="/parkingBlock/parkingBlock">차단 시간 관리</a></div>
            </div>
        </div>
    </div>
    <div class="row adminBorder borderBottom">
        <div class="col">
            <div class="row backgroundColorwhite" style="font-size: 20px; font-weight: bold;">
                <div class="col-2 mt-3"><i class="bi bi-headphones"></i></div>
                <div class="col mt-3 mb-2">고객센터 관리</div>
            </div>
            <div class="row backgroundColorwhite">
                <div class="col-2 my-1"></div>
                <div class="col my-1"><a href="/noticeManagement/noticeManagement">공지사항 관리</a></div>
            </div>
            <div class="row backgroundColorwhite">
                <div class="col-2"></div>
                <div class="col mt-1 mb-4"><a href="/qnaManage/qnaManage">문의 내역 관리</a></div>
            </div>
        </div>
    </div>
</div>