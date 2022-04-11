/**
 *  작성일: 2022-03-30
 *  작성자: 김청룡
 *  설명: user용 데이트타임 픽커
 * **/

const drawStartDateCus = document.getElementById('drawStartDateCus');
const drawStartHoursCus = document.getElementById('drawStartHoursCus');
const drawEndDateCus = document.getElementById('drawEndDateCus');
const drawEndHoursCus = document.getElementById('drawEndHoursCus');

let startDate;
let startHours;
let endDate;
let endHours;

const container = document.querySelector('.scrolly-container');
const yinner = document.querySelector('.yinner');
const customHours = document.querySelectorAll('.start');
const containerx = document.querySelector('.scrollx-container');
const xinner = document.querySelector('.xinner');
const WEEKDAY = ['일', '월', '화', '수', '목', '금', '토'];

// 한달 날짜 가져오기
let res_day = [];
let endResDay = [];
let today = new Date();
const afterMon = new Date(today.setMonth(today.getMonth() + 1));
today = new Date();
while (today.getTime() <= afterMon.getTime()) {
    res_day.push(today.getTime())
    today.setDate(today.getDate() + 1)
}
// 날짜 생성하기
res_day.forEach(e => {
    html = ``;
    html += `<div class="customDay startDay">`
    html += `    <label>`
    html += `        <input type="radio" name="startDay" style="display: none;" value="${moment(e).format('YYYY-MM-DD')}">`
    html += `        <p>${WEEKDAY[new Date(e).getDay()]}</p>`
    html += `        <p>${new Date(e).getDate()}</p>`
    html += `    </label>`
    html += `</div>`
    $('#startDate').append(html);
})


res_day.forEach(e => {
    html = ``;
    html += `<div class="customDay endDay">`
    html += `    <label>`
    html += `        <input type="radio" name="endDay" style="display: none;" value="${moment(e).format('YYYY-MM-DD')}">`
    html += `        <p>${WEEKDAY[new Date(e).getDay()]}</p>`
    html += `        <p>${new Date(e).getDate()}</p>`
    html += `    </label>`
    html += `</div>`
    $('#endDate').append(html);
})

const customDayStart = document.querySelectorAll('.startDay');
let startPos = 0;
let offset = 0;
let curPos = 0;
const cnWidth = customHours[0].clientHeight;

container.addEventListener('touchstart', (e) => {
    startPos = e.touches[0].pageY;  // 터치한 Y 좌표
});

container.addEventListener('touchmove', (e) => {
	e.stopPropagation();
    document.getElementById('customDatePicker').style.overflowY = "hidden";
    yinner.style.transitionDuration = '0ms';
    offset = curPos + (e.targetTouches[0].pageY - startPos); // 이동중인 x좌표
    yinner.style.transform = `translate3d(0px, ${offset}px, 0px)`;
    customHours.forEach(e => {
        if (e.classList.contains('selectcustomHour')) {
            e.classList.remove('selectcustomHour')
        }
    })
    let moveHours = Math.round(offset / cnWidth) * cnWidth
    if (moveHours <= -(cnWidth * (24 - 1))) {
        moveHours = -(cnWidth * (24 - 1))
    }
    if (moveHours >= 0) {
        moveHours = 0;
    }
    customHours[-(moveHours / cnWidth - 1)].classList.add('selectcustomHour');
});

container.addEventListener('touchend', (e) => {
    document.getElementById('customDatePicker').style.removeProperty('overflow-y')
    const sum = curPos + (e.changedTouches[0].pageY - startPos); //바낀 x좌표
    let finalX = Math.round(sum / cnWidth) * cnWidth;
// 0은 첫단 영역의 시작이다  이동될 수록 -
    if (finalX >= 0) {
        finalX = 0;
    }

// 끝단 영역보다 더 작으면 끝단으로
    else if (finalX <= -(cnWidth * (24 - 1))) {
        finalX = -(cnWidth * (24 - 1));
    }

    if (document.querySelector('input[name="startDay"]:checked')) {
        if (document.querySelector('input[name="startDay"]:checked').value == document.querySelectorAll('input[name="startDay"]')[0].value) {
            if (-(finalX / cnWidth ) <= new Date().getHours()) {
                finalX = (-(new Date().getHours())) * cnWidth;
            }
        }
    }
    let hoursIndex = -(finalX / cnWidth - 1) - 1;
    if (hoursIndex < 0) {
        hoursIndex = 0
    } else if (hoursIndex > customHours.length - 1) {
        hoursIndex = customHours.length - 1;
    }
    hoursIndex += 1;
    customHours.forEach(e => {
        if (e.classList.contains('selectcustomHour')) {
            e.classList.remove('selectcustomHour')
        }
    })
    customHours[hoursIndex].classList.add('selectcustomHour');
    yinner.style.transform = `translate3d(0px, ${finalX}px, 0px)`;
    yinner.style.transitionDuration = '300ms';
    curPos = finalX;
    startHours = (-(finalX / cnWidth )) /// 시간 값
    drawStartHoursCus.innerText = startHours + "시";
    if (startHours == 23 && startDate == endDate) {
        const indexNum = Array.from(document.querySelectorAll('input[name="startDay"]')).indexOf(document.querySelector('input[name="startDay"]:checked'))
        costomDayInputEnd[indexNum + 1].addEventListener('click', endDayPiclk(costomDayInputEnd[indexNum + 1])) // 다음날짜로 자동 픽킹
        costomDayInputEnd[indexNum + 1].setAttribute('checked', true); // radio 체크
    } else {
        if (startDate == endDate && startHours >= endHours) {
            endHourPick();
        }
    }
    caculateDateHours();
});

