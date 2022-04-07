window.addEventListener('DOMContentLoaded', e=> {
	var body = document.querySelector('body');
	body.classList.add('scrollNonBox');
	refreshComment();
	setInterval(refreshComment, 3000);
	
});


var scrollLock = false;
var lastChatSeq = 0;


function writeCommentProcess(){
	
	var commentInput = document.getElementById("commentInput");
	if(commentInput.value == ""){
		alert("댓글을 입력해주세요.");
		return;
	} else{
		var commentValue = commentInput.value;
	}
	
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){ 
		   var data = JSON.parse(xhr.responseText);
		   
		   commentInput.value = "";
		   refreshComment();
		}
	};
	
	xhr.open("post", "./writeCommentProcess", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("CHAT_CONT=" + commentValue);
}



function refreshComment(){
	
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){ 
		   var data = JSON.parse(xhr.responseText);
			
		   
		   
			var firstColBox = document.getElementById("appendBox");
			//chatContentBox.innerHTML = "";

			for(chatData of data.chatList){
				
				lastChatSeq = chatData.CHAT_SEQ; 
				
				if(chatData.CHAT_SENDE == data.USER_SEQ) {
					
					
					var userChatRowBox = document.createElement("div");
					userChatRowBox.setAttribute("class", "row my-3");
					userChatRowBox.setAttribute("style", "margin:auto");
					firstColBox.appendChild(userChatRowBox);
					
					var userChatColBox = document.createElement("div");
					userChatColBox.setAttribute("class", "col-8 ms-auto");
					userChatColBox.setAttribute("style", "width:fit-content;");
					userChatRowBox.appendChild(userChatColBox);
					
					// 채팅 내용
					var contentInfoBox = document.createElement("div");
					contentInfoBox.setAttribute("class", "row py-1 ms-auto");
					contentInfoBox.setAttribute("style", "width:fit-content");
					userChatColBox.appendChild(contentInfoBox);
					var contentDate = document.createElement("div");
					contentDate.setAttribute("class", "col chatDate");
					if(chatData.CHAT_AMPM == 'AM'){
						contentDate.innerText = "오전 " + chatData.CHAT_TIME;
					} else {
						contentDate.innerText = "오후 " + chatData.CHAT_TIME;
					}
					contentInfoBox.appendChild(contentDate);
					var contentTextBox = document.createElement("div");
					contentTextBox.setAttribute("class", "col py-2 contentUserBox");
					contentTextBox.setAttribute("style", "background-color:#3E4AB8;color:white");
					contentTextBox.innerText = chatData.CHAT_CONT;
					contentInfoBox.appendChild(contentTextBox);
				
				} else {
					// 관리자 채팅 내역	
					var adminCommentRowBox = document.createElement("div");
					adminCommentRowBox.setAttribute("class", "row my-3");
					adminCommentRowBox.setAttribute("style", "margin:auto");
					firstColBox.appendChild(adminCommentRowBox);
					
					var adminCommentColBox = document.createElement("div");
					adminCommentColBox.setAttribute("class", "col-8 me-auto");
					adminCommentRowBox.appendChild(adminCommentColBox);
					
					var adminInfoBox = document.createElement("div");
					adminInfoBox.setAttribute("class", "row");
					adminCommentColBox.appendChild(adminInfoBox);
					
					var adminTextBox = document.createElement("div");
					adminTextBox.setAttribute("class", "col idBox");
					adminTextBox.innerText = "관리자";
					adminInfoBox.appendChild(adminTextBox);
					
					var adminContentBox = document.createElement("div");
					adminContentBox.setAttribute("class", "row py-1");
					adminContentBox.setAttribute("style", "width:fit-content;flex-flow:row");
					adminCommentColBox.appendChild(adminContentBox);
					
					var adminContentText = document.createElement("div");
					adminContentText.setAttribute("class", "col py-2 contentBox");
					adminContentText.innerText = chatData.CHAT_CONT;
					adminContentBox.appendChild(adminContentText);
					var adminDate = document.createElement("div");
					adminDate.setAttribute("class", "col chatDate");
					if(chatData.CHAT_AMPM == 'AM'){
						adminDate.innerText = "오전 " + chatData.CHAT_TIME;
					} else {
						adminDate.innerText = "오후 " + chatData.CHAT_TIME;
					}
					adminContentBox.appendChild(adminDate);
				}
			}
			
			if(!scrollLock){ 
				// 해당 부분의 전체 페이지를 맨 아래로 스크롤하려는 경우, 
				chatContentBox.scrollTop = chatContentBox.scrollHeight;
			}
		}
	};
	xhr.open("get","./getChatListByOneUser?lastChatSeq="+lastChatSeq, true);
	xhr.send();
}


function changeLock(){
	
	var lockIcon = document.getElementById("lockIcon");
	
	if(lockIcon.classList.contains('bi-lock')){
		lockIcon.classList.remove('bi-lock');
		lockIcon.classList.add('bi-unlock');
		scrollLock = false;
	} else {
		lockIcon.classList.remove('bi-unlock');
		lockIcon.classList.add('bi-lock');		
		scrollLock = true;
	}
}
