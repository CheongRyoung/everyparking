//비밀번호 유효성검사
$("#inputPw").on("input",function(){
    var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
    var result = regex.exec($("#inputPw").val());
    
    if(result != null){
        $(".pw.regex").html("");
    }else{
        $(".pw.regex").html("8~20자리 / 영대소문자, 숫자, 특수문자 포함하여야합니다.");
        $(".pw.regex").css("color","red");
    }
});
    
//비밀번호 확인    
$("#inputPwConfirm").on("keyup",function(){
        if($("#inputPw").val()==$("#inputPwConfirm").val()){
        $(".pwConfirm.regex").html("비밀번호가 일치합니다");
        $(".pwConfirm.regex").css("color","blue");
        }else{
        $(".pwConfirm.regex").html("비밀번호가 일치하지않습니다");
        $(".pwConfirm.regex").css("color","red");
        }
});
    
//이름 유효성검사
$("#inputName").on("input",function(){
    var regex = /^[가-힣a-zA-Z]+$/;
    var result = regex.exec($("#inputName").val());
    
    if(result != null){
    $(".name.regex").html("");  
    }else{
        $(".name.regex").html("한글과 영어만 입력가능합니다.");
        $(".name.regex").css("color","red");
    }
    
});

//생년월일 유효성 검사
var dateBirth = document.getElementById('inputBirth');
var date = new Date();
	date = moment(date, "YYYY-MM-DD");
	date = date.format();
	date = date.substr(0,10);

console.log(date);
dateBirth.value = date;
dateBirth.setAttribute("max", date);
	
	function setMaxValue(){
		if(dateBirth.value > date){
			dateBirth.value = date;
		}
	}


//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
$("#rgsbtn").on("click",function(){
    var email = $("#inputEmail").val();
    var pw = $("#inputPw").val();
    var name = $("#inputName").val();
    var carNo = $("#inputCarNo").val();
    
    var emailregex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    var pwregex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
    var nameregex = /^[가-힣a-zA-Z]+$/;
    var carNoregex =  /\d{2,3}[가-힣]{1}\d{4}/gm;
    
    var emailregex = emailregex.exec(email);
    if(emailregex == null){
        cmm.alert("ID양식을 다시 확인해주세요");
        return;
    }
    var pwregex = pwregex.exec(pw);
    if(pwregex == null){
        cmm.alert("비밀번호양식을 다시 확인해주세요");
        return;
    }
    var nameregex = nameregex.exec(name);
    if(nameregex == null){
        cmm.alert("이름양식을 다시 확인해주세요");
        return;;
    }
    
    var carNoregex = carNoregex.exec(carNo);
    if(carNoregex == null){
        cmm.alert("차량번호양식을 다시 확인해주세요");
        return;
    }
    

    if(isConFirmed == false){
    	cmm.alert("ID 중복을 확인해주세요.");
    	return;
    }
    if(document.querySelector('input[value="RY02"]:checked')) {
        if(!document.querySelector('#agree:checked')) {
            cmm.alert("동의 체크박스를 확인해주세요.");
            return;
        }
    }
    
    
    //빈칸 없을 때 제출.
    $("#rgs").submit();
        

});

//우대사항리스트에서 장애인 체크시 장애인 약관 체크박스 활성화
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

//이메일 중복확인 
var isConFirmed = false;

function confirmEmail(){
    
    var emailBox = document.getElementById("inputEmail");
    var emailValue = emailBox.value;
    
    // 이메일 정규표현식
    var regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            var data = JSON.parse(xhr.responseText);
            
            var confirmAlertBox = document.getElementById("confirmAlertBox");

            if(data.result == true){
                isConFirmed = false;
                confirmAlertBox.innerText = "이미 존재하는 ID입니다.";
                confirmAlertBox.style.color = "red";
            } else {
                isConFirmed = true;
                confirmAlertBox.innerText = "사용 가능한 ID입니다.";
                confirmAlertBox.style.color = "blue";
            }    
            
            if(!regex.exec($("#inputEmail").val())) {
            	isConFirmed = false;
            	confirmAlertBox.innerText = "올바른 ID가 아닙니다.";
                confirmAlertBox.style.color = "red";
            } 

        }
    };

        xhr.open("POST", "./isExistEmail", true);
        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xhr.send("USER_MAIL=" + emailValue);

}

////차량번호 유효성검사
//$("#inputCarNo").on("input",function(){
//    var regex = /\d{2,3}[가-힣]{1}\d{4}/gm;
//    var result = regex.exec($("#inputCarNo").val());
//    
//    if(result != null){
//    $(".carNum.regex").html("");  
//    }else{
//        $(".carNum.regex").html("숫자와 한글만 가능합니다.");
//        $(".carNum.regex").css("color","red");
//    }
//    
//});


//차량번호 중복확인 및 정규표현식
var confirm_carNo = false;

function confirmCarNo(){
    
    var carNoBox = document.getElementById("inputCarNo");
    var carNoValue = carNoBox.value;
    
    //차량번호 정규표현식
    var regex = /\d{2,3}[가-힣]{1}\d{4}/gm;
        
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            var data = JSON.parse(xhr.responseText);
            
            var confirmCarNoAlertBox = document.getElementById("confirmCarNoAlertBox");

            if(data.result == true){
            	confirm_carNo = false;
                confirmCarNoAlertBox.innerText = "이미 존재하는 차량번호입니다.";
                confirmCarNoAlertBox.style.color = "red";
            } else {
            	confirm_carNo = true;
                confirmCarNoAlertBox.innerText = "사용 가능한 차량번호입니다.";
                confirmCarNoAlertBox.style.color = "blue";
            }    
            
            if(!regex.exec($("#inputCarNo").val())) {
            	confirm_carNo = false;
            	confirmCarNoAlertBox.innerText = "올바른 차량번호가 아닙니다.";
            	confirmCarNoAlertBox.style.color = "red";
            } 

        }
    };

        xhr.open("POST", "./isExistCarNo", true);
        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xhr.send("USER_CAR_NO=" + carNoValue);

}







