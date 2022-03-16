<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col mx-3">

	<!--Top title-->
	<div class="row">
		<div class="col px-0 text-start">
			<h1 style="font-weight: bold;">주차장 등록</h1>
		</div>
	</div>

	<!-- 내용 -->
	<div
		class="row mt-4 mb-3 backgroundColorwhite adminBorder borderBottom"
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
							<input type="text" value="주차장 명을 입력해 주세요." style="width: 100%;">
						</div>
					</div>
					<div class="row me-3 mt-3">
						<div class="col-4 mt-1">주차장 위치</div>
						<div class="col">
							<input id="postcodeName" type="text" value="클릭 후 주소를 입력해 주세요." style="width: 100%;" onclick="postcoderun()" readonly>
							<input id="postcodeX"    type="hidden" value="1" name="">
							<input id="postcodeY"    type="hidden" value="1" name="">
						</div>
					</div>

					<div class="row me-3 mt-3">
						<div class="col-4 mt-1">주차장 위치 상세</div>
						<div class="col">
							<input type="text" value="입구 위치 등을 작성해 주세요." style="width: 100%;">
						</div>
					</div>
					<div class="row me-3 mt-3">
						<div class="col-4 mt-1">주차 비용</div>
						<div class="col">
							<input type="text" value="할인율 적용전 시간 당 비용을 입력해주세요."
								style="width: 100%;">
						</div>
					</div>
					<div class="row me-3 mt-3">
						<div class="col-4 mt-1">주차장 설명</div>
						<div class="col">
							<input type="text" value="주차장을 설명해 주세요."
								style="width: 100%; height: 90px;">
						</div>
					</div>
					<div class="row me-3 mt-3">
						<div class="col-4 mt-1">이미지 업로드</div>
						<div class="col">
							<form action="http://localhost/upload.php" method="post"
								enctype="multipart/form-data">
								<input type="file" name="profile" style="width: 100%;">

							</form>
						</div>
					</div>

					<div class="row pt-5 me-5 mt-3">
						<div class="col"></div>
						<div class="col-5 text-end d-gird">
							<form action="">
								<button type="button" class="btn btn-outline-primary">등록완료</button>
							</form>
						</div>
					</div>

				</div>
			</div>


		</div>
	</div>



</div>


