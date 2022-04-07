<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <header>
        <div class="row headerBox py-2 px-0">
            <div class="col px-0">
                <h5 class="title">공지 사항</h5>
            </div>
        </div>
    </header>
    <main>
        <!-- 수정 해야되는 부분-->
        <div class="row" style="margin-top: auto;">
            <div class="col">
                <div class="row">
                    <div class="col p-0">
                        <img src="/img/testNoti.png" class="img-fluid">
                    </div>
                </div>

                <div class="row">
                    <div class="col" style="border-top: solid 3px #5865f2;"></div>
                </div>
                <div class="row mt-2">
                    <div class="col px-0">
                        <table class="table text-center" id="noticeManageTable"  style="font-size: 0.9rem; color: #a6a6a6;">
                        
                        </table>
                    </div>
                </div>
			   <div id="pagingBlock3" style="display: flex; justify-content: center; bottom: 1%; margin-top:1rem;"></div>
            </div>
        </div>
    </main>
</div>
<script type="text/javascript" src="/js/operation/noticeManage/noticeManage.js"></script>
