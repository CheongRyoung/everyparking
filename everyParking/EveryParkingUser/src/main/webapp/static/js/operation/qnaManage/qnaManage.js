let sessionInfo;
//qna 생성 수정 삭제

function uploadData() {
	
	let editorData = editor.getData();
	$('input[name=editorData]').val(editorData);
	
	var typeData = document.getElementById("type");
	var type = typeData.options[typeData.selectedIndex].value;
	
	let qnaTitle = document.getElementsByName("QNA_TITLE")[0].value;
	
	if ( editorData==null || editorData=="" ) {
		cmm.alert("본문을 입력해 주세요");
		event.preventDefault();
		return false; 
	}
		
	if ( qnaTitle==null || qnaTitle=="" ) {
		cmm.alert("제목을 입력해 주세요");
		event.preventDefault();
		return false;
	}
	
	if ( type == "" || type == "문의 유형을 선택해주세요." || type == null) {
		cmm.alert("올바른 유형을 선택해 주세요");
		event.preventDefault();
		return false;
	}
	

}

function updateData() {
	
	let editorData = editor.getData();

	var typeData = document.getElementById("type");
	var type = typeData.options[typeData.selectedIndex].value;
	
	let qnaTitle = document.getElementsByName("QNA_TITLE")[0].value;
	
	if ( editorData==null || editorData=="" ) {
		cmm.alert("본문을 입력해 주세요");
		return false;
	}
	
	if ( qnaTitle==null || qnaTitle=="" ) {
		cmm.alert("제목을 입력해 주세요");
		return false;
	}
	
	if ( type == "" || type == "문의 유형을 선택해주세요." || type == null) {
		cmm.alert("올바른 유형을 선택해 주세요");
		return false;
	}

	let param = cmm.formToJson("#qnaDetail");
	param.editorData = editorData;
	
	ajaxCall("/operation/QNA/updateQna", param, function(data){
		cmm.alert(data.message, function(){
			if (data.code == 'S') {
				location.href="/operation/QNA/list"
			}
		})
	})

}
	function deleteQna(qnaNum){
		cmm.confirm('삭제', '삭제하시겠습니까', null, function(){
			ajaxCall("/operation/QNA/deleteQna?QNA_SEQ=" + qnaNum, null, function(data){
				cmm.alert(data.message, function(){
					if (data.code == 'S') {
						location.href="/operation/QNA/list"
					}
				})
			})
		}
	)		
}


// qna 출력	
	
let qnaManage = {
	    gridOption:{},
	    grid : null,
	    initPage: function(){
	        let $this = this;
	        this.gridOption = {
	            cols : [
	            	{title : "No", name:"QNA_SEQ", colWidth:"5", order: true},
	                {title : "제목", name: "QNA_TITLE", colWidth:"40", filter:function(data, rowData, ridx, cidx, $this) {
	                	return escapeHtml(rowData.QNA_TITLE);
	                }},
	                {title : "유형", name: "SUB_NAME",},
	                {title : "날짜", name: "REG_DATE", type:"date", colWidth:"18"},
	                {title : "답변", name: "QNA_ANS",  filter:function(data, rowData, ridx, cidx, $this) {
	                	if (rowData.QNA_ANS == 'Y') {
		                	return `<a href = "/operation/QNA/reply?QNA_SEQ=${rowData.QNA_SEQ}" class="btn btn-danger btn-sm"><i class="bi bi-check-lg"></i></a>`
						}
	                	return `<a href = "/operation/QNA/reply?QNA_SEQ=${rowData.QNA_SEQ}" class="btn btn-sm" style="border:0.05rem solid #3E4AB8;"><i class="bi bi-question-lg" style="color:#3E4AB8;"></i></a>`
	                }, colWidth:"5"}
	            ],
	            onRowClick: "onRowClick",
	            pagingEl : '#pagingBlock4',
	            getParam : getParam
	        };
	        this.grid = new Grid("#qnaManageTable", $this.gridOption,"../QNA/selectListQna");
	    },
	}

	function getParam(){
	    return {}
	}

	function onRowClick(num, obj){
		location.href = "/operation/QNA/reply?QNA_SEQ="+ obj.childNodes[0].innerText;
		qnaSeq = obj.childNodes[0].innerText;
		console.log(qnaSeq);
}

