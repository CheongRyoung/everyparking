<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col mx-3">
<div class="row mt-3">
            <!-- top title-->
            <div class="col px-0 text-start">
               <h2 style="font-weight: bold;">주차장 홈</h2>
            </div>
		</div>
         <div class="row">
              <div class="col px-0 text-start" style=" margin: 0; ">
                <span class="fs-7 fw-light">주차장 관리 > 주차장 홈</span>
            </div>
          </div>	
			<div class="row">
			   <div class="col text-end">
					<a href="./parkingRegister">
						<button type="button" class="btn btn-outline-secondary btn-sm fs-6">주차장 등록</button>
					</a>
				</div>
			</div>

	<!-- 테이블 -->
	<div class="row mt-3 mb-3 backgroundColorwhite" style="height: 600px; position: relative;">
		<div class="col px-0">
			<table class="table text-center mb-0" id="parkingZoneTable">
			</table>
		</div>
		<div id="pagingBlock2" style="position: absolute; justify-content:center; display:flex; bottom: 1%;"></div>
	</div>
</div>

<script type="text/javascript" src="/js/parkingManage/parkingZone.js"></script>