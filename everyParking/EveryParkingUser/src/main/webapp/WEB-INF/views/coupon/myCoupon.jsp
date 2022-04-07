<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <header>
        <div class="row px-0">
            <div class="col">
                <div class="row headerBox py-2 mb-3">
                    <div class="col-1 px-0 pt-1"><i class="bi bi-arrow-left fs-5" onclick="location.href='/main/home'"></i></div>
                    <div class="col px-0">
                        <h5 class="title">내 쿠폰함</h5>
                    </div>
                    <div class="col-1 px-0"></div>
                </div>
            </div>
        </div>
    </header>

    
            <main class="section">
                <div class="row pt-2 pb-5 topBox m-0" style="width: 100%;">
                    <div class="col px-0">
                    	<c:forEach items="${myCouponData}" var="data">
                        	<div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
	                            <div class="col">
	                                <div class="row">
	                                    <div class="col">
	                                    	<img class="img-fluid" src="/uploadImage/${data.FILE_URL}${data.FILE_CONV_NAME}">
	                                    </div>
	                                </div>
	                                
	                                <div class="row mt-2" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
	                                    <div class="col mt-2 mb-2 text-center">
	                                    	${data.COU_NAME}
	                                    </div>
	                                </div>
                            	</div>
                        	</div>
                 		</c:forEach>
                    </div>
                </div>
            </main>
    
</div>
<!-- <script src="/js/mypage/reservation.js"></script> -->