let startPosx = 0;
let offsetx = 0;
let curPosx = 0;
const cnWidthx = customDayStart[0].clientWidth;

containerx.addEventListener('touchstart', (e) => {
    startPosx = e.touches[0].pageX;  // 터치한 Y 좌표
});

containerx.addEventListener('touchmove', (e) => {
    xinner.style.transitionDuration = '0ms';
    offsetx = curPosx + (e.targetTouches[0].pageX - startPosx); // 이동중인 x좌표
    xinner.style.transform = `translate3d(${offsetx}px, 0px, 0px)`;
});

containerx.addEventListener('touchend', (e) => {
    const sum = curPosx + (e.changedTouches[0].pageX - startPosx); //바낀 x좌표
    let finalX = Math.round(sum / cnWidthx) * cnWidthx;
// 0은 첫단 영역의 시작이다  이동될 수록 -
    if (finalX >= 0) {
        finalX = 0;
    }

// 끝단 영역보다 더 작으면 끝단으로
    else if (finalX <= -(cnWidthx * (res_day.length - 1))) {
        finalX = -(cnWidthx * (res_day.length - 1));
    }
    xinner.style.transform = `translate3d(${finalX}px, 0px, 0px)`;
    xinner.style.transitionDuration = '300ms';
    curPosx = finalX;
});

const costomDayInput = document.querySelectorAll('input[name="startDay"]');
costomDayInput.forEach((e, index) => {
    e.addEventListener('click', e => {
        if (endDate != null && new Date(e.target.value) > new Date(endDate)) {
            costomDayInputEnd[index].addEventListener('click', endDayPiclk(costomDayInputEnd[index])) // 다음날짜로 자동 픽킹
            costomDayInput[index].checked = "checked";
        }
        if (e.target.value == endDate && startHours == 23) {
            costomDayInputEnd[index + 1].addEventListener('click', endDayPiclk(costomDayInputEnd[index + 1])) // 다음날짜로 자동 픽킹
            costomDayInputEnd[index + 1].checked = "checked";
        }
        customDayStart.forEach(e => {
            e.classList.remove('selectcustomDay');
        })
        e.target.parentNode.parentNode.classList.add('selectcustomDay');
        startDate = e.target.value;
        drawStartDateCus.innerText = moment(startDate).format('MM-DD');
        if (startHours >= endHours && startDate == endDate) {
            endHourPick();
        }
        if (startHours < new Date().getHours()+1 && startDate == document.querySelectorAll('input[name="startDay"]')[0].value) {
            containerx.addEventListener('touchend', startHourPick(e))
        }
        caculateDateHours()
    })
})
// 종료시간 관련 변수

let endStartPos = 0;
let endOffset = 0;
let endCurPos = 0;
let endStartPosx = 0;
let endOffsetx = 0;
let endCurPosx = 0;

const containerEnd = document.querySelector('#endTimeBoxY');
const yinnerEnd = document.querySelector('#endHours');
const containerxEnd = document.querySelector('#endTimeBoxX');
const xinnerEnd = document.getElementById('endDate');
const customHoursEnd = document.querySelectorAll('.end');

containerEnd.addEventListener('touchstart', (e) => {
    endStartPos = e.touches[0].pageY;  // 터치한 Y 좌표
});

containerEnd.addEventListener('touchmove', (e) => {
	e.stopPropagation();
    document.getElementById('customDatePicker').style.overflowY = "hidden";
    yinnerEnd.style.transitionDuration = '0ms';
    endOffset = endCurPos + (e.targetTouches[0].pageY - endStartPos); // 이동중인 x좌표
    yinnerEnd.style.transform = `translate3d(0px, ${endOffset}px, 0px)`;
    customHoursEnd.forEach(e => {
        if (e.classList.contains('selectcustomHour')) {
            e.classList.remove('selectcustomHour')
        }
    })
    let moveHours = Math.round(endOffset / cnWidth) * cnWidth
    if (moveHours <= -(cnWidth * (24 - 1))) {
        moveHours = -(cnWidth * (24 - 1))
    }
    if (moveHours >= 0) {
        moveHours = 0;
    }
    customHoursEnd[-(moveHours / cnWidth - 1)].classList.add('selectcustomHour');
});

