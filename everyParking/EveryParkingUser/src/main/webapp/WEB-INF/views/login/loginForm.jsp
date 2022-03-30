<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <div class="row joinBox mx-auto mt-5">
         <div class="col">
            <div class="row my-3">
                <div class="col text-center">
                    <img class="logoMain mt-5" src="/img/newLogo.png">
                </div>
            </div>
            <div class="row" style="margin: auto">
                <div class="col">
                	<form action="/login/loginProcess" method="post">
	                    <div class="row mt-4 mb-5">
	                        <div class="col text-center"><span class="login" style="border-bottom:0.4rem #2c0eee solid;">LOGIN</span></div>
	                    </div>
	                    <div class="form-floating mt-2">
	                        <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="USER_MAIL">
	                        <label for="floatingInput">이메일</label>
	                    </div>
	                    <div class="form-floating mb-3">
	                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="USER_PW">
	                        <label for="floatingPassword">비밀번호</label>
	                    </div>
	                    <div class="row mb-3">
	                        <div class="col d-flex justify-content-between">
	                                    <span><a href="./findEmail" class="link-secondary" style="font-size:0.9rem;">이메일 찾기</a>
	                                    </span>
	                            <span><a href="./register" class="link-secondary" style="font-size:0.9rem;">회원 가입</a>
	                                    </span>
	                        </div>
	                    </div>
	                    <div class="row mb-5 pb-4">
	                        <div class="col d-grid">
	                        	<button id="loginBtn" class="longBtn" style="height:2rem; border:0px; color:white;">로그인</button>
	                        </div>
	                    </div>
	            	</form>       
                </div>
            </div>
        </div>
    </div>
</div>

