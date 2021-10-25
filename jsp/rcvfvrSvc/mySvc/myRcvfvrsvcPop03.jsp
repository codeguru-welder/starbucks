<div id="lnkErrPopup" class="modal modal--smallest" data-element="modal__element">
    <div class="modal__container" data-element="modal__element-container">
        <div class="modal__header">
            <h1 class="modal__header--title">안내</h1>
        </div>
        <div class="modal__contents">
            <div class="warn__wrap">
                <p class="warn__title">보조금24 나의혜택 서비스 접속 지연 안내</p>
                <ul class="warn__list">
                    <li id="lnkErrCts"></li>
                    </br>
                    <li id="lnkErrDate"></li>
                </ul>
                <div class="button-wrap">
                    <button class="button button--large" onclick="javascript:location.reload();" ><span class="relative">확인</span></button>
                </div>
            </div>
        </div>
        <button class="modal__btn--close" type="button" data-element="modal__close" title="닫기" onclick="javascript:$('body').data('plugin_modal').close('#lnkErrPopup'); return false;">닫기</button>
    </div>
</div>