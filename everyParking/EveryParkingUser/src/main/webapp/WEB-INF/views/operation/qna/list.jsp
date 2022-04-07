<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<div class="container-fluid">
	<header>
        <div class="row headerBox py-2 px-0">
            <div class="col px-0">
                <h5 class="title">문의하기</h5>
            </div>
        </div>
    </header>
  <main>
    <!-- 수정 해야되는 부분-->
    <div class="row" style="margin-top: auto;">
      <div class="col">
        <div class="row">
          <div class="col p-0">
            <img src="/img/testQnA.png" class="img-fluid">
          </div>
        </div>
        <div class="row">
          <div class="col" style="border-top: solid 3px #5865f2;"></div>
        </div>
        <div class="row mt-2" style="background-color:white;">
          <div class="col px-0">
            <table class="table text-center" id="qnaManageTable" style="font-size:0.7rem; color: #a6a6a6;">
            </table>
          </div>
        </div>
        <div id="pagingBlock4" style="display: flex; justify-content: center; bottom: 1%; margin-top:1rem;"></div>				
    <c:if test="${!empty sessionUser }">        			
        <div class="row mt-3">
          <div class="col btnBox">
            <a href="./write"><button class="longBtn" style="width: 5.5rem;">문의하기</button></a>
          </div>
        </div>
    </c:if>
      </div>
    </div>
  </main>
</div>
<script type="text/javascript" src="/js/operation/qnaManage/qnaManage.js"></script>
