<!-- [D] 로직 관련 함수 실행 -->
<!--
    var yourVariable = $('body').data('plugin_modal');
    yourVariable.close('#lypop01'); 업데이트 로딩 모달 닫기
    yourVariable.open('#lypop02'); 업데이트 완료 모달 열기
    yourVariable.close('#lypop02'); 업데이트 완료 모달 열닫기
-->
<!-- //레이어팝업 호출용 버튼 목록 (임시 개발시 삭제) -->
<div id="lypop01" class="modal modal--round" data-element="modal__element">
    <div class="modal__container" data-element="modal__element-container">
        <div class="modal__header hide">
            <h1 class="modal__header--title">정보 업데이트</h1>
        </div>
        <div class="modal__contents">
            <div class="update">
				<div class="update__info">
					잠시만 기다려주세요.
                </div>
                <p class="update__content">
					최신 맞춤혜택 정보 안내를 위하여 
					<br/>회원님의 개인(자격)정보를 조회하고 있습니다.
					<br/>(최장 1~2분 소요됩니다.)
                </p>
                <div class="update__container">
                    <div class="update__text" style="left: 0%;">
                        <span class="update__number">0</span>%
                    </div>
                    <div class="update__bar" aria-hidden="true">
                        <div class="update__bar-inner" style="width:0%"></div>
                    </div>
                </div>           
            </div>
			<!-- 1105 | 주석처리
            <div class="benefit-info">
                <div class="benefit-info__photo">
                    <img src="/rcvfvrSvc/images/C/img_50year.png" alt="">
                    <img src="/rcvfvrSvc/images/C/img_50year2.png" alt="">
                </div>
                <div class="benefit-info__text">장년층(50~64세)의 수혜 사례입니다.</div>
            </div>
            -->
        </div>
    </div>
</div>