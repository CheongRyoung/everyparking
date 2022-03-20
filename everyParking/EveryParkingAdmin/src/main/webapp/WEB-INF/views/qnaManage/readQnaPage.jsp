
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col mx-3"><!-- 실질적 내용 변경 구역-->
    <div class="row"><!-- top title-->
        <div class="col text-start p-0">
            <h1 style="font-weight: bold;">문의 내역 관리</h1>
        </div>

    </div>
    <!-- 흰 내용 부분 -->
    <div class="row mt-4 adminBorder borderBottom backgroundColorwhite">
        <div class="col mx-3" style="height: 600px;">
            <div class="row mt-4">
                <div class="col">
                    <h4 style="font-weight: bold;">${qna.QNA_TITLE }</h4>
                </div>
            </div>
            <div class="row my-4">
                <div class="col">
                    <span style="font-weight: bold;">작성자 </span>
                    <span>${qna.USER_NAME}</span>
                    <span>|</span>
                    <span style="font-weight: bold;">등록일 </span>
                    <span>${qna.REG_DATE}</span>
                    <span>|</span>
                    <span style="font-weight: bold;">조회수 </span>
                    <span>${qna.QNA_COUNT }</span>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col" style="border-top: solid 1px #a6a6a6;"></div>
            </div>
            <!-- 내용 영역인데 에디터가 들어가야할 공간이 필요하대서 그냥 height 값 설정해둘게요 -->
            <div class="row my-3">
                <div class="col mt-3" style="height: 180px;">
                    ${qna.QNA_CONT}
                </div>
            </div>

            <div class="row pt-3" style="border-top: solid 1px #a6a6a6;">
                <div class="col">
                    <span style="font-weight: bold;">관리자</span>
                    <span style="color: rgb(80, 79, 79);">| 2022.03.02 | 11:41:21 </span>
                </div>
                <div class="col d-flex justify-content-end">
                    <a class="commentBtn" href="#"><p style="padding-right: 10px;">수정</p></a><span>
                                    <a class="commentBtn" href="#"><p style="padding-left: 5px;">삭제</p></a>
                </div>
            </div>
            <div class="row mb-3" style="padding-left: 12px;">
                안녕하세요. 우주 관리자입니다. 확인 후 바로 연락드리겠습니다.
            </div>
            <div class="row py-4" style="border-top: 1px solid #a6a6a6;">
                <div class="col d-grid">
                    <div class="input-group">
                        <textarea rows="3" class="form-control" style="border-right: none; resize: none;"></textarea>
                        <button type="submit" class="input-group-text" style="background-color: white; border-left: none;">댓글 입력</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
