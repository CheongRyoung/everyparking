<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0 pt-1"><i class="bi bi-arrow-left fs-5" onclick="history.back();"></i></div>
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
                        <img src="/img/testQnA.png" class="img-fluid">
                    </div>
                </div>

                <div class="row">
                    <div class="col" style="border-top: solid 3px #5865f2;"></div>
                </div>

                <dlv class="row mt-3">
                    <div class="col">
                        <h1 style="font-weight: bold;">${qna.QNA_TITLE }</h1>
                    </div>
                </dlv>
                <div class="row my-3">
                    <div class="col" style="font-size: 0.9rem;">
                        <span style="font-weight: bold;">작성자 </span>
                        <span>${qna.USER_NAME }</span>
                    </div>
                </div>
                
                <div class="row mb-3 mt-1">
                    <div class="col" style="font-size: 0.9rem;">
                    	<span style="font-weight: bold;">등록일 </span>
                        <span id = "dateJsp">${qna.REG_DATE}</span>
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
                <div class="row my-3">
                    <div class="col-5">
                        <a href="./list"><button class="cancelBtn">목록</button></a>
                    </div>
                    <div class="col d-flex justify-content-end">
	                <c:if test="${!empty qnaMove.QNA_NEXT}">                
	                    <a href="./reply?QNA_SEQ=${qnaMove.QNA_NEXT}"><button class="longBtn" style="width:5.5rem;margin-right:0.2rem;">이전글</button></a>
	                </c:if>    
	                <c:if test="${!empty qnaMove.QNA_PREV}">
	                    <a href="./reply?QNA_SEQ=${qnaMove.QNA_PREV}"><button class="longBtn" style="width:5.5rem;">다음글</button></a>
	                </c:if>
                    </div>
                </div>           
				<div class="row mt-3 mb-4 mx-0" style="border-bottom: 0.2rem solid #3E4AB8; height: 3rem;">
                    <div class="col align-self-center">
                        <span class="mainContentSubSubNg fs-5">답변 </span>
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
  
        	 	<c:if test="${!empty sessionUser }">
		            <div class="row pt-4">
		                <div class="col d-grid">
		                	<form action="/operation/QNA/insertComment" method="post" onsubmit="insertComment()">
		                	<input type="hidden" name="QNA_SEQ" value="${qna.QNA_SEQ}">
		                    <div class="input-group">
		                        <textarea name="QNAC_CONT" id="commentCont" rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
		                        <button type="submit" class="input-group-text" style="background-color: #EEEEEE;">댓글 입력</button>
		                    </div>
		                    </form>
		                </div>
		            </div>
		            <div class="row">
		         		<div class="col-9"></div>
		        		<div class="col">
			        		<span class="commentBtn" id="commentCount">0자</span>
			        		<span class="commentBtn" id="commentTotal">/40자</span>
		        		</div>
		       		</div>
		         </c:if>    
            </div>  
            </div>
        </div>
    </main>
</div>
<script type="text/javascript" src="/js/operation/qnaManage/qnaManage.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>