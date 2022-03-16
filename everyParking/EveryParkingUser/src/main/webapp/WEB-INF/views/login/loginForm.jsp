<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <div class="row joinBox mx-auto mt-5">
         <div class="col">
            <div class="row my-4">
                <div class="col text-center">
                    <img class="logoMain mt-5" src="/img/logoBG.jpg">
                </div>
            </div>
            <div class="row" style="margin: auto">
                <div class="col">
                	<form action="./loginProcess" method="post">
	                    <div class="row mt-5 mb-4">
	                        <div class="col text-center"><span class="login">로그인</span></div>
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
	                                    <span><a href="#" class="link-secondary">아이디 찾기</a>
	                                    </span>
	                            <span><a href="./register" class="link-secondary">회원 가입</a>
	                                    </span>
	                        </div>
	                    </div>
	                    <div class="row mb-5 pb-4">
	                        <div class="col d-grid"><button class="btn btn-primary">로그인</button></div>
	                    </div>
	            	</form>       
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/login/login.js"></script>
