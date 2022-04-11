/** main map 관련 스크립트 **/
window.addEventListener('DOMContentLoaded', e => {
	parkSeq = document.getElementById("parkSeq");
	reservationDate = document.querySelector('.datepicker');
	selectTimeDatepicker = document.querySelector("#selectTime");
	selectTimeDatepicker.addEventListener('click', beforeReservation);
})
const mainMap = document.getElementById("mainMap");
const mainMapX = document.getElementById("postcodeX");
const mainMapY = document.getElementById("postcodeY");
var parkSeq;
var reservationDate;
var selectTimeDatepicker;
var insertData = document.getElementById("insertData");
var parkPrice = document.getElementById("parkPrice");
var finalPrice = "";
var averageData = 0;

if(mainMap){
	var valueX = parseFloat(mainMapX.value);
	var valueY = parseFloat(mainMapY.value);
	var showFstX = "";
	var showSecX = "";
	var showFstY = "";
	var showSecY = "";
}

// info - 주차장 정보 넣을 element 생성
var parkNameBox = document.getElementById("parkName");
var totalSectionCountBox = document.getElementById("totalSectionCount");
var parkingAddBox = document.getElementById("parkingAdd");
var phoneBox = document.getElementById("phone");
var openTimeBox = document.getElementById("openTime");
var endTimeBox = document.getElementById("endTime");
var parkPriceBox = document.getElementById("parkPrice");
var reviewCountBox = document.getElementById("reviewCount");
var section = document.getElementById("section");
var review = document.getElementById("review");
var listBox = document.getElementById("listBox");
var imageBox = document.getElementById("image");
var averageReviewBox = document.getElementById("averageReview");

var remainCountBox = document.getElementById("remainCount");


// list - 정보 넣을 element 생성
var totalParkingCountBox = document.getElementById("totalParkingCount");

var map;


//지도 생성
if(mainMap) {

    var mapContainer = document.getElementById('mainMap'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.49966168796031, 127.03007039430118), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    
    // 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
   kakao.maps.event.addListener(map, 'tilesloaded', function() {
	   
	   var bounds = map.getBounds();
	   
	   // 지도의 남서쪽 좌표 가져오기
	   var swLatLng = bounds.getSouthWest(); 
	    
	   // 지도의 북동쪽 좌표 가져오기
	   var neLatLng = bounds.getNorthEast(); 
	   
	   
	   var result = new Map();
	   
	   result = {'x1' : swLatLng.La, 'y1' : swLatLng.Ma, 'x2' : neLatLng.La, 'y2' : neLatLng.Ma};
	   markerLoad(result);
      
      })
      
   };

var carparkPositions = [];
var parkingNumList = [];
var carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다


