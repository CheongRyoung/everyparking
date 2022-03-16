/*
작성자:김청룡
수정자:
작성일:2022-03-08
수정일:
*/

// id값을 통해 선택할 수 있습니다.
const datepickerR = document.getElementById('datepickerR');
const datepickerN = document.getElementById('datepickerN');
const readEditor = document.getElementById('readEditor');
const writeEditor = document.getElementById('writeEditor');
const testGridid = document.getElementById('testGrid');
const testajax = document.getElementById('testajax');

// 시간을 포함해서 날짜를 선택해야할때
if(datepickerR) {
    $('input[name="daterange"]').daterangepicker({
        minDate: new Date(),
        autoUpdateInput: true,
        timePicker: true,
        timePicker24Hour: true,
        locale: {
            "separator": " ~ ",                     // 시작일시와 종료일시 구분자
            "format": 'YYYY년 MM월 DD일 HH시',                 // 일시 노출 포맷
            "applyLabel": "확인",                    // 확인 버튼 텍스트
            "cancelLabel": "취소",                   // 취소 버튼 텍스트
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
        },

        showDropdowns: true                   // 년월 수동 설정 여부

    });

    $('input[name="daterange"]').on('show.daterangepicker', function (ev, picker) {
        $(".yearselect").css("float", "left");
        $(".monthselect").css("float", "right");
        $(".nob").css("float", "right");
        handlerTime();
    });
    var timepickerReviseList = document.querySelectorAll(".calendar-time");

    function handlerTime() {
        for(timepickerRevise of timepickerReviseList) {
            timepickerRevise.setAttribute("style", "text-align: right;");
        }
    }
}

// 시간을 제외하고 캘린더 나타내기
if(datepickerN) {
    $('input[name="daterange"]').daterangepicker({
        maxDate: new Date(),                     // 누르는 시점의 날짜의 객체를 생성해서 그 이후 날짜는 선택을 못하게(minDate로 하면 당일 기준 이전 날짜는 선택 불가하게 가능)
        showDropdowns: true,

        locale: {
            "separator": " ~ ",                      // 시작일시와 종료일시 구분자
            "format": 'YYYY-MM-DD',                  // 일시 노출 포맷
            "applyLabel": "확인",                    // 확인 버튼 텍스트
            "cancelLabel": "취소",                   // 취소 버튼 텍스트
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
        }

    });

    $('input[name="daterange"]').on('show.daterangepicker', function (ev, picker) {
        $(".yearselect").css("float", "left");
        $(".monthselect").css("float", "right");
        $(".nob").css("float", "right");
    });
}


// ckedior Read
if(readEditor){
    ClassicEditor
        .create( readEditor)

        .then( editor => {
            window.editor = editor;
            editor.isReadOnly = true;
            const toolbarElement = editor.ui.view.toolbar.element;
            toolbarElement.style.display = 'none';
        } )
        .catch( error => {
            console.error( 'Oops, something went wrong!' );
            console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
            console.warn( 'Build id: g64ljk55ssvc-goqlohse75uw' );
            console.error( error );
        } );
}

// ckeitor 작성을 위한 함수입니다.
if(writeEditor){
    let editor;

    ClassicEditor
        .create( writeEditor , {
            ckfinder: {
                uploadUrl: 'http://localhost:8123/test/imageUpload'
            }
        } )
        .then( newEditor => {
            editor = newEditor;
        } )

        .then( editor => {
            window.editor = editor;

        } )
        .catch( error => {
            console.error( 'Oops, something went wrong!' );
            console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
            console.warn( 'Build id: g64ljk55ssvc-goqlohse75uw' );
            console.error( error );
        } );

    function uploadData() {
        const editorData = editor.getData();
        console.log(typeof(editorData));

        var xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function() {
            if(xhr.readyState==4&&xhr.status==200) {

            }
        }
        xhr.open("post", "../test/uploadTest", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
        xhr.send("editorData="+editorData);
    }
}

// 주소 검색및 좌표 변환 입니다
var addr = ''; // 주소 변수  (검색할때 이값에 넣어주도록합니다)
function postcoderun() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            //////
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
            transGeocode();
        }
    }).open();
}

