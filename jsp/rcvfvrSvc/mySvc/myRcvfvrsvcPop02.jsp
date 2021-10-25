<!-- 레이어팝업 호출용 버튼 목록 (임시 개발시 삭제) -->
<!--
<div style="position: fixed; bottom:0;right:0;background:greenyellow;padding:10px">
    <a href="#" data-element="modal__open" data-target="#lypop02">정보업데이트 완료 팝업</a>
</div>
-->

<div id="lypop09" class="modal modal--round modal--smaller" data-element="modal__element">
    <div class="modal__container" data-element="modal__element-container">
        <div class="modal__header hide">
            <h1 class="modal__header--title"></h1>
        </div>
        <div class="modal__contents">
            <div class="popup-list popup-agree">
                <p class="popup-list__text">보조금24<br>이용동의를 취소하시겠습니까?</p>
                <div class="button-wrap">
                    <button class="button button--large button--border" data-element="modal__close"><span class="relative">취소</span></button>
                    <button class="button button--large" onclick="javascript:setFixessvcAgreCancl();"><span class="relative">확인</span></button>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="lypop10" class="modal modal--round modal--smaller" data-element="modal__element">
    <div class="modal__container" data-element="modal__element-container">
        <div class="modal__header hide">
            <h1 class="modal__header--title"></h1>
        </div>
        <div class="modal__contents">
            <div class="popup-list popup-agree">
                <p class="popup-list__text">보조금24<br>이용동의를 취소하셨습니다.</p>
                <p class="pagepoll__desc">언제든지 재동의하시면<br>로그인 한번으로 내게 맞는 혜택을<br class="mobile"> 한눈에 조회하실 수 있습니다.</p>
                <div class="button-wrap">
                    <button class="button button--large" onclick="location.href='/portal/rcvfvrSvc/main'"><span class="relative">확인</span></button>
                </div>
            </div>
        </div>
    </div>
</div>