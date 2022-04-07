<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col mx-3">
	<!-- 실질적 내용 변경 구역-->
	<div id="modalZone"></div>
	<div class="row mt-3">
	<!-- top title-->
		<div class="col px-0 text-start">
			<h2 style="font-weight: bold;">문의내역 관리</h2>
		</div>
	</div>
	<div class="row">
		<div class="col px-0 text-start" style="margin: 0;">
			<span class="fs-7 fw-light">고객 센터 > 문의 내역</span>
		</div>
	</div>			
	<div class="row mt-4 adminBorder borderBottom"  style="background-color: white; height: 600px; position: relative">
		<!-- 테이블 구역 -->
		<div class="col px-0">
			<table class="table table-bordered text-center mb-0" id="qnaManageTable" >
			</table>
		</div>
		<div id="pagingBlock4" style="display: flex; justify-content: center; position: absolute; bottom: 1%;"></div>				
	</div>
</div>
<script type="text/javascript" src="/js/qnaManage/qnaManagement.js"></script>