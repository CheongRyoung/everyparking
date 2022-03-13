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
					<h4 style="font-weight: bold;">Stage 1: 주차장에서 이용할 구역을 선택해 주세요</h4>
				</div>
				<div class="row mt-3">
					<div class="col-4 px-0">
						<img class="img-fluid" src="/img/image1.png">
					</div>
					<div class="col ms-1">
						<div class="row mb-5">
							<div class="col-4">
								<input type="checkbox" name="sector1" value="normal"> 일반
								구역
							</div>
							<div class="col">공용주차 공간입니다</div>
						</div>
						<div class="row mb-5">
							<div class="col-4">
								<input type="checkbox" name="sector2" value="woman">
								여성전용 구역
							</div>
							<div class="col">여성을 위한 주차 공간입니다</div>
						</div>
						<div class="row mb-5">
							<div class="col-4">
								<input type="checkbox" name="sector3" value="disabled">
								장애인 구역
							</div>
							<div class="col">장애인을 위한 주차 공간입니다</div>
						</div>
						<div class="row mb-5">
							<div class="col-4">
								<input type="checkbox" name="sector4" value="charge"> 충전
								구역
							</div>
							<div class="col">전기차 충전시설이 구비된 주차 공간입니다</div>
						</div>
						<div class="row me-4 pt-5 mt-5">
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