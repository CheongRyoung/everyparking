<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- noticeInsertModal -->

<div id = "modalZone">
</div>
<div class="modalStyle modal fade" id="noticeInsertModal"
	data-bs-backdrop="show" data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content rounded shadow">
			<form action="/noticeManagement/insertNoti">
				<input type="hidden" name="editorData">
					<div class="modal-header" style = "background-color: #313a46; color:#fff; height: 100%">
						<div class="row">
							<div class="col px-0">
								<a class="nav-link active fs-3">공지사항 등록</a>
								<a class="nav-link fs-6">공지사항을 작성해 주세요</a>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col">
								<div class="row mt-3">
									<div class="col-3 d-flex justify-content-between">
			                        	<span class="fw-bold ps-1">제목</span>
			                        	<span class="text-black-50">|</span>
									</div>
									<div class="col">
										<input class="form-control" type="text" name="notiTitle" placeholder="제목을 입력해주세요.">
									</div>
								</div>
								<div class="row mt-5 mb-5">
									<div class="col">
										<textarea class="form-control" id="writeEditor"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="border: none;">
						<button type="button" class="modalBtn btn btn-secondary"
							style="background-color: #e0e0e0; color: #000;"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="modalBtn btn btn-primary" onclick="uploadData()">등록</button>
					</div>
			</form>
		</div>
	</div>
</div>

<div class="col mx-3">
		<!-- 실질적 내용 변경 구역-->
		<div class="row mt-3">
		<!-- top title-->
			<div class="col px-0 text-start">
				<h2 style="font-weight: bold;">공지사항 관리</h2>
			</div>
		</div>
		<div class="row">
			<div class="col px-0 text-start" style="margin: 0;">
				<span class="fs-7 fw-light">고객 센터 > 공지사항</span>
			</div>
		</div>			
		<div class="row">
			<div class="col mt-4 px-0 text-end">
				<button class="btn btn-light btn-sm adminBorder borderBottom" data-bs-toggle="modal" data-bs-target="#noticeInsertModal">
					공지사항 등록
				</button>
			</div>
		</div>
	<div class="row mt-4 adminBorder borderBottom" style = "background-color: white; position:relative; height: 600px">
		<!-- 테이블 구역 -->
		<div class="col px-0">
			<table class="table table-bordered text-center mb-0" id="noticeManageTable">
			</table>
		</div>
	   <div id="pagingBlock3" style="display: flex; justify-content: center; position: absolute; bottom: 1%;"></div>
	</div>
</div>
<script type="text/javascript" src="/js/noticeManagement/noticeManagement.js"></script>