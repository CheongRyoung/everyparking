<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col mx-3"><!-- 실질적 내용 변경 구역-->
    <div class="row"><!-- top title-->
        <div class="col text-start p-0">
            <h1 style="font-weight: bold;">이용 내역 조회<span class="fs-6 fw-light"> 주차장 이용 현황을 확인할 수 있습니다</span></h1>
        </div>
        <div class="col-2 mt-4 px-0 text-end">
            <button class="btn btn-light btn-sm adminBorder borderBottom" onclick="location.href='../../profitCost/profitTable'">내역 조회</button>
        </div>
    </div>
    <div class="row mt-4 align-items-center"><!-- 검색 옵션 구역-->
        
        <div class="col px-0">
            <select class="form-select" aria-label="Default select example" onchange="searchGrid('#profitTable', this.value)">
					<option selected>전체</option>
					<c:forEach items="${list}" var="data">
						<option value="${data.PARK_NAME}">${data.PARK_NAME}</option>
					</c:forEach>
					<!-- 예약 기간 검색 변수 아마 따로 계산 값으로? -->
				</select>
        </div>
        <div class="col-10"></div>
    </div>
    <div class="row mt-3 mb-3 backgroundColorwhite adminBorder borderBottom" style="height: 600px; position: relative;">
		<div class="col px-0">	
			<table class="table table-bordered text-center mb-0" id="userHistory"></table>
		</div>
		<div id="pagingBlock2" style="position: absolute; justify-content:center; display:flex; bottom: 1%;"></div>
	</div>
</div>

<script src="/js/parkingManage/userHistory.js"></script>