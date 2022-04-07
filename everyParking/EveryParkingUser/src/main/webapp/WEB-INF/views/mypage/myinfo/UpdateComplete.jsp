<%@ page contentType="text/html;charset=UTF-8" language="java" 
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0"><a href="/mypage/myinfo/confirmPw"><i class="bi bi-arrow-left fs-5"></i></a></div>
            <div class="col px-0">
                <h5 class="title">마이 페이지</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
        <div class="row my-5" style="margin-top: auto;">
            <div class="col">
                <div class="row joinBox" style="margin: auto;">
                    <div class="col text-center mt-5">
                        <div class="row">
                            <div class="col text-center">
                                <img class="logoMain mt-3" src="/img/logoBG.jpg">
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col mx-3">
                                <p class="fs-4 fw-bold">회원 정보가</p>
                                <p class="fs-4 fw-bold">수정되었습니다</p>
                            </div>
                        </div>
                        <div class="row mt-5 mb-5 mx-1 pb-4">
                            <div class="col d-grid"><button class="longBtn" onclick="location.href='/main/home';">메인 페이지로 이동</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>