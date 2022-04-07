<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <header>
        <div class="row px-0">
            <div class="col">
                <div class="row headerBox py-2 mb-3">
                    <div class="col px-0">
                        <h5 class="title">예약 확인</h5>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="navColor col pb-2 activeBox" id="type_1">예약내역</div>
                    <div class="navColor col pb-2" id="type_2">과거내역</div>
                    <div class="navColor col pb-2" id="type_3">취소내역</div>
                </div>
                <div id="bbline" style="height: 1px; background-color: #2c0eee; width: 33%;"></div>
            </div>
        </div>
    </header>

    <div class="scroll-container">
        <div class="inner">
            <main class="section">
            </main>
            <main class="section">
            </main>
            <main class="section">
            </main>
	    </div>
    </div>
</div>
<script src="/js/mypage/reservation.js"></script>
<script src="/js/mypage/reservation/list.js"></script>
