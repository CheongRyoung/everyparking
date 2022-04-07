<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	<div class="col mx-3">
		<form action="/parkingManage/insertParkingInfo" onsubmit="return checkForm()" name="parkingRegiForm" enctype="multipart/form-data" method="post" id="parkingInfoDetailForm">
			<!-- 실질적 내용 변경 구역-->
			<div class="row mt-3">
				<!-- top title-->
				<div class="col px-0 text-start">
					<h2 style="font-weight: bold;">주차장 등록</h2>
				</div>
			</div>
			<div class="row">
		        <div class="col px-0 text-start" style="margin: 0;">
				    <span class="fs-7 fw-light">주차장 관리 > 주차장 홈</span>
				</div>
		    </div>			
			<div class="row mt-4 backgroundColorwhite tab-content selected">
				<!-- 테이블 구역 -->
				<div class="col mb-5">
					<div class="row mt-5">
						<div class="col">
							<img class="img-fluid shadow-sm" style="width: 90%; height: 100%;" src="/img/image1.png">
						</div>
						<div class="col px-0">
							<div class="row">
								<div class="col">
									<span class="fs-7 fw-bold text-black-50">STEP 01</span>
								</div>
							</div>
							<h4>주차장에서 이용할 구역을 선택해 주세요</h4>
								<div class="row mt-4 me-3 border border-2 rounded bg-light bg-gradient">
									<div class="col ms-3">
										<c:forEach items="${ryList}" var="ry">
										<div class="row mb-5 mt-5">
											<div class="col-4">
												<input type="checkbox" name="SEC_TYPE" value=${ry.SUB_CODE }> 
												<span class="fw-bold ps-1">${ry.SUB_NAME } 구역</span>						
											</div>
											<div class="col-2 pe-0">
												<span class="text-black-50">|</span>												
											</div>
											<div class="col ps-0">
					                        	<span class="text-black-50">공용주차 공간입니다</span>											
											</div>
										</div>
										</c:forEach>
									</div>
								</div>	
								<div class="row me-3 mt-4 mt-2">
									<div class="col text-end d-gird px-0">
										<button type="button" class="btn btn-light border border-2 rounded" onclick="parkingRevise.nextStep()">다음단계</button>
									</div> 
								</div>						
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-4 backgroundColorwhite tab-content">
				<!-- 테이블 구역 -->
				<div class="col mb-5">
					<div class="row mt-5">
						<div class="col">
							<img class="img-fluid shadow-sm" style="width: 90%; height: 100%;" src="/img/image1.png">
						</div>
						<div class="col px-0">
							<div class="row">
								<div class="col">
									<span class="fs-7 fw-bold text-black-50">STEP 02</span>
								</div>
							</div>
							<h4>선택한 구역의 주차 가능 대수와 구역별 할인률을 입력해주세요.</h4>
								<div  class="row mt-4 me-3 border border-2 rounded bg-light bg-gradient">
									<div class="col ms-3">
										<div class="row mt-3 mb-5">
											<div class="col-3">
					                        	<span class="text-black-50">구분</span>
											</div>
											<div class="col">
					                        	<span class="text-black-50">주차 가능 대수 입력</span>
											</div>
											<div class="col">
					                        	<span class="text-black-50">할인율</span>
											</div>
										</div>
										<c:forEach items="${ryList}" var="ry">
										<div class="row mb-5" id="SEC_TYPE_${ry.SUB_CODE }">
											<div class="col-3">
												<span class="fw-bold ps-1">${ry.SUB_NAME } 구역</span>
											</div>
											<div class="col">
												<input type="text" class="border border-2 rounded" name="SEC_COUNT" placeholder="가능 대수" onkeypress="onlyNum();"  style=" width: 100% ">
											</div>
											<div class="col">
												<input type="text" class="border border-2 rounded" name="SEC_DIS" placeholder="할인율(%)" onkeypress="onlyNum();"  style=" width: 100% ">
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
								<div class="row me-3 mt-4 mt-2">
								<div class="col text-start d-gird px-0">
									<button type="button" class="btn btn-light border border-2 rounded" onclick="parkingRevise.prevStep()">이전단계</button>
								</div>
								<div class="col text-end d-gird px-0">
									<button type="button" class="btn btn-light border border-2 rounded" onclick="parkingRevise.nextStep2()">다음단계</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 내용 -->
			<div class="row mt-4 backgroundColorwhite tab-content">
				<div class="col mb-5">
					<div class="row mt-5">
						<div class="col">
							<!-- 이미지 미리보기로 변경 -->
							<img id="thumbNail" class="img-fluid" src="/img/image1.png" style="width: 90%; height: 100%;">                   
						</div>
						<div class="col px-0">
							<div class="row">
								<div class="col">
									<span class="fs-7 fw-bold text-black-50">STEP 03</span>
								</div>
							</div>
							<h4>주차장 정보를 입력해 주세요.</h4>
							<div  class="row mt-4 me-3 border border-2 rounded-3 bg-light bg-gradient">
								<div class="col ms-3">
									<div class="row me-3 mt-4">
										<div class="col-4 d-flex justify-content-between">
				                        	<span class="fw-bold ps-1">주차장명</span>
				                        	<span class="text-black-50">|</span>
										</div>
										<div class="col">
											<input class="border border-2 rounded" type="text" placeholder="주차장 명을 입력해 주세요." name="PARK_NAME" style="width: 100%;">
										</div>
									</div>
									<div class="row me-3 mt-3">
										<div class="col-4 d-flex justify-content-between">
				                        	<span class="fw-bold ps-1">주차장 위치</span>
				                        	<span class="text-black-50">|</span>
										</div>
										<div class="col">
											<input id="postcodeName" class="border border-2 rounded" type="text" placeholder="클릭 후 주소를 입력해 주세요." name="PARK_ADDR1" style="width: 100%;" onclick="postcoderun()" readonly>
											<input id="postcodeX"    type="hidden" name="PARK_ADDR_X">
											<input id="postcodeY"    type="hidden" name="PARK_ADDR_Y">
										</div>
									</div>
			
									<div class="row me-3 mt-3">
										<div class="col-4 d-flex justify-content-between">
				                        	<span class="fw-bold ps-1">주차장 위치 상세</span>
				                        	<span class="text-black-50">|</span>
										</div>
										<div class="col">
											<input type="text" class="border border-2 rounded" placeholder="입구 위치 등을 작성해 주세요." style="width: 100%;" name="PARK_ADDR2">
										</div>
									</div>
									<div class="row me-3 mt-3">
										<div class="col-4 d-flex justify-content-between">
				                        	<span class="fw-bold ps-1">주차 비용</span>
				                        	<span class="text-black-50">|</span>
										</div>
										<div class="col">
											<input type="text" class="onlyNum border border-2 rounded" name="PARK_PRICE" placeholder="할인율 적용전 시간 당 비용을 입력해주세요." onkeypress="onlyNum();" style="width: 100%;">
										</div>
									</div>
									<div class="row me-3 mt-3">
										<div class="col-4 d-flex justify-content-between">
				                        	<span class="fw-bold ps-1">전화 번호</span>
				                        	<span class="text-black-50">|</span>
										</div>
										<div class="col">
											<input type="text" class="border border-2 rounded" name="PARK_CALL_NUM" placeholder="주차장 전화번호를 입력해주세요." style="width: 100%;">
										</div>
									</div>	
									<div class="row me-3 mt-3">
										<div class="col-4 d-flex justify-content-between">
				                        	<span class="fw-bold ps-1">주차장 설명</span>
				                        	<span class="text-black-50">|</span>
										</div>
										<div class="col">
											<textarea rows="3" class="border border-2 rounded" cols="45" placeholder="주차장을 설명해 주세요." name="PARK_CONT" style="width:100%;"></textarea>
										</div>
									</div>
									<div class="row me-3 mt-3">
										<div class="col-4 d-flex justify-content-between">
				                        	<span class="fw-bold ps-1">문의 시간</span>
				                        	<span class="text-black-50">|</span>
										</div>
										<div class="col pe-0">
											<span class="text-black-50">OPEN :</span> 
											<input class="inputTime border border-2 rounded" type="time" name="PARK_OPEN">
										</div>					
										<div class="col pe-0">
											<span class="text-black-50">CLOSE :</span>
											<input class="inputTime border border-2 rounded" type="time" name="PARK_CLOSE">
										</div>						
									</div>
									<div class="row me-3 mt-3 mb-4">
										<div class="col-4 d-flex justify-content-between">
				                        	<span class="fw-bold ps-1">이미지 업로드</span>
				                        	<span class="text-black-50">|</span>
										</div>
										<div class="col">
											<input id="inputThumbnail" type="file" name="profile" style="width: 100%;">
										</div>
									</div>
								</div>
							</div>								
							<div class="row me-4 mt-4">
							<div class="col text-start d-gird px-0">
									<button type="button" class="btn btn-light border border-2 rounded" onclick="parkingRevise.prevStep()">이전단계</button>
								</div>
								<div class="col text-end d-gird px-0">
									<button type="submit" class="btn btn-light border border-2 rounded">등록 완료</button>
								</div>
							</div>
					</div>
				</div>
			</div>
			</div>
			</form>
		</div>
<script type="text/javascript" src="/js/parkingManage/parkingRegister.js"></script>
