<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col mx-3">
	<!-- 실질적 내용 변경 구역-->
	<div class="row">
		<!-- top title-->
		<div class="col text-start p-0">
			<h1 style="font-weight: bold;">공지사항 관리</h1>
		</div>
		<div class="col-6 mt-4">
			<p style="vertical-align: text-bottom;"></p>
		</div>
		<div class="col-2 mt-4 px-0 text-end">
			<a href="./noticeInsertForm"><button class="btn btn-light btn-sm adminBorder borderBottom" data-bs-toggle="modal" data-bs-target="#noticeInsertModal">공지사항
				등록</button></a>
		</div>
	</div>
	<div class="row mt-4 adminBorder borderBottom">
		<!-- 테이블 구역 -->
		<div class="col px-0" style="background-color: white; height: 600px;">
			<table class="table table-bordered text-center mb-0"
				style="background-color: white;">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col-5">공지사항 제목</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
						<th scope="col">수정</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td></td>
						<td></td>
						<td></td>
						<td class="py-0 verticalMiddle"><a href="#"
							class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#noticeInsertModal">수정</a></td>
						<td class="py-0 verticalMiddle"><a href="#"
							class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#noticeDeleteModal">삭제</a></td>
					</tr>
					<tr>
						<th scope="row">2</th>
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
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>