// 불러오는 타일에 마커 찍어주기
function markerLoad(result) {
   var params = "";
   if(result == null) {
      params = {}
   } else {
      params = result
   }

   ajaxCall("/main/selectParkingInfoList", params, function(data) {
	   
      carparkPositions = [];
      parkingNumList = [];
      carparkMarkers = [];

      for (var i = 0; i < data.list.length; i++) {
         // 예시좌표 서버에서 이쪽으로 좌표값 받아와야함
         carparkPositions[i] = new kakao.maps.LatLng(data.list[i].PARK_ADDR_Y, data.list[i].PARK_ADDR_X);

         // 이쪽에는 주차장 넘버 받아와야함
         parkingNumList[i] = data.list[i].PARK_SEQ;

         if (i == data.list.length - 1) {
            createCarparkMarkers();  // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다
            setCarparkMarkers(map);
         }
      }
   
      
      totalParkingCountBox.innerText = data.totalCnt;
      
      // list for문 수행할 곳
      listBox.innerHTML = "";
      for(listBoxData of data.list){
    	  var totalParkingCount = 0;
    	  var sectionNameList = "";
    	  var womanSection = "";
    	  var disableSection = "";
    	  var electroSection = "";
    	  for(var i = 0; i < (listBoxData.sectionList).length; i++){
    		  totalParkingCount += listBoxData.sectionList[i].SEC_COUNT;
    		  sectionNameList += " " + listBoxData.sectionList[i].SUB_NAME;
    		  if(listBoxData.sectionList[i].SUB_CODE == "RY01"){
    			  continue;
    		  }else if(listBoxData.sectionList[i].SUB_CODE == "RY02"){
    			  disableSection = listBoxData.sectionList[i].SEC_COUNT;
    		  }else if(listBoxData.sectionList[i].SUB_CODE == "RY03"){
    			  womanSection = listBoxData.sectionList[i].SEC_COUNT;
    		  }else if(listBoxData.sectionList[i].SUB_CODE == "RY04"){
    			  electroSection = listBoxData.sectionList[i].SEC_COUNT;
    			  
    		  }
    	  }
    	  var modalHtml = ``;
    	  modalHtml +=` <div class="row parkingImageBox">`;
    	  modalHtml +=`     <div class="col pb-2" onclick="showRese(${listBoxData.PARK_SEQ})" style="cursor: pointer;">`;
		  modalHtml +=`         <div class="row mb-3">`;
		  modalHtml +=`             <div class="col p-0">`;
		  modalHtml +=`                 <img class="imageInfoBox img-fluid" src="/uploadImage/${listBoxData.FILE_URL}${listBoxData.FILE_CONV_NAME}">`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row mb-2">`;
	      modalHtml +=`             <div class="col parkingSpotName">`;
	      modalHtml +=`             	<span>${listBoxData.PARK_NAME}</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row mb-4">`;
	      modalHtml +=`             <div class="col parkingSpotInfo">`;
	      modalHtml +=`                	<span>총 공간 : </span><span>${totalParkingCount}</span><span>면 | 주차면 : </span><span>${sectionNameList}</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row parkingSpotExRowBox">`;
	      modalHtml +=`             <div class="col-4">`;
	      modalHtml +=`                 <i class="bi bi-geo-alt" style="color:#3E4AB8;"></i><span class="parkingSpotIconEx">위치</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`             <div class="col parkingSpotEx">`;
	      modalHtml +=`					<span style="width:10rem; overflow:hidden; text-overflow:ellipsis; display:block; white-space: nowrap; float: right;">${listBoxData.PARK_ADDR1}</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row parkingSpotExRowBox">`;
	      modalHtml +=`             <div class="col-4">`;
	      modalHtml +=`                 <i class="bi bi-credit-card" style="color:#3E4AB8;"></i><span class="parkingSpotIconEx">주차요금</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`             <div class="col parkingSpotEx">`;
	      modalHtml +=`                 <span>1시간 </span><span>${listBoxData.PARK_PRICE}</span><span>원</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row parkingSpotExRowBox">`;
	      modalHtml +=`             <div class="col-4">`;
	      modalHtml +=`                 <i class="bi bi-stopwatch" style="color:#3E4AB8;"></i><span class="parkingSpotIconEx">문의시간</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`             <div class="col parkingSpotEx">`;
	      modalHtml +=`                 <span>${listBoxData.PARK_OPEN}</span> ~ <span>${listBoxData.PARK_CLOSE}</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`     </div>`;
	      modalHtml +=` </div>`;
	      $("#listBox").append(modalHtml);
	      modalHtml = ``;
	      
      }

   })
   
};


	// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
    function createMarkerImage(src, size, options) {
        var markerImage = new kakao.maps.MarkerImage(src, size, options);
        return markerImage;
    }

    // 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
    function createMarker(position, image, num) {

        var marker = new kakao.maps.Marker({
            position: position
            
        });
        marker.value=num;
        

        //마커 클릭 이벤트 등록
        kakao.maps.event.addListener(marker, 'click', function() {
        	
        	
            // 추후 ajax통신문을 작성하고 마지막에 스타일 변화를 주어야함
            // marker.value가 주차장 넘버를 가지고 있으니 이걸로 서버 컨트롤 들어가야함
            // marker.value가 주차장 번호 = params에 넣어서 ajaxCall을 이용하여 보내줘야함
            parkSeq = marker.value;
            
            showRese(parkSeq);
            
                	
    });
        
        
        return marker;
    }
    
    // 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
    function createCarparkMarkers() {
        for (var i = 0; i < carparkPositions.length; i++) {

            var imageSize = new kakao.maps.Size(),
                imageOptions = {
                    spriteOrigin: new kakao.maps.Point(10, 72),
                    spriteSize: new kakao.maps.Size(50, 50)
                };

            // 마커이미지와 마커를 생성합니다
            var markerImage = createMarkerImage("../img/ping.png", imageSize, imageOptions),
                marker = createMarker(carparkPositions[i], markerImage, parkingNumList[i]);

            // 생성된 마커를 주차장 마커 배열에 추가합니다
            carparkMarkers.push(marker);
        }
    }

    // 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
    function setCarparkMarkers(map) {
        for (var i = 0; i < carparkMarkers.length; i++) {
            carparkMarkers[i].setMap(map);
        }
    }


