<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div class="col mx-3">
		<form action="/parkingManage/updateParkingInfo" enctype="multipart/form-data" method="post" id="parkingInfoDetailForm" onsubmit="return parkingRevise.validForm()">
			<input type="hidden" name="PARK_SEQ">
			<!-- 실질적 내용 변경 구역-->
			<div class="row">
				<!-- top title-->
				<div class="col text-start px-0">
					<h1 style="font-weight: bold;">주차장 수정</h1>
				</div>
			</div>
			<div class="row mt-4 backgroundColorwhite adminBorder borderBottom tab-content active" style="height: 600px;">
				<!-- 테이블 구역 -->
				<div class="col">
					<div class="row mb-3">
						<div class="col ms-5 mt-5 mb-4">
							<h4 style="font-weight: bold;">Stage 1: 주차장에서 이용할 구역을 선택해 주세요</h4>
						</div>
						<div class="row mt-3">
							<div class="col-4 px-0">
								<img class="img-fluid" src="/img/image1.png">
							</div>
							<div class="col ms-1">
								<div class="row mb-5">
									<div class="col-4">
										<input type="checkbox" name="SEC_TYPE" value="SC01"> 일반 구역
									</div>
									<div class="col">공용주차 공간입니다</div>
								</div>
								<div class="row mb-5">
									<div class="col-4">
										<input type="checkbox" name="SEC_TYPE" value="SC02">
										여성전용 구역
									</div>
									<div class="col">여성을 위한 주차 공간입니다</div>
								</div>
								<div class="row mb-5">
									<div class="col-4">
										<input type="checkbox" name="SEC_TYPE" value="SC03">
										장애인 구역
									</div>
									<div class="col">장애인을 위한 주차 공간입니다</div>
								</div>
								<div class="row mb-5">
									<div class="col-4">
										<input type="checkbox" name="SEC_TYPE" value="SC04"> 충전
										구역
									</div>
									<div class="col">전기차 충전시설이 구비된 주차 공간입니다</div>
								</div>
							</div>
						</div>
						<div class="row me-4 pt-5 mt-5">
							<div class="col-10 text-end d-gird">
								<button type="button" class="btn btn-outline-primary" onclick="parkingRevise.nextStep()">다음단계</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-4 backgroundColorwhite adminBorder borderBottom tab-content"
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
								<div class="row mb-5" id="SEC_TYPE_SC01">
									<div class="col-3">일반 구역</div>
									<div class="col">
										<input type="text" name="SEC_COUNT" placeholder="가능 대수">
									</div>
									<div class="col">
										<input type="text" name="SEC_DIS" placeholder="할인율(%)">
									</div>
								</div>
								<div class="row mb-5" id="SEC_TYPE_SC02">
									<div class="col-3">여성 전용</div>
									<div class="col">
										<input type="text" name="SEC_COUNT" placeholder="가능 대수">
									</div>
									<div class="col">
										<input type="text" name="SEC_DIS" placeholder="할인율(%)">
									</div>
								</div>
								<div class="row mb-5" id="SEC_TYPE_SC03">
									<div class="col-3">장애인 구역</div>
									<div class="col">
										<input type="text" name="SEC_COUNT" placeholder="가능 대수">
									</div>
									<div class="col">
										<input type="text" name="SEC_DIS" placeholder="할인율(%)">
									</div>
								</div>
								<div class="row mb-5" id="SEC_TYPE_SC04">
									<div class="col-3">전기차 구역</div>
									<div class="col">
										<input type="text" name="SEC_COUNT" placeholder="가능 대수">
									</div>
									<div class="col">
										<input type="text" name="SEC_DIS" placeholder="할인율(%)">
									</div>
								</div>
							</div>
						</div>
						<div class="row me-4 mt-4">
							<div class="col-5 text-start d-gird">
								<button type="button" class="btn btn-outline-primary" onclick="parkingRevise.prevStep()">이전단계</button>
							</div>
							<div class="col-5 text-end d-gird">
								<button type="button" class="btn btn-outline-primary" onclick="parkingRevise.nextStep()">다음단계</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 내용 -->
			<div class="row mt-4 mb-3 backgroundColorwhite adminBorder borderBottom tab-content"
			 style="height: 600px;">
			<div class="col">

				<div class="row">
					<div class="col ms-5 mt-5 mb-4">
						<h4 style="font-weight: bold;">Stage 3: 주차장 정보를 입력해 주세요.</h4>
					</div>
				</div>

				<div class="row mt-3">
					<div class="col-4 px-0">
						<img class="img-fluid" src="/img/image1.png">
					</div>

					<div class="col ms-1">
						<div class="row me-3">
							<div class="col-4 mt-1">주차장명</div>
							<div class="col">
								<input type="text" value="주차장 명을 입력해 주세요." name="PARK_NAME" style="width: 100%;">
							</div>
						</div>
						<div class="row me-3 mt-3">
							<div class="col-4 mt-1">주차장 위치</div>
							<div class="col">
								<input id="postcodeName" type="text" value="클릭 후 주소를 입력해 주세요." name="PARK_ADDR" style="width: 100%;" onclick="postcoderun()" readonly>
								<input id="postcodeX"    type="hidden" name="PARK_ADDR_X">
								<input id="postcodeY"    type="hidden" name="PARK_ADDR_Y">
							</div>
						</div>

						<div class="row me-3 mt-3">
							<div class="col-4 mt-1">주차장 위치 상세</div>
							<div class="col">
								<input type="text" placeholder="입구 위치 등을 작성해 주세요." style="width: 100%;" name="PARK_ADDR">
							</div>
						</div>
						<div class="row me-3 mt-3">
							<div class="col-4 mt-1">주차 비용</div>
							<div class="col">
								<input type="text" name="PARK_PRICE" placeholder="할인율 적용전 시간 당 비용을 입력해주세요."
									   style="width: 100%;">
							</div>
						</div>
						<div class="row me-3 mt-3">
							<div class="col-4 mt-1">주차장 설명</div>
							<div class="col">
								<input type="text" name="PARK_CONT" placeholder="주차장을 설명해 주세요."
									   style="width: 100%; height: 90px;">
							</div>
						</div>
						<div class="row me-3 mt-3">
							<div class="col-4 mt-1">이미지 업로드</div>
							<div class="col">
								<input type="file" name="profile" style="width: 100%;">
							</div>
						</div>
					</div>
				</div>
				<div class="row me-4 mt-4">
					<div class="col-5 text-start d-gird">
						<button type="button" class="btn btn-outline-primary" onclick="parkingRevise.prevStep()">이전단계</button>
					</div>
					<div class="col-5 text-end d-gird">
						<button type="submit" class="btn btn-outline-primary">수정 완료</button>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>

<script type="text/javascript" src="/js/parkingManage/parkingRevise.js"></script>
<script>
	parkingRevise.init(${PARK_SEQ});
</script>