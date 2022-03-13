<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <header>
        <div class="row py-2 px-0">
            <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5"></i></div>
            <div class="col px-0">
                <h5 class="title">문의 작성</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
    <main>
        <!-- 수정 해야되는 부분-->
        <div class="row topBox" style="margin-top: auto;">
            <div class="col">
                <form action="" method="post">
                    <div class="row buyDetailLineBox">
                        <div class="col my-2 py-2">
                            <div class="row py-2">
                                <div class="col sectionName">문의 유형</div>
                            </div>
                            <div class="row pt-2">
                                <div>
                                    <select class="form-select formFontSize" aria-label="Default select example">
                                        <option selected>문의 유형을 선택해주세요.</option>
                                        <option value="1">회원 문의</option>
                                        <option value="2">예약 문의</option>
                                        <option value="3">결제 문의</option>
                                        <option value="4">환불 문의</option>
                                        <option value="5">기타 문의</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col my-2 sectionName">문의 내용</div>
                    </div>
                    <div class="row pt-1">
                        <div class="col">
                            <input type="text" class="form-control formFontSize" placeholder="문의 제목을 입력해주세요.">
                        </div>
                    </div>
                    <div class="row py-3">
                        <div class="col">
                            <textarea id="writeEditor" placeholder="문의할 내용을 입력해주세요."></textarea>
                        </div>
                    </div>
                    <div class="row py-4">
                        <div class="col-5"></div>
                        <div class="col btnBox">
                            <button type="submit" class="insertBtn btn btn-primary">등록</button>
                            <button class="cancelBtn btn btn-primary">취소</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
