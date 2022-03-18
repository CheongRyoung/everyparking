<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col mx-3">
	<!-- 실질적 내용 변경 구역-->
	<div class="row">
		<!-- top title-->
		<div class="col text-start p-0">
			<h1 style="font-weight: bold;">문의 내역 관리</h1>
		</div>

	</div>
	<div class="row mt-4 adminBorder borderBottom">
		<!-- 테이블 구역 -->
		<!-- 답변 전에는 빈칸, 답변 후에는 채워지게 했으면 해서 우선 outline으로 잡았습니다.-->
		<div class="col px-0" style="background-color: white; height: 600px;">
			<table class="table table-bordered text-center mb-0" id="qnaManageTable" >
				<!-- 
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">문의 제목</th>
						<th scope="col">문의 내용</th>
						<th scope="col">등록일</th>
						<th scope="col">상태</th>
						<th scope="col">답변</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td class="py-0 verticalMiddle"><a href="#"
							class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#qnaModal">답변하기</a></td>
						
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
				 -->
			</table>
		<div id="pagingBlock4" style="display: flex; justify-content: center; position: absolute; bottom: 1%;"></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/js/qnaManage/qnaManagement.js"></script>