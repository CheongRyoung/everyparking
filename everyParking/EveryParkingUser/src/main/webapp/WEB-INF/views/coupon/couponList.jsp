<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <header>
        <div class="row px-0">
            <div class="col">
                <div class="row headerBox py-2 mb-3">
                    <div class="col-1 px-0 pt-1"><i class="bi bi-arrow-left fs-5" onclick="location.href='/main/home'"></i></div>
                    <div class="col px-0">
                        <h5 class="title">쿠폰 발급</h5>
                    </div>
                    <div class="col-1 px-0"></div>
                </div>
            </div>
        </div>
    </header>

    
            <main class="section">
                <div class="row pt-2 pb-5 topBox m-0" style="width: 100%;">
                    <div class="col px-0">
                    	<c:forEach items="${dataList}" var="data">
                    		<c:if test="${data.COU_COUNT > 0}">
	                        	<div class="row mt-2 mb-3 mx-2 pt-2 usageBox">
		                            <div class="col">
		                                <div class="row">
		                                    <div class="col">
		                                    	<img class="img-fluid" src="/uploadImage/${data.FILE_URL}${data.FILE_CONV_NAME}">
		                                    </div>
		                                </div>
		                                
		                                <div class="row mt-2" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
		                                    <div class="col text-center">
		                                    	${data.COU_NAME}
		                                    </div>
		                                </div>
		                                
		                                <div class="row" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
		                                	<div class="col text-center" style="border-right : solid 1px rgba(0, 0, 0, 11%);">
		                                		남은 쿠폰 수량
		                                	</div>
											<div class="col text-center">
												${data.COU_COUNT} 개
											</div>                                   
		                                </div>
		                                
		                                <div class="row" style="border-top : solid 1px rgba(0, 0, 0, 11%);">
		                                    <div class="col buyDate d-grid p-0">
		                                    	<c:choose>
		                                    		<c:when test="${!empty sessionUser}">
		                                    			<c:choose>
															<c:when test="${data.myPublishCount > 0}">
				                                       			<button class="btn" disabled="disabled" onclick="location.href='/coupon/getCoupon?COU_SEQ=${data.COU_SEQ}'" >이미 발급받은 쿠폰입니다</button>
															</c:when>
															<c:otherwise>
				                                       			<button class="btn" onclick="location.href='/coupon/getCoupon?COU_SEQ=${data.COU_SEQ}'">쿠폰받기</button>
															</c:otherwise>
		                                    			</c:choose>
		                                    		</c:when>
		                                    		<c:otherwise>
				                                        <button class="btn" onclick="publishAlert();">쿠폰받기</button>
		                                    		</c:otherwise>
		                                    	</c:choose>
		                                    </div>
		                                </div>
		                                
	                            	</div>
	                        	</div>
                        	</c:if>
                 		</c:forEach>
                    </div>
                </div>
            </main>
    
</div>
<script src="/js/coupon/couponList.js"></script>
