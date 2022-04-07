<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0 pt-1"><i class="bi bi-arrow-left fs-5" onclick="history.back();"></i></div>
            <div class="col px-0">
                <h5 class="title">채팅톡</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
    	<div class="row" style="height:100%">
    		<div class="col">
    			<div class="row" id="chatContentBox" style="height:67%;overflow:scroll;">
    				<div class="col" id="appendBox">
		    			
    				</div>
    			</div>
    			<div class="row my-2" style="margin:auto;">
    				<div class="col" style="text-align: right;">
    					<i class="bi bi-lock fs-3" id="lockIcon" onclick="changeLock()"></i>
    				</div>
    			</div>
    			<div class="row mb-2" id="chatCommentBox">
    				<div class="col my-1 py-1" >
    					<textarea id="commentInput" class="form-control sendBox" name="CHAT_CONT" rows="1"></textarea>
    				</div>
    				<div class="col-1 mx-1 me-3 p-0" style="align-self:center;">
    					<button type="submit" style="border: 0;outline: 0;background: none;" onclick="writeCommentProcess()"><i class="bi bi-send fs-2" style="cursor:pointer;"></i></button>
    				</div>
    			</div>
    		</div>
    	</div>
	</main>
</div>
<script type="text/javascript" src="/js/chat/chatting.js"></script>
