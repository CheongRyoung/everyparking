function frmCheck() {                                                                                                                                                                             
if ($("#checkPw").val() == "") {                                                                                                                                                                 
alert("비밀번호를 입력해주세요.");                                                                                                                                                            
$("#checkPw").focus();                                                                                                                                                                         
return false;                                                                                                                                                                                 
} 
if ($("#checkPw"))
$("#form1").submit();                                                                                                                                                                       
}                                                                                                                                                                                                 

/* TODO > 입력받은 패스워드로 암호화 한값을 + SESSION의 로그인된 아이디와 함께  =  DB값과 비교 = > 그결과가 1건이상일때 다음화면으로 이동*/