<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col mx-3">
	<!-- 실질적 내용 변경 구역-->
	<div class="row">
		<!-- top title-->
		<div class="col text-start px-0">
			<h1 style="font-weight: bold;">주차장 등록</h1>
		</div>
	</div>
	<div class="row mt-4 backgroundColorwhite adminBorder borderBottom"
		style="height: 600px;">
		<!-- 테이블 구역 -->
		<div class="col">
			<div class="row mb-3">
				<div class="col ms-5 mt-5 mb-4">
					<h4 style="font-weight: bold;">Stage 2: 선택한 구역의 주차 가능 대수와 구역별
						할인율을 입력해 주세요</h4>
				</div>
				<div class="row mt-3">
					<div class="col-4 px-0">
						<img class="img-fluid" src="/img/image1.png">
					</div>
					<div class="col ms-1">
						<div class="row mb-5">
							<div class="col-3">구분</div>
							<div class="col">주차 가능 대수 입력</div>
							<div class="col">할인율(숫자만 입력)</div>
						</div>
						<div class="row mb-5">
							<div class="col-3">일반 구역</div>
							<div class="col">
								<input type="text" placeholder="가능 대수">
							</div>
							<div class="col">
								<input type="text" placeholder="할인율(%)">
							</div>
						</div>
						<div class="row mb-5">
							<div class="col-3">여성 전용</div>
							<div class="col">
								<input type="text" placeholder="가능 대수">
							</div>
							<div class="col">
								<input type="text" placeholder="할인율(%)">
							</div>
						</div>
						<div class="row mb-5">
							<div class="col-3">장애인 구역</div>
							<div class="col">
								<input type="text" placeholder="가능 대수">
							</div>
							<div class="col">
								<input type="text" placeholder="할인율(%)">
							</div>
						</div>
						<div class="row mb-5">
							<div class="col-3">전기차 구역</div>
							<div class="col">
								<input type="text" placeholder="가능 대수">
							</div>
							<div class="col">
								<input type="text" placeholder="할인율(%)">
							</div>
						</div>
						<div class="row me-4 mt-4">
							<div class="col"></div>
							<div class="col-10 text-end d-gird">
								<form action="">
									<button type="button" class="btn btn-outline-primary">다음단계</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 우편 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
