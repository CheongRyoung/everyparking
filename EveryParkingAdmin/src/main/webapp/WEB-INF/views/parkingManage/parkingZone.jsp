<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col mx-3">
	<div class="row" style="height: 75px;">
		<div class="col">
			<div class="row" style="font-size: 40px; font-weight: bold;">
				<div class="col px-0 text-start">주차장 홈</div>
			</div>
		</div>

		<div class="col-2 text-end">
			<div class="row">
				<div class="col mt-4 px-0 d-grid">
					<form action="">
						<button type="button"
							class="btn btn-light btn-sm adminBorder borderBottom">주차장
							등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 테이블 -->
	<div
		class="row mt-3 mb-3 backgroundColorwhite adminBorder borderBottom"
		style="height: 600px;">
		<div class="col px-0">
			<table class="table table-bordered text-center mb-0">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">주차장명</th>
						<th scope="col">주차장 주소</th>
						<th scope="col">수정</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>중앙 주차장</td>
						<td>서울 강남구 학동로 426</td>
						<td><a href="#" class="btn btn-outline-primary btn-sm">수정</a></td>
						<td><a href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</a></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>라임 주차장</td>
						<td>서울 강남구 학동로 426</td>
						<td><a href="#" class="btn btn-outline-primary btn-sm">수정</a></td>
						<td><a href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</a></td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>레몬 주차장</td>
						<td>서울 강남구 학동로 426</td>
						<td><a href="#" class="btn btn-outline-primary btn-sm">수정</a></td>
						<td><a href="#" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
