<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col mx-3">
    <!--Top title-->
    <div class="row mt-3">
        <div class="col px-0 text-start">
            <h2 style="font-weight: bold;">차단 시간 설정</h2>
        </div>
    </div>
    <div class="row">
        <div class="col px-0 text-start" style=" margin: 0; ">
		    <span class="fs-7 fw-light">주차장 관리 > 차단 시간 설정 > 차단 시간 등록</span>
		</div>
    </div>
    <!-- 내용 -->
    <form id="blockFormData" name="blockFormData" method="post">
    <div class="row mt-4 backgroundColorwhite">
        <div class="col mb-5">
            <div class="row mt-5" >
				<div class="col">
                    <img class="img-fluid shadow-sm" style="width: 90%; height: 100%;" src="/img/image1.png">
                </div>
             	<div class="col px-0">
                	<h4 style="font-weight: bold;">주차장 이용 불가 시간을 설정해주세요</h4>
			         	<div class="row mt-4 me-3 border border-2 rounded bg-light bg-gradient">
			                <div class="col ms-3">
			                    <div class="row me-3 mt-4">
			                        <div class="col-4 mt-1 d-flex justify-content-between">
			                        	<span class="fw-bold ps-1">주차장 선택</span>
			                        	<span class="text-black-50">|</span>
			                        </div>
			                        <div class="col">
			                            <select class="form-select inputPlusSelectBox" aria-label="주차장명">
			                                <c:forEach items="${list}" var="data">
			                                    <option value="${data.PARK_SEQ}">${data.PARK_NAME}</option>
			                                </c:forEach>
			                            </select>
			                        </div>
			                    </div>
			                    <div class="row me-3 mt-3">
			                        <div class="col-4 mt-1 d-flex justify-content-between">
			                        	<span class="fw-bold ps-1">차단 시간</span>
			                        	<span class="text-black-50">|</span>
			                        </div>
			                        <div class="col">
			                            <input type="text" id="datepickerR" name="daterange" class="form-control datepicker text-black-50" style="width: 100%; height: 35px; padding-left: 10px;"/>
			                        </div>
			                    </div>
			                    <div class="row me-3 mt-3">
			                        <div class="col-4 mt-1 d-flex justify-content-between">
			                        	<span class="fw-bold ps-1">주차장 구역 설정</span>
			                        	<span class="text-black-50">|</span>
			                        </div>
			                        <div class="col" id="selectSection">
			                            <p class="text-black-50">주차장을 선택 후 시간을 설정해주세요</p>
			                        </div>
			                    </div>
			                    <div class="row me-3 mt-3 mb-5">
			                        <div class="col-4 mt-1 d-flex justify-content-between">
			                        	<span class="fw-bold ps-1">사유 작성</span>
			                        	<span class="text-black-50">|</span>
									</div>
			                        <div class="col">
										<textarea row="10" col="50" class="inputPlusSelectBox" style="width: 100%; height: 150px; border-radius: 0.25rem; border: 1px solid #ced4ce" placeholder="이용 불가된 사유를 작성해주세요" name="BLO_CONT" id="BLO_CONT"></textarea>
			                        </div>
			                    </div>
			                </div>
			          </div>
			          <div class="row me-3 mt-4 pt-2">
			          	<div class="col"></div>
							<div class="d-grid gap-3 d-md-flex justify-content-md-end">
			                	<button type="button" class="btn btn-light text-black-50 border border-2 rounded" onclick="history.back();">취소</button>	                	
			                    <button type="button" class="btn btn-light text-black-50 border border-2 rounded" onclick="blockRegister()">등록 완료</button>
							</div>					  
					  </div>       	
                </div>
            </div>            
        </div>
    </div>    
    </form>
</div>
<script src="/js/parkingBlock/parkingBlockRegi.js"></script>