<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="content">

        <!-- top -->
        <div class="top">
          <div class="title">
            <h1> 유지 비용 관리 </h1>
            <span> 주차장 관리 > 유지 비용 관리 </span>
          </div>

          <!-- topBtn -->
          <button class="topBtn">
           <a href="./costInsertForm">비용 등록</a>
          </button>
           <!-- // topBtn -->

        </div>
        <!-- // top -->
        
        <!-- mainCon -->
        <div class="mainCon">


          <!-- mainCon-TopWrap -->
          <div class="mainCon-TopWrap">

            <!-- dropDownBoxWrap -->
            <div class="dropDownBoxWrap">

              <!-- dropDownBox01 -->
              <form class="dropDownBox01" id="dateAndSeq" style="display:flex; flex-direction:row;">
                <select id="parkSeqBox" name="PARK_SEQ" class="form-select" aria-label="Default select example" onchange="selectParkSeq()">
					<option value="" selected>주차장 선택</option>
					<c:forEach items="${list}" var="data">
						<option value="${data.PARK_SEQ}">${data.PARK_NAME}</option>
					</c:forEach>
				</select>
              <!-- // dropDownBox01 -->

              <!-- calenderWrap -->
              <div class="dropDownBox01" style="margin-left:10px;">
                  <select id="searchYearBox" name="SEARCHYEAR" onchange="selectParkSeq()">
					<option value="" selected>연도 선택</option>
					<c:forEach items="${yearList }" var="year">
						<option value="${year.yearData }">${year.yearData }년</option>
					</c:forEach>
				</select>
              </div>
			</form>
              <!-- // calenderWrap --> 

            </div>
            <!-- // dropDownBoxWrap -->
            
            <!-- mainCon-TopBtnWrap -->
            <div class="mainCon-TopBtnWrap">
              <ul>
               
              </ul>
            </div>
            <!-- mainCon-TopBtnWrap -->

          </div>
          <!-- mainConTopWrap -->

           <!-- tableWrap -->
            <div class="tableWrap">

              <!-- table -->
              <table class="table" id="costTable">
                <colgroup>
                  <col style="width:3.5%;">
                  <col style="width:15%;">
                  <col style="width:15%;">
                  <col style="width:45%;">
                  <col style="width:15%;">
                  <col style="width:6.5%;">
                </colgroup>
               
              </table>
              <!-- // table -->

            </div>
            <!-- // tableWrap -->
           

        </div>
        <!-- // mainCon -->
</div>
     
<script src="/js/costManage/costTable.js"></script>