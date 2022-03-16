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
	<div class="row mt-3 mb-3 backgroundColorwhite adminBorder borderBottom" style="height: 600px;">
	<div
		class="row mt-3 mb-3 backgroundColorwhite adminBorder borderBottom"
		style="height: 600px; position: relative;">
		<div class="col px-0">
			<table class="table table-bordered text-center mb-0" id="parkingZoneTable">
			</table>
		</div>
		<div id="pagingBlock2" style="display: flex; justify-content: center; position: absolute; bottom: 1%;"></div>
	</div>
</div>

<script type="text/javascript" src="/js/parkingManage/parkingZone.js"></script>