function transGeocode() {
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

/** 주소펼치기  **/
function doShowAddress(target){
    var parkingSpot = target.closest(".parkingSpot");
    parkingSpot.querySelector(".addressInfo").classList.toggle("show");
}


/** 네비바에 필요한 스크립트 **/
var sidebarBox = document.querySelector("#sideBox");
var cateBtn = document.querySelector(".category-btn");
var mySideBox = document.querySelector("#mySideBox");
var myBtn = document.querySelector(".my-btn");

function cateToggle(){
    if(mySideBox.classList.contains('show-mySideBar')){
        mySideBox.className="my-sideBar";
    }
    // sidebarBox.classList.toggle('show-cateSideBar');
    var hasClass = sidebarBox.classList.contains("cate-sideBar");
    if(!hasClass){
        // cate-sideBar가 없을 때,
        sidebarBox.className="cate-sideBar";
        //sidebarBox.classList.add("cate-sideBar");
    } else{
        // cate-sideBar가 있을 때,
        sidebarBox.className="show-cateSideBar";
        //sidebarBox.classList.add("showSideBar");
    }
}
cateBtn.addEventListener('click', cateToggle);

function myPageToggle(){
    if(sidebarBox.classList.contains('show-cateSideBar')){
        sidebarBox.className="cate-sideBar";
    }

    var hasClass = mySideBox.classList.contains("my-sideBar");
    if(!hasClass){
        mySideBox.className="my-sideBar";
    }else{
        mySideBox.className= "show-mySideBar";
    }
}
myBtn.addEventListener('click', myPageToggle);


// 예약취소 버튼 출현
function cancel(target){

    var parentBox = target.closest(".reservationStateBox")
    parentBox.innerHTML = "";

    var h6Box = document.createElement("h6");
    h6Box.setAttribute("style","float:right");
    parentBox.appendChild(h6Box);

    var spanBox = document.createElement("span");
    spanBox.setAttribute("class", "badge bg-secondary state");
    spanBox.style.cursor = "pointer";
    spanBox.setAttribute("onclick", "doCancel(this)");
    spanBox.setAttribute("onmouseleave", "refresh(this)");  // -> 목적: 원래 '예약완료'가 다시 보이게 / 에러 : 파라미터가 다중 함수 어떻게 적용~?
    spanBox.innerText = "예약취소";
    h6Box.appendChild(spanBox);

}

const reservationStateBox = document.querySelector(".reservationStateBox");
if(reservationStateBox) {
    function refresh(target){ /* event에 대한 정보를 보내는거 자체가 target >>> send로 보낼 때, target.target.~~~ */

        var parentBox = target.closest(".reservationStateBox")
        parentBox.innerHTML = "";

        var h6Box = document.createElement("h6");
        h6Box.setAttribute("style","float:right");
        parentBox.appendChild(h6Box);

        var spanBox = document.createElement("span");
        spanBox.setAttribute("class", "badge bg-primary state");
        spanBox.setAttribute("onmouseover","cancel(this)");
        spanBox.innerText = "예약완료";
        h6Box.appendChild(spanBox);


    }

// 예약취소 실행 함수
    function doCancel(target){
        alert("test");
    }

}


// 버튼 버블 css 형성
var areaSelectBtnList = document.querySelectorAll('.areaSelect button');
for(var i=0; i<areaSelectBtnList.length; i++){
    areaSelectBtnList[i].addEventListener('click', Handlerbubble);
}
function Handlerbubble(evt) {
    for(var i=0; i<areaSelectBtnList.length; i++){
        areaSelectBtnList[i].setAttribute("class", "btn fw-bold text-white");
    }
    var eventNode = evt.target;
    eventNode.setAttribute("class", "btn bubble fw-bold text-primary");
}


// 별점 구현
// 별점
const checkStar = document.querySelectorAll(".checkStar");
const star = document.querySelectorAll(".star");
const chooseWord = document.querySelector("#chooseWord");


function color(event) {
    const num = parseInt(event.target.value);
    for(var i=0; i<checkStar.length; i++){
        star[i].classList.remove("redStar");
    }
    for(var i=0; i<num; i++){
        star[i].classList.add("redStar");
    }

    switch(num) {
        case 1:  // if (x === 'value1')
            chooseWord.style.color = 'red';
            chooseWord.innerText = "1점 별로에요";
            break;

        case 2:  // if (x === 'value2')
            chooseWord.style.color = 'red';
            chooseWord.innerText = "2점 그저그래요";
            break;

        case 3:  // if (x === 'value2')
            chooseWord.style.color = 'red';
            chooseWord.innerText = "3점 괜찮아요";
            break;

        case 4:  // if (x === 'value2')
            chooseWord.style.color = 'red';
            chooseWord.innerText = "4점 좋아요";
            break;

        case 5:  // if (x === 'value2')
            chooseWord.style.color = 'red';
            chooseWord.innerText = "5점 최고에요";
            break;
    }
}

for(var i=0; i<checkStar.length; i++){
    checkStar[i].addEventListener("click", color);
}