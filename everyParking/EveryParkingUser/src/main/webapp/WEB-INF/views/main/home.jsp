<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid" style="background-image: url('/img/mainBackground.png');">
    <main>
        <!-- 수정 해야되는 부분-->
        <div class="row m-0">
            <div class="col mt-5 mx-2 pt-5 ps-0">
                <p style="font-size: 20px; font-weight: bold;">어떤 주차장을 찾으세요?</p>
                <p style="font-size: 20px; font-weight: bold;">바로 <span style="color: #2c0eeec4; font-size: 28px;">우주</span>에서 확인하세요</p>
                <div class="row my-5">
                    <div class="col mx-2">
                        <form action="/main/map" method="post">
                            <div class="input-group">
                                <input name="postcodeName" id="postcodeName" type="text" class="form-control" placeholder="지역명, 위치를 검색하세요" onclick="DaumPostcode()" readonly>
                                <input name="postcodeX" id="postcodeX" type="hidden">
                                <input name="postcodeY" id="postcodeY" type="hidden">
                                <button class="input-group-text" style="border: 0px; background-color: #2c0eeec4;"><i class="bi bi-search text-white"></i></button>
                            </div>
                            <div class="col" id="wrap" style="display: none; position: relative;">
                                <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row my-5 py-5">
                    <div class="col text-center">
                        <img src="/img/mainImage.png" style="width: 320px; height: auto;">
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

