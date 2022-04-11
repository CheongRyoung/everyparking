<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <div class="content">

        <!-- top -->
        <div class="top">
          <div class="title">
            <h1> 유지 비용 등록 </h1>
            <span> 주차장 관리 > 유지비용 관리 > 비용 등록 </span>
          </div>
        </div>
        <!-- // top -->
        
        <!-- mainCon -->
        <div class="mainCon">

          <!-- tableWrap -->
          <div class="tableWrap_2 add">
			<form action="/profitCost/insertCost" method="post">
            <!-- tableCon -->
            <div class="tableCon">

              <!-- mainConHeader -->
              <div class="mainConHeader">
                <img src="/img/more.svg">
                <h2> 유지비용 등록 </h2>
                <span> 비용정보를 작성해주세요 </span>
              </div>
              <!-- // mainConHeader -->

              <!-- table -->
              
              <table class="table">
                <colgroup>
                    <col style="width:25%;">
                    <col style="width:75%;">
                </colgroup>
                <tr>
                  <th> 주차장 선택 </th>
                  <td>
                    <!-- dropDownBox02 -->
                      <select class="inputPlusSelectBox input_2" name="PARK_SEQ" required>
                        <c:forEach items="${list}" var="data">
                                   <option value="${data.PARK_SEQ}">${data.PARK_NAME}</option>
                       </c:forEach>
                      </select>
                    <!-- // dropDownBox02 -->
                  </td>
                </tr>
                <tr>
                  <th> 비용명칭 </th>
                  <td><input class="input_2" type="text" placeholder="비용명을 입력하세요" name="COST_NAME" id="COST_NAME"></td>
                </tr>
                <tr>
                  <th> 비용 금액 </th>
                  <td><input class="input_2" type="text" placeholder="금액을 입력해주세요" name="COST_PRICE" id="COST_PRICE" onkeyup="inputNumberFormat(this)"></td>
                </tr>
                <tr>
                  <th> 비용 발생일 </th>
                  <td><input type="date" class="input_2" id="COST_DATE" name="COST_DATE"></td>
                </tr>
                <tr>
                  <th> 사유 작성 </th>
                  <td><textarea name="COST_CONT" rows="15" placeholder="비용이 발생된 사유를 작성해주세요."></textarea></td>
                </tr>
              </table>
              <!-- // table -->
				  
            </div>
            <!-- //tableCon -->

            <!-- rightBottomBtn -->
            <div class="rightBottomBtn rightBottomBtn02">
              <button type="button" onclick="history.back();"> 취소 </button>
              <button type="submit"> 등록 </button>
            </div>
            <!-- // rightBottomBtn --> 
            </form>
          </div>
          
          <!-- // tableWrap -->

        </div>
      
        <!-- // mainCon -->
        
      </div>
<script type="text/javascript" src="/js/costManage/costTable.js">
</script>
