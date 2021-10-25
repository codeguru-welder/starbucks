<c:set var="nowDate" value="<%=new java.util.Date() %>" />
<input type="hidden" id="encRrn" value="${user.ENC_RRN}" />
<input type="hidden" id="nowYmd" value=<fmt:formatDate value="${nowDate }" pattern="yyyyMMdd" /> />
<div id="mainPop01" class="modal modal--large" data-element="modal__element">
    <div class="modal__container" data-element="modal__element-container">
        <div class="modal__header">
            <h1 class="modal__header--title">국가보조금 맞춤형서비스<br class="mobile">(보조금24) 이용 동의</h1>
        </div>
        <div class="modal__contents">
            <div class="popup-list">
                <div class="popup-list__title">
                    보조금24를 통해 맞춤안내 서비스 제공관련 개인의 자격정보, 서비스 수급 정보 실시간 확인을 위해 정보연계 동의가 필요합니다.
                </div>
                <ul class="popup-list__dep1">
                    <li>
                        <span class="popup-list__num">1.</span>
                        <span>개인정보 수집ㆍ이용 목적</span>
                        <ul class="popup-list__dep2">
                            <li>회원의 주민등록번호로 행정기관에서 관리하고 있는 자격정보를 연계하여 받을 수 있는 혜택, 수급정보를 연계하여 이미 받고 있는 혜택 안내</li>
                        </ul>
                    </li>
                    <li>
                        <span class="popup-list__num">2.</span>
                        <span>수집ㆍ이용하려는 개인정보의 항목</span>
                        <ul class="popup-list__dep2">
                            <li>개인의 자격정보 : 기초수급자 차상위, 한부모, 장애인, 농업인, 어업인, 보훈대상자, 임산부, 고용보험 가입, 초중고생 여부, 북한이탈주민 등</li>
                            <li>서비스 수급정보 : 정부24에서 제공하는 맞춤안내서비스별 수급여부</li>
                            <li>주민등록정보 : 14세 미만 자녀정보, 거주지정보, 가족관계정보</li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="popup-radio-wrap">
                <div class="popup-radio__label">정보연계활용</div>
                <div class="radio-wrap">
                    <div class="radio-wrap__item">
                        <input type="radio" class="radio-wrap__input" id="chkFixessvcAgre" name="agree1" checked="">
                        <i class="radio-wrap__icon" aria-hidden="true"></i>
                        <label for="chkFixessvcAgre" class="radio-wrap__label">동의함</label>
                    </div>
                    <div class="radio-wrap__item">
                        <input type="radio" class="radio-wrap__input" id="rdo2" name="agree1">
                        <i class="radio-wrap__icon" aria-hidden="true"></i>
                        <label for="rdo2" class="radio-wrap__label">동의안함</label>
                    </div>
                </div>
            </div>
            <div class="popup-radio-wrap" id="chkChildren14Agre">
                <div class="popup-radio__label">14세미만 자녀정보 활용</div>
                <div class="radio-wrap">
                    <div class="radio-wrap__item">
                        <input type="radio" class="radio-wrap__input" id="chkChildrenAgre" name="agree2" checked="">
                        <i class="radio-wrap__icon" aria-hidden="true"></i>
                        <label for="chkChildrenAgre" class="radio-wrap__label">동의함</label>
                    </div>
                    <div class="radio-wrap__item">
                        <input type="radio" class="radio-wrap__input" id="rdo4" name="agree2">
                        <i class="radio-wrap__icon" aria-hidden="true"></i>
                        <label for="rdo4" class="radio-wrap__label">동의안함</label>
                    </div>
                </div>
            </div>
            <div class="button-wrap">
                <button class="button button--large" type="button" onclick="javscript:setFixessvcAgre();" ><span class="relative">확인</span></button>
            </div>
        </div>
        <button class="modal__btn--close" type="button" data-element="modal__close" title="닫기">닫기</button>
    </div>
</div>