containerEnd.addEventListener('touchend', (e) => {
    const sum = endCurPos + (e.changedTouches[0].pageY - endStartPos); //바낀 x좌표
    let finalX = Math.round(sum / cnWidth) * cnWidth;
// 0은 첫단 영역의 시작이다  이동될 수록 -
    if (finalX >= 0) {
        finalX = 0;
    }

// 끝단 영역보다 더 작으면 끝단으로
    else if (finalX <= -(cnWidth * (24 - 1))) {
        finalX = -(cnWidth * (24 - 1));
    }

    if (document.querySelector('input[name="endDay"]:checked')) {
        if (startHours != null && startDate != null && endDate != null && startDate == endDate) {
            if ((finalX == 0 ? 0 : -(finalX / cnWidth - 1)) <= startHours+1) {
                finalX = (-(startHours)-1) * cnWidth;
            }
        }
    }
    customHoursEnd.forEach(e => {
        if (e.classList.contains('selectcustomHour')) {
            e.classList.remove('selectcustomHour')
        }
    })
    let hoursIndex = -(finalX / cnWidth - 1) - 1;
    if (hoursIndex < 0) {
        hoursIndex = 0
    } else if (hoursIndex > customHoursEnd.length - 1) {
        hoursIndex = customHoursEnd.length - 1;
    }
    hoursIndex += 1;
    customHoursEnd[hoursIndex].classList.add('selectcustomHour');
    yinnerEnd.style.transform = `translate3d(0px, ${finalX}px, 0px)`;
    yinnerEnd.style.transitionDuration = '300ms';
    endCurPos = finalX;
    endHours = (-(finalX / cnWidth )) /// 시간 값
    drawEndHoursCus.innerText = endHours + "시";
    document.getElementById('customDatePicker').style.removeProperty('overflow-y')
    caculateDateHours()
});

containerxEnd.addEventListener('touchstart', (e) => {
    endStartPosx = e.touches[0].pageX;  // 터치한 Y 좌표
});

containerxEnd.addEventListener('touchmove', (e) => {
    xinnerEnd.style.transitionDuration = '0ms';
    endOffsetx = endCurPosx + (e.targetTouches[0].pageX - endStartPosx); // 이동중인 x좌표
    xinnerEnd.style.transform = `translate3d(${endOffsetx}px, 0px, 0px)`;
});

containerxEnd.addEventListener('touchend', (e) => {
    const sum = endCurPosx + (e.changedTouches[0].pageX - endStartPosx); //바낀 x좌표
    let finalX = Math.round(sum / cnWidthx) * cnWidthx;
// 0은 첫단 영역의 시작이다  이동될 수록 -
    if (finalX >= 0) {
        finalX = 0;
    }

// 끝단 영역보다 더 작으면 끝단으로
    else if (finalX <= -(cnWidthx * (res_day.length - 1))) {
        finalX = -(cnWidthx * (res_day.length - 1));
    }
    xinnerEnd.style.transform = `translate3d(${finalX}px, 0px, 0px)`;
    xinnerEnd.style.transitionDuration = '300ms';
    endCurPosx = finalX;
});
const customDayEnd = document.querySelectorAll('.endDay');
const costomDayInputEnd = document.querySelectorAll('input[name="endDay"]');
costomDayInputEnd.forEach((e, index) => {
    e.addEventListener('click', e => {
        if (startDate != null && new Date(e.target.value) < new Date(startDate)) {
            costomDayInput[index].addEventListener('click', startDayPick(costomDayInput[index]))
            costomDayInput[index].checked = "checked";
            startHourPick()
        }
        if (e.target.value == startDate && startHours == 23) {
            costomDayInputEnd[index + 1].addEventListener('click', endDayPiclk(costomDayInputEnd[index + 1])) // 다음날짜로 자동 픽킹
            costomDayInputEnd[index + 1].checked = "checked";
            return false;
        }
        customDayEnd.forEach(e => {
            e.classList.remove('selectcustomDay');
        })
        e.target.parentNode.parentNode.classList.add('selectcustomDay');
        endDate = e.target.value;
        drawEndDateCus.innerText = moment(endDate).format('MM-DD');
        if (startHours >= endHours && startDate == endDate) {
            endHourPick();
        }
        caculateDateHours()
    })
})


