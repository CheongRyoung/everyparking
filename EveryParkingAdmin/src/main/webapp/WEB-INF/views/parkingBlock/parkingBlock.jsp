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
		<div class="col px-0">
			<table class="table table-bordered text-center mb-0">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">주차장명</th>
						<th scope="col">사용불가 시간</th>
						<th scope="col">차단 사유</th>
						<th scope="col">차단 영역</th>
						<th scope="col">수정</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>a 주차장</td>
						<td>2022-02-02 15시 ~ 2022-02-02 17시</td>
						<td data-bs-toggle="modal" data-bs-target="#blockreasonModal" style="cursor: pointer;">나무가 쓰려져서 건물이...</td>
						<td>일반 구역 2칸</td>
						<td><a href="#" class="btn btn-outline-primary btn-sm">수정</a></td>
						<td><a href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</a></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>a 주차장</td>
						<td>2022-02-02 20시 ~ 2022-02-02 21시</td>
						<td data-bs-toggle="modal" data-bs-target="#blockreasonModal" style="cursor: pointer;">나무가 쓰려져서 건물이...</td>
						<td>일반 구역 4칸</td>
						<td><a href="#" class="btn btn-outline-primary btn-sm">수정</a></td>
						<td><a href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</a></td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>a 주차장</td>
						<td>2022-02-02 22시 ~ 2022-02-02 23시</td>
						<td data-bs-toggle="modal" data-bs-target="#blockreasonModal" style="cursor: pointer;">나무가 쓰려져서 건물이...</td>
						<td>전기차 구역 2칸</td>
						<td><a href="#" class="btn btn-outline-primary btn-sm">수정</a></td>
						<td><a href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>



</div>
