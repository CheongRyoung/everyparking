<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 실질적 내용 변경 구역-->
<div class="col mx-3">

	<div class="row backgroundColorwhite adminBorder borderBottom"
		style="height: 75px;">
		<div class="col-6">
			<div class="row mt-2">
				<div class="col">금일 이용 현황</div>
				<div class="col">어제 이용 현황</div>
				<div class="col">누적 이용 현황</div>
			</div>
			<div class="row mt-1" style="font-size: 20px; font-weight: bold;">
				<div class="col">20</div>
				<div class="col">20</div>
				<div class="col">40</div>
			</div>
		</div>
		<div class="col-4"></div>
		<div class="col text-end">
			<div class="row">
				<div class="col mt-4 pe-3 d-grid">
					<form action="">
						<button type="button"
							class="btn btn-light btn-sm adminBorder borderBottom">이용
							내역 조회</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 차트 들어가는 공간-->
	<div
		class="row mt-3 mb-3 backgroundColorwhite adminBorder borderBottom"
		style="height: 400px;">
		<div class="col"></div>
	</div>

	<div class="row ">
		<!--최근 문의 내역-->
		<div class="col me-4 backgroundColorwhite adminBorder borderBottom"
			style="height: 175px;">
			<div class="row">
				<div class="col pt-2">최근 문의 내역</div>
				<div class="col text-end">
					<a href="#"><i class="bi bi-plus-lg fs-2"></i></a>
				</div>
			</div>
			<div class="row mt-1 ms-2 me-1 mb-2 borderBottom">
				<div class="col ">차단기가 안올라가요</div>
				<div class="col text-end">2022-02-24</div>
			</div>
			<div class="row ms-2 me-1 mb-2 borderBottom">
				<div class="col ">쓰레기가 너무 많아요</div>
				<div class="col text-end">2022-02-24</div>

			</div>
			<div class="row ms-2 me-1 mb-2 borderBottom">
				<div class="col ">출차가 늦어질것 같아요</div>
				<div class="col text-end">2022-02-24</div>

			</div>
		</div>

		<!--최근 공지 사항-->
		<div class="col backgroundColorwhite adminBorder borderBottom"
			style="height: 175px;">
			<div class="row">
				<div class="col pt-2">최근 공지 사항</div>
				<div class="col text-end">
					<a href="#"><i class="bi bi-plus-lg fs-2"></i></a>
				</div>
			</div>
			<div class="row mt-1 ms-2 me-1 mb-2 borderBottom">
				<div class="col ">안녕하세요</div>
				<div class="col text-end">2022-02-24</div>
			</div>
			<div class="row ms-2 me-1 mb-2 borderBottom">
				<div class="col ">즐거운 명절</div>
				<div class="col text-end">2022-02-24</div>
			</div>
			<div class="row ms-2 me-1 mb-2 borderBottom">
				<div class="col ">이용하시는데 불편한건...</div>
				<div class="col text-end">2022-02-24</div>
			</div>
		</div>
	</div>

</div>
