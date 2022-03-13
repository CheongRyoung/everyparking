<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col mx-3">
	<!-- 실질적 내용 변경 구역-->
	<div class="row">
		<!-- top title-->
		<div class="col text-start p-0">
			<h1 style="font-weight: bold;">
				이용 내역 조회<span class="fs-6 fw-light"> 주차장 이용 현황을 확인할 수 있습니다</span>
			</h1>
		</div>
		<div class="col-2 mt-4 px-0 text-end">
			<a class="btn btn-light btn-sm adminBorder borderBottom" href="#">내역
				조회</a>
		</div>
	</div>
	<div class="row mt-4 align-items-center">
			<!-- 검색 옵션 구역-->
			<div class="col-2 px-0">
				<select class="form-select" aria-label="Default select example">
				<option selected>전체</option>
				<option value="parkingLot_name">주차장명</option>
				<option value="reservation_carNo">예약 차량</option>
				<option value="reservation_startTime">예약 기간</option>
			</select>
		</div>
		<div class="col px-0">
				<div class="row">
					<div class="col-2"></div>
					<div class="col text-center">
						<input type="text" name="daterange" class="datepicker"
							style="width: 250px; height: 35px; border-style: none; text-align: center;" />
						<button class="btn btn-primary mb-1 ms-3 btn-sm" type="button"
							style="height: 35px;">검색</button>
					</div>
				</div>
			</div>
	</div>
	<div class="row mt-2 adminBorder borderBottom">
		<!-- 테이블 구역 -->
		<div class="col px-0" style="background-color: white; height: 600px;">
			<table class="table table-bordered text-center mb-0"
				style="background-color: white;">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">주차장명</th>
						<th scope="col">예약 차량</th>
						<th scope="col">예약 기간</th>
						<th scope="col">예약 금액</th>
						<th scope="col">발생일</th>
						<th scope="col">비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>