function panTo() {
    valueX = parseFloat(mainMapX.value);
    valueY = parseFloat(mainMapY.value);
    // 이동할 위도 경도 위치를 생성합니다
    var moveLatLon = new kakao.maps.LatLng(valueY, valueX);

    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);
}

if(valueX > -1) {
    panTo();
}



function showRese(PARK_SEQ){
	// params를 날릴때 ajaxCall에서 정한 방식인 Map형식을 지켜줘야함
    ajaxCall("/main/selectOneParkingInfo", {'PARK_SEQ' : PARK_SEQ}, function(data){
    	parkingData = data;
    })
    
    infoHandle.style.left='0%';

    
    parkNameBox.innerText = parkingData.data.parkingInfo.PARK_NAME;
    parkingAddBox.innerText = parkingData.data.parkingInfo.PARK_ADDR1;
    phoneBox.innerText = parkingData.data.parkingInfo.PARK_CALL_NUM;
    openTimeBox.innerText = parkingData.data.parkingInfo.PARK_OPEN;
    endTimeBox.innerText = parkingData.data.parkingInfo.PARK_CLOSE;
    parkPriceBox.innerText = parkingData.data.parkingInfo.PARK_PRICE;
    reviewCountBox.innerText = parkingData.data.reviewCount;
    
    imageBox.setAttribute('src', "/uploadImage/" + parkingData.data.parkingInfo.FILE_URL + parkingData.data.parkingInfo.FILE_CONV_NAME);
    
    parkPrice.innerText = parkingData.data.parkingInfo.PARK_PRICE;
    
    for(reviewList of parkingData.data.reviewList){
    	averageData += reviewList.REV_STAR;
    }
    averageData = (averageData / (parkingData.data.reviewList).length);
    
    if((parkingData.data.reviewList).length == 0){
    	averageReviewBox.innerText = "0.0점";
    }else{
    	averageReviewBox.innerText = averageData.toFixed(1);
    }
    averageData = 0;
    
    
    section.innerHTML = "";
    for(sectionData of parkingData.data.sectionList){
		var modalHtml = ``;
    	modalHtml +=` <div class="row">`;
    	modalHtml +=` 	<div class="col-7 discountTitleNg">`;
    	modalHtml +=` 		<span class="grayFontJm">${sectionData.SUB_NAME}</span><span class="grayFontJm"> 구역</span>`;
    	modalHtml +=` 	</div>`;
    	modalHtml +=` 	<div class="col text-center">`;
    	modalHtml +=` 		<span class="grayFontJm">${sectionData.SEC_DIS}</span ><span class="grayFontJm">%</span>`;
    	modalHtml +=` 	</div>`;
    	modalHtml +=` </div>`;
    	$("#section").append(modalHtml);
      
    }
    
    review.innerHTML = "";
    for(reviewData of parkingData.data.reviewList){
    	
    	var reviewDate = new Date(reviewData.REG_DATE);
    	// 자바스크립트는 month가 0부터 시작
    	reviewDate = reviewDate.getFullYear() + "-" + (reviewDate.getMonth() + 1) + "-" + reviewDate.getDate() + " " + String(reviewDate.getHours()).padStart(2, "0") + ":" + String(reviewDate.getMinutes()).padStart(2, "0");
    	var reviewStar = '';
    	for(let i = 1; i <= 5; i++){
    		if(reviewData.REV_STAR >= i){
    			reviewStar += '★';
    		}else{
    			reviewStar += '☆';
    		}
    	}
    	var modalHtml = ``;
    	modalHtml +=`<div class="row my-3 mx-1" style="border: 1.5px solid rgb(243, 243, 243); box-shadow: 2px 3px 4px #d7dadf; border-radius:0.5rem;">`;
    	modalHtml +=`	<div class="col">`;
    	modalHtml +=`		<div class="row mb-2 mt-3 mx-1">`;
    	modalHtml +=`			<div class="col d-flex justify-content-between">`;
    	modalHtml +=`				<span class="grayFontJm">${reviewData.USER_NAME}</span>`;
    	modalHtml +=`    			<span class="grayFontJm">${reviewDate}</span>`;
    	modalHtml +=`    		</div>`;
    	modalHtml +=`		</div>`;
    	modalHtml +=`		<div class="row" style="margin-left: 0.2rem;">`;
    	modalHtml +=` 			<div class="col">`;
    	modalHtml +=` 				<p style="color:red;">${reviewStar}</p>`;
    	modalHtml +=` 			</div>`;
    	modalHtml +=`		</div>`;
    	modalHtml +=`		<div class="row mb-2 pb-1" style="margin: 0.2rem;">`;
    	modalHtml +=` 			<div class="col">`;
    	modalHtml +=` 				<span class="commentContentNg">${reviewData.REV_CONT}</span>`;
    	modalHtml +=` 			</div>`;
    	modalHtml +=`		</div>`;
    	modalHtml +=` 	</div>`;
    	modalHtml +=`</div>`;
    	$("#review").append(modalHtml);
    	modalHtml = ``;
    }
    
    var totalSectionCount = 0;
    for(totalSectionCountData of parkingData.data.sectionList){
    	totalSectionCount += totalSectionCountData.SEC_COUNT;
    	
    }
    totalSectionCountBox.innerText = totalSectionCount;
}


