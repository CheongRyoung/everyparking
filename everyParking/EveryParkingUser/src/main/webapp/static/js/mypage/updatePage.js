$("#submit").on("click", function(){
	if($("#user_pw").val()==""){
		alert("비밀번호를 입력해주세요.");
		$("#user_pw").focus();
		return false;
	}
	if($("#user_name").val()==""){
		alert("성명을 입력해주세요.");
		$("#user_name").focus();
		return false;
	}
});


function deleteUser(){
	var param = cmm.formToJson('form');
	ajaxCall("/mypage/myinfo/deleteInfo", param,  function(data){
		if(data.code == 'S'){
			location.href="/mypage/myinfo/goodBye"
		}else{
			alert(data.message);
		}
	})
	
	
}


