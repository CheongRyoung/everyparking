<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <header>
        <div class="row px-0">
            <div class="col">
                <div class="row headerBox py-2 mb-3">
                    <div class="col-1 px-0 pt-1"><i class="bi bi-arrow-left fs-5" onclick="location.href='/main/home'"></i></div>
                    <div class="col px-0">
                        <h5 class="title">에러 발생</h5>
                    </div>
                    <div class="col-1 px-0"></div>
                </div>
            </div>
        </div>
    </header>

    <main class="section">
        <div class="row">
            <div class="col text-center">
                <img src="/img/newLogo.png" class="img-fluid">
            </div>
        </div>
        <div class="row mt-5">
            <div class="col text-center fs-3 fw-bold">
                <p>${code }</p>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col text-center fs-3">
                 <p>${message }</p>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col text-center fs-3">
                <p>다른 방법으로 시도해주세요</p>
            </div>
        </div>
    </main>
</div>

