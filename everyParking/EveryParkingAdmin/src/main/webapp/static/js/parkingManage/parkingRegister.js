let parkingRevise = {
    PARK_SEQ : null,
    PARK_INFO : {},
    step:0,
//    init : function(PARK_SEQ){
//        this.PARK_SEQ = PARK_SEQ;
//        this.searchOneParkingZone();
//
//    },
   searchOneParkingZone:function(){
        let param = {
            PARK_SEQ : this.PARK_SEQ
        };
        let $this = this;
        ajaxCall("/parkingManage/selectOneParkingInfo", param, function(data){
            if(data.code == 'S') {
                console.log(data)
                $this.PARK_INFO = data.data;
                $this.sections = $this.PARK_INFO.sections;
                if($this.sections.length>0){
                    $this.sections.forEach((item, index)=>{
                        /* 리터럴템플릿 >(탭 위의키) `` 로 감싸면 js변수를 ${} 로 호출할 수 있습니다. */
                        $(`input[name=SEC_TYPE][value=${item.SEC_TYPE}]`).prop('checked', true);
                        $(`#SEC_TYPE_${item.SEC_TYPE} input[name=SEC_COUNT]`).val(item.SEC_COUNT);
                        $(`#SEC_TYPE_${item.SEC_TYPE} input[name=SEC_DIS]`).val(item.SEC_DIS);
                    });
                }
                cmm.jsonToForm($this.PARK_INFO, "#parkingInfoDetailForm");
            } else {
                cmm.alert(data.message);
            }
        })
    },
    chkSection : function(){
        $('input[name=SEC_TYPE]').each(function(){   /* $('input[name=SEC_TYPE]') => input요소에서 name이 'SEC_TYPE'인 것을 반복문(each) 돌려  'checked'속성이 있는지 확인 */
            if($(this).prop('checked')){
                $(`#SEC_TYPE_${this.value}`).show();
                $(`#SEC_TYPE_${this.value}`).find('input').prop('disabled',false);
            }else{
                $(`#SEC_TYPE_${this.value}`).hide();
                $(`#SEC_TYPE_${this.value}`).find('input').prop('disabled',true);
            }
        })
    },

    prevStep:function(){
        this.step--;
        $('.tab-content.active').removeClass('active');
        $(`.tab-content:eq(${this.step})`).addClass('active');
        this.chkSection();
    },
    nextStep:function(){
        this.step++;
        $('.tab-content.active').removeClass('active');
        $(`.tab-content:eq(${this.step})`).addClass('active');
        this.chkSection();
    },
    validForm:function(){
        console.log(cmm.formToJson('#parkingInfoDetailForm'))
        //TODO validate
        return true;
    }
    
}

/* 이미지 미리보기&숫자만 입력 
* 작성자 : 전지나
*/
const inputThumbnail = document.getElementById("inputThumbnail");
const thumbNail = document.getElementById("thumbNail");
function readImage(event) {
	  var urlsrc = URL.createObjectURL(event.target.files[0]);
	  thumbNail.src = urlsrc;
	  }
	inputThumbnail.addEventListener("change", readImage)
	
	
function onlyTimeNum(event){
	if(event.keyCode<48 || event.keyCode>57){
		event.returnValue=false;
        if(event.target.value < 0 || event.target.value > 24){
        	alert('1~24사이의 숫자만을 입력해주세요.');
        }
    }
}
/* 전지나 끝 */