function beforeReservation(){
	
	var params = {'PARK_SEQ' : parkSeq, 'daterange' : reservationDate.value};
	params.PARK_SEQ = parkSeq;
	params.daterange = reservationDate.value;
	
	dateX = moment(reservationDate.value.substr(0, 13).concat(':00:00'));
	dateY = moment(reservationDate.value.substr(17, 13).concat(':00:00'));

	dateX = new Date(dateX);
	dateY = new Date(dateY);

	finalTime = ((dateY-dateX) / 1000 / 60 / 60 );
	
	price = parseInt(parkPrice.innerText);
	priceByTime = finalTime * price;
	
	ajaxCall("/main/selectSectionInfoForRese", params, function(data){
		var modalHtml = ``;
		remainCount.innerHTML = "";
				modalHtml +=` <div class="row">`;
				modalHtml +=` 	<div class="col-5">`;
				modalHtml +=` 		<span class="mainContentSubTitle">남은구역</span>`;
				modalHtml +=` 	</div>`;
				modalHtml +=` 	<div class="col">`;
		for(sectionData of data.data.sectionList){
			if(sectionData.SEC_TYPE == 'RY01' && sectionData.remaincnt > 0){
				modalHtml +=` <div class="row my-2">`;
				modalHtml +=`    <div class="col">`;
				modalHtml +=`        <span class="grayFontJm">일반 전용</span>`;
				modalHtml +=`    </div>`;
				modalHtml +=`    <div class="col text-end parkingSectionNg">`;
				modalHtml +=`        <span class="grayFontJm">${sectionData.remaincnt}칸</span>`;
				modalHtml +=`    </div>`;
				modalHtml +=` </div>`;
			}else if(sectionData.SEC_TYPE == 'RY02' && sectionData.remaincnt > 0){
				modalHtml +=` <div class="row my-2">`;
				modalHtml +=`    <div class="col">`;
				modalHtml +=`        <span class="grayFontJm">장애인 전용</span>`;
				modalHtml +=`    </div>`;
				modalHtml +=`    <div class="col text-end parkingSectionNg">`;
				modalHtml +=`        <span class="grayFontJm">${sectionData.remaincnt}칸</span>`;
				modalHtml +=`    </div>`;
				modalHtml +=` </div>`;
			}else if(sectionData.SEC_TYPE == 'RY03' && sectionData.remaincnt > 0){
				modalHtml +=` <div class="row my-2">`;
				modalHtml +=`    <div class="col">`;
				modalHtml +=`        <span class="grayFontJm">여성 전용</span>`;
				modalHtml +=`    </div>`;
				modalHtml +=`    <div class="col text-end parkingSectionNg">`;
				modalHtml +=`        <span class="grayFontJm">${sectionData.remaincnt}칸</span>`;
				modalHtml +=`    </div>`;
				modalHtml +=` </div>`;
			}else if(sectionData.SEC_TYPE == 'RY04' && sectionData.remaincnt > 0){
				modalHtml +=` <div class="row my-2">`;
				modalHtml +=`    <div class="col">`;
				modalHtml +=`        <span class="grayFontJm">전기차 전용</span>`;
				modalHtml +=`    </div>`;
				modalHtml +=`    <div class="col text-end parkingSectionNg">`;
				modalHtml +=`        <span class="grayFontJm">${sectionData.remaincnt}칸</span>`;
				modalHtml +=`    </div>`;
				modalHtml +=` </div>`;
			}
		}
		modalHtml +=` 	</div>`;
		modalHtml +=` </div>`;
		modalHtml +=` <div class="row my-4 py-4 areaList" style="border-bottom: #EEEEEE solid 0.5rem; border-top: #EEEEEE solid 8px;">`;
		modalHtml +=`     <div class="col-5">`;
		modalHtml +=`     	<span class="mainContentSubTitle">주차 구역 선택</span>`;
		modalHtml +=`     </div>`;
		modalHtml +=`     <div class="col text-center d-grid">`;
		modalHtml +=`     	<select onchange="selectBox(this.value, ${priceByTime})" class="form-select" aria-label="Default select example" style="font-size: 0.8rem; color: #A6A6A6; heigth: 2rem;">`;
		modalHtml +=`     		<option selected id="selectBoxValue">주차 구역</option>`;
		for(sectionData of data.data.sectionList){
			if(sectionData.SEC_TYPE == 'RY01' && sectionData.remaincnt > 0){
				modalHtml +=` <option value=${sectionData.SEC_DIS} value2=${sectionData.SEC_SEQ}>일반</option>`;
			}else if(sectionData.SEC_TYPE == 'RY02' && sectionData.remaincnt > 0){
				modalHtml +=` <option value=${sectionData.SEC_DIS} value2=${sectionData.SEC_SEQ}>장애인</option>`;
			}else if(sectionData.SEC_TYPE == 'RY03' && sectionData.remaincnt > 0){
				modalHtml +=` <option value=${sectionData.SEC_DIS} value2=${sectionData.SEC_SEQ}>여성</option>`;
			}else if(sectionData.SEC_TYPE == 'RY04' && sectionData.remaincnt > 0){
				modalHtml +=` <option value=${sectionData.SEC_DIS} value2=${sectionData.SEC_SEQ}>전기차</option>`;
			}
		}
		modalHtml +=`     	</select>`;
		modalHtml +=`     </div>`;
		modalHtml +=`  </div>`;
		modalHtml +=`<div class="row my-4 pb-4 areaList" style="border-bottom: #EEEEEE solid 0.5rem;">`;
	    modalHtml +=`    <div class="col-5">`;
	    modalHtml +=`        <span class="mainContentSubTitle">전화 번호</span>`;
	    modalHtml +=`    </div>`;
	    modalHtml +=`    <div class="col numberSectionNg d-grid">`;
	    modalHtml +=`        <input class="form-control form-control-sm d-grid phoneNumber" id="inputPhone" name="RESE_CALL_NUM" type="text" aria-label=".form-control-sm example">`;
	    modalHtml +=`    </div>`;
	    modalHtml +=`</div>`;
	    modalHtml +=`<div class="row my-4 pb-4 areaList" style="border-bottom: #EEEEEE solid 0.5rem;">`;
	    modalHtml +=`    <div class="col-5">`;
	    modalHtml +=`        <span class="mainContentSubTitle">차량 번호</span>`;
	    modalHtml +=`    </div>`;
	    modalHtml +=`    <div class="col numberSectionNg d-grid">`;
	    modalHtml +=`        <input class="form-control form-control-sm" id="inputCarNo" name="RESE_CAR_NO" type="text" aria-label=".form-control-sm example">`;
	    modalHtml +=`    </div>`;
	    modalHtml +=`</div>`;
	    modalHtml +=`<div class="row mt-4 mb-2 areaList">`;
	    modalHtml +=`    <div class="col-5">`;
	    modalHtml +=`        <span class="mainContentSubTitle">쿠폰 적용</span>`;
	    modalHtml +=`    </div>`;
	    modalHtml +=`    <div class="col numberSectionNg d-grid">`;
	    modalHtml +=`     	<select onchange="selectCouponBox(this.value, ${finalPrice})" class="form-select coupon" aria-label="Default select example" style="font-size: 0.8rem; color: #A6A6A6; heigth: 2rem;">`;
		modalHtml +=`     		<option selected id="selectBoxValue">쿠폰 선택</option>`;
		for(couponData of data.data.myCouponList){
			modalHtml +=` <option value=${couponData.COU_PRICE} value2=${couponData.PUB_SEQ}>${couponData.COU_NAME}</option>`;
		}
		modalHtml +=`     	</select>`;
	    modalHtml +=`    </div>`;
	    modalHtml +=`</div>`;
	    modalHtml +=`<div class="row my-2 pb-3 areaList" style="border-bottom: #EEEEEE solid 0.5rem;">`;
	    modalHtml +=`    <div class="col-5">`;
	    modalHtml +=`    </div>`;
	    modalHtml +=`    <div class="col numberSectionNg d-none text-center" id="showCouponPrice">`;
	    modalHtml +=`    	<div class="row">`;
	    modalHtml +=`       	<div class="col grayFontJm">`;
	    modalHtml +=`              쿠폰 금액`;
	    modalHtml +=`			</div>`;
	    modalHtml +=`       	<div class="col grayFontJm">`;
	    modalHtml +=`       		<span id="couponPrice"></span><span>원</span>`;
	    modalHtml +=`			</div>`;
	    modalHtml +=`		</div>`;
	    modalHtml +=`    </div>`;
	    modalHtml +=`</div>`;
	    modalHtml +=`<div class="row mt-4 pb-4 areaList">`;
	    modalHtml +=`    <div class="col-5">`;
	    modalHtml +=`        <span class="mainContentSubTitle">결제 수단</span>`;
	    modalHtml +=`    </div>`;
	    modalHtml +=`    <div class="col">`;
	    modalHtml +=`        <div class="form-check form-check-inline">`;
	    modalHtml +=`            <input class="form-check-input" type="radio" name="payMethod" id="inlineRadio1" value="kakaoPay">`;
	    modalHtml +=`            <label class="form-check-label grayFontJm" for="inlineRadio1">카카오페이<img src="/img/KaKao.png" alt=""></label>`;
	    modalHtml +=`        </div>`;
	    modalHtml +=`    </div>`;
	    modalHtml +=`</div>`;
	    modalHtml +=`<div class="row mt-3 mb-4" onclick="payment()" style="height:2.5rem;">`;
	    modalHtml +=`    <div class="col-1"></div>`;
	    modalHtml +=`	 <div class="col">`;
	    modalHtml +=`		 <div class="row" style="background-color:#3E4AB8; border-radius:0.5rem; height:2.5rem; align-content:center;">`;
	    modalHtml +=`    		 <div class="col d-none text-center" id="showPrice">`;
	    modalHtml +=`        		 <span class="title" style="color:white;">총 </span><span id="payPrice" class="title" style="color:white;"></span><span class="title" style="color:white;"> 원</span>`;
	    modalHtml +=`	 		 </div>`;
	    modalHtml +=`    		 <div class="col text-center">`;
	    modalHtml +=`		 		 <span class="title" style="color:white;">결제하기</span>`;
	    modalHtml +=`    		 </div>`;
	    modalHtml +=`		 </div>`;
	    modalHtml +=`	 </div>`;
	    modalHtml +=`    <div class="col-1"></div>`;
	    modalHtml +=`</div>`;
	    $('#remainCount').append(modalHtml);
		modalHtml = ``;
		
	})
	pickerClose();
	const startDateResult = document.getElementById('startDateResult');
	const endDateResult = document.getElementById('endDateResult');
	startDateResult.innerText = `${startDate} ${(startHours<10) ? "0"+startHours : startHours}시`;
	endDateResult.innerText = `${endDate} ${(endHours<10) ? "0"+endHours : endHours}시`;
	document.getElementById('formData').childNodes[1].classList.remove('d-none');
};

