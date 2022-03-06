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
					<img class="img-fluid" src="../img/image1.png">
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
							<input id="postcodeX" type="hidden" value="1" name="">
							<input id="postcodeY" type="hidden" value="1" name="">
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb99d8cd30c99f04d4597f0c98a11482&libraries=services"></script>
<script>
var addr = ''; // 주소 변수
function postcoderun() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var extraRoadAddr = ''; // 참고 항목 변수
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            
			 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			     addr = data.roadAddress;
			 } else { // 사용자가 지번 주소를 선택했을 경우(J)
			     addr = data.jibunAddress;
			 }

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcodeName').value = addr;
          //주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(addr, function(result, status) {
            	console.log(result);
                // 정상적으로 검색이 완료됐으면 
                 if (status === kakao.maps.services.Status.OK) {

                    document.getElementById('postcodeX').value = result[0].x;
                    document.getElementById('postcodeY').value = result[0].y;
            		
                } 
            }); 
            
        }
    }).open();
} 
</script>
<script>
  
</script>