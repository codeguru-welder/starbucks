<div id="tracerCnt" class="modal modal--smallest" data-element="modal__element">
    <div class="modal__container" data-element="modal__element-container">
        <div class="modal__header">
            <h1 class="modal__header--title">안내</h1>
        </div>
        <div class="modal__contents">
            <div class="warn__wrap">
                <p class="warn__title">이용자 증가로 행정기관의 자격확인이 지연되고 있습니다.</p>
                <ul class="warn__list">
                    <li id="lnkErrCts">
						이용에 불편을 드려 죄송합니다. <br/>다음번에 다시 보조금24 혜택을 확인해 보세요.<br/> <br/>
						(서비스 이용 원활한 시간 : 평일 18:00 ~ 또는 공휴일)                    	
                    </li>
                </ul>
                <div class="button-wrap" onclick="javascript:$('body').data('plugin_modal').close('#tracerCnt'); return false;">
                    <button class="button button--large"><span class="relative">확인</span></button>
                </div>
            </div>
        </div>
        <button class="modal__btn--close" type="button" data-element="modal__close" title="닫기" onclick="javascript:$('body').data('plugin_modal').close('#tracerCnt'); return false;">닫기</button>
    </div>
</div>