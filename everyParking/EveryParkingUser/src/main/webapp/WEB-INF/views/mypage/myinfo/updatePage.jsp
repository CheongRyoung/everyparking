<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
<form name="updatePage" action="/mypage/myinfo/updateComplete" method="POST" autocomplete="off" onsubmit="return validate()">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0 pt-1"><i class="bi bi-arrow-left fs-5" onclick="location.href='/mypage/myinfo/confirmPw'"></i></div>
            <div class="col px-0">
                <h5 class="title">마이 페이지</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    
    <main>
        <!-- 수정 해야되는 부분-->
        <div class="row my-5" style="margin-top: auto;">
            <div class="col">
                <div class="row joinBox" style="margin: auto;">
                    <div class="col text-center mt-5">
                        <div class="row my-3">
                            <div class="col text-center">
                                <h4 style="font-weight: bold;">회원 정보 수정</h4>
                            </div>
                        </div>
                        <div class="row text-start">
                            <div class="col">
                                <div class="row mb-1">
                                    <div class="col"><span>이메일</span></div>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" name="USER_MAIL" id="user_mail" value="${data.USER_MAIL}" readonly>
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <div class="row mb-1">
                                    <div class="col"><span>비밀번호</span></div>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" name="USER_PW" id="user_pw" placeholder="Password">
                                    <label for="floatingPassword">Password</label>
                                </div>
                                <div class="row mb-1">
                                    <div class="col"><span>이름</span></div>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" name="USER_NAME" id="user_name" placeholder="name" value="${data.USER_NAME}">
                                    <label for="floatingName">이름</label>
                                </div>
                                <div class="row mb-1">
                                    <div class="col"><span>생년월일</span></div>
                                </div>
                                <input type="date" class="form-control mb-3" name="USER_BIRTH" id="user_birth" placeholder="Password" value="${data.USER_BIRTH}">
                                <div class="row mb-1">
                                    <div class="col"><span>차량 번호</span></div>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" name="USER_CAR_NO" id="user_car_no" placeholder="CarNo" value="${data.USER_CAR_NO}">
                                    <label for="floatingCarNo">차량 번호</label>
                                </div>
                                <div class="row mb-1">
                                    <div class="col">우대 사항</div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                    	<c:forEach var="item" items="${royalList}">
                                          <c:choose>
                                                <c:when test="${item.SUB_NAME == '일반'}">
                                                    <span class="d-none">
                                                    <input type="checkbox" name="royal" value="${item.SUB_CODE}" checked="checked"/> ${item.SUB_NAME }</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="checkbox" name="royal" value="${item.SUB_CODE}" ${royal.indexOf(item.SUB_CODE) > -1 ? 'checked="checked"' : ''}/> ${item.SUB_NAME }
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
                                        <textarea readonly rows="3">1. 장애인전용주차구역 주차표지가 붙어있는 자동차로서 보행에 장애가 있는 사람이 타고 있는 자동차만 주차할 수 있습니다.
        2. 이를 위반한 사람에 대하여는 10만원의 과태료를 부과합니다.</textarea>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <input type="checkbox" id="agree" disabled> 동의합니다.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="col">
                                <button class="mx-1" style="float: right; background-color:red; border:0px; border-radius: 0.2rem; width:5.5rem; height:2.3rem; color:white; margin-right:0.2rem;" type="button" onclick="deleteUser()">회원 탈퇴</button>
                                <button style="float: right; background-color:#5865f2; border:0px; border-radius: 0.2rem; width:5.5rem; height:2.3rem; color:white; margin-right:0.2rem;" id="submit" type="submit">수정 완료</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>
    </form>
</div>
<script type="text/javascript" src="/js/mypage/updatePage.js">
</script>

