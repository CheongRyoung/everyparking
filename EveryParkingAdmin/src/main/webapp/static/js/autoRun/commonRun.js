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
        locale: {
            "separator": " ~ ",                     // 시작일시와 종료일시 구분자
            "format": 'YYYY년 MM월 DD일 hh시',                 // 일시 노출 포맷
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
        .create( document.querySelector( '#readEditor' ))

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
        .create( document.querySelector( '#writeEditor' ) , {
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


/**
 *  작성자: 김청룡
 *  작성일: 22-03-09
 *  프로젝트에 필요한 그리드 상세 사용법 예시
 *
 * **/


/** 이부분은 gird.js의 상단 부분에 설명이 나와있습니다.   **/
if(testGridid){
    let testGrid;
    $(function(){
        let gridOption = {
            cols:[
                {title:"번호", name:"test_no", type:"number", order:true}
                , {title:"제목", name:"title", order:true}
                , {title:"시간", name:"datestring", order:true}
                , {title:"사유", name:"reason", order:true}
                , {title:"위치", name:"area", order:true}
                , {title:"수정", name:"button", defaultData:"Y",
                    filter:function(){return '<button onclick="clickTest()" class="btn btn-outline-primary btn-sm">수정</button>'}}
                , {title:"삭제", name:"button", defaultData:"Y",
                    filter:function(){return '<button onclick="clickTest()" class="btn btn-outline-danger btn-sm">삭제</button>'}}
            ],

            /** row클릭 이벤트가 필요할 때 넣어야합니다.   원하는 이벤트명으로 변경할 수 있습니다.   **/
            onRowClick: "onRowClick",
            /** pagingEl에 페이징 숫자를 넣을 공간에 담을 수 있습니다. 안담게 되면 null을 반환해서 생성하지 않습니다.**/
            pagingEl : '#pagingBlock',
            getParam : getParam
        };
        testGrid = new Grid("#testGrid", gridOption, "/test/testAjax");

    })
}

function getParam(){
    return {}
}
/** 그리드 검색 관련
 *
 *   searchGrid("안녕", "난 검색이야", "#testGrid");
 *   위와같은 형식의 함수 이벤트를 등록하세요
 *
 * **/

/**  row를 클릭하면 발생하는 이벤트입니다. obj로 해당 열에대한 tr을 가져오게 되는데 childNodes를 통해서 원하는 값을 가져온뒤
 *   controller에 파라미터를 넘기는 항목을 작성할 수 있습니다.  (onRowClick function 안에)
 *   ex. location.href = '../test/test?parkingNum=' +obj.childNodes[0].innerText;
 *   ex. ajaxCall('../test/test', { x: obj.childNodes[0].innerText }, callback, errorCallback, asyncType)
 *   cf. { x: obj.childNodes[0].innerText } 이부분은 post일때 JSON.stringify()로 파싱하기 위한 param명을 지정해줄수 있습니다.
 *   **/
function onRowClick(num , obj){
    console.log(obj.childNodes[0].innerText);
}

/** ajaxCall을 활용하는 방안에 관하여.... 팀원들의 이해를 돕기위해 남깁니다.
 *  작성자: 김청룡
 *  작성일: 22-03-11
 * **/

/** params에 대한 설명 : 밑과 같이 class로 params를 넘겨도 되구요 **/
let Rectangle = class Rectangle2 {
    constructor(height, width) {
        this.height = height;
        this.width = width;
    }
};
let test = new Rectangle("123", "345");

let example = new function() {
    this.ex= "ex";
    this.xe= 're';
}

/** 이런 형식으로 작성 해서 보내도 됩니다. **/
test = { "키": "값", "키": "값"};

if(testajax){
    /** 첫번째 파라미터에 요청 맵핑 주소를 넣어줍니다.
     *  두번째 파라미터에는 주소로 날릴 파라미터를 적어줍니다. (기본적으로 post 통신으로 되어있습니다)
     *  파라미터의 형식은 다음과 같습니다 params= { 키: 값, 키: 값, 키: 값};
     *  세번째 파라미터에는 통신결과후 값을 활용해 수행할 function을 작성해줍니다.**/
        ajaxCall("/test/ajaxCall", test, function (result) {

            /** 통신의 결과물을 function()안의 파라미터로 받아오게 됩니다. 이것을 data에 넣어줍니다. **/
            let data = result;
            if (data.result == 'fail') {
                alert('ajax 통신을 실패했습니다.')
            } else {
                alert('ajax통신을 성공했습니다.')
            }

        })
}




