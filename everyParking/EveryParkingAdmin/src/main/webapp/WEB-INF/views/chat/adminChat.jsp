<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col mx-3">
	<!-- 실질적 내용 변경 구역-->
	<div class="row">
		<!-- top title-->
		<div class="col text-start">
			<h1 style="font-weight: bold;">
				실시간 문의
			</h1>
		</div>
	</div>
	
	<div class="row mt-3 mb-3 backgroundColorwhite adminBorder borderBottom" style="height: 650px; background-color:white;position: relative;margin:auto;">
		<div class="col px-0">	
   			<div class="row px-2" id="chatContentBox" style="height:80%;overflow:scroll;margin:auto;background-color:white;">
   				<div class="col" id="appendBox">
	    			
   				</div>
   			</div> 
   			<div class="row px-2" style="margin:auto;">
   				<div class="col-3 my-2" style="align-self: center">
   					<select id="reciverInput" name="CHAT_RECIV" class="form-select" aria-label="Default select example" style="line-height:20px">
   					<option value="">유저 선택</option>
   					<c:forEach items="${data.chatMemberList }" var="list">
					  <option value="${list.USER_SEQ}">${list.USER_MAIL }</option>
					 </c:forEach>
					</select>
   				</div>
   				<div class="col my-2" style="text-align: end;">
   					<i id="lockIcon" class="bi bi-lock fs-3" onclick="changeLock()"></i>
   				</div>
   			</div>
   			<div id="chatCommentBox" class="row px-2">
   				<div class="col">
   					<textarea id="commentInput" class="form-control sendBox" name="CHAT_CONT" rows="1" placeholder="답변할 내용을 입력해주세요." style="line-height:35px"></textarea>
   				</div>
   				<div class="col-2 ps-0 d-grid" style="align-self:center;height:45px;">
   					<button type="button" class="btn btn-warning" onclick="writeCommentProcess()">보내기</button>
   				</div>
   			</div>
		</div>
	</div>
</div>
<script src="/js/chat/adminChat.js"></script>