// 우대사항 선택 박스 선택하면 금액 계산
function selectBox(value, priceByTime2222){
	if(value.length > 0){
		value = parseInt(value);
		
		const payPrice = document.getElementById('payPrice');
		finalPrice = (priceByTime * ((100 - (value)) / 100));
		
		payPrice.innerText = finalPrice;
		document.getElementById('showPrice').classList.remove('d-none');
	}
}

// 쿠폰박스 선택하면  총금액 - 쿠폰금액을 계산
function selectCouponBox(value){
	if(value > 0){
		
		console.log(value);
		finalPriceByCoupon = finalPrice - value;
		
		if(finalPriceByCoupon < 0) {
			finalPriceByCoupon = 0;
		}
		
		couponPrice = document.getElementById("couponPrice");
		couponPrice.innerText = value;
		payPrice.innerText = finalPriceByCoupon;
		document.getElementById('showCouponPrice').classList.remove('d-none');
	}
}

function payment(){
	var paymentUrl = '/order/pay';
	var secSeq1 = document.querySelector('select > option:checked');
	var secSeq = secSeq1.getAttribute('value2');
	
	var couponSeq1 = document.querySelector('.coupon > option:checked');
	var couponSeq = couponSeq1.getAttribute('value2');


	dateX = moment(dateX, "YYYY-MM-DD hh:mm:ss");
	dateY = moment(dateY, "YYYY-MM-DD hh:mm:ss");

	dateX = dateX.format();
	dateY = dateY.format();
	
	dateX = reservationDate.value.substr(0, 13).concat(':00:01');
	dateY = reservationDate.value.substr(17, 13).concat(':00:00');
	
	var params = new FormData(document.getElementById('insertData'));
	params.append('RESE_START' , dateX);
	params.append('RESE_END' , dateY);
	if(couponSeq == null){
		params.append('RESE_PRICE' , finalPrice);
	}else{
		params.append('RESE_PRICE' , finalPriceByCoupon);
	}
	params.append('SEC_SEQ' , secSeq);
	params.append('PARK_SEQ' , parkSeq);
	params.append('daterange' , reservationDate.value);
	params.append('item' , parkNameBox.innerText + " " +secSeq1.innerText + "구역");
	params.append('PUB_SEQ' , couponSeq);
	
	if(params.get('RESE_PRICE') == 0) {
		paymentUrl = "/main/insertReservation"
	}
	if(!checkRegister()){
		return;
	}
	

	let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if(xhr.readyState==4 && xhr.status==200) {
        	if(params.get('RESE_PRICE') == 0) {
        		location.href = "/main/reservationComplete"
        	} else {
                let data = JSON.parse(xhr.responseText);
    			location.href = data.next_redirect_pc_url
        	}
        }
    }
    xhr.open('post', paymentUrl);
    // xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    
    xhr.send(params);
	
}


