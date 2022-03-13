<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<button type="button"
					class="btn btn-light btn-sm adminBorder borderBottom">사용
					시간 설정</button>
			</form>
		</div>
	</div>

	<!--Dropdown-->
	<div class="row">
		<div class="col-2 mt-3 ms-0 ps-0">
			<select class="form-select" aria-label="주차장 검색">
				<option selected>전체</option>
				<option value="parkingLot_name">주차장명</option>
			</select>
		</div>
	</div>


	<!-- 테이블 -->
	<div class="row mb-3 backgroundColorwhite adminBorder borderBottom"
		style="height: 600px;">
		<div class="col px-0" id="testGrid">

		</div>
		<div id="pagingBlock">
			
		</div>
	</div>
</div>
