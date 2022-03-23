const reservationBox = document.getElementById('reservationBox');

window.onload = () => {
    if(reservationBox) {
        showMyList('PAST_DAY');
    }
}

function showMyList(choose) {
    var date = new Date();
    if(choose == 'PAST_DAY') {
        url = '/mypage/review/pastHistory';
        params = {'PAST_DAY' : moment(date).format("YYYY-MM-DD")}
    } else if(choose == 'CURRENT_DAY'){
        url = '/mypage/review/currentHistory';
        params = {'CURRENT_DAY' : moment(date).format("YYYY-MM-DD")}
    } else if(choose == 'STATE_NAME') {
        url = '/mypage/review/cancleHistory';
        params = {'STATE_NAME' : moment(date).format("YYYY-MM-DD")}
    }
    ajaxCall(url, params, function(data) {
        if(data.code == 'F') {
            cmm.alert("데이터를 받아오지 못했습니다.")
        } else {
            reservationBox.innerHTML = ``;
            var list = data.list;
            for(item of list) {
                let PASTHTML = ``;
                PASTHTML += `<div class="row mt-2 mb-3 mx-2 py-2 usageBox">`;
                PASTHTML += `    <div class="col">`;
                PASTHTML += `        <div class="row">`;
                PASTHTML += `            <div class="col parkingSpot">${item.PARK_NAME}`;
                PASTHTML += `                <span onClick="doShowAddress(this)"><i class="bi bi-chevron-down"></i></span>`;
                PASTHTML += `                <span class="carNo">(${item.RESE_CAR_NO})</span>`;
                PASTHTML += `                <div class="addressInfo"><p><i class="bi bi-map"></i>${item.PARK_ADDR1}</p></div>`;
                PASTHTML += `            </div>`;
                PASTHTML += `            <div class="col">`;
                PASTHTML += `                <h6 class="reviewState">${item.REV_SEQ != null ? '후기 작성 완료' : '후기 미작성'}</h6>`;
                PASTHTML += `            </div>`;
                PASTHTML += `        </div>`;
                PASTHTML += `        <div class="row">`;
                PASTHTML += `            <div class="col usageTime">${moment(item.RESE_START).format("YYYY-MM-DD HH")} ~ ${moment(item.RESE_END).format("YYYY-MM-DD HH")}</div>`;
                PASTHTML += `        </div>`;
                PASTHTML += `        <div class="row pt-1">`;
                PASTHTML += `            <div class="col buyDate">구매일 | ${moment(item.REG_DATE).format("YYYY-MM-DD HH")}</div>`;
                PASTHTML += `        </div>`;
                PASTHTML += `    </div>`;
                PASTHTML += `</div>`;
                $("#reservationBox").append(PASTHTML);
            }
        }
    })
}