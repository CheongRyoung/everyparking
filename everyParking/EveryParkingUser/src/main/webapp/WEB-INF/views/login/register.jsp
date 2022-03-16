<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid" style="min-width: 500px;">
    <header>
        <div class="row headerBox py-2 px-0" style="border-bottom: 1px solid #eeeeee;">
            <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5"></i></div>
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
                <div class="row joinBox" style="margin: auto;">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col text-center">
                                <img class="logoMain my-3" src="/img/logoBG.jpg">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                            	<form action="./registerProcess" method="post">
	                                <div class="row mb-1">
	                                    <div class="col"><span>이메일</span></div>
	                                </div>
	                                <div class="form-floating mb-3">
	                                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="USER_MAIL">
	                                    <label for="floatingInput">Email address</label>
	                                </div>
	                                <div class="row mb-1">
	                                    <div class="col"><span>비밀번호</span></div>
	                                </div>
	                                <div class="form-floating mb-3">
	                                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="USER_PW">
	                                    <label for="floatingPassword">Password</label>
	                                </div>
	                                <div class="row mb-1">
	                                    <div class="col"><span>비밀번호 확인</span></div>
	                                </div>
	                                <div class="form-floating mb-3">
	                                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
	                                    <label for="floatingPassword">Password Confirm</label>
	                                </div>
	                                <div class="row mb-1">
	                                    <div class="col"><span>이름</span></div>
	                                </div>
	                                <div class="form-floating mb-3">
	                                    <input type="text" class="form-control" id="floatingName" placeholder="name" name="USER_NAME">
	                                    <label for="floatingName">이름</label>
	                                </div>
	                                <div class="row mb-1">
	                                    <div class="col"><span>생년월일</span></div>
	                                </div>
	                                <input type="date" class="form-control mb-3" id="floatingBirth" placeholder="Birth" name="USER_BIRTH">
	                                <div class="row mb-1">
	                                    <div class="col"><span>차량번호</span></div>
	                                </div>
	                                <div class="form-floating mb-3">
	                                    <input type="text" class="form-control" id="floatingCarNo" placeholder="CarNo" name="USER_CAR_NO">
	                                    <label for="floatingCarNo">차량번호</label>
	                                </div>
	                                <div class="row mb-1">
	                                    <div class="col">우대 사항</div>
	                                </div>
	                                <div class="row mb-3">
	                                    <div class="col">
	                                    	<c:forEach items="${getSubCodeRoyalUserList}" var="royalUser">
												<input type="checkbox" name="SUB_CODE" value="${royalUser.SUB_CODE}">${royalUser.SUB_NAME }
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
	                                        <textarea readonly rows="3">1. 장애인전용주차구역 주차표지가 붙어있는 자동차로서 보행에 장애가 있는 사람이 타고 있는 자동차만 주차할 수 있습니다.
	        2. 이를 위반한 사람에 대하여는 10만원의 과태료를 부과합니다.</textarea>
	                                    </div>
	                                </div>
	                                <div class="row mb-3">
	                                    <div class="col">
	                                        <input type="checkbox"> 동의합니다.
	                                    </div>
	                                </div>
	                                <div class="row my-4">
	                                    <div class="col">
	                                        <button class="buttonBox" style="float: right;">회원 가입 완료</button>
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
