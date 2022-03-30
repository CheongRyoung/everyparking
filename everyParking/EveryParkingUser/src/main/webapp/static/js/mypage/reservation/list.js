/**
 * 
 */

let list = {
	page : 1,
	selectReservationList: function(page){
		if(!page){
			page = 1;
		}
		this.page = page;
		
		let type = Number($('.activeBox').attr('id').replace("type_", ""));
		let $target = $(`.section:eq(${type-1})`);
		let params = {
				PAGING_YN : 'Y'
				, START  : (this.page-1)* 10 
				, CNT :10
				, ORDER : "RESE_START"
				, ORDER_TYPE :"DESC"
				, type : type
		}
		$target.empty();
		ajaxCall("/mypage/reservation/selectListReservation", params, function(data){
			if(data.code == 'S'){
				let html = '';
				data.list.forEach((item, idx )=>{
					html += `<div class="row mt-2 mb-3 mx-2 pt-2 usageBox">`;
					html += `    <div class="col">`;
					html += `        <div class="row">`;
					html += `            <div class="col parkingSpot pe-0">${item.PARK_NAME}`;
					html += `                <span onclick="doShowAddress(this)" class="open"><i class="bi bi-chevron-down"></i></span>`;
					html += `                <div class="addressInfo"><p><i class="bi bi-map"></i>서울 강남구 밤고개로 99</p></div>`;
					html += `            </div>`;
					html += `            <div class="col p-0">`;
					html += `                <span class="reviewState">결제일 | 2022.02.20</span>`;
					html += `            </div>`;
					html += `        </div>`;
					html += `        <div class="row mt-2">`;
					html += `            <div class="col">`;
					html += `                <div class="row">`;
					html += `                    <div class="col">`;
					html += `                        <span class="carNo">예약차량번호</span>`;
					html += `                    </div>`;
					html += `                </div>`;
					html += `                <div class="row">`;
					html += `                    <div class="col">`;
					html += `                        <span class="carNo">${item.RESE_CAR_NO}</span>`;
					html += `                    </div>`;
					html += `                </div>`;
					html += `            </div>`;
					html += `            <div class="col-1 p-1 text-center" style="margin-top: 3px;">`;
					html += `                <img src="/img/seline.svg" class="img-fluid" style="height: 30px;">`;
					html += `            </div>`;
					html += `            <div class="col usageTime text-start p-0">`;
					html += `                <div class="row">`;
					html += `                    <div class="col">`;
					html += `                        ${moment(item.RESE_START).format("MM-DD hh:mm")}`;
					html += `                    </div>`;
					html += `                </div>`;
					html += `                <div class="row">`;
					html += `                    <div class="col">`;
					html += `                         ${ moment(item.RESE_END).format("MM-DD hh:mm") }`;
					html += `                    </div>`;
					html += `                </div>`;
					html += `            </div>`;
					html += `        </div>`;
					html += `        <div class="row mt-3" style="border-top : solid 1px rgba(0, 0, 0, 11%);">`;
					html += `            <div class="col buyDate d-grid p-0" style="border-right: rgba(0, 0, 0, 11%) solid 1px;">`;
					if(item.USE_YN == 'Y'){
						html += `                <button class="btn" onclick="list.cancelReservation(${item.RESE_SEQ})">예약취소</button>`;
					} else {
						html += `				<button class="btn" style="color:red;">취소완료</button>`;
					}
					html += `            </div>`;
					html += `        </div>`;
					html += `    </div>`;
					html += `</div>`;
				})
				$target.html(html);
			}else{
				cmm.alert(data.message);
			}
		})
	},
	tabChangeEvent:function(){
		this.selectReservationList(1);
	},	
	reSearch: function(){
		this.selectReservationList(this.page);		
	},
	cancelReservation: function(RESE_SEQ){
		let $this = this;
		let params = {RESE_SEQ:RESE_SEQ} 
		ajaxCall("/mypage/reservation/cancelReservation", params, function(data){
			cmm.alert(data.message, function(){
				$this.reSearch();
			});
			
		})
		
	}
}

$(function(){
	list.selectReservationList(1);
})