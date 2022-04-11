<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid" style="background-image: url('/img/mainBackground.png');">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0 pt-1"><i class="bi bi-arrow-left fs-5" onclick="history.back();" style="cursor:pointer;"></i></div>
            <div class="col px-0">
                <h5 class="title">회원 가입</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
        <!-- 수정 해야되는 부분-->
        <div class="row my-5" style="margin-top: auto;">
            <div class="col">
                <div class="row" style="margin: auto;">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col text-center">
                                <img class="logoMain my-3" src="/img/logo2.png">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                            	<form id="rgs" action="./registerProcess" method="post">
								    <div class="row mb-1">
								        <div class="col"><span>ID</span></div>
								        <!-- 
								        <div class="col text-end">
								        	<button type="button" class="btn btn-secondary"">이메일 중복확인</button>
								        </div>
								        -->
								    </div>
								    <div class="form-floating mb-3">
								        <input type="text" class="form-control" id="inputEmail" placeholder="name@example.com" name="USER_MAIL" onblur="confirmEmail();">
								        <div id= "confirmAlertBox" class="email regex"></div>
								        <label for="floatingInput">ex) example@example.com</label>
								    </div>
								
								
								    <div class="row mb-1">
								        <div class="col"><span>비밀번호</span></div>
								    </div>
								    <div class="form-floating mb-3">
								        <input type="password" class="form-control" id="inputPw" placeholder="Password" name="USER_PW">
								        <div class="pw regex"></div>
								        <label for="floatingPassword">Password</label>
								    </div>
								    
								    
								    
								    <div class="row mb-1">
								        <div class="col"><span>비밀번호 확인</span></div>
								    </div>
								    <div class="form-floating mb-3">
								        <input type="password" class="form-control" id="inputPwConfirm" placeholder="Password">
								        <div class="pwConfirm regex"></div>
								        <label for="floatingPassword">Password Confirm</label>
								    </div>
								    
								    
								    <div class="row mb-1">
								        <div class="col"><span>이름</span></div>
								    </div>
								    <div class="form-floating mb-3">
								        <input type="text" class="form-control" id="inputName" placeholder="name" name="USER_NAME">
								        <div class="name regex"></div>
								        <label for="floatingName">이름</label>
								    </div>
								    
								    
								    <div class="row mb-1">
								        <div class="col"><span>생년월일</span></div>
								    </div>
								    <input type="date" class="form-control" id="inputBirth" placeholder="Birth" name="USER_BIRTH" onchange="setMaxValue();">
								    
								    <div class="row mt-3 mb-1">
								        <div class="col"><span>차량번호</span></div>
								    </div>
								    <div class="form-floating mb-3">
								        <input type="text" class="form-control" id="inputCarNo" placeholder="CarNo" name="USER_CAR_NO" onblur="confirmCarNo();">
								        <div id="confirmCarNoAlertBox" class="carNum regex"></div>
								        <label for="floatingCarNo">차량번호</label>
								    </div>
								    
								    
								    <div class="row mb-1">
								        <div class="col">우대 사항</div>
								    </div>
								    <div class="row mb-4">
								        <div class="col">
								            <c:forEach items="${getSubCodeRoyalUserList}" var="royalUser">
												<c:choose>
													<c:when test="${royalUser.SUB_NAME == '일반'}">
														<span class="d-none">
										                <input type="checkbox" name="SUB_CODE" value="${royalUser.SUB_CODE}" checked> ${royalUser.SUB_NAME}
										                </span>
													</c:when>
													<c:otherwise>
										                <input type="checkbox" name="SUB_CODE" value="${royalUser.SUB_CODE}"> ${royalUser.SUB_NAME}&nbsp;&nbsp;
													</c:otherwise>
												</c:choose>								            
								            </c:forEach>
								        </div>
								    </div>
								    <div class="row mb-1">
								        <div class="col">
								                장애인 우대 약관 
								        </div>
								    </div>
								    <div class="row mb-1">
								        <div class="col  d-grid">
								            <textarea readonly rows="3" style="font-size:0.8rem; border:0.05rem solid #3E4AB8;">1. 장애인전용주차구역 주차표지가 붙어있는 자동차로서 보행에 장애가 있는 사람이 타고 있는 자동차만 주차할 수 있습니다.&#10;2. 이를 위반한 사람에 대하여는 10만원의 과태료를 부과합니다.</textarea>
								        </div>
								    </div>
								    <div class="row mb-4 pb-3">
								        <div class="col">
								            <input type="checkbox" id="agree" disabled> 동의합니다.
								        </div>
								    </div>
								    <div class="row my-5">
								        <div class="col d-grid">
								            <button type="button" id="rgsbtn" class="longBtn" style="float: right;">회원 가입 완료</button>
								        </div>
								    </div>
								</form>	    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<script type="text/javascript" src="/js/login/register.js"></script>