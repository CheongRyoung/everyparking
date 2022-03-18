let parkingRevise = {
    PARK_SEQ : null,
    PARK_INFO : {},  // null값인 상태
    step:0,
    init : function(PARK_SEQ){
        this.PARK_SEQ = PARK_SEQ;
        this.searchOneParkingZone();
    },
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
                        /* 리터럴템플릿 >(탭 위의키:백틱) `` 로 감싸면 js변수를 ${} 로 호출할 수 있습니다. */
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
        $('input[name=SEC_TYPE]').each(function(){
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