// 댓글 입력 수정 삭제
	
	function insertComment(){
		
		let comment = document.getElementById("commentCont").value;
		
		if ( comment==null || comment=="" ) {
			cmm.alert("내용을 입력해 주세요");
			event.preventDefault();
			return false;
		}
		
		if (comment.length >= 40){
			cmm.alert("댓글은 한글 20자, 영어40자 까지 가능합니다.(특수기호 포함)");
			event.preventDefault();
			return false;
		}
	}
	
	function insertReply(commentNum){
		
		let comment = document.getElementById("replyCont" + commentNum).value;
		
		if ( comment == null || comment == "") {
			cmm.alert("내용을 입력해 주세요");
			event.preventDefault();
			return false;
		}
		
		if (comment.length >= 40){
			cmm.alert("댓글은 한글 20자, 영어40자 까지 가능합니다.(특수기호 포함)");
			event.preventDefault();
			return false;
		}
	}



	function updateComment(commentNum){
		
		var param = cmm.formToJson("#commentDetail" + commentNum);
		console.log(param)
				
		if (param.QNAC_CONT == null || param.QNAC_CONT == '' ){

			cmm.alert("내용을 입력해 주세요");
			event.preventDefault();
			return false;

		}
		
		if (param.QNAC_CONT.length >= 40){

			cmm.alert("40자 이내로 입력해 주세요");
			event.preventDefault();
			return false;

		}

		ajaxCall("/operation/QNA/updateComment", param, function(data){
				cmm.alert(data.message, function(){
					if (data.code == 'S') {
						location.reload();
					}
				})
			})
		}

	function deleteComment(commentNum){
		cmm.confirm('삭제', '삭제하시겠습니까', null, function(){
			ajaxCall("/operation/QNA/deleteComment?QNAC_SEQ=" + commentNum, null, function(data){
				cmm.alert(data.message, function(){
					if (data.code == 'S') {
						location.reload();
					}
				})
			})
		}
	)}
	
	// 댓글 출력	
	function getCommentList(){
		
		$("#cmtBtn").click(function(){
			$("#cmtMore").css("display","");
			$("#cmtMoreDiv").css("display","");
			$("#cmtBtn").css("display","none");
			$("#cmtListDiv").css("display","none");
		})
		
		$("#cmtBtnMore").click(function(){
			$("#cmtMore").css("display","none");
			$("#cmtMoreDiv").css("display","none");
			$("#cmtBtn").css("display","");
			$("#cmtListDiv").css("display","");

		})

		let ttt = new URL(window.location.href);
		const urlParams = ttt.searchParams;
		let qnaSeq = urlParams.get("QNA_SEQ");

		var cmt = "";
		var cmtList = "";
		var cmtUpdate = "";
		var cmtUpdateModal = "";
		var reply = "";
		var replyWidth = "";
		var replyIcon = "";
		var replyModal = "";

		
		ajaxCall("/operation/QNA/getCommentList?QNA_SEQ=" + qnaSeq, null,function(data){

			// 댓글이 4개 이상일 때와 이하일 때를 구분해 놓았습니다.
			if(data.length <= 4){
				
				$("#cmtBtn").css("display","none");
							
			for (var i = 0; i < data.length; i++) {
				console.log(data);		
				// 시간 출력 설정
				var dateFormat = data[i].REG_DATE;
				var date = moment(dateFormat).format('YY-MM-DD HH:mm');
				
				// 수정,삭제 작성 부분
				if (sessionInfo != undefined && sessionInfo.userName == data[i].USER_NAME) {				
					cmtUpdate = `
			                        <a class="commentBtn" onclick ="updateModal(`+ data[i].QNAC_SEQ +`)"><i class="bi bi-pencil-square"></i></a>
			                        <a class="commentBtn" onclick ="deleteComment(`+ data[i].QNAC_SEQ +`)"><i class="bi bi-trash-fill"></i></a>
	                        	`;
					cmtUpdateModal = `
											<div class="modal fade" id="updateModal`+ data[i].QNAC_SEQ +`" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="updateModalLabel">댓글 수정</h5>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <form id="commentDetail`+ data[i].QNAC_SEQ +`">
											      <div class="modal-body">
										            <div class="row mb-3" style="padding-left: 12px;">
										               <div class="input-group">
										                  <input type="hidden" name="QNAC_SEQ" value="`+ data[i].QNAC_SEQ +`">
										                  <textarea name="QNAC_CONT" id="updateCont" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
										               </div>                
										            </div>            
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
											        <button type="button" class="btn btn-primary" onclick="updateComment(`+ data[i].QNAC_SEQ +`)">수정</button>
											      </div>
											      </form>
											    </div>
											  </div>
											</div>

									 `;
					
				} else{
					cmtUpdate = "";
					cmtUpdateModal = "";
				}
				// 대댓글 위치 잡기
				if (data[i].GQNA_DEP == 1) {
					reply = `<div class = "col-1">
								<a class = "commentBtn"><i class="bi bi-arrow-return-right"></i></a>
							 </div>`;
					replyWidth = `<div class = "col-1">
								  </div>`;
				} else {
					reply = "";
					replyWidth = "";
				}
				
				//대댓글 작성 링크
				if (sessionInfo != undefined) {
					replyIcon = `<a class = "commentBtn" onclick="replyModal(`+ data[i].QNAC_SEQ +`)"><i class="bi bi-pencil"></i><a>`;
					replyModal = `
						<div class="modal fade" id="replyModal`+ data[i].QNAC_SEQ +`" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="replyModalLabel">답글 입력</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <form action="/operation/QNA/insertReply" method="post" onsubmit="insertReply(`+ data[i].QNAC_SEQ +`)">
						      <div class="modal-body">
					            <div class="row mb-3" style="padding-left: 12px;">
					               <div class="input-group">
									  <input type="hidden" name="QNA_SEQ" value="`+ data[i].QNA_SEQ +`">
					                  <input type="hidden" name="GQNA_NUM" value="`+ data[i].QNAC_SEQ +`">
					                  <input type="hidden" name="QNAC_SEQ" value="`+ data[i].QNAC_SEQ +`">
					                  <textarea name="QNAC_CONT" id="replyCont `+ data[i].QNAC_SEQ +`" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
					               </div>                
					            </div>            
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						        <button type="submit" class="btn btn-primary">작성 완료</button>
						      </div>
						      </form>
						    </div>
						  </div>
						</div>					
					`;
				} else {
					replyIcon = "";
					replyModal = "";
				}
				
				// 댓글 메인 출력 부분
				cmt += `
	                <div class="row mt-2" style="margin: 1px;">
	                `+ replyWidth +`	                
	                    <div class="col d-flex justify-content-between">
	                        <span class="mainContentSubSubNg">`+data[i].USER_NAME+`</span>
	                        <span class="mainContentSubSubNg">`+ date +`</span>
	                    </div>
	                </div>
	                <div class="row my-2 pb-1" style="margin: 1px;">
  	                `+ reply +`
	                    <div class="col">
	                        <span class="commentContentNg">`+data[i].QNAC_CONT+`</span>
	                        <div class="d-flex justify-content-end">
	                        `+ replyIcon +`
       	                    `+ cmtUpdate +`
       	                    </div>
	                    </div>
	                </div>
	                `+cmtUpdateModal+`
	                `+ replyModal +`
				`;
			}

		} 
		// 4개 이상일 때
		else {
			for (var i = 0; i < 4; i++) {
				// 시간 출력 설정
				var dateFormat = data[i].REG_DATE;
				var date = moment(dateFormat).format('YY-MM-DD HH:mm');

				// 수정,삭제 작성 부분
				if (sessionInfo != undefined && sessionInfo.userName == data[i].USER_NAME) {
					cmtUpdate = `
			                        <a class="commentBtn" onclick ="updateModal(`+ data[i].QNAC_SEQ +`)"><i class="bi bi-pencil-square"></i></a>
			                        <a class="commentBtn" onclick ="deleteComment(`+ data[i].QNAC_SEQ +`)"><i class="bi bi-trash-fill"></i></a>
	                        	`;
					cmtUpdateModal = `
						<div class="modal fade" id="updateModal`+ data[i].QNAC_SEQ +`" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="updateModalLabel">댓글 수정</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <form id="commentDetail`+ data[i].QNAC_SEQ +`">
						      <div class="modal-body">
					            <div class="row mb-3" style="padding-left: 12px;">
					               <div class="input-group">
					                  <input type="hidden" name="QNAC_SEQ" value="`+ data[i].QNAC_SEQ +`">
					                  <textarea name="QNAC_CONT" id="updateCont" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
					               </div>                
					            </div>            
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						        <button type="button" class="btn btn-primary" onclick="updateComment(`+ data[i].QNAC_SEQ +`)">수정</button>
						      </div>
						      </form>
						    </div>
						  </div>
						</div>

				 `;
				} else {
					cmtUpdate = "";
					cmtUpdateModal = "";
				}
				// 대댓글 위치 잡기
				if (data[i].GQNA_DEP == 1) {
					reply = `<div class = "col-1">
								<a class = "commentBtn"><i class="bi bi-arrow-return-right"></i></a>
							 </div>`;
					replyWidth = `<div class = "col-1">
								  </div>`;
				} else {
					reply = "";
					replyWidth = "";
				}
				
				//대댓글 작성 링크
				if (sessionInfo != undefined) {
				replyIcon = `<a class = "commentBtn" onclick = "replyModal(`+ data[i].QNAC_SEQ +`)"><i class="bi bi-pencil"></i><a>`;
					replyModal = `
						<div class="modal fade" id="replyModal`+ data[i].QNAC_SEQ +`" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="replyModalLabel">답글 입력</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <form action="/operation/QNA/insertReply" method="post" onsubmit="insertReply(`+ data[i].QNAC_SEQ +`)">
						      <div class="modal-body">
					            <div class="row mb-3" style="padding-left: 12px;">
					               <div class="input-group">
									  <input type="hidden" name="QNA_SEQ" value="`+ data[i].QNA_SEQ +`">
					                  <input type="hidden" name="GQNA_NUM" value="`+ data[i].QNAC_SEQ +`">
					                  <input type="hidden" name="QNAC_SEQ" value="`+ data[i].QNAC_SEQ +`">
					                  <textarea name="QNAC_CONT" id="replyCont`+ data[i].QNAC_SEQ +`" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
					               </div>                
					            </div>            
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						        <button type="submit" class="btn btn-primary">작성 완료</button>
						      </div>
						      </form>
						    </div>
						  </div>
						</div>					
					`;
				} else {
					replyIcon = "";
					replyModal = "";
				}
				
				// 댓글 메인 출력 부분
				cmt += `
	                <div class="row mt-2" style="margin: 1px;">
	                `+ replyWidth +`	                
	                    <div class="col d-flex justify-content-between">
	                        <span class="mainContentSubSubNg">`+data[i].USER_NAME+`</span>
	                        <span class="mainContentSubSubNg">`+ date +`</span>
	                    </div>
	                </div>
	                <div class="row my-2 pb-1" style="margin: 1px;">
  	                `+ reply +`
	                    <div class="col">
	                        <span class="commentContentNg">`+data[i].QNAC_CONT+`</span>
	                        <div class="d-flex justify-content-end">
	                        `+ replyIcon +`
       	                    `+ cmtUpdate +`
       	                    </div>
	                    </div>
	                </div>
	                `+cmtUpdateModal+`
	                `+ replyModal +`
				`;
			}
			
			// 4개 이상인 경우 더보기 누르면 출력됩니다.
			for(var i = 4; i < data.length; i++){
				
				var dateFormat = data[i].REG_DATE;
				var date = moment(dateFormat).format('YY-MM-DD HH:mm');

				// 수정,삭제 작성 부분
				if (sessionInfo != undefined && sessionInfo.userName == data[i].USER_NAME) {
					cmtUpdate = `
			                        <a class="commentBtn" onclick ="updateModal(`+ data[i].QNAC_SEQ +`)"><i class="bi bi-pencil-square"></i></a>
			                        <a class="commentBtn" onclick ="deleteComment(`+ data[i].QNAC_SEQ +`)"><i class="bi bi-trash-fill"></i></a>
	                        	`;
					cmtUpdateModal = `
						<div class="modal fade" id="updateModal`+ data[i].QNAC_SEQ +`" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="updateModalLabel">댓글 수정</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <form id="commentDetail`+ data[i].QNAC_SEQ +`">
						      <div class="modal-body">
					            <div class="row mb-3" style="padding-left: 12px;">
					               <div class="input-group">
					                  <input type="hidden" name="QNAC_SEQ" value="`+ data[i].QNAC_SEQ +`">
					                  <textarea name="QNAC_CONT" id="updateCont" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
					               </div>                
					            </div>            
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						        <button type="button" class="btn btn-primary" onclick="updateComment(`+ data[i].QNAC_SEQ +`)">수정</button>
						      </div>
						      </form>
						    </div>
						  </div>
						</div>

				 `;
				} else {
					cmtUpdate = "";
					cmtUpdateModal = "";
				}
				// 대댓글 위치 잡기
				if (data[i].GQNA_DEP == 1) {
					reply = `<div class = "col-1">
								<a class = "commentBtn"><i class="bi bi-arrow-return-right"></i></a>
							 </div>`;
					replyWidth = `<div class = "col-1">
								  </div>`;
				} else {
					reply = "";
					replyWidth = "";
				}
				
				//대댓글 작성 링크
				if (sessionInfo != undefined) {
					replyIcon = `<a class = "commentBtn" onclick ="replyModal(`+ data[i].QNAC_SEQ +`)"><i class="bi bi-pencil"></i><a>`;
					replyModal =`
						<div class="modal fade" id="replyModal`+ data[i].QNAC_SEQ +`" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="replyModalLabel">답글 입력</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <form action="/operation/QNA/insertReply" method="post" onsubmit="insertReply(`+ data[i].QNAC_SEQ +`)">
						      <div class="modal-body">
					            <div class="row mb-3" style="padding-left: 12px;">
					               <div class="input-group">
									  <input type="hidden" name="QNA_SEQ" value="`+ data[i].QNA_SEQ +`">
					                  <input type="hidden" name="GQNA_NUM" value="`+ data[i].QNAC_SEQ +`">
					                  <input type="hidden" name="QNAC_SEQ" value="`+ data[i].QNAC_SEQ +`">
					                  <textarea name="QNAC_CONT" id="replyCont`+ data[i].QNAC_SEQ +`" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
					               </div>                
					            </div>            
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						        <button type="submit" class="btn btn-primary">작성 완료</button>
						      </div>
						      </form>
						    </div>
						  </div>
						</div>					
					`;
				} else {
					replyIcon = "";
					replyModal = "";
				}
				
				// 댓글 메인 출력 부분
				cmtList += `
	                <div class="row mt-2" style="margin: 1px;">
	                `+ replyWidth +`	                
	                    <div class="col d-flex justify-content-between">
	                        <span class="mainContentSubSubNg">`+data[i].USER_NAME+`</span>
	                        <span class="mainContentSubSubNg">`+ date +`</span>
	                    </div>
	                </div>
	                <div class="row my-2 pb-1" style="margin: 1px;">
  	                `+ reply +`
	                    <div class="col">
	                        <span class="commentContentNg">`+data[i].QNAC_CONT+`</span>
	                        <div class="d-flex justify-content-end">
	                        `+ replyIcon +`
       	                    `+ cmtUpdate +`
       	                    </div>
	                    </div>
	                </div>
	                `+cmtUpdateModal+`
	                `+ replyModal +`
				`;
				
			}
		}
			$("#cmtList").empty();
			$("#cmtList").append(cmt);	
			
			$("#cmtMore").empty();
			$("#cmtMore").append(cmtList);

		})
	}	

	// 업데이트 모달
	function updateModal(commentNum){
		$("#updateModal" + commentNum).modal('show');
	}
	// 답글 모달
	function replyModal(commentNum){
		$("#replyModal" + commentNum).modal('show');
	}

	
	
