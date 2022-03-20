<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col mx-3"><!-- 실질적 내용 변경 구역-->
    <div class="row"><!-- top title-->
        <div class="col text-start p-0">
            <h1 style="font-weight: bold;">공지사항 관리</h1>
        </div>
        <div class="col-6 mt-4">
            <p style="vertical-align: text-bottom;"></p>
        </div>
        <div class="col-2 mt-4 px-0 text-end">
            <button class="btn btn-light btn-sm adminBorder borderBottom">공지사항 등록</button>
        </div>
    </div>
    <!-- 흰 내용 부분 -->
    <div class="row mt-4 adminBorder borderBottom backgroundColorwhite">
        <div class="col mx-3" style="height: 600px;">
            <div class="row mt-4">
                <div class="col">
                    <h4 style="font-weight: bold;">${noti.NOTI_TITLE }</h4>
                </div>
            </div>
            <div class="row my-4">
                <div class="col">
                    <span style="font-weight: bold;">작성자 </span>
                    <span>${noti.USER_NAME }</span>
                    <span>|</span>
                    <span style="font-weight: bold;">등록일 </span>
                    <span>${noti.REG_DATE }</span>
                    <span>|</span>
                    <span style="font-weight: bold;">조회수 </span>
                    <span>${noti.NOTI_COUNT }</span>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col" style="border-top: solid 1px #a6a6a6;"></div>
            </div>
            <!-- 내용 영역인데 에디터가 들어가야할 공간이 필요하대서 그냥 height 값 설정해둘게요 -->
            <div class="row my-3">
                <div class="col mt-3" style="height: 320px;">
                   	<textarea id="readEditor" style="display: none;">${noti.NOTI_CONT }</textarea>
                </div>
            </div>

            <div class="row my-4">
                <div class="col-5">
                    <button class="insertBtn btn btn-outline-primary">목록</button>
                </div>
                <div class="col">
                    <button class="insertBtn btn btn-outline-primary me-5" style="float: right;">다음글 〉</button>
                    <button class="insertBtn btn btn-outline-primary me-2" style="float: right;">〈 이전글</button>
                </div>
            </div>
        </div>
    </div>
</div>