<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5" onclick="history.back();"></i></div>
            <div class="col px-0">
                <h5 class="title">공지 사항</h5>
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
                        <img src="/img/testNoti.png" class="img-fluid">
                    </div>
                </div>

                <div class="row">
                    <div class="col" style="border-top: solid 3px #3E4AB8;"></div>
                </div>

                <dlv class="row mt-3">
                    <div class="col">
                        <h1 style="font-weight: bold;">${noti.NOTI_TITLE }</h1>
                    </div>
                </dlv>

                <div class="row my-3">
                    <div class="col" style="font-size: 0.9rem;">
                        <span style="font-weight: bold;">작성자 </span>
                        <span>${noti.USER_NAME }</span>
                    </div>
                </div>
                <div class="row mb-3 mt-1">
                    <div class="col" style="font-size: 0.9rem;">
                        <span style="font-weight: bold;">등록일 </span>
                        <span id = "dateJsp">${noti.REG_DATE }</span>
                        <span>|</span>
                        <span style="font-weight: bold;">조회수 </span>
                        <span>${noti.NOTI_COUNT }</span>
                    </div>
                    <div class="col-2">
		                <c:if test="${!empty noti.FILE_SEQ}">                    
		                    <a href="/downloadFile/${noti.FILE_SEQ}"><button class="btn downloadBtn"><i class="bi bi-download"></i></button></a>
	                    </c:if>                                
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col" style="border-top: solid 1px #a6a6a6;"></div>
                </div>

                <div class="row">
                    <div class="col mt-3" id="readEditorBox">
						<textarea id="readEditor">${noti.NOTI_CONT }</textarea>
                    </div>
                </div>

                <div class="row my-4">
                    <div class="col">
                        <a href="./list"><button class="cancelBtn btn btn-primary" style="width: 5rem; border-radius:0.5rem; border: none; height: 2.5rem;">목록</button></a>
                    </div>
                    <div class="col d-flex justify-content-end">
		                <c:if test="${!empty move.NOTI_NEXT}">                
		                    <a href="./content?NOTI_SEQ=${move.NOTI_NEXT}"><button class="longBtn" style="width: 5rem; margin-right:0.2rem;">이전글</button></a>
		                </c:if>    
		                <c:if test="${!empty move.NOTI_PREV}">
		                    <a href="./content?NOTI_SEQ=${move.NOTI_PREV}"><button class="longBtn" style="width: 5rem;">다음글</button></a>
		                </c:if>
	                    </div>
                </div>

            </div>
        </div>
    </main>
</div>
<script type="text/javascript" src="/js/operation/noticeManage/noticeManage.js"></script>

