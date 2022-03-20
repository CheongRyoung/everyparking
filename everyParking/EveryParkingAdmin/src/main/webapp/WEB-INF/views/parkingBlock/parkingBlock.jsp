<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 실질적 내용 변경 구역-->

<div class="col mx-3">

	<!--Top title-->
	<div class="row">
		<div class="col px-0 text-start">
			<h1 style="font-weight: bold;">
				차단 시간 설정<span class="fs-6 fw-light"> 사용자의 예약을 차단할 시간을 설정해주세요</span>
			</h1>
		</div>

		<div class="col-2 mt-4 px-0 text-end">
			<form action="">
				<button type="button" class="btn btn-light btn-sm adminBorder borderBottom" onclick="location.href='/parkingBlock/parkingBlockRegister'">차단 시간 등록</button>
			</form>
		</div>
	</div>

	<!--Dropdown-->
	<div class="row">
		<div class="col-2 mt-3 ms-0 ps-0">
			<select class="form-select" aria-label="Default select example" onchange="searchGrid('#parkingBlock', this.value)">
					<option selected>전체</option>
					<c:forEach items="${list}" var="data">
						<option value="${data.PARK_NAME}">${data.PARK_NAME}</option>
					</c:forEach>
			</select>
		</div>
		<div class="col mt-4 px-0 text-end mb-1">
			<button class="btn btn-light btn-sm adminBorder borderBottom" onclick="excelDown('#parkingBlock', '/excel/parkingBlock')">엑셀 다운로드</button>
		</div>
	</div>


	<!-- 테이블 -->
	<div class="row mb-3 backgroundColorwhite adminBorder borderBottom"
		style="height: 600px; position: relative;" >
		<div class="col px-0">
			<table class="table table-bordered text-center mb-0" id="parkingBlock"></table>
		</div>
		<div id="pagingBlock2" style="position: absolute; justify-content:center; display:flex; bottom: 1%;"></div>
	</div>
</div>
<script src="/js/parkingBlock/parkingBlock.js"></script>