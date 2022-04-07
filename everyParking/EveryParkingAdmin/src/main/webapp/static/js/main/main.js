const todayBuy = document.getElementById('today');
const yesterday = document.getElementById('yesterday');
const totalday = document.getElementById('totalday');
const qna = document.getElementById('qna');
const noti = document.getElementById('noti');
const flucToday = document.getElementById('flucToday');
const flucWeek = document.getElementById('flucWeek');

window.addEventListener('DOMContentLoaded', e => {
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if(xhr.readyState==4 && xhr.status==200) {
            const data = JSON.parse(xhr.responseText).data;
            todayBuy.innerText = data.tocn;
            yesterday.innerText = data.yecn;
            totalday.innerText = data.ttcn;
            flucTodayValue = isFinite((data.tocn - data.yecn) / data.yecn *100) ? ((data.tocn - data.yecn) / data.yecn *100) : 0;
            if(flucTodayValue < 0) {
                flucToday.classList.add('text-primary')
            } else {
                flucToday.classList.add('text-danger')
            }
            flucToday.innerText = `${flucTodayValue}%`;
            flucWeekValue = isFinite((data.ttcn - data.ttma) / data.ttma *100) ? ((data.ttcn - data.ttma) / data.ttma *100) : 0;
            if(flucWeekValue < 0) {
                flucWeek.classList.add('text-primary')
            } else {
                flucWeek.classList.add('text-danger')
            }
            flucWeek.innerText = `${flucWeekValue}%`;

            data.noti.forEach( (item, index) => {
                mainhtml = ``;
                mainhtml +=`<div class="row mt-1 ms-2 me-1 mb-2 borderBottom">`
                mainhtml +=`    <div class="col"><a href="/noticeManagement/readNoticePage?NOTI_SEQ=${item.NOTI_SEQ}">${item.NOTI_TITLE}</a></div>`
                mainhtml +=`    <div class="col text-end">${moment(item.REG_DATE).format('YYYY-MM-DD')}</div>`
                mainhtml +=`</div>`
                $("#noti").append(mainhtml);
            })
            data.qna.forEach( (item, index) => {
                mainhtml = ``;
                mainhtml +=`<div class="row mt-1 ms-2 me-1 mb-2 borderBottom">`
                mainhtml +=`    <div class="col"><a href="/qnaManage/readQnaPage?QNA_SEQ=${item.QNA_SEQ}">${item.QNA_TITLE}</a></div>`
                mainhtml +=`    <div class="col text-end">${moment(item.REG_DATE).format('YYYY-MM-DD')}</div>`
                mainhtml +=`</div>`
                $("#qna").append(mainhtml);
            })
        }
    }
    xhr.open("get", "/com/main");
    xhr.send();
})


