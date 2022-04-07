<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container-fluid">

    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col-1 px-0 pt-1"><i class="bi bi-arrow-left fs-5" onclick="location.href='/main/home'"></i></div>
            <div class="col px-0">
                <h5 class="title">마이 페이지</h5>
            </div>
            <div class="col-1 px-0"></div>
        </div>
    </header>
   
    <main>
    <form name="form1"  action="/mypage/myinfo/updatePage" method="post">
        <!-- 수정 해야되는 부분-->
        <div class="row my-5" style="margin-top: auto;">
            <div class="col">
            
                <div class="row joinBox" style="margin: auto;">
                    <div class="col text-center mt-5">
                        <div class="row">
                            <div class="col text-center">
                                <img class="logoMain mt-3" src="/img/newLogo.png">
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col mx-3">
                                <h4 style="font-weight: bold;">비밀번호 확인</h4>
                            </div>
                        </div>
                        <div class="row mt-4 mx-1">
                            <div class="col">
                                <input type="password" class="form-control form-control-user" id="checkPw" placeholder="비밀번호를 입력해주세요" name="USER_PW">
                            </div>
                        </div>
                       
                        <div class="row mt-4 mb-5 mx-1 pb-4">
                            <div class="col d-grid">
                             <button type="submit" class="longBtn" onclick="return frmCheck();">확인</button>  
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       </form>
    </main>
</div>
<script>
$(function(){                                                                                                                                                                                     
	var msg = "${message}";                                                                                                                                                                             
	if(msg){             
		alert(msg);                                                                                                                                                                                      
	}                                                                                                                                                                                               
});                   
</script>
<script type="text/javascript" src="/js/mypage/confirmPw.js"></script>
