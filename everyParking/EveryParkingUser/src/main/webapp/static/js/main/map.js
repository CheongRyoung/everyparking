/** main map 관련 스크립트 **/

const mainMap = document.getElementById("mainMap");
const mainMapX = document.getElementById("postcodeX");
const mainMapY = document.getElementById("postcodeY");
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


// list - 정보 넣을 element 생성
var totalParkingCountBox = document.getElementById("totalParkingCount");



var result = new Map();


//지도 생성
if(mainMap) {

    var mapContainer = document.getElementById('mainMap'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.49966168796031, 127.03007039430118), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    
    // 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
   kakao.maps.event.addListener(map, 'tilesloaded', function() {
      getInfoByMap();
      
   
      })
      
   };

function getInfoByMap() {
    // 지도 영역정보를 얻어옵니다 
   var bounds = map.getBounds();
   
   // 지도의 남서쪽 좌표 가져오기
   var swLatLng = bounds.getSouthWest(); 
    
   // 지도의 북동쪽 좌표 가져오기
   var neLatLng = bounds.getNorthEast(); 
   
   
   var result = new Map();
   
   result = {'x1' : swLatLng.La, 'y1' : swLatLng.Ma, 'x2' : neLatLng.La, 'y2' : neLatLng.Ma};
   markerLoad(result);

}




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
		  modalHtml +=`         <div class="col pb-2">`;
		  modalHtml +=`         <div class="row mb-3">`;
		  modalHtml +=`             <div class="col p-0">`;
		  modalHtml +=`                 <img class="imageInfoBox" src="/img/p6.jpeg">`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row mb-2">`;
	      modalHtml +=`             <div class="col parkingSpotName">`;
	      modalHtml +=`             		<span>${listBoxData.PARK_NAME}</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row mb-3">`;
	      modalHtml +=`             <div class="col parkingSpotInfo">`;
	      modalHtml +=`                	<span>총 공간 : </span><span>${totalParkingCount}</span><span>면 | 주차면 : </span><span>${sectionNameList}</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row soptBox mb-3">`;
	      modalHtml +=`             <div class="col">`;
	      for(var i = 0; i < (listBoxData.sectionList).length; i++){
	      	if(listBoxData.sectionList[i].SUB_CODE == "RY03" && listBoxData.sectionList[i].SEC_COUNT != 0){
	      		modalHtml +=`                 <img src="/img/womanIcon.png" style="width:16px;height:16px"><span class="sopt">${womanSection}</span><span>면</span>`;
	      	}else{
	      		modalHtml +=``;
	      	}
	      }
	      modalHtml +=`             </div>`;
	      modalHtml +=`             <div class="col">`;
	      for(var i = 0; i < (listBoxData.sectionList).length; i++){
		    if(listBoxData.sectionList[i].SUB_CODE == "RY02" && listBoxData.sectionList[i].SEC_COUNT != 0){
		      	modalHtml +=`                 <img src="/img/disabledPerson.png" style="width:16px;height:16px;vertical-align: text-bottom;"><span class="sopt">${disableSection}</span><span>면</span>`;
		    }else{
		      	modalHtml +=``;
		    }
		  }
	      modalHtml +=`             </div>`;
	      modalHtml +=`             <div class="col">`;
	      for(var i = 0; i < (listBoxData.sectionList).length; i++){
		    if(listBoxData.sectionList[i].SUB_CODE == "RY04" && listBoxData.sectionList[i].SEC_COUNT != 0){
		      	modalHtml +=`                 <i class="bi bi-lightning" style="vertical-align: text-top;"></i><span class="sopt">${electroSection}</span><span>면</span>`;
		    }else{
		      	modalHtml +=``;
		    }
		  }
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row parkingSpotExRowBox">`;
	      modalHtml +=`             <div class="col-4">`;
	      modalHtml +=`                 <i class="bi bi-geo-alt"></i><span class="parkingSpotIconEx">위치</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`             <div class="col parkingSpotEx">`;
	      modalHtml +=`					<span>${listBoxData.PARK_ADDR1}</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row parkingSpotExRowBox">`;
	      modalHtml +=`             <div class="col-4">`;
	      modalHtml +=`                 <i class="bi bi-credit-card"></i><span class="parkingSpotIconEx">주차요금</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`             <div class="col parkingSpotEx">`;
	      modalHtml +=`                 <span>1시간 </span><span>${listBoxData.PARK_PRICE}</span><span>원</span>`;
	      modalHtml +=`             </div>`;
	      modalHtml +=`         </div>`;
	      modalHtml +=`         <div class="row parkingSpotExRowBox">`;
	      modalHtml +=`             <div class="col-4">`;
	      modalHtml +=`                 <i class="bi bi-stopwatch"></i><span class="parkingSpotIconEx">문의시간</span>`;
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
            console.log(marker.value);									// marker.value가 주차장 번호 = params에 넣어서 ajaxCall을 이용하여 보내줘야함
            infoHandle.style.left='0%';
 
            var map = new Map();
            
            
            // params를 날릴때 ajaxCall에서 정한 방식인 Map형식을 지켜줘야함
            ajaxCall("/main/selectOneParkingInfo", {'PARK_SEQ' : marker.value}, function(data){
            	map = data;
            })
            
            
            parkNameBox.innerText = map.data.parkingInfo.PARK_NAME;
            parkingAddBox.innerText = map.data.parkingInfo.PARK_ADDR1;
            phoneBox.innerText = map.data.parkingInfo.PARK_CALL_NUM;
            openTimeBox.innerText = map.data.parkingInfo.PARK_OPEN;
            endTimeBox.innerText = map.data.parkingInfo.PARK_CLOSE;
            parkPriceBox.innerText = map.data.parkingInfo.PARK_PRICE;
            reviewCountBox.innerText = map.data.reviewCount;
            
            
            section.innerHTML = "";
            for(sectionData of map.data.sectionList){
            	if(sectionData.SUB_CODE != 'RY01'){
            		var modalHtml = ``;
                	modalHtml +=` <div class="row">`;
                	modalHtml +=` 	<div class="col-7 discountTitleNg">`;
                	modalHtml +=` 		<span class="mainContentSubSubNg">${sectionData.SUB_NAME}</span><span class="mainContentSubSubNg"> 구역</span>`;
                	modalHtml +=` 	</div>`;
                	modalHtml +=` 	<div class="col text-center">`;
                	modalHtml +=` 		<span class="mainContentSubSubNg">${sectionData.SEC_DIS}</span ><span class="mainContentSubSubNg">%</span>`;
                	modalHtml +=` 	</div>`;
                	modalHtml +=` </div>`;
                	$("#section").append(modalHtml);
                	
            	}
            	
            }
            
            review.innerHTML = "";
            for(reviewData of map.data.reviewList){
            	
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
            	modalHtml +=`<div class="row mt-2" style="margin: 1px;">`;
            	modalHtml +=`	<div class="col d-flex justify-content-between">`;
            	modalHtml +=`		<span class="mainContentSubSubNg">${reviewData.USER_NAME}</span>`;
            	modalHtml +=`    	<span class="mainContentSubSubNg">${reviewDate}</span>`;
            	modalHtml +=`    </div>`;
            	modalHtml +=`</div>`;
            	modalHtml +=`<div class="row" style="margin-left: 1px;">`;
            	modalHtml +=` 	<div class="col">`;
            	modalHtml +=` 		<p>${reviewStar}</p>`;
            	modalHtml +=` 	</div>`;
            	modalHtml +=`</div>`;
            	modalHtml +=`<div class="row mb-2 pb-1" style="margin: 1px; border-bottom: 1px solid #EEEEEE;">`;
            	modalHtml +=` 	<div class="col">`;
            	modalHtml +=` 		<span class="commentContentNg">${reviewData.REV_CONT}</span>`;
            	modalHtml +=` 	</div>`;
            	modalHtml +=` 	<div class="col d-flex justify-content-end">`;
            	modalHtml +=` 		<a class="commentBtn" href="#"><i class="bi bi-pencil-square"></i></a>`;
            	modalHtml +=`		<a class="commentBtn" href="#"><i class="bi bi-trash-fill"></i></a>`;
            	modalHtml +=`	</div>`;
            	modalHtml +=`</div>`;
            	$("#review").append(modalHtml);
            	modalHtml = ``;
            }
            
            var totalSectionCount = 0;
            for(totalSectionCountData of map.data.sectionList){
            	totalSectionCount += totalSectionCountData.SEC_COUNT;
            	
            }
            totalSectionCountBox.innerText = totalSectionCount;
                	
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


// info 창 열고 닫기
function infoClose(){
	infoHandle.style.left = "-100%";
}

var infoHandle = document.querySelector(".info");



// list 창 열고 닫기
var listHandle = document.getElementById("list");

function listOpen(){
	listHandle.style.right = "0%";
}

function listClose(){
	listHandle.style.right = "-100%";
}

