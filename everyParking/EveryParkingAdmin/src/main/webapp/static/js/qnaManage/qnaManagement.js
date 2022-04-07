var sessionInfo = null;	

let qnaManagement = {
	    gridOption:{},
	    grid : null,
	    initPage: function(){
	        let $this = this;
	        this.gridOption = {
	            cols : [
	                {title : "번호", name: "QNA_SEQ", type:"number", colWidth:"10", order: true},
	                {title : "문의 제목", name: "QNA_TITLE", filter:function(data, rowData, ridx, cidx, $this) {
	                	return `<a href="/qnaManage/readQnaPage?QNA_SEQ=` + rowData.QNA_SEQ + `">`+ escapeHtml(rowData.QNA_TITLE); +`</a>`}},
	                {title : "등록일", name: "REG_DATE", type:"date"},
	                {title : "문의 유형", name: "SUB_NAME", colWidth:"10"},
	                {title : "답변여부", name: "QNA_ANS", filter:function(data, rowData, ridx, cidx, $this) {
	                	if (rowData.QNA_ANS == 'Y') {
		                	return `<button class="btn btn-danger btn-sm" onclick="qnaManagement.updateQna(${ridx})">답변완료</button>`
						}
	                	return `<button class="btn btn-outline-primary btn-sm" onclick="qnaManagement.updateQna(${ridx})">답변하기</button>`
	                }, colWidth:"10"},
	            ],
	            pagingEl : '#pagingBlock4',
	            getParam : getParam
	        };
	        this.grid = new Grid("#qnaManageTable", $this.gridOption,"/qnaManage/selectListQna");
	    },
	    updateQna : function(ridx){
	    	let $this = this;
	    	let rowData = $this.grid.getRowData(ridx)
	    	var qnaUpdateModal = '';
	    		
	    		ajaxCall("/qnaManage/getQna?QNA_SEQ=" + rowData.QNA_SEQ , null, function(data){	    
	    		
	    		console.log("게시판");
	    		console.log(data);
	    		
				var dateFormater = data.data.REG_DATE;
				var dateForm = moment(dateFormater).format('YY-MM-DD HH:mm');
	    		
	    		if(data.data.QNA_CONT == undefined){
	    			data.data.QNA_CONT = '';
	    		}
	    		
		    	qnaUpdateModal = `
		    						<div class="modalStyle modal fade" id="qnaUpdateModal"
										data-bs-backdrop="show" data-bs-keyboard="false" tabindex="-1"
										aria-labelledby="staticBackdropLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content rounded shadow">
													<div class="modal-header" style = "background-color: #313a46; color:#fff; height: 100%">
														<div class="row">
															<div class="col px-0">
																<a class="nav-link active fs-3">문의 내역</a>
																<a class="nav-link fs-6">문의 내역을 확인해 주세요.</a>
															</div>
														</div>
													</div>
													<div class="modal-body">
													
											            <div class="row mt-4">
											                <div class="col">
											                    <h4 style="font-weight: bold;">`+ data.data.QNA_TITLE +`</h4>
											                </div>
											            </div>
											            <div class="row my-4">
											                <div class="col">
											                    <span style="font-weight: bold;">작성자 </span>
											                    <span>`+ data.data.USER_NAME +`</span>
											                    <span>|</span>
											                    <span style="font-weight: bold;">등록일 </span>
											                    <span>`+ dateForm +`</span>
											                    <span>|</span>
											                    <span style="font-weight: bold;">조회수 </span>
											                    <span>`+ data.data.QNA_COUNT +`</span>
											                </div>
											            </div>
											            <div class="row mt-2">
											                <div class="col"></div>
											            </div>
											            <div class="row my-3">
											                <div class="col mt-3" style="height: 180px;">
											                    `+ data.data.QNA_CONT +`
											                </div>
											            </div>
										                <div id="cmtList"></div>
												        <div class="row" id="cmtListDiv">
												        	<div class="col d-flex justify-content-end">
													        	<a href='javascript:void(0);' id="cmtBtn">
													        		<button class="btn btn-primary"><i class="bi bi-three-dots"></i></button>
													        	</a>
												        	</div>
												        </div>
												        <div id="cmtMore" style="display: none"></div>
												        <div id="cmtMoreDiv" class="row" style="display: none">
												        	<div class="col d-flex justify-content-end">
													        	<a href='javascript:void(0);' id="cmtBtnMore">
													        		<button class="btn btn-danger"><i class="bi bi-three-dots"></i></button>
													        	</a>
												        	</div>
												        </div>
													    <div class="row py-4">
											                <div class="col d-grid">
											                	<form action="/qnaManage/insertComment" method="post" onsubmit="insertComment()">
												                	<input type="hidden" name="QNA_SEQ" value="`+ data.data.QNA_SEQ +`">
												                    <div class="input-group">
												                        <textarea name="QNAC_CONT" id="qnacCont" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
												                        <button type="submit" class="input-group-text" style="background-color: white; border-left: none;">댓글 입력</button>
												                    </div>
											                    </form>
											                </div>
											            </div>																										
													</div>
													<div class="modal-footer" style="border: none;">	
											            <button type="button" class="modalBtn btn btn-secondar'y" style="background-color: #e0e0e0; color: #000;" data-bs-dismiss="modal">취소</button>
													</div>
											</div>
										</div>
									</div>
		    						`;
		    	
		    	$("#modalZone").empty();
		    	$("#modalZone").append(qnaUpdateModal);
		    	
		    	getCommentList(data.data.QNA_SEQ);		    	
		    	getQnaUpdateModal();
	    	
	    })
	}}	    

