<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 지도가 나오는 배경 -->
<div class="kakaoMap"  id="mainMap" style="width:100%; height:92vh; position: absolute; left: 0; z-index: 1;">
    <div class="row my-3 mx-1">
        <div class="col input-group btn-group dropstart" >
            <button style="z-index: 2; background-color:#3E4AB8;" class="input-group-text" id="basic-addon2" onclick="panTo();">
                <i class="bi bi-search text-white"></i>
            </button>
            <input style="border: 0px; z-index: 2; background-color: white;" name="postcodeName" id="postcodeName" type="text" class="form-control" placeholder="지역명, 위치를 검색하세요" onclick="DaumPostcode(event)" readonly>
            </div>
        <div class="col-2 ps-1 d-flex flex-row-reverse" style="z-index:2;">
            <button type="button" style="width:2.5rem; height:2.5rem; border:0px; border-radius: 0.2rem; background-color:#3E4AB8;" onclick="listOpen();"><i class="bi bi-list-check" style="color:white;"></i></button>
        </div>
    </div>
</div>
<c:choose>
	<c:when test="${data.postcodeX eq '' || data.postcodeY eq '' }">
		<input type="hidden" id="postcodeX" value="127.03007039430118">
		<input type="hidden" id="postcodeY" value="37.49966168796031">
	</c:when>
	<c:otherwise>
		<input type="hidden" id="postcodeX" value=${data.postcodeX }>
		<input type="hidden" id="postcodeY" value=${data.postcodeY }>
	</c:otherwise>
</c:choose>
<!-- 왼쪽 정보 팝업창 -->
<div class="info">
    <div class="container-fluid">
        <header>
            <div class="row headerBox py-2 px-0">
                <div class="col-1 px-0 pt-1" onclick="infoClose();"><i class="bi bi-arrow-left fs-5"></i></div>
                <div class="col px-0">
                    <h5 class="title">예약 상세</h5>
                </div>
                <div class="col-1 px-0"></div>
            </div>
        </header>
        <main>
            <!-- 수정 해야되는 부분-->
            <div class="row topBox" style="margin-top: auto;">
                <div class="col">
                    <div class="row mt-4">
                        <div class="col"><span class="mainContentTitle" id="parkName"></span></div>
                    </div>
                    <div class="row mb-3">
                        <div class="col"><span class="mainContentSubNg">총 공간 : <span id="totalSectionCount"></span> 면 </span></div>
                    </div>
                    <div class="row" >
                        <div class="col px-0">
                            <img class="mainContentImg img-fluid" id="image">
                        </div>
                    </div>
                    <div class="wraper" style="margin-top: 1.2rem;">
                        <div class="row">
                            <div class="col">
                                <i class="bi bi-geo-alt" style="color:#3E4AB8;"></i> <span class="cardTitleNg" id="parkingAdd"> </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <i class="bi bi-telephone" style="color:#3E4AB8;"></i> <span class="cardTitleNg" id="phone"> </span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <i class="bi bi-watch" style="color:#3E4AB8;"></i> <span class="cardTitleNg" id="openTime"></span> ~ <span class="cardTitleNg" id="endTime"></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <i class="bi bi-star" style="color:#3E4AB8;"></i> <span class="cardTitleNg" id="averageReview" style="color:#3E4AB8; font-size:1.1rem;"></span><span class="cardTitleNg"> / 5.0점</span>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-2" style="margin-top: 1.5rem; border-top: 0.5rem solid #EEEEEE;">
                        <div class="col-5 areaList align-self-center"><span class="mainContentSubTitle">시간  요금</span></div>
                        <div class="col areaList align-self-center">
                            <div class="row">
                                <div class="col-7 discountTitleNg">
                                    <span class="grayFontJm">1시간당</span>
                                </div>
                                <div class="col">
                                    <span class="grayFontJm" id="parkPrice"></span><span class="grayFontJm"> 원</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 1.2rem;">
                        <div class="col-5"><span class="mainContentSubTitle">할 인 율</span></div>
                        <div class="col align-self-center" id="section">
                            <!-- 구역 할인률 노출 -->
                        </div>
                    </div>
                    <div class="row mt-5 py-2 px-0">
                    	<div class="col-1"></div>
                        <div class="col px-0 d-grid">
                            <button class="btn title m-0 p-0" onclick="pickerOpen()" style="background-color:#3E4AB8; border-radius:0.5rem; color:white; height:2.5rem;">예약 일시 선택</button>
                        </div>
                        <div class="col-1"></div>
                    </div>
	                <form id="formData" name="formData" method="post">
	                <div class="row d-none mt-3 py-2 px-0" style="border-bottom: #EEEEEE solid 0.5rem;">
	                    <div class="col d-grid">
	                        <input type="hidden" name="daterange" class="datepicker" style="font-size: 16px; color: #A6A6A6; height: 2.2rem;" readonly>
                            <div class="row">
                                <div class="col">
                                    <span class="mainContentSubTitle">시작시간</span>
                                </div>
                                <div class="col text-end">
                                    <div id="startDateResult" class="grayFontJm" style="padding-right:0.7rem;">시간을 선택해주세요</div>
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col">
                                    <span class="mainContentSubTitle">종료시간</span>
                                </div>
                                <div class="col text-end">
                                    <div id="endDateResult" class="grayFontJm" style="padding-right:0.7rem;">시간을 선택해주세요</div>
                                </div>
                            </div>
                        </div>
	                </div>
	                </form>
	                <form id="insertData" name="insertData" method="post">
	                	<div id="remainCount"></div>
					</form>	
                    <!-- 리뷰 작성-->
                    <div class="row mt-5 mb-4 mx-0" style="border-bottom: 0.2rem solid #3E4AB8; height: 3rem;">
                        <div class="col align-self-center">
                            <span class="mainContentSubSubNg">리뷰 </span><span class="mainContentSubSubNg" id="reviewCount" style="color:#3E4AB8; font-size:1.2rem; font-weight:bold"></span><span class="mainContentSubSubNg">건</span>
                        </div>
                    </div>
					<!-- 리뷰 데이터 노출 -->
					<div id="review"></div>
                </div>
            </div>
        </main>
    </div>
