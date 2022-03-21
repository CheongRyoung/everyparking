

window.onload = function(){
    const blockParkSelect = document.querySelector('.inputPlusSelectBox');
    const blockParkDate = document.querySelector('.drp-selected');
    const blockFormData = document.getElementById('blockFormData');
    const applyBtn = document.querySelector('.applyBtn');

    function getSectionInfo() {
        if(blockFormData){
            var params = {'PARK_SEQ': blockParkSelect.value, "daterange": blockParkDate.value};
            params.PARK_SEQ = blockParkSelect.value;
            params.daterange = blockParkDate.innerText;
            ajaxCall('/parkingBlock/getSectionInfo', params, function(data) {
                var secList = data.list;
                $("#selectSection").html("");
                secList.forEach((item, index) => {
                    if(item.SEC_COUNT - item.SEC_USE <= 0) {
                        let SEChtml = ``;
                        SEChtml += `<div class="row mb-1">`;
                        SEChtml += `    <div class="col">`;
                        SEChtml += `        <p> ${item.SUB_NAME}</p>`;
                        SEChtml += `    </div>`;
                        SEChtml += `    <div class="col">`;
                        SEChtml += `        <p>만차입니다</p>`;
                        SEChtml += `    </div>`;
                        SEChtml += `</div>`;
                        $("#selectSection").append(SEChtml);
                    } else {
                        let SEChtml = ``;
                        SEChtml += `<div class="row mb-1">`;
                        SEChtml += `    <div class="col">`;
                        SEChtml += `        <input type="radio" value=${item.SEC_SEQ} name="SEC_SEQ" id="SEC_SEQ"> ${item.SUB_NAME}`;
                        SEChtml += `    </div>`;
                        SEChtml += `    <div class="col">`;
                        SEChtml += `        <select  class="form-select"  name="INSERT_COUNT" id="INSERT_COUNT">`;
                        for(let i=1; i<=(item.SEC_COUNT - item.SEC_USE); i++) {
                            SEChtml += `<option value=${i}> ${i} 칸 </option>`;
                        }
                        SEChtml += `</select>`;
                        SEChtml += `    </div>`;
                        SEChtml += `</div>`;
                        $("#selectSection").append(SEChtml);
                    }
                })
            });
        }
    }
    applyBtn.addEventListener('click', getSectionInfo);
};

function blockRegister() {
    if(!document.querySelector('input[name="SEC_SEQ"]')) {
        cmm.confirm("확인", "구역을 선택해주시거나 만차시 다른 시간을 선택해주세요");
        return false;
    }

    if(!document.querySelector('input[name="SEC_SEQ"]').checked) {
        cmm.confirm("확인", "구역을 선택해주시거나 만차시 다른 시간을 선택해주세요");
        return false;
    }
    if(document.querySelector('textarea').value.length == 0) {
        cmm.confirm("확인", "사유를 작성해주세요");
        return false;
    }
    let params = new FormData(blockFormData);
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if(xhr.readyState==4 && xhr.status==200) {
            let data = JSON.parse(xhr.responseText);
            if(data.code == "S") {
                cmm.alert("저장에 성공했습니다.", function() {
                    location.href = '/parkingBlock/parkingBlock';
                })
            } else {
                cmm.alert("예약이 존재합니다. 다시 확인해주세요");
            }
        }
    }
    xhr.open('post', '/parkingBlock/insertBlock');
    // xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send(params);
}