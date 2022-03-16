
/** main map 관련 스크립트 **/

const mainMap = document.getElementById("mainMap");
const mainMapX = document.getElementById("postcodeX");
const mainMapY = document.getElementById("postcodeY");
var valueX = parseFloat(mainMapX.value);
var valueY = parseFloat(mainMapY.value);


if(mainMap) {

    var mapContainer = document.getElementById('mainMap'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.49966168796031, 127.03007039430118), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 예시좌표 서버에서 이쪽으로 좌표값 받아와야함
    var carparkPositions = [
        new kakao.maps.LatLng(37.49966168796031, 127.03007039430118),
        new kakao.maps.LatLng(37.499463762912974, 127.0288828824399),
        new kakao.maps.LatLng(37.49896834100913, 127.02833986892401),
        new kakao.maps.LatLng(37.49893267508434, 127.02673400572665),
        new kakao.maps.LatLng(37.49872543597439, 127.02676785815386),
        new kakao.maps.LatLng(37.49813096097184, 127.02591949495914),
        new kakao.maps.LatLng(37.497680616783086, 127.02518427952202)
    ];

// 이쪽에는 주차장 넘버 받아와야함
    var parkingNumList = [
        1, 2, 3, 4, 5, 6, 7
    ];

    var carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

    createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다


// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
    function createMarkerImage(src, size, options) {
        var markerImage = new kakao.maps.MarkerImage(src, size, options);
        return markerImage;
    }

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
    function createMarker(position, image, num) {

        var marker = new kakao.maps.Marker({
            position: position,
            image: image
        });
        marker.value=num;

        //마커 클릭 이벤트 등록
        kakao.maps.event.addListener(marker, 'click', function(qweqwadw) {
            // 추후 ajax통신문을 작성하고 마지막에 스타일 변화를 주어야함
            // marker.value가 주차장 넘버를 가지고 있으니 이걸로 서버 컨트롤 들어가야함
            console.log(marker.value);
            infoHandle.style.left='0%';
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
            var markerImage = createMarkerImage("../img/park.png", imageSize, imageOptions),
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

// 창로드가 완료되면 마커를 생성함
    window.onload = function() {
        // 주차장 마커 지도에 표시하도록 설정합니다
        setCarparkMarkers(map);
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

function infoClose(){
    infoHandle.style.left="-100%";
}

var infoHandle = document.querySelector(".info");