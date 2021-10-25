<div id="header" class="web-header">
    <div class="top-header">
        <div class="top-header__inner">
            <ul class="top-header__left">
				<h1><a href="/portal/main"><img src="/rcvfvrSvc/images/C/logo_top2.png" alt="정부24"></a></h1>
            </ul>
            <ul class="top-header__right">
				<c:if test="${not empty user && user.USER_ID != null}">
					<li class="bar"><a href="/nlogin/logout?Mcode=10011" class="gnb-btn-login logout"><span class="login-text">로그아웃</span></a></li>
				</c:if>
				<c:if test="${not empty user && user.USER_ID == null}">
					<li class="bar"><a href="/nlogin/?curr_url=/portal/rcvfvrSvc/main" class="gnb-btn-login login"><span class="login-text">로그인</span></a></li>
					<li class="bar"><a href="/nlogin/usr?Mcode=10004">회원가입</a>
				</c:if>

				<c:if test="${empty user}">
					<c:if test="${not empty user_imsi}">
						<li class="bar"><a href="/nlogin/logout?Mcode=10011" class="gnb-btn-login logout"><span class="login-text">로그아웃</span></a></li>
					</c:if>
					<c:if test="${empty user_imsi}">
						<li class="bar"><a href="/nlogin/?curr_url=/portal/rcvfvrSvc/main" class="gnb-btn-login login"><span class="login-text">로그인</span></a></li>
						<li class="bar"><a href="/nlogin/usr?Mcode=10004">회원가입</a></li>
					</c:if>
				</c:if>

                <li>
                    <span class="zoom-button">
                        <span class="zoom-button__out">
                            <a href="#" onclick="javascript:zoomControl.zoomOut()"><span class="hide">화면축소</span></a>
                        </span>
                        <span class="zoom-button__text">
                            <a href="#" class="gnb__anchor" title="화면확대축소 초기화" onclick="javascript:zoomControl.zoomReset()">화면크기 100%</a>
                        </span>
                        <span class="zoom-button__in">
                            <a href="#" onclick="javascript:zoomControl.zoomIn()"><span class="hide">화면확대</span></a>
                        </span>
                    </span>
                </li>
            </ul>
        </div>
    </div>

    <div class="web-header__inner">
        <h1><a href="/portal/rcvfvrSvc/main"><img src="/rcvfvrSvc/images/C/logo3.png" alt="찾아주는 보조금24"></a></h1>
        <div class="gnb" id="gnb">
            <ul>
                <li class="gnb__list">
                   	<c:choose>
						<c:when test="${not empty user_imsi}">							
                    		<a href="javascript:redirect();" class="dep01 ${param.gnb eq 'mySvc' ? 'is-active' : '' }">나의 혜택</a>
							<script>
							function redirect(){
								$('.event-apply__desc.login').empty();
								$('.event-apply__desc.login').append("개인회원만 이용가능한 서비스입니다. <br/>로그인 하시겠습니까?");
     							$('body').data('plugin_modal').open('#loginPop');
							}
							</script>
						</c:when>
						<c:when test="${paramUser eq null}">
                    		<a href="javascript:redirectMyRcvfvrsvc();" class="dep01 ${param.gnb eq 'mySvc' ? 'is-active' : '' }">나의 혜택</a>
							<script>
	     						function redirectMyRcvfvrsvc(){
	     							$('.event-apply__desc.login').empty();
									$('.event-apply__desc.login').append("회원만 이용가능한 서비스입니다. <br/>로그인 하시겠습니까?");
	     							$('body').data('plugin_modal').open('#loginPop');
	     						}
							</script>
						</c:when>
						<c:when test="${paramUser.USER_DTL_SECT_CD ne '101' && paramUser.USER_DTL_SECT_CD ne '102'}">
                    		<a href="javascript:redirect();" class="dep01 ${param.gnb eq 'mySvc' ? 'is-active' : '' }">나의 혜택</a>
							<script>
								function redirect(){
									$('.event-apply__desc.login').empty();
									$('.event-apply__desc.login').append("개인회원만 이용가능한 서비스입니다. <br/>로그인 하시겠습니까?");
	     							$('body').data('plugin_modal').open('#loginPop');
								}
							</script>
						</c:when>
						<c:when test="${paramUser.AGREE_STTUS_CD ne '02' && paramUser.AGREE_STTUS_CD ne '03'}">
                    		<a href="javascript:openMainPop01();" class="dep01 ${param.gnb eq 'mySvc' ? 'is-active' : '' }">나의 혜택</a>
						</c:when>
						<c:otherwise>
                    		<a href="/portal/rcvfvrSvc/mySvc/myRcvfvrsvc" class="dep01 ${param.gnb eq 'mySvc' ? 'is-active' : '' }">나의 혜택</a>
						</c:otherwise>
					</c:choose>
                </li>
                <li class="gnb__list">
                    <a href="#" class="dep01 ${param.gnb eq 'svcFind' ? 'is-active' : ''}" >혜택 찾기</a>
                    <ul class="gnb__list-sub">
                        <li><a href="/portal/rcvfvrSvc/svcFind/simpleFindStepOne">간편찾기</a></li>
                        <li><a href="/portal/rcvfvrSvc/svcFind/svcSearchAll">전체보기</a></li>
                    </ul>
                </li>
                <li class="gnb__list">
                    <a href="#" class="dep01 ${param.gnb eq 'intrcn' ? 'is-active' : '' }">보조금24란</a>
                    <ul class="gnb__list-sub">
                    	<li><a href="/portal/rcvfvrSvc/useguidance/intrcnRcvfvr">보조금24 소개</a></li>
                    	<li><a href="/portal/rcvfvrSvc/useguidance/rcvfvrSvcSttus">보조금24 현황</a></li>
                    	<li><a href="/portal/rcvfvrSvc/recomendBnef">일상속 보조금24 이야기</a></li>
                    </ul>
                </li>
                <li class="gnb__list">
                    <a href="#" class="dep01 ${param.gnb eq 'useguidance' ? 'is-active' : '' }">이용안내</a>
                    <ul class="gnb__list-sub">
                    	<li><a href="/portal/rcvfvrSvc/useguidance/faq?accordionYn=N">자주묻는질문</a></li>
                        <li><a href="/portal/rcvfvrSvc/useguidance">나의혜택 이용하기</a></li>
                        <li><a href="/portal/rcvfvrSvc/useguidance/tab2">간편찾기 이용하기</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <button type="button" class="button button-search"><span class="hide">통합검색</span></button>
    </div>
    <span class="gnb__bg" aria-hidden="true"></span>
</div>