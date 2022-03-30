<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox px-0 mb-5" style="border-bottom: 1px solid #eeeeee;">
            <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5" style="color:white;" onclick="location.href='/login/loginPage'" style="cursor:pointer;"></i></div>
            <div class="col px-0">
                <h5 class="title">이메일 찾기</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
        <div class="row" style="margin: auto">
            <div class="col">
                <div class="row joinBox" style="margin: auto;">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col text-center">
                                <img class="logoMain my-3" src="/img/newLogo.png">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <form action="./findEmailProcess" method="post" name="findMail">
                                    <div class="form-floating mt-2">
                                        <input type="text" class="form-control" id="USER_NAME" placeholder="이름" name="USER_NAME">
                                        <label for="floatingInput">이름</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="USER_CAR_NO" placeholder="차량번호" name="USER_CAR_NO">
                                        <label for="floatingCarNumber">차량번호</label>
                                    </div>
                                
                                    <div class="row mb-5 pb-4">
                                        <div class="col d-grid">
                                            <button type="submit" class="longBtn" style="color:white; border:0px; height:2rem;">이메일 찾기</button>
                                            
                                            <c:if test="${check == 1}">
                                                <script type="text/javascript">
                                                    opener.document.findMail.USER_NAME.value = "";
                                                    opener.document.findMail.USER_CAR_NO.value = "";
                                                </script>
                                                <label>일치하는 정보가 존재하지 않습니다.</label>
                                            </c:if>
                                            
                                            <c:if test="${check == 0}">
                                                <label class="mt-3 mb-2">찾으시는 이메일은 " ${USER_MAIL} " 입니다.</label>
                                                <button class="longBtn" style="color:white; border:0px; height:2rem;" onclick="endFindEmail(); return false;">확인</button>
                                            </c:if>
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
<script type="text/javascript" src="/js/login/findEmail.js"></script>