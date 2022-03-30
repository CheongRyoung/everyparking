<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5" style="color:white;"></i></div>
            <div class="col px-0">
                <h5 class="title">문의 사항</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
        <!-- 수정 해야되는 부분-->
        <div class="row" style="margin-top: auto;">
            <div class="col">
                <div class="row">
                    <div class="col p-0">
                        <img src="../../img/qna.png" class="img-fluid">
                    </div>
                </div>

                <div class="row">
                    <div class="col" style="border-top: solid 3px #1187cf;"></div>
                </div>

                <dlv class="row mt-3">
                    <div class="col">
                        <h4 style="font-weight: bold;">${qna.QNA_TITLE }</h4>
                    </div>
                </dlv>
                <div class="row my-3">
                    <div class="col" style="font-size: 12px;">
                        <span style="font-weight: bold;">작성자 </span>
                        <span>${qna.USER_NAME}</span>
                        <span>|</span>
                        <span style="font-weight: bold;">등록일 </span>
                        <span>${qna.REG_DATE}</span>
                        <span>|</span>
                        <span style="font-weight: bold;">조회수 </span>
                        <span>${qna.QNA_COUNT}</span>
                    </div>
                </div>
			<c:if test="${!empty sessionUser && sessionUser.USER_SEQ == qna.USER_SEQ }">             
                <div class="row">
                 <div class="col">
                    <a onclick="deleteQna(${qna.QNA_SEQ})"><i class="bi bi-trash ms-2" style="float: right;"></i></a>
                    <a href="./updateQnaForm?QNA_SEQ=${qna.QNA_SEQ}"><i class="bi bi-pencil" style="float: right;"></i></a>
                 </div>
                </div>
            </c:if>
                <div class="row mt-2">
                    <div class="col" style="border-top: solid 1px #a6a6a6;"></div>
                </div>

                <div class="row" style="height: 200px;">
                    <div class="col mt-3">
                        ${qna.QNA_CONT}
                    </div>
                </div>
                <div class="row my-4">
                    <div class="col-5">
                        <a href="./list"><button class="cancelBtn btn btn-primary" style="width: 80px;">목록</button></a>
                    </div>
                    <div class="col d-flex justify-content-end">
	                <c:if test="${!empty qnaMove.QNA_NEXT}">                
	                    <a href="./reply?QNA_SEQ=${qnaMove.QNA_NEXT}"><button class="insertBtn btn btn-outline-primary">이전글</button></a>
	                </c:if>    
	                <c:if test="${!empty qnaMove.QNA_PREV}">
	                    <a href="./reply?QNA_SEQ=${qnaMove.QNA_PREV}"><button class="insertBtn btn btn-outline-primary">다음글</button></a>
	                </c:if>
                    </div>
                </div>
                


		<c:forEach items="${commentList }" var="comment">	
                <div class="row mt-2" style="margin: 1px;">
                    <div class="col d-flex justify-content-between">
                        <span class="mainContentSubSubNg">${comment.USER_NAME }</span>
                        <span class="mainContentSubSubNg">${comment.REG_DATE }</span>
                    </div>
                </div>
                <div class="row mb-2 pb-1" style="margin: 1px; border-bottom: 1px solid #EEEEEE;">
                    <div class="col">
                        <span class="commentContentNg">${comment.QNAC_CONT }</span>
                    </div>
                <c:if test="${!empty sessionUser && sessionUser.USER_SEQ == comment.USER_SEQ }">
                	<div class="col d-flex justify-content-end">
                        <a class="commentBtn" data-bs-toggle="modal" data-bs-target="#exampleModal${comment.QNAC_SEQ }"><i class="bi bi-pencil-square"></i></a>
                        <a class="commentBtn" onclick ="deleteComment(${comment.QNAC_SEQ })"><i class="bi bi-trash-fill"></i></a>
                    </div>
                </c:if>
                </div>
            <div class="modal fade" id="exampleModal${comment.QNAC_SEQ }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <form id="commentDetail${comment.QNAC_SEQ }">
			      <div class="modal-body">
		            <div class="row mb-3" style="padding-left: 12px;">
		               <div class="input-group">
		                  <input type="hidden" name="QNAC_SEQ" value="${comment.QNAC_SEQ}">
		                  <textarea name="QNAC_CONT" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
		               </div>                
		            </div>            
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary" onclick="updateComment(${comment.QNAC_SEQ})">수정</button>
			      </div>
			      </form>
			    </div>
			  </div>
			</div>
        </c:forEach>
            <div class="row py-4">
                <div class="col d-grid">
                	<form action="/operation/QNA/insertComment" method="post" onsubmit="insertComment()">
                	<input type="hidden" name="QNA_SEQ" value="${qna.QNA_SEQ}">
                    <div class="input-group">
                        <textarea name="QNAC_CONT" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
                        <button type="submit" class="input-group-text" style="background-color: white; border-left: none;">댓글 입력</button>
                    </div>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </main>
</div>
<script type="text/javascript" src="/js/operation/qnaManage/qnaManage.js"></script>