window.addEventListener('DOMContentLoaded', e => {
    costomDayInput[0].addEventListener('click', startDayPick(costomDayInput[0])) // 현재날짜로 자동 픽킹
    costomDayInput[0].checked = "checked";
    costomDayInputEnd[0].addEventListener('click', endDayPiclk(costomDayInputEnd[1])) // 다음날짜로 자동 픽킹
    costomDayInputEnd[1].checked = "checked";
    containerx.addEventListener('touchend', startHourPick(e)); // 기본 한시인데 오늘날짜면 현재시간 +1
    containerEnd.addEventListener('touchend', endHourPick(e)); // 상동
    caculateDateHours();
})

function startDayPick(e) {
    if (endDate != null && new Date(e.value) > new Date(endDate)) {
        alert("종료시간 보다 뒤에 올 수 없습니다")
        return false;
    }
    customDayStart.forEach(e => {
        e.classList.remove('selectcustomDay');
    })
    e.parentNode.parentNode.classList.add('selectcustomDay');
    startDate = e.value;
    drawStartDateCus.innerText = moment(startDate).format('MM-DD');;
    if (startHours < new Date().getHours()+1 && startDate == document.querySelectorAll('input[name="startDay"]')[0].value) {
        containerx.addEventListener('touchend', startHourPick())
    }
}

function endDayPiclk(e) {
    if (startDate != null && new Date(e.value) < new Date(startDate)) {
        alert("시작시간 보다 앞에 올 수 없습니다")
        return false;
    }
    customDayEnd.forEach(e => {
        e.classList.remove('selectcustomDay');
    })
    e.parentNode.parentNode.classList.add('selectcustomDay');
    endDate = e.value;
    drawEndDateCus.innerText = moment(endDate).format('MM-DD');
}

function startHourPick(e) {
    let finalX = 0;
    if (document.querySelector('input[name="startDay"]:checked')) {
        if (document.querySelector('input[name="startDay"]:checked').value == document.querySelectorAll('input[name="startDay"]')[0].value) {
            if (-(finalX / cnWidth - 1) <= new Date().getHours()) {
                finalX = (-(new Date().getHours())) * cnWidth;
            }
        }
    }
    let hoursIndex = -(finalX / cnWidth - 1) - 1;
    if (hoursIndex < 0) {
        hoursIndex = 0
    } else if (hoursIndex > customHours.length - 1) {
        hoursIndex = customHours.length - 1;
    }
    customHours.forEach(e => {
        if (e.classList.contains('selectcustomHour')) {
            e.classList.remove('selectcustomHour')
        }
    })
    hoursIndex += 1;
    customHours[hoursIndex].classList.add('selectcustomHour');
    yinner.style.transform = `translate3d(0px, ${finalX}px, 0px)`;
    yinner.style.transitionDuration = '300ms';
    curPos = finalX;
    startHours = (-(finalX / cnWidth )) /// 시간 값
    drawStartHoursCus.innerText = startHours + "시";
}

function endHourPick(e) {
    let finalX = 0;
    if (document.querySelector('input[name="endDay"]:checked')) {
        if (startHours != null && startDate != null && endDate != null && startDate == endDate) {
            if ((finalX == 0 ? 0 : -(finalX / cnWidth - 1)) <= startHours) {
                finalX = (-(startHours)-1) * cnWidth;
            }
        }
    }
    let hoursIndex = -(finalX / cnWidth - 1) - 1;
    if (hoursIndex < 0) {
        hoursIndex = 0
    } else if (hoursIndex > customHoursEnd.length - 1) {
        hoursIndex = customHoursEnd.length - 1;
    }
    customHoursEnd.forEach(e => {
        if (e.classList.contains('selectcustomHour')) {
            e.classList.remove('selectcustomHour')
        }
    })
    hoursIndex += 1;
    customHoursEnd[hoursIndex].classList.add('selectcustomHour');
    yinnerEnd.style.transform = `translate3d(0px, ${finalX}px, 0px)`;
    yinnerEnd.style.transitionDuration = '300ms';
    endCurPos = finalX;
    endHours = (-(finalX / cnWidth )) /// 시간 값
    drawEndHoursCus.innerText = endHours + "시";
}

const resultHours = document.getElementById('resultHours');

function caculateDateHours() {
    if (startDate, startHours, endDate, endHours != null) {
    	
    	let startString = startDate + " ";
    	if(startHours < 10){
    		startString += "0";
    	}
    	
    	startString += (startHours + ":00");
    	
    	let endString = endDate + " ";
    	if(endHours < 10){
    		endString += "0";
    	}

    	endString += (endHours + ":00");
    	
    	
        const finalstartdate = new Date(moment(startString));
        const finalendDate = new Date(moment(endString));
        const resultDate = finalendDate - finalstartdate;
        resultHours.innerText = resultDate / (1000 * 60 * 60) + "시간";
        reservationDate.value = `${startDate} ${startHours<10 ? "0"+startHours : startHours}시 ~ ${endDate} ${endHours < 10 ? "0"+endHours : endHours}시`;
    }
}