</div>
<!-- 오른쪽 리스트 팝업창  -->
<div class="list" id="list">
	<div class="container-fluid" style="background-image: url('/img/mainBackground.png');">
	    <header>
	        <div class="row headerBox py-2 px-0">
	            <div class="col-1" onclick="listClose();" style="padding-top:0.7rem;"><i class="bi bi-arrow-right fs-5"></i></div>
	            <div class="col px-0">
	                <h5 class="title">주차장 목록</h5>
	            </div>
	            <div class="col-1 px-0"></div>
	        </div>
	    </header>
	    <main>
	        <div class="row pt-2 mb-3">
	            <div class="col listCountBox">
	                <i class="bi bi-layers"></i>총<span class="listCountNum" id="totalParkingCount" style="color:#3E4AB8;"></span>건
	            </div>
	        </div>
	        <div id="listBox">
	        </div>
	    </main>
	</div>
</div>
<div class="customDatePicker" id="customDatePicker" style="cursor: pointer;">
    <div class="container-fluid" style="padding-bottom: 5rem;">
        <header>
            <div class="row headerBox py-2 px-0">
                <div class="col-1" style="padding-top:0.7rem;" onclick="pickerClose();"><i class="bi bi-x-lg"></i></div>
                <div class="col px-0">
                    <h5 class="title">예약 시간 선택</h5>
                </div>
                <div class="col-1 px-0"></div>
            </div>
        </header>
        <main>
            <div class="row pt-3 mb-3 topBox">
                <div class="col customDateBox p-0">
                    <div style="text-align: center; margin: 2rem;">
                        <span>입차 시간</span>
                        <span id="drawStartDateCus">2022-05-25</span>
                        <span id="drawStartHoursCus">15시</span>
                    </div>
                    <div class="scrollx-container">
                        <div id="startDate" class="xinner">
                        </div>
                    </div>
                    <div class="scrolly-container" style="overflow-y: hidden;">
                        <div class="yinner">
                            <div class="customHour start"></div>
                            <div class="customHour start">00시</div>
                            <div class="customHour start">01시</div>
                            <div class="customHour start">02시</div>
                            <div class="customHour start">03시</div>
                            <div class="customHour start">04시</div>
                            <div class="customHour start">05시</div>
                            <div class="customHour start">06시</div>
                            <div class="customHour start">07시</div>
                            <div class="customHour start">08시</div>
                            <div class="customHour start">09시</div>
                            <div class="customHour start">10시</div>
                            <div class="customHour start">11시</div>
                            <div class="customHour start">12시</div>
                            <div class="customHour start">13시</div>
                            <div class="customHour start">14시</div>
                            <div class="customHour start">15시</div>
                            <div class="customHour start">16시</div>
                            <div class="customHour start">17시</div>
                            <div class="customHour start">18시</div>
                            <div class="customHour start">19시</div>
                            <div class="customHour start">20시</div>
                            <div class="customHour start">21시</div>
                            <div class="customHour start">22시</div>
                            <div class="customHour start">23시</div>
                            <div class="customHour start"></div>
                        </div>
                        <div style="opacity: 0.2; width: 100%; position: absolute; top: 50%; height: 50%; background-color: #2c0eee; transform: translateY(-50%)"></div>
                    </div>

                    <div style="text-align: center; margin: 2rem;">
                        <span>출차 시간</span>
                        <span id="drawEndDateCus">2022-05-25</span>
                        <span id="drawEndHoursCus">15시</span>
                    </div>
                    <div id="endTimeBoxX" class="scrollx-container">
                        <div id="endDate" class="xinner">
                        </div>
                    </div>
                    <div id="endTimeBoxY" class="scrolly-container" style="overflow-y: hidden;">
                        <div id="endHours"class="yinner">
                            <div class="customHour end"></div>
                            <div class="customHour end">00시</div>
                            <div class="customHour end">01시</div>
                            <div class="customHour end">02시</div>
                            <div class="customHour end">03시</div>
                            <div class="customHour end">04시</div>
                            <div class="customHour end">05시</div>
                            <div class="customHour end">06시</div>
                            <div class="customHour end">07시</div>
                            <div class="customHour end">08시</div>
                            <div class="customHour end">09시</div>
                            <div class="customHour end">10시</div>
                            <div class="customHour end">11시</div>
                            <div class="customHour end">12시</div>
                            <div class="customHour end">13시</div>
                            <div class="customHour end">14시</div>
                            <div class="customHour end">15시</div>
                            <div class="customHour end">16시</div>
                            <div class="customHour end">17시</div>
                            <div class="customHour end">18시</div>
                            <div class="customHour end">19시</div>
                            <div class="customHour end">20시</div>
                            <div class="customHour end">21시</div>
                            <div class="customHour end">22시</div>
                            <div class="customHour end">23시</div>
                            <div class="customHour end"></div>
                        </div>
                        <div style="opacity: 0.2; width: 100%; position: absolute; top: 50%; height: 50%; background-color: #2c0eee; transform: translateY(-50%)"></div>
                    </div>
                    <div style="text-align: center; margin: 2rem;">
                        <span>총 예약 시간</span>
                        <span id="resultHours">총 예약 시간</span>
                    </div>
                    <div class="row py-2 px-0">
                    	<div class="col-1"></div>
                        <div class="col px-0 d-grid">
                            <button class="btn title m-0 p-0" id="selectTime" style="background-color:#3E4AB8; color:white; border-radius:0.5rem; color:white; height:2.5rem;">시간 선택 완료</button>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script type="text/javascript" src="/js/main/map.js"></script>
<script type="text/javascript" src="/js/main/customDatePicker.js"></script>