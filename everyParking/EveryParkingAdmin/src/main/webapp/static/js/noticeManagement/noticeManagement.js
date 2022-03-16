/**
 * 03/14 종화 작성
 */

const writeEditor = document.getElementById('writeEditor');

if(writeEditor){
    let editor;

    ClassicEditor
        .create( document.querySelector( '#writeEditor' ) , {
            ckfinder: {
                uploadUrl: '/admin/test/imageUpload'
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
        
        const notiTitle = document.getElementById("notititle").value;
        console.log(typeof(notiTitle));
        
        var xhr = new XMLHttpRequest();
        
        xhr.onreadystatechange = function() {
            if(xhr.readyState==4&&xhr.status==200) {
            	
            }
        }
        xhr.open("post", "../noticeManagement/uploadTest", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
        xhr.send("editorData=" + editorData + "&notiTitle=" + notiTitle);
    }
  
    function updateData() {
        const editorData = editor.getData();
        console.log(typeof(editorData));
        
        const updateTitle = document.getElementById("notititle").value;
        console.log(typeof(updateTitle));
        
        
        var xhr = new XMLHttpRequest();
        
        xhr.onreadystatechange = function() {
            if(xhr.readyState==4&&xhr.status==200) {
            	
            }
        }

        xhr.open("post", "../noticeManagement/updateNoti", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
        xhr.send("editorData=" + editorData + "&notiTitle=" + updateTitle);
    }
}

let noticeManagement = {
	    gridOption:{},
	    grid : null,
	    initPage: function(){
	        let $this = this;
	        this.gridOption = {
	            cols : [
	                {title : "번호", name: "NOTI_SEQ", type:"number", colWidth:"10", order: true},
	                {title : "공지사항 제목", name: "NOTI_TITLE", colWidth:"20" },
	                {title : "작성자", name: "USER_SEQ", colWidth:"10"},
	                {title : "등록일", name: "REG_DATE", colWidth:"10"},
	                {title : "수정", name: "modify", filter:function(data, rowData, ridx, cidx, $this){
	                    return `<a href="/noticeManagement/noticeUpdateForm?NOTI_SEQ=${rowData.NOTI_SEQ}" class="btn btn-outline-primary btn-sm">수정</a>`
	                }, colWidth:"10"},
	                {title : "삭제", name: "NOTI_SEQ", filter:function(data, rowData, ridx, cidx, $this) {
	                    return `<a class="btn btn-outline-danger btn-sm" onclick="cmm.confirm('삭제', '삭제하시겠습니까', 'notice', ${rowData.NOTI_SEQ})">삭제</a>`
	                }, colWidth:"10"},
	            ],
	            pagingEl : '#pagingBlock3',
	            getParam : getParam
	        };
	        this.grid = new Grid("#noticeManageTable", $this.gridOption,"/noticeManagement/selectListNoti");
	    }
	}
	function getParam(){
	    return {}
	}

	$(function(){
	    noticeManagement.initPage();
	    // alert, comfirm .. > cmm.alert()
	    // cmm.confirm


	    // cmm

	    // cmm.attachComma() >> 숫자 포맷 (콤마)
	    // cmm.formToJson()
	    // cmm.jsonToForm()
	    ajaxCall(

	    )
	})
