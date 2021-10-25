<!DOCTYPE html>
<html lang="ko">
	<head>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp">
			<jsp:param name="gnb" value="main" />
		</jsp:include>
		<title>보조금24</title>
	</head>
<style>
	.main__table-data{
		cursor: pointer;
	}
</style>
	<body>
		<div class="skip-nav">
		    <a href="#content" class="skip-nav__item">본문바로가기</a>
		    <a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
		</div>
		<div id="wrap">
		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp" />
		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" /> 
		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />

		    <div id="content" class="web-content main">
		        <div class="main__top-section01">
		            <div class="container">
		                <div class="main-slider">
		                    <div class="main-slider__belt">
		                        <!-- <div class="main-slider__item">
		                            <div class="main-slider__title">
                                		<strong>나에게 딱맞는 보조금 쏙!</strong><br>
                                		<span>보조금24에서 만나는 나를 위한 정부혜택</span>
		                            </div>
		                            <div class="main-slider__button-wrap">
		                                <a href="/portal/rcvfvrSvc/useguidance/intrcnRcvfvr" class="main-slider__anchor">
		                                    <span>자세히 보기</span>
		                                </a>
		                            </div>
		                        </div> -->
		                        <div class="main-slider__item main-slider__item--type02">
		                            <div class="main-slider__title">
		                                <strong>보조금24란?</strong><br>
                                		<span>내가 받을 수있는 정부혜택을 쉽게 확인하고 신청할 수 있는 맞춤형 서비스입니다.</span>
		                            </div>
		                            <div class="main-slider__button-wrap">
		                                <a href="/portal/rcvfvrSvc/useguidance/intrcnRcvfvr" class="main-slider__anchor">
		                                    <span>자세히 보기</span>
		                                </a>
		                            </div>
		                        </div>
		                    </div>
		                        
		                    <!-- page_count -->
		                    <!-- <span class="main-slider__page-count">
		                        <span class="wrap">
		                            <span class="now">1</span>
		                            <span class="max">4</span>
		                        </span>
		                        <button type="button" class="auto" aria-label="pause autoplay"></button>
		                    </span> -->
		                    <!-- // page_count -->
		                </div>
		            </div>
		        </div>
        
		        <input type="hidden" id="cpttrId" value="${uVo.cpttrId}">
				<input type="hidden" id="cpttrNm" value="${paramUser.USER_NM}">
				<input type="hidden" id="cvplRequstGuidanceNo" value="${uVo.cvplRequstGuidanceNo }">
				<input type="hidden" id="age" value="${fn:substring(paramUser.RRN,0,7)}" >
				<input type="hidden" id="updatePsbYn" value="${uVo.updatePsbYn}">
				<!-- 로그인 후 -->
				<c:choose>
					<c:when test="${(not empty user && user.USER_ID ne null) && (paramUser.USER_DTL_SECT_CD eq '101' || paramUser.USER_DTL_SECT_CD eq '102')}">
						<c:choose>
							<c:when test="${(paramUser.AGREE_STTUS_CD eq '02' || paramUser.AGREE_STTUS_CD eq '03')}">
								<c:choose>
									<c:when test="${svcYn eq 'Y' && (rView.rsltCnt1 ne 0 || rView.rsltCnt2 ne 0 || rView.rsltCnt3 ne 0)}">
										<div class="main__section01 main__section01--login" id="rcvData">
								            <div class="container">
								                <div class="main__inner">
								                    <div class="main__flex-item">
								                        <div class="main__flex-box">
								                            <div class="main__profile">
								                                <img src="/rcvfvrSvc/images/main/img_prof_1_01_m.png" id="usrImg" class="pc" alt="여자 노년" />
								                            </div>
								                            <div class="main__title">
								                                ${paramUser.USER_NM}님의 혜택</span>
								                            </div>
								                        </div>
								                    </div>
													<div class="main__flex-item">
													    <div class="main__flex-box">
													        <div class="main__table">
													            <div class="main__table-column">
													            	<div class="main__table-head">
																		 신청<br class="mobile">하세요
													                </div>
													                <div class="main__table-data" onclick="javascript:getTabView('1');">
													                	${rView.rsltCnt2}<span>건</span>
													                </div>													                
													            </div>
													            <div class="main__table-column">
													            	<div class="main__table-head">
                                       									확인해<br class="mobile">보세요
													                </div>
													                <div class="main__table-data" onclick="javascript:getTabView('2');">
													                    ${rView.rsltCnt3}<span>건</span>
													                </div>													                
													            </div>
													            <div class="main__table-column">
													                <div class="main__table-head">
																		받고<br class="mobile">있어요
													                </div>
													                <div class="main__table-data" onclick="javascript:getTabView('3');">
													                    ${rView.rsltCnt1}<span>건</span>
													                </div>
													            </div>
													        </div>
													    </div>
													</div>
								                    <div class="main__flex-item">
								                        <div class="main__meta">
								                            <button type="button" class="main__meta-button" onclick="javascript:getRcvfvrData();">최신 정보 가져오기</button>
								                            <div class="main__meta-text">최종수정일 ${uVo.updateTime}</div>
								                        </div>
								                    </div>
								                </div>
								            </div>
								        </div>
									</c:when>
									<c:when test="${svcYn eq 'Y' && (rView.rsltCnt1 eq 0 && rView.rsltCnt2 eq 0 && rView.rsltCnt3 eq 0)}"> 								
								        <div class="main__section01 main__section01--login main__section01--long">
								            <div class="container">
								                <div class="main__inner">
								                    <div class="main__flex-item main__flex-item--type02">
								                        <div class="main__flex-box">
								                            <div class="main__profile">
								                                <img src="/rcvfvrSvc/images/main/img_prof_1_01_m.png" id="usrImg" class="pc" alt="여자 노년" />
								                            </div>
		                            						<div class="main__title main__title--small">
																현재 ${paramUser.USER_NM}님의 받을 수 있는 혜택이 확인되지 않습니다.
								                            </div>
								                        </div>								                        
								                    </div>
								                    <div class="main__float main__float--type02">
							                            <a href="/portal/rcvfvrSvc/svcFind/svcSearchAll" class="button">혜택 전체보기</a>
			                            				<a href="/portal/rcvfvrSvc/svcFind/simpleFindStepOne" class="button">간편 혜택 찾기</a>
							                        </div>
								                </div>
								            </div>
								        </div>
									</c:when>
									<c:otherwise><!-- 동의만 하고 혜택 확인 안한 경우 -->		
										<div class="main__section01 main__section01--login main__section01--long">
								            <div class="container">
								                <div class="main__inner">
								                    <div class="main__flex-item main__flex-item--type02 main__flex-noinfo">
								                        <div class="main__flex-box">
								                            <div class="main__profile">
								                                <img src="/rcvfvrSvc/images/main/img_prof_1_01_m.png" id="usrImg2" class="pc" alt="여자 노년" />
								                            </div>
								                            <div class="main__title main__title--small">
								                                ${paramUser.USER_NM}님, 지금 바로!<br>
																나의 혜택을 확인하세요.
								                            </div>
								                        </div>								                        
								                    </div>
								                    <div class="main__float main__float--type04">
							                            <a href="#none" onclick="javascript:getRcvfvrData();" class="button">맞춤혜택 조회하기</a>
							                        </div>
								                </div>
								            </div>
								        </div>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<div class="main__section01 main__section01--login main__section01--long">
						            <div class="container">
						                <div class="main__inner">
						                    <div class="main__flex-item main__flex-item--type02 main__flex-noinfo">
						                        <div class="main__flex-box">
						                            <div class="main__profile">
						                                <img src="/rcvfvrSvc/images/main/img_prof_1_01_m.png" id="usrImgAgre" class="pc" alt="여자 노년" />
						                            </div>
						                            <div class="main__title main__title--small">
						                                ${paramUser.USER_NM}님, 서비스이용동의하고 나의 혜택을 확인하세요.
						                            </div>
						                        </div>						                        
						                    </div>
						                    <div class="main__float main__float--type03">
					                            <a href="javascript:openMainPop01();" class="button">서비스 이용 동의</a>
					                        </div>
						                </div>
						            </div>
						        </div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
				        <div class="main__section01 main__section01--login-pre">
				            <div class="container">
				                <div class="main__left">
				                    <h2 class="main__title">
				                        <a href="javascript:redirect();" class="main__button" aria-label="맞춤혜택 확인하기">나의 혜택 바로가기</a>
				                    </h2>
				                </div>
				            </div>
				            <div class="container">
				                <div class="main__right">
				                    <h2 class="main__title">
				                        <a href="/portal/rcvfvrSvc/svcFind/simpleFindStepOne" class="main__button" aria-label="간편하게 혜택 확인하기">간편하게 혜택 찾기</a>
				                    </h2>
				                </div>
				            </div>
				        </div>
				        <c:choose>
				        	<c:when test="${not empty user_imsi}">
				        		<script>
									function redirect(){
										$('.event-apply__desc.login').empty();
										$('.event-apply__desc.login').append("개인회원만 이용가능한 서비스입니다. <br/>로그인 하시겠습니까?");
										$('body').data('plugin_modal').open('#loginPop');
									}
								</script>
				        	</c:when>
				        	<c:when test="${paramUser eq null}">
								<script>
									function redirect(){
										$('.event-apply__desc.login').empty();
										$('.event-apply__desc.login').append("회원만 이용가능한 서비스입니다. <br/>로그인 하시겠습니까?");
										$('body').data('plugin_modal').open('#loginPop');
								     }
								</script>
							</c:when>
							<c:when test="${paramUser.USER_DTL_SECT_CD ne '101' && paramUser.USER_DTL_SECT_CD ne '102'}">
								<script>
									function redirect(){
										$('.event-apply__desc.login').empty();
										$('.event-apply__desc.login').append("개인회원만 이용가능한 서비스입니다. <br/>로그인 하시겠습니까?");
										$('body').data('plugin_modal').open('#loginPop');
									}
								</script>
		            		</c:when>
		            		<c:otherwise>
                    			<script>
              						function redirect(){
              							location.href = "/portal/rcvfvrSvc/mySvc/myRcvfvrsvc";
              						}
								</script>
                    		</c:otherwise>
				        </c:choose>
					</c:otherwise>
		        </c:choose>
				<!-- 로그인 후  : 정보 없는 경우-->
		        <div class="main__section01 main__section01--login main__section01--long" id="noData" style="display : none;">
		            <div class="container">
		                <div class="main__inner">
		                    <div class="main__flex-item main__flex-item--type02">

		                        <div class="main__float">
		                            <a href="/portal/rcvfvrSvc/svcFind/svcSearchAll" class="button">혜택 전체보기</a>
		                            <a href="/portal/rcvfvrSvc/svcFind/simpleFindStepOne" class="button">간편 혜택 찾기</a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!-- //로그인 후 : 정보 없는 경우 -->
		        
		       <c:if test="${sysTroblManage ne 'N' && sysTroblManage ne '' && sysTroblManage ne null }">
			        <div class="alert__wrap">
			            <div class="alert__box">
			                <strong class="alert__title">알림</strong>
			                <p class="alert__text">${util:toHtmlTagBlank(sysTroblManage)}</p>
			            </div>
			        </div>
		        </c:if>
		        <div class="main__section03">
		            <div class="container">
		                <!-- 210414 수정 -->
		                <h2 class="main__title"><span>보조금24를 소개해요</span></h2>
		                <div class="intro__wrap">
		                    <ul>
		                        <li>
		                            <a href="https://www.youtube.com/watch?v=C3Tq2sI1-Xs" target="_blank" title="새창열림">
		                            	<img src="/rcvfvrSvc/images/main/img_intro1_pc.png" class="pc" alt="정부24에서 만나는 뜻 밖의 혜택 영상보기">
                                		<img src="/rcvfvrSvc/images/main/img_intro1_mo.png" class="mobile" alt="정부24에서 만나는 뜻밖의 혜택 영상보기">
		                            </a>
		                        </li>
		                        <li>
		                            <a href="#" title="카드뉴스 팝업" data-element="modal__open" data-target="#lypop01">
		                            	<img src="/rcvfvrSvc/images/main/img_intro2_pc.png" class="pc" alt="보조금24 그것이 알고 싶다! 카드뉴스 보기">
                                		<img src="/rcvfvrSvc/images/main/img_intro2_mo.png" class="mobile" alt="보조금24 그것이 알고 싶다! 카드뉴스 보기">
		                            </a>
		                        </li>
		                        <li>
		                            <a href="#" title="보조금24 웹툰 팝업" data-element="modal__open" data-target="#lypop02">
		                            	<img src="/rcvfvrSvc/images/main/img_intro3_pc.png" class="pc" alt="보조금24 웹툰보기">
                                		<img src="/rcvfvrSvc/images/main/img_intro3_mo.png" class="mobile" alt="보조금24 웹툰보기">
		                            </a>
		                        </li>
		                        <li>
		                            <a href="/portal/rcvfvrSvc/useguidance/faq">
		                            	<img src="/rcvfvrSvc/images/main/img_intro4_pc.png" class="pc"  alt="자주 묻는 질문 바로가기">
                                		<img src="/rcvfvrSvc/images/main/img_intro4_mo.png" class="mobile"  alt="자주 묻는 질문 바로가기">
		                            </a>
		                        </li>
		                    </ul>
		                </div>
		            </div>
		        </div>
		        <div class="main__section02">
		            <div class="container">
                		<h2 class="main__title"><span>일상 속 든든한 보조금24 이야기</span></h2>
		                <div class="card">
		                    <div class="card__list card__type1">
		                        <div class="card__item card__item--case01">
		                            <a href="/portal/rcvfvrSvc/recomendBnef/1" class="card__link">
		                                <div class="card__contents">
		                                    <div class="card__title"><span>취업준비 중인<br> 신*영</span>님의<br class="mobile"> 이야기</div>
		                                </div>
		                            </a>
		                        </div>
		                        <div class="card__item card__item--case02">
		                            <a href="/portal/rcvfvrSvc/recomendBnef/2" class="card__link">
		                                <div class="card__contents">
		                                    <div class="card__title"><span>엄마가 처음인<br> 이*주</span>님의<br class="mobile"> 이야기</div>
		                                </div>
		                            </a>
		                        </div>		                        
		                        <div class="card__item card__item--case03">
		                            <a href="/portal/rcvfvrSvc/recomendBnef/3" class="card__link">
		                                <div class="card__contents">
		                                    <div class="card__title"><span>다발성 근염 진단<br class="pc"> 박*철</span>님의<br class="mobile"> 이야기</div>
		                                </div>
		                            </a>
		                        </div>
		                        <div class="card__item card__item--case04">
		                            <a href="/portal/rcvfvrSvc/recomendBnef/4" class="card__link">
		                                <div class="card__contents">
		                                    <div class="card__title"><span>홀로 살지만 외롭지<br class="pc"> 않은 김*형</span>님의 이야기</div>
		                                </div>
		                            </a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
		</div>

		<!-- 210414 추가 -->
		<div id="lypop01" class="modal modal--news" data-element="modal__element">
		    <div class="modal__container" data-element="modal__element-container">
		        <div class="modal__header">
		            <h1 class="modal__header--title">카드뉴스 팝업</h1>
		        </div>
		        <div class="modal__contents">
		            <div class="modal-slider">
		                <div class="modal-slider__belt" data-slider="arrow3">
		                    <!-- 210405 alt값 추가 -->
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_00.png" alt="정부24가 만든 국가보조금 맞춤형 서비스, 보조금24 그것이 알고 싶다!">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_01.jpg" alt="'몰라서' 한국보건사회연구원(2019)의 보고서에 따르면 지자체 복지담당자 70.9%가 꼽은 대상자의 국가보조금 비신청 사유 1위입니다. 왜 몰랐을까요?">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_02.jpg" alt="국민을 위한 보조금이 국민에게는 너무 멀었습니다. 중앙부처, 지자체,  공공기관 등에서 괸리하는 보조금 및 서비스 혜택만 약 수만개에 이릅니다. 이렇게 많은 혜택 중에 무엇이 나에게 해당되는지 국민들은 알 수가 없었습니다.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_03.jpg" alt="불편함은 수혜서비스 통합 플랫폼 보조금24의 탄생을 이끈 원동력이 됐습니다. 한 곳에! 중앙부처, 지자체, 공공기관에서 제공하는 각종 혜택을 한 곳에!, 한 눈에! 현재 받고 있고, 향후 받을 수 있는 각종 혜택을 한 눈에!, 한 번에! 나에게 맞는 혜택을 확인하고 신청까지 한 번에!">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_04.jpg" alt="보조금24는 국민이 만든 서비스입니다. 보조금24(39.5%)가 온나라보조금(28.3%), 나라드림24(32.1%)을 제치고 국민이 선정한 브랜드 명칭이 되었고, 국민이 뽑은 홈페이지 디자인으로 제작되었습니다. 이는 국가보조금 맞춤형서비스 대국민 투표 이벤트를 통해 선정 되었고, 투표분야는 브랜드명칭, 홈페이지 디자인이고, 투표기간은 2020년 9월 23일에서 10월 7일까지 이며, 투표인원은 총 9,767명 입니다.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_05.jpg" alt="보조금24는 국민의 삶을 이렇게 바꿔나갑니다. 전에는 내가 받을 수 있는 서비스가 무엇인지, 내가 수혜 자격에 해당될지 고민이었는데 이제는 정부24 로그인 한번으로 내게 맞는 혜택이 다 나옵니다.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_06.jpg" alt="보조금24는 성장하고 있습니다. 2021년 4월 중앙부처서비스, 2021년 12월 지자체 서비스, 2022년 공공기관 서비스, 또다른 행정 혁신을 만드는 큰 작업인 만큼, 더 많은 국민들이 혜택을 받을 수 있도록 단계별로 서비스를 확대할 예정입니다.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_07.png" alt="2021년 4월 말 정부24(www.gov.kr)에서 보조금24의 첫 출발을 함께 해주세요!">
		                        </div>
		                    </div>
		                </div>
		                
		                <!-- page_count -->
		                <span class="modal-slider__page-count">
		                    <span class="wrap">
		                        <span class="now">1</span>
		                        <span class="max">9</span>
		                    </span>
		                </span>
		                <!-- // page_count -->
		            </div>
		        </div>
		        <button class="modal__btn--close" type="button" data-element="modal__close" title="닫기">닫기</button>
		    </div>
		</div>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/mySvc/myRcvfvrsvcPop03.jsp" />
		<div id="lypop02" class="modal modal--news" data-element="modal__element">
		    <div class="modal__container" data-element="modal__element-container">
		        <div class="modal__header">
		            <h1 class="modal__header--title">웹툰 팝업</h1>
		        </div>
		        <div class="modal__contents">
		            <div class="modal-slider">
		                <div class="modal-slider__belt" data-slider="arrow3">
		                    <!-- 210405 alt값 추가 -->
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_00.png" alt="정부24가 만든 국가 보조금 맞춤형 서비스, 보조금24">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_01.jpg" alt="여러분은 알고 계셨나요? 중앙부처, 지자체가 국민에게 제공하는 혜택이 수천 개">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_02.jpg" alt="수많은 혜택 중에 내가 받을 혜택은 몇 개? 일일이 찾기 어렵고 신청하기는 더 힘들고">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_03.jpg" alt="정부24에서 선보이는 새로운 서비스! 보조금24">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_04.jpg" alt="중앙부처가 제공하는 300여 종의 서비스">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_05.jpg" alt="국민 누구나 쉽고 편하게, 일일이 찾아다닐 필요 없이 정부24에서 한 번에, 개인정보 입력없이 이용동의 한버으로 누구나 쉽게, 정보취약계층은 주민센터에 가면 안내받을 수 있어요.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_06.jpg" alt="2021년 4월 중앙부처서비스, 2021년 12월 지자체 서비스, 2022년 공공기관 서비스로 보조금24는 계속됩니다.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_07.png" alt="2021년 4월 말 정부24에서 만나요.">
		                        </div>
		                    </div>
		                </div>
		                
		                <!-- page_count -->
		                <span class="modal-slider__page-count">
		                    <span class="wrap">
		                        <span class="now">1</span>
		                        <span class="max">9</span>
		                    </span>
		                </span>
		                <!-- // page_count -->
		            </div>
		        </div>
		        <button class="modal__btn--close" type="button" data-element="modal__close" title="닫기">닫기</button>
		    </div>
		</div>
		<script>

		    $(document).ready(function(){
		    	if('${user.USER_ID}' != null && '${user.USER_ID}' != ""){
		    		var gender = "";
		    		var year = new Date().getFullYear();
		    		var ageYear = "";

		    		// 9 : 1800 ~ 1899년에 태어난 남성
		            // 0 : 1800 ~ 1899년에 태어난 여성
		            // 1 : 1900 ~ 1999년에 태어난 남성
		            // 2 : 1900 ~ 1999년에 태어난 여성
		            // 3 : 2000 ~ 2099년에 태어난 남성
		            // 4 : 2000 ~ 2099년에 태어난 여성
		            // 5 : 1900 ~ 1999년에 태어난 외국인 남성
		            // 6 : 1900 ~ 1999년에 태어난 외국인 여성
		            // 7 : 2000 ~ 2099년에 태어난 외국인 남성
		            // 8 : 2000 ~ 2099년에 태어난 외국인 여성

		    		if ($("#age").val().substr(6,1) == "9" || $("#age").val().substr(6,1) == "0"){
		    			ageYear = "18";
		    		}else if($("#age").val().substr(6,1) == "1" || $("#age").val().substr(6,1) == "2"
		    			|| $("#age").val().substr(6,1) == "5" || $("#age").val().substr(6,1) == "6"){
		    			ageYear = "19";
		    		}else if ($("#age").val().substr(6,1) == "3" || $("#age").val().substr(6,1) == "4"
		    			|| $("#age").val().substr(6,1) == "7" || $("#age").val().substr(6,1) == "8"){
		    			ageYear = "20";
		    		}

		    		//성별
		    		if($("#age").val().substr(6,1) % 2 == 1){
		    			gender = "ZZ0401"
		    		}else{
		    			gender = "ZZ0402"
		    		}
		    		
		    		ageYear = (ageYear + $("#age").val().substr(0,2)) *1;
		    		var age = year - ageYear;
		    		var img = $("img[id^='usrImg']");
		    		// var mImg = $("img[id^='mUsrImg']");

		    		var imgSrc = "";
		    		var imgAlt = "";
		    		
		    		//남자 노년 65~
		    		if(gender == "ZZ0401" && age > 64){
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_2_01_m.png";
		    			imgAlt = "남자 노년";
		    		}else if(gender == "ZZ0401" && age >= 30 && age < 65){ //남자 중장년 30~64
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_2_02_m.png";
		    			imgAlt = "남자 중장년";
		    		}else if(gender == "ZZ0401" && age >= 19 && age < 30){ //남자 청년 19~29
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_2_03_m.png";
		    			imgAlt = "남자 청년";
		    		}else if(gender == "ZZ0401" && age >= 13 && age < 19){ //남자 청소년 13~18
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_2_04_m.png";
		    			imgAlt = "남자 청소년";
		    		}else if(gender == "ZZ0401" && age >= 6 && age < 13){ //남자 아동 6~12
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_2_05_m.png";
		    			imgAlt = "남자 아동";
		    		}else if(gender == "ZZ0401" && age < 6){ //남자 유아 
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_2_06_m.png";
		    			imgAlt = "남자 유아";
		    		}else if(gender == "ZZ0402" && age > 64){ //여자 노년
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_1_01_m.png";
		    			imgAlt = "여자 노년";
		    		}else if(gender == "ZZ0402" && age >= 30 && age < 65){ //여자 중장년 30~64
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_1_02_m.png";
		    			imgAlt = "여자 중장년";
		    		}else if(gender == "ZZ0402" && age >= 19 && age < 30){ //여자 청년 19~29
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_1_03_m.png";
		    			imgAlt = "여자 청년";
		    		}else if(gender == "ZZ0402" && age >= 13 && age < 19){ //여자 청소년 13~18
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_1_04_m.png";
		    			imgAlt = "여자 청소년";
		    		}else if(gender == "ZZ0402" && age >= 6 && age < 13){ //여자 아동 6~12
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_1_05_m.png";
		    			imgAlt = "여자 아동";
		    		}else if(gender == "ZZ0402" && age < 6){ //여자 유아 
		    			imgSrc = "/rcvfvrSvc/images/main/img_prof_1_06_m.png";
		    			imgAlt = "여자 유아";
		    		}

		    		img.attr("src", imgSrc);
		    		img.attr("alt", imgAlt);
		    		// mImg.attr("src", imgSrc.substr(0, imgSrc.length-4) + "_m" + imgSrc.substr(imgSrc.length-4, imgSrc.length));
		    	}
		    });

	        //url 복사
		    function urlCopy(obj){
	    		var urlTxt = window.location.protocol + "//" + window.location.hostname;
	    		urlTxt += obj;
	    		var copyArea = document.createElement("textarea");
	    		copyArea.value = urlTxt;

	    		document.body.appendChild(copyArea);
	    		copyArea.select();
	    		document.execCommand("copy");
	    		document.body.removeChild(copyArea);

	    		alert("URL이 클립보드에 복사되었습니다.");
	    	}


	        function getRcvfvrData(){
	        	
	        	//연계 상태 확인
	        	$.ajax({
	        		  type: "post"
	        		, url: "/portal/rcvfvrSvc/mySvc/selectLnkSttus.do"
	                , contentType : "application/json: charset=UTF-8"
                    , dataType : "json"
	        		, success:function(data) {
	        			//연계 불가
	        			if(data.result == "Y"){
	        				var stdh = data.stdh;
	        				var eddh = data.eddh;
	        				
	        				$("#lnkErrCts").empty();		
	        				$("#lnkErrCts").append(data.troblGuidanceCts);
	        				$('body').data('plugin_modal').open('#lnkErrPopup');
	        				return false;
	        			}else if(data.result == "N"){
	        				
	        				if($("#updatePsbYn").val() == "N"){
	        	        		alert("자격/수급정보의 변동사항이 없어 하루동안 재조회되지 않습니다.");
	        	        		return false;
	        	        	}
	        				
	        				wStorage = window.sessionStorage;
				        	wStorage.setItem("myRcvfvrsvc",true);			
				        	location.href = '/portal/rcvfvrSvc/mySvc/myRcvfvrsvc';
	        			}else{
	        				$('.event-apply__desc.login').empty();
							$('.event-apply__desc.login').append("회원만 이용가능한 서비스입니다. <br/>로그인 하시겠습니까?");
 							$('body').data('plugin_modal').open('#loginPop');
	        			}
	        		}, error:function(e) {
	        			alert("시스템 점검 중입니다. 잠시후 이용 부탁드립니다.");
	        			location.reload();
	        		}
	        	});
	        }
	        	        
	        function getTabView(cls){
	        	wStorage = window.sessionStorage;

	        	wStorage.setItem("viewTab", cls);
	        	location.href = '/portal/rcvfvrSvc/mySvc/myRcvfvrsvc';
	        }
		</script>
	</body>
</html>