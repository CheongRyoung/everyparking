<%--
  Created by IntelliJ IDEA.
  User: blueg
  Date: 2022-03-11
  Time: 오후 5:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/adminCss.css">
    <title>Document</title>
    <!-- 클래식 에디터 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
    <style>
        .qnaBorderColorNg{border-top: solid 1px #a6a6a6; border-bottom: solid 1px #a6a6a6;}
        .qnaAnswerBackgroundColorNg{border-right: solid 1px #a6a6a6; background-color: #f5f5f5;}
    </style>
</head>
<body>
<div class="container-fluid" style="max-width: 500px; background-color: #F5F5F5;">
    <header>
        <div class="row headerBox py-2 px-0" style="border-bottom: 1px solid #eeeeee;">
            <div class="col-1 px-0 mx-2"><i class="bi bi-arrow-left fs-5"></i></div>
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
                                <div class="row mb-1">
                                    <div class="col"><span>이메일</span></div>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                                    <label for="floatingInput">Email address</label>
                                </div>
                                <div class="row mb-1">
                                    <div class="col"><span>비밀번호</span></div>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
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
                                    <input type="text" class="form-control" id="floatingName" placeholder="name">
                                    <label for="floatingName">이름</label>
                                </div>
                                <div class="row mb-1">
                                    <div class="col"><span>생년월일</span></div>
                                </div>
                                <input type="date" class="form-control mb-3" id="floatingPassword" placeholder="Password">
                                <div class="row mb-1">
                                    <div class="col">우대 사항</div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <input type="checkbox"> 여성 <input type="checkbox"> 장애인 <input type="checkbox"> 전기차
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>


</body>
</html>
