<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col mx-3">

    <!--Top title-->
    <div class="row">
        <div class="col px-0 text-start">
            <h1 style="font-weight: bold;">
                차단 시간 설정<span class="fs-6 fw-light"> 사용자의 예약을 차단할 시간을 설정해주세요</span>
            </h1>
        </div>

        <div class="col-2 mt-4 px-0 text-end">
            <form action="">
                <button type="button"
                        class="btn btn-light btn-sm adminBorder borderBottom">사용
                    시간 설정
                </button>
            </form>
        </div>
    </div>

    <!-- 내용 -->
    <form id="blockFormData" name="blockFormData" method="post">
    <div class="row mt-4 mb-3 backgroundColorwhite adminBorder borderBottom"
            style="height: 600px;">
        <div class="col">

            <div class="row">
                <div class="col ms-5 mt-5 mb-4">
                    <h4 style="font-weight: bold;">주차장 이용 불가 시간을 설정해주세요</h4>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-4 px-0">
                    <img class="img-fluid" src="/img/image1.png">
                </div>
                <div class="col ms-1">
                    <div class="row me-3">
                        <div class="col-4 mt-1">주차장 선택</div>
                        <div class="col">
                            <select class="form-select inputPlusSelectBox" aria-label="주차장명">
                                <c:forEach items="${list}" var="data">
                                    <option value="${data.PARK_SEQ}">${data.PARK_NAME}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="row me-3 mt-3">
                        <div class="col-4 mt-1">차단 시간</div>
                        <div class="col">
                            <input type="text" id="datepickerR" name="daterange" class="form-control datepicker"
                                   style="width: 100%; height: 35px; padding-left: 10px;"/>
                        </div>
                    </div>
                    <div class="row me-3 mt-3">
                        <div class="col-4 mt-1">주차장 구역 설정</div>
                        <div class="col" id="selectSection">
                            <p>주차장을 선택 후 시간을 설정해주세요</p>
                        </div>
                    </div>
                    <div class="row me-3 mt-3">
                        <div class="col-4 mt-1">사유 작성</div>
                        <div class="col">
								<textarea row="5" col="50" class="inputPlusSelectBox" style="width: 100%; height: 150px; border-radius: 0.25rem; border: 1px solid #ced4ce" placeholder="이용 불가된 사유를 작성해주세요" name="BLO_CONT" id="BLO_CONT"></textarea>
                        </div>
                    </div>
                    <div class="row me-3 mt-4 pt-2">
                        <div class="col"></div>
                        <div class="col-5 text-end d-gird">
                            <button type="button" class="btn btn-outline-primary" onclick="blockRegister()">등록완료</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</div>
<script src="/js/parkingBlock/parkingBlockRegi.js"></script>