//세션 정보 가져오기 
function getSessionInfo(){
	
	var xhr = new XMLHttpRequest();
	
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = JSON.parse(xhr.responseText);
			
			if(data.result != 'empty'){
				sessionInfo = {
					userNo : data.userNo,
					userName : data.userName
				};
			}
		}
	};
	xhr.open("get" , "../QNA/getSessionInfo" , false); //마지막 인자.. false 동기식인데.. 왠만하면 피하자..
	xhr.send();
}

//qna 정보 가져오기

$(function(){
	getSessionInfo();
	console.log(sessionInfo);
	
	dateJspForm();
    qnaManage.initPage();
    getCommentList();
    console.log(escapeHtml(`"<a class = "commentBtn"><i class="bi bi-arrow-return-right"></i></a>"`));
})

function dateJspForm(){
	try{
		var date = document.getElementById("dateJsp").value;		
	}
	catch{
		return;
	}
	var dateForm = moment(date).format('YY-MM-DD HH:mm');
	
	$("#dateJsp").empty();
	$("#dateJsp").append(dateForm);	
}

$('#commentCont').keyup(function(e){
	let content = $(this).val();
	
	if (content.length == 0 || content == '') {
		$('#commentCount').text('0자'); 
	} else {
		$('#commentCount').text(content.length + '자'); 
	} 
	if (content.length > 40) {
		$(this).val($(this).val().substring(0, 40)); 
		alert('글자수는 40자까지 입력 가능합니다.'); 
	}
})