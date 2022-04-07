function validate(){
	if(!$('#agree').is(":disabled") && !$('#agree').is(":checked")){
		alert("동의하세요.");
		$("#agree").focus();
		return false;
	}
	
	if($("#user_pw").val()==""){
		alert("비밀번호를 입력해주세요.");
		$("#user_pw").focus();
		return false;
	}
	
    var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
    var result = regex.exec($("#user_pw").val());
    
    if(result == null){
		alert("8~20자리 / 영대소문자, 숫자, 특수문자 포함하여야합니다.");
		$("#user_pw").focus();
		return false;
    }
	
	if($("#user_name").val()==""){
		alert("성명을 입력해주세요.");
		$("#user_name").focus();
		return false;
	}
	return true;
}


function deleteUser(){
	cmm.confirm('회원 탈퇴', '정말로 탈퇴하시겠습니까?', null, function(){
		var param = cmm.formToJson('form');
		ajaxCall("/mypage/myinfo/deleteInfo", param,  function(data){
			if(data.code == 'S'){
				location.href="/mypage/myinfo/goodBye"
			}else{
				alert(data.message);
			}
		})
	});
}

const agreeBox = document.querySelector('#agree');   //동의박스
const dPerson = document.querySelector('input[value="RY02"]');  //장애박스
dPerson.addEventListener('change', e=> {
   if(agreeBox.disabled) {
      agreeBox.disabled = false;
      agreeBox.checked = '';
   } else {
      agreeBox.disabled = true;
      agreeBox.checked = '';
   }
})