function getCommentList(nnn){
	
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
	var qnaNum;
	
	if (qnaSeq == null){
		qnaNum = nnn;
	} else {
		qnaNum = qnaSeq;
	}

	var cmt = "";
	var cmtList = "";
	var cmtUpdate = "";
	var cmtUpdateModal = "";
	var reply = "";
	var replyWidth = "";
	var replyIcon = "";
	var replyModal = "";

	
	ajaxCall("/qnaManage/getCommentList?QNA_SEQ=" + qnaNum, null,function(data){
		

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
									                  <textarea name="QNAC_CONT" id="updateCont`+data[i].QNAC_SEQ+`" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
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
					      <form action="/qnaManage/insertReply" method="post" onsubmit="insertReply(`+ data[i].QNAC_SEQ +`)">
					      <div class="modal-body">
				            <div class="row mb-3" style="padding-left: 12px;">
				               <div class="input-group">
								  <input type="hidden" name="QNA_SEQ" value="`+ data[i].QNA_SEQ +`">
				                  <input type="hidden" name="GQNA_NUM" value="`+ data[i].QNAC_SEQ +`">
				                  <input type="hidden" name="QNAC_SEQ" value="`+ data[i].QNAC_SEQ +`">
				                  <textarea name="QNAC_CONT" id="replyCont (`+ data[i].QNAC_SEQ +`)" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
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
                <div class="row my-2 pb-1" style="margin: 1px; border-bottom: 1px solid #EEEEEE;">
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
				                  <textarea name="QNAC_CONT" id="updateCont`+data[i].QNAC_SEQ+`" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
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
					      <form action="/qnaManage/insertReply" method="post" onsubmit="insertReply(`+ data[i].QNAC_SEQ +`)">
					      <div class="modal-body">
				            <div class="row mb-3" style="padding-left: 12px;">
				               <div class="input-group">
								  <input type="hidden" name="QNA_SEQ" value="`+ data[i].QNA_SEQ +`">
				                  <input type="hidden" name="GQNA_NUM" value="`+ data[i].QNAC_SEQ +`">
				                  <input type="hidden" name="QNAC_SEQ" value="`+ data[i].QNAC_SEQ +`">
				                  <textarea name="QNAC_CONT" id="replyCont(`+ data[i].QNAC_SEQ +`)" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
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
                <div class="row mb-2 pb-1" style="margin: 1px; border-bottom: 1px solid #EEEEEE;">
	                `+ reply +`
                    <div class="col">
                        <span class="commentContentNg">`+data[i].QNAC_CONT+`</span>
                        <div class="d-flex justify-content-end">
                        `+ replyIcon +`
   	                    `+ cmtUpdate +`
   	                    </div>
                    </div>
                </div>
                `+ cmtUpdateModal +`
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
				                  <textarea name="QNAC_CONT" id="updateCont`+data[i].QNAC_SEQ+`" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
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
				replyModal = `
					<div class="modal fade" id="replyModal`+ data[i].QNAC_SEQ +`" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="replyModalLabel">답글 입력</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <form action="/qnaManage/insertReply" onsubmit="insertReply(`+ data[i].QNAC_SEQ +`)" method="post">
					      <div class="modal-body">
				            <div class="row mb-3" style="padding-left: 12px;">
				               <div class="input-group">
								  <input type="hidden" name="QNA_SEQ" value="`+ data[i].QNA_SEQ +`">
				                  <input type="hidden" name="GQNA_NUM" value="`+ data[i].QNAC_SEQ +`">
				                  <input type="hidden" name="QNAC_SEQ" value="`+ data[i].QNAC_SEQ +`">
				                  <textarea name="QNAC_CONT" id="replyCont(`+ data[i].QNAC_SEQ +`)" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
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
                <div class="row mb-2 pb-1" style="margin: 1px; border-bottom: 1px solid #EEEEEE;">
	                `+ reply +`
                    <div class="col">
                        <span class="commentContentNg">`+data[i].QNAC_CONT+`</span>
                        <div class="d-flex justify-content-end">
                        `+ replyIcon +`
   	                    `+ cmtUpdate +`
   	                    </div>
                    </div>	                    
                </div>
                `+ cmtUpdateModal +`
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
	// 본문 수정 모달
	function getQnaUpdateModal(){
		$("#qnaUpdateModal").modal('show');
	}	
	
	
	function getParam(){
	    return {}
	}
		
	$(function(){
	    qnaManagement.initPage();
		getSessionInfo();
		getCommentList();
	    ajaxCall(
	    )
	})
	
	function insertComment(){
		
		let comment = document.getElementById("qnacCont").value;
		
		if ( comment == null || comment == "" ) {
			cmm.alert("내용을 입력해 주세요");
			event.preventDefault();
			return false;
		}
	}
	
	function updateComment(commentNum){
		
		var param = cmm.formToJson("#commentDetail" + commentNum);
		console.log(param)
		
		let comment = document.getElementById("updateCont" + commentNum).value;
		
		if ( comment == null || comment == "" ) {
			cmm.alert("내용을 입력해 주세요");
			event.preventDefault();
			return false;
		}
		
		ajaxCall("/qnaManage/updateComment", param, function(data){
				cmm.alert(data.message, function(){
					if (data.code == 'S') {
						location.reload();
					}
				})
			})
		}
	
	function deleteComment(commentNum){
		
		cmm.confirm('삭제', '삭제하시겠습니까', null, function(){
			ajaxCall("/qnaManage/deleteComment?QNAC_SEQ=" + commentNum, null, function(data){
				cmm.alert(data.message, function(){
					if (data.code == 'S') {
						location.reload();
					}
				})
			})
		}
	)};
	

		
///////////////////////////////////  세션 정보 가져오기  /////////////////////////////////////////////////////////////////////	
	
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
		xhr.open("get" , "/qnaManage/getSessionInfo" , false); //마지막 인자.. false 동기식인데.. 왠만하면 피하자..
		xhr.send();
	}
				