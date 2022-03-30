
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
  <header>
    <div class="row headerBox py-2 px-0">
      <div class="col-1 px-0"><i class="bi bi-arrow-left fs-5" style="color:white;"></i></div>
      <div class="col px-0">
        <h5 class="title">문의 사항</h5>
      </div>
      <div class="col-1 px-0"></div>
    </div>
  </header>
  <main>
    <!-- 수정 해야되는 부분-->
    <div class="row" style="margin-top: auto;">
      <div class="col">
        <div class="row">
          <div class="col p-0">
            <img src="/img/qna.png" class="img-fluid">
          </div>
        </div>
        <div class="row">
          <div class="col" style="border-top: solid 3px #1187cf;"></div>
        </div>
        <div class="row mt-2">
          <div class="col">
            <table class="table text-center" id="qnaManageTable" style="font-size: 12px; color: #a6a6a6;">
            
            </table>
          </div>
        </div>
        <div id="pagingBlock4" style="display: flex; justify-content: center; bottom: 1%; font-size: 12px"></div>				
        <div class="row">
          <div class="col btnBox">
            <a href="./write"><button class="insertBtn btn btn-primary">문의하기</button></a>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>
<script type="text/javascript" src="/js/operation/qnaManage/qnaManage.js"></script>
