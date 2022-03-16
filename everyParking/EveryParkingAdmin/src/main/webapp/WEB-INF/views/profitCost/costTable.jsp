<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col mx-3">
	<!--Top title-->
	<div class="row">
		<div class="col px-0 text-start">
			<h1 style="font-size: 40px; font-weight: bold;">
				유지 비용 관리<span class="fs-6 fw-light"> 주차장 관리비용을 등록할 수 있습니다.</span>
			</h1>
		</div>

		<div class="col-2 mt-3 text-end">
			<form action="">
				<button type="button"
					class="btn btn-light btn-sm adminBorder borderBottom" data-bs-toggle="modal" data-bs-target="#costModalinsert">비용
					등록</button>
			</form>
		</div>
	</div>
	<!--Dropdown-->
	<div class="row mt-4 align-items-center">
			<!-- 검색 옵션 구역-->
			<div class="col-2 px-0">
				<select class="form-select" aria-label="Default select example">
				<option selected>전체</option>
				<option value="parkingLot_name">주차장명</option>
				<option value="manage_name">비용 사유</option>
			</select>
		</div>
		
		<div class="col px-0">
				<div class="row">
					<div class="col-2"></div>
					<div class="col text-center">
						<input type="text" id='datepickerN' name="daterange" class="datepicker"
							style="width: 250px; height: 35px; border-style: none; text-align: center;" />
						<button class="btn btn-primary mb-1 ms-3 btn-sm" type="button"
							style="height: 35px;">검색</button>
					</div>
				</div>
			</div>
	</div>
	<!-- 테이블 -->
	<div class="row mt-2 mb-3 backgroundColorwhite adminBorder borderBottom"
		style="height: 600px;">
		<div class="col px-0">
			<table class="table table-bordered text-center mb-0">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">주차장명</th>
						<th scope="col">비용 사유</th>
						<th scope="col">금액</th>
						<th scope="col">발생일</th>
						<th scope="col">수정</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>a 주차장</td>
						<td>청소비</td>
						<td>1,000,000원</td>
						<td>2022-02-02 15:11</td>
						<td><a href="#" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#costModalinsert">수정</a></td>
						<td><a href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#costDeleteModal">삭제</a></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>a 주차장</td>
						<td>수리비</td>
						<td>1,000,000원</td>
						<td>2022-02-02 15:11</td>
						<td><a href="#" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#costModalinsert">수정</a></td>
						<td><a href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#costDeleteModal">삭제</a></td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>a 주차장</td>
						<td>청소비</td>
						<td>1,000,000원</td>
						<td>2022-02-02 15:11</td>
						<td><a href="#" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#costModalinsert">수정</a></td>
						<td><a href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#costDeleteModal">삭제</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
