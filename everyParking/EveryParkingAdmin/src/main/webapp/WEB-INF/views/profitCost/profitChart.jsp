<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col mx-3">
	<!-- 실질적 내용 변경 구역-->
	<div class="row">
		<!-- top title-->
		<div class="col text-start p-0">
			<h1 style="font-weight: bold;">
				순 수익 조회<span class="fs-6 fw-light"> 주차장 수익을 확인할 수 있습니다</span>
			</h1>
		</div>
		<div class="col-2 mt-4 px-0 text-end">
			<a href="./costInsertForm" class="btn btn-light btn-sm adminBorder borderBottom" data-bs-toggle="modal" data-bs-target="#costModalinsert">비용 등록</a>
		</div>
	</div>
	<form action="">
		<div class="row mt-4  align-items-center">
			<!-- 검색 옵션 구역-->
			<div class="col-2 px-0">
				<select class="form-select" aria-label="Default select example" onchange="searchParkSeq(this.value);">
					<option selected>전체</option>
					<c:forEach items="${list}" var="data">
						<option value="${data.PARK_SEQ}">${data.PARK_NAME}</option>
					</c:forEach>
					<!-- 예약 기간 검색 변수 아마 따로 계산 값으로? -->
				</select>
			</div>
			<div class="col px-0">
				<div class="row align-items-center">
					<div class="col-2"></div>
					<div class="col text-center">
						<input type="text" id='datepickerN' name="daterange" class="datepicker"
							style="width: 250px; height: 35px; border-style: none; text-align: center;"/>
						<button class="btn btn-primary mb-1 ms-3 btn-sm" type="button"
							style="height: 35px;" onclick="searchDate();">검색</button>
					</div>
				</div>
			</div>
			<div class="col-auto px-0" style="font-size: 20px;">
				<div class="btn-group" role="group">
					<a href="./profitChart" class="bi bi-bar-chart-line btn btn-secondary active" aria-current="page"></a><a href="./profitTable" class="bi bi-list-ul btn btn-secondary"></a>
				</div>
			</div>
		</div>
	</form>
	<div class="row mt-2 adminBorder borderBottom">
		<!-- 테이블 구역 -->
		<div class="col px-0" style="background-color: white;width:100%;height:600px;">
			<!-- Chart API 가져올 구역-->
			<canvas class="profitChart" id="profitChart" width="917.69" height="510"></canvas>
		</div>
	</div>
</div>
<script type="text/javascript" src="/js/profitCost/profitChart.js"></script>