// 전화번호 자동 하이픈 처리
$(document).on("keyup", ".phoneNumber", function() {
	
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	
});

// 전화번호 유효성 검사
function checkRegister(){
	var regex = /\d{2,3}[가-힣]{1}\d{4}/gm;
	
	if(!regex.test($("#inputCarNo").val())){
		cmm.confirm("확인", "차량 번호를 확인해주세요");
		$("#inputCarNo").focus();
		return false;
	}
	
	var regex1 = /^\d{3}-\d{3,4}-\d{4}$/;

	var str = $('#inputPhone').text().trim();

    var phone = str.replace(/\-{1,2}$/g, "");

    $('#inputPhone').text(phone);

	if(!regex1.test($('#inputPhone').val())){
		cmm.confirm("확인", "전화 번호를 확인해주세요");
		$('#inputPhone').focus();
		return false;
	}
	return true;
}


// info 창 열고 닫기
function infoClose(){
	infoHandle.style.left = "-100%";
}

var infoHandle = document.querySelector(".info");



// list 창 열고 닫기
var listHandle = document.getElementById("list");
var customDatePicker = document.getElementById("customDatePicker");

function listOpen(){
	listHandle.style.right = "0%";
}

function listClose(){
	listHandle.style.right = "-100%";
}

// datePicker 창
function pickerClose(){
	customDatePicker.style.bottom = "-100%";
}

function pickerOpen(){
	
	// 버튼 누름과 동시에 로그인 확인 
	ajaxCall("/main/checkLogin", {}, function(data){
		if(data.code == 'F'){
			cmm.alert("로그인이 필요합니다.");
			return;
		}else{
			customDatePicker.style.bottom = "0%";
		}
	})
	
}
