let qnaManagement = {
	    gridOption:{},
	    grid : null,
	    initPage: function(){
	        let $this = this;
	        this.gridOption = {
	            cols : [
	                {title : "번호", name: "QNA_SEQ", type:"number", colWidth:"10", order: true},
	                {title : "문의 제목", name: "QNA_TITLE"},
	                {title : "문의 내용", name: "QNA_CONT"},
	                {title : "등록일", name: "REG_DATE", type:"date"},
	                {title : "상태", name: "QNA_TYPE", colWidth:"10"},
	                {title : "답변여부", name: "QNA_SEQ", filter:function(data, rowData, ridx, cidx, $this) {
	                	return `<a href = "/qnaManage/readQnaPage?QNA_SEQ=${rowData.QNA_SEQ}" class="btn btn-outline-primary btn-sm">답변하기</a>`
	                }, colWidth:"10"},
	            ],
	            pagingEl : '#pagingBlock4',
	            getParam : getParam
	        };
	        this.grid = new Grid("#qnaManageTable", $this.gridOption,"/qnaManage/selectListQna");
	    },
	}
	function getParam(){
	    return {}
	}

	$(function(){
	    qnaManagement.initPage();
	    // alert, comfirm .. > cmm.alert()
	    // cmm.confirm


	    // cmm

	    // cmm.attachComma() >> 숫자 포맷 (콤마)
	    // cmm.formToJson()
	    // cmm.jsonToForm()
	    ajaxCall(

	    )
	})

//	function writeComment{
//		
//		
//		ajaxCall("/qnaManage/writeComment", param, function(data){
//			cmm.alert(data.message, function(){
//				if(data.code=='S'){
//					location.href="/qnaManage/readQnaPage?QNA_SEQ=${rowData.QNA_SEQ}"
//				}
//			})
//		})
//	}