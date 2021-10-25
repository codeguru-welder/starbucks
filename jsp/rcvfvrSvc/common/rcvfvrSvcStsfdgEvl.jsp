<script src="/rcvfvrSvc/js/rcvfvrSvc/rcvfvrSvcStsfdgEvl.js?time=${toDate}"></script>
<input type="hidden" id="telNo" value="${user.MOBL_TEL }"/>
<!-- 210302 수정 -->
<div class="container page-poll">
	<div class="pagepoll__wrap">
		<form id="pagepollForm" method="POST" onsubmit="return false;">
			<input type="hidden" name="cpttrId" value="${user.USER_ID }" />
			<input type="hidden" name="svcId" value="${param.svcId}" />
			<input type="hidden" name="mnNm" value="${param.mnNm}" />
			<input type="hidden" name="mnCd" value="${param.mnCd}" />
			
			<strong class="pagepoll__title">${param.mnCd eq 'ZZ2901' ? '맞춤안내' : '혜택 안내'} 결과 의견 등록</strong>
			<div class="textarea__wrap">
				<textarea name="impOpinion" id="impOpinion" title="안내에 대한 의견을 입력해주세요." class="textarea__inp" 
					placeholder="${param.mnCd eq 'ZZ2901' ? '보조금24 맞춤안내(신청하세요, 확인하세요) 결과에 대한 의견을 주세요.' : '보조금24 혜택안내 요약정보에 대한 의견을 주세요.'}&#13;&#10;여러분의 관심과 의견이 더 나은 서비스를 만들어 가는데 도움이 됩니다."></textarea>
				<span class="textarea__counter">0/1000</span>
				<a href="javascript:rcvfvrSvcStsfdgEvl();" class="textarea__button">등록</a>
			</div>
		</form>
	</div>
</div>
	
<!-- 210302 추가 -->
<div id="lypop07" class="modal modal--round modal--smaller" data-element="modal__element">
    <div class="modal__container" data-element="modal__element-container">
        <div class="modal__header hide">
            <h1 class="modal__header--title">개선의견 등록 완료</h1>
        </div>
        <div class="modal__contents">
            <div class="event-apply">
                <strong class="event-apply__title">개선의견 등록 완료</strong>
                <p class="event-apply__desc">소중한 의견 감사합니다.<br>서비스 개선에 반영하겠습니다.</p>
                <div class="button-wrap">
                    <button class="button button--large" data-element="modal__close" onclick="javascript:reload();"><span class="relative">닫기</span></button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 210305 재수정 -->
<div id="lypop08" class="modal modal--round modal--smaller" data-element="modal__element">
    <div class="modal__container" data-element="modal__element-container">
        <div class="modal__header hide">
            <h1 class="modal__header--title"></h1>
        </div>
        <div class="modal__contents">
            <div class="popup-list">
                <p class="popup-list__text">소중한 의견 감사합니다.<br>서비스 개선에 반영하겠습니다.</p>
                <strong class="pagepoll__title"><span>이벤트 참여</span> (선택)</strong>
                <p class="pagepoll__desc">의견을 주신 분들 대상으로 추첨을 통해 경품 증정 이벤트를 진행하고 있으니 많은 참여 바랍니다.</p>
                <div class="pagepoll__number">                
					
					<form id="eventForm" method="POST" onsubmit="return false;">					
						<input type="hidden" name="cpttrId" value="${user.USER_ID }" />
						<input type="hidden" name="mnCd" value="${param.mnCd}" />						
						<input type="hidden" name="svcId" value="${param.svcId}" />	                    	
						<input type="hidden" name="mobileNo" value="" />
	                    
	                    <div class="pagepoll__phone">
	                        <input type="number" class="phone-number" title="전화번호 처음자리" oninput="maxLengthCheck(this)" maxlength="3" id="num1" name="num1" onkeyup="javascript:nextNum('2');">
	                        <span> - </span>
	                        <input type="number" class="phone-number" title="전화번호 중간자리" oninput="maxLengthCheck(this)" maxlength="4" id="num2" name="num2" onkeyup="javascript:nextNum('3');">
	                        <span> - </span>
	                        <input type="number" class="phone-number" title="전화번호 끝자리" oninput="maxLengthCheck(this)" maxlength="4" id="num3" name="num3"> 
	                    </div>
                    </form>
                </div>
                <div class="pagepoll__agree">                
                    <div class="checkbox__wrap">
	                    <input type="checkbox" id="agree">
	                    <label for="agree">개인정보 수집 및 이용에 동의합니다.</label>
	                    <a href="#none" onclick="showDetailChk();">[<span>자세히보기</span>]</a>
                    </div>
                </div>
                
                <div class="pagepoll__law">
                    <div class="popup-list__title">
                        정부24 이벤트 참여 및 경품증정을 위한 개인정보 처리와 관련하여 동의를 받고 있습니다.
                    </div>
                    <div class="popup-list__text">
                        귀하는 동의를 거부할 권리가 있으나, 동의하지 않으실 경우 이벤트 참여가 불가능함을 알려드립니다.
                    </div>
                    <ul class="popup-list__dep1">
                        <li>
                            <span class="popup-list__num">1.</span>
                            <span>수집 개인정보 항목</span>
                            <ul class="popup-list__dep2">
                                <li>성명, 휴대전화번호</li>
                            </ul>
                        </li>
                        <li>
                            <span class="popup-list__num">2.</span>
                            <span>개인정보 수집 및 이용 목적</span>
                            <ul class="popup-list__dep2">
                                <li>이벤트 참여 확인 및 경품 증정</li>
                            </ul>
                        </li>
                        <li>
                            <span class="popup-list__num">3.</span>
                            <span>개인정보의 보유 및 이용기간</span>
                            <ul class="popup-list__dep2">
                                <li>수집된 개인정보는 이벤트 참여 확인 및 경품 증정을 위한 용도 이외에 사용하지 않습니다.</li>
                                <li>수집된 개인정보는 경품 증정이 완료된 후 지체없이 파기 됩니다.</li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="button-wrap">
                    <button class="button button--large button--border" data-element="modal__close" onclick="location.reload(); return false;"><span class="relative">닫기</span></button>
                    <button class="button button--large" id="eventBtn"><span class="relative">응모하기</span></button>
                </div>
            </div>
        </div>
    </div>
</div>
