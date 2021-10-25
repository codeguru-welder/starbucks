<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
	<title>보조금24 현황 | 보조금24란 | 보조금24</title>
</head>
<style>
	.page-navigation li {
		display: inline-block;
	}
</style>
<body>
	<div class="skip-nav">
		<a href="#content" class="skip-nav__item">본문바로가기</a>
		<a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
	</div>

	<div id="wrap">
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp">
			<jsp:param name="gnb" value="intrcn" />
		</jsp:include>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" /> 
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />	
		
	    <div class="visual__status">	    
			<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
				<jsp:param name="gnb" value="intrcn" />
				<jsp:param name="mnb" value="rcvfvrSvcSttus" />
			</jsp:include>
			
			<input type="hidden" id="pageIndex" name="pageIndex" value="${fixesSvc.pageIndex }" />
			<input type="hidden" id="lastPage" name="lastPage" value="${fixesSvc.lastPage }" />
	        
	        <div class="visual__wrap">
	            <div class="visual__left">
	                <strong class="visual__title">보조금24의<br> 발전모습</strong>
	                <p class="visual__text">해마다 더 많은 정부<br class="mobile"> 혜택을<br class="pc"> 확인할 수 있습니다.</p>
	            </div>
	            <div class="visual__right">
	                <div class="svg-box">
	                    <svg version="1.1" id="path-p" class="pc" width="752" height="322" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	                        viewBox="0 0 752 322" style="enable-background:new 0 0 752 322;" xml:space="preserve">
	                        <style type="text/css">
	                            .path {fill: transparent; stroke: #fff; stroke-width: 1px;}
	                        </style>
	                        <g>
	                            <path class="path" d="M 380 52 L 605 52 A 25 25 0 1 1 605 317 L 605 317 L 150 317 A 50 50 0 0 1 150 52 L 380 52"/>
	                        </g>
	                        <g>
	                            <path class="path" d="M 373 42 C 343 42 323 32 318 2 C 348 2 368 11 373 42 C 377 11 392 2 427 2 C 422 32 402 42 373 42"/>
	                        </g>
	                    </svg>
	                    <svg version="1.1" id="path-m" class="mobile" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	                        viewBox="0 0 626 600" style="enable-background:new 0 0 626 600;" xml:space="preserve">
	                        <style type="text/css">
	                            .path {fill: transparent; stroke: #fff; stroke-width: 6px;}
	                        </style>
	                        <g>
	                            <path class="path" d="M 315 75 L 573 75 C 603 75 623 95 623 125 V 548 C 623 578 598 598 573 598 L 53 597 C 23 598 3 578 3 548 V 125 C 3 95 23 75 53 75 L 315 75"/>
	                        </g>
	                        <g>
	                            <path class="path" d="M 313 55 C 283 55 245 32 245 2 C 280 2 313 23 313 55 C 313 23 344 2 378 2 C 378 32 343 55 313 55"/>
	                        </g>
	                    </svg>
	                </div>
	                <div class="visual__motion">
	                    <div class="motion__object">
	                        <strong class="motion__date">2021년 4월</strong>
	                        <div class="motion__inner">
	                            <div class="motion__wrap">
	                                <span class="motion__title">중앙부처</span>
	                                <span class="motion__count"><em>305</em>개</span>
	                            </div>
	                            <div class="motion__wrap">
	                                <span class="motion__title">온라인신청</span>
	                                <span class="motion__count"><em>25</em>개</span>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="motion__object">
	                        <strong class="motion__date">2021년 12월</strong>
	                        <div class="motion__inner">
	                            <div class="motion__wrap">
	                                <span class="motion__title">광역 기초</span>
	                                <span class="motion__count"><em>6천</em>여개</span>
	                            </div>
	                            <div class="motion__wrap">
	                                <span class="motion__title">온라인신청</span>
	                                <span class="motion__count"><em>75</em>개</span>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="motion__object">
	                        <strong class="motion__date">2022년</strong>
	                        <p class="motion__text">공공기관<br> 서비스</p>
	                    </div>
	                </div>
	                <p class="visual__desc">[20년도] 행정기관의 약 100종의 정보연계 추진<br class="mobile"> → [21년도] 총 200여 종의 정보연계 확대</p>
	            </div>
	        </div>
	    </div>
	    <div id="content" class="web-content">
	        <div class="subsidy-status">
	            <strong class="subsidy-status__title">2021년도 맞춤안내 기준정보</strong>
	            <p class="subsidy-status__desc">보조금24는 현금, 현물, 이용권 등 중앙부처 수혜서비스 305종에 대해 개인의 연령, 소득, 자격기준 정보를<br class="pc"> 행정기관에서 보유하고 있는 정보와 연계하여 맞춤안내를 제공합니다.</p>
	            <div class="subsidy-status__tab">
	                <ul class="tab-list">
	                    <li>
	                        <a href="/portal/rcvfvrSvc/useguidance/rcvfvrSvcSttus?tab=1" class="tab-anchor active">맞춤안내 혜택 305종</a>
	                    </li>
	                    <li>
	                        <a href="/portal/rcvfvrSvc/useguidance/rcvfvrSvcSttus?tab=2" class="tab-anchor">자격정보 51종</a>
	                    </li>
	                    <li>
	                        <a href="/portal/rcvfvrSvc/useguidance/rcvfvrSvcSttus?tab=3" class="tab-anchor">수급정보 64종</a>
	                    </li>
	                    <li>
	                        <a href="/portal/rcvfvrSvc/useguidance/rcvfvrSvcSttus?tab=4" class="tab-anchor">온라인 신청</a>
	                    </li>
	                </ul>
	                <div class="tab-panel">
	                    <div class="tab-content">
	                        <div class="benefit__check">
	                            <span>받고있는 혜택에서 확인가능</span>
	                        </div>
	                        <div class="benefit__wrap">
	                        	<c:forEach var="fixesSvc" items="${fixesSvc.list}" varStatus="status">
	                        		<c:choose>
		                        		<c:when test="${status.index eq '0' || status.index eq '12' || status.index eq '24'}">
		                        			<c:choose>
		                        				<c:when test="${fixesSvc.svcNm eq '1'}">
		                        					<div class="benefit__box">
		                        						<c:if test="${fixesSvc.svcNmInitial ne '' && fixesSvc.svcNmInitial ne null}">
							                                <div class="benefit__head">
							                                   <span>${fixesSvc.svcNmInitial}</span> 
							                                </div>
														</c:if>
						                                <ul class="benefit__body">
		                        				</c:when>
		                        				<c:otherwise>
		                        					<div class="benefit__box"> 
				                        				<ul class="benefit__body">
					                        				<li <c:if test="${fixesSvc.reqDt ne null}"> class='icon-badge'</c:if>>
					                        					<a href="/portal/rcvfvrSvc/dtlEx/${fixesSvc.svcId }" class="benefit__link">${fixesSvc.svcNm}</a>
					                        					<i class="benefit__icon"></i>
					                        				</li>
		                        				</c:otherwise>
		                        			</c:choose>		                        			
		                        		</c:when>
		                        		<c:when test="${status.index ne '11' && status.index ne '23' && status.index ne '35' && !status.last}">
		                        			<c:choose>
		                        				<c:when test="${fixesSvc.svcNm eq '1'}">
		                        					</ul>
		                        						<c:if test="${fixesSvc.svcNmInitial ne '' && fixesSvc.svcNmInitial ne null}">
							                                <div class="benefit__head">
							                                   <span>${fixesSvc.svcNmInitial}</span> 
							                                </div>
														</c:if>
					                                <ul class="benefit__body">
		                        				</c:when>
		                        				<c:otherwise>
					                        		<li <c:if test="${fixesSvc.reqDt ne null}"> class='icon-badge'</c:if>>
				                       					<a href="/portal/rcvfvrSvc/dtlEx/${fixesSvc.svcId }" class="benefit__link">${fixesSvc.svcNm}</a>
				                       					<i class="benefit__icon"></i>
				                       				</li>
				                       			</c:otherwise>
				                       		</c:choose>
		                       			</c:when>
		                       			<c:otherwise>
		                       				<c:choose>
		                       					<c:when test="${fixesSvc.svcNm eq '1'}">
		                       						</ul>
		                       							<c:if test="${fixesSvc.svcNmInitial ne '' && fixesSvc.svcNmInitial ne null}">
							                                <div class="benefit__head">
							                                   <span>${fixesSvc.svcNmInitial}</span> 
							                                </div>
														</c:if>
													</div>
		                       					</c:when>
		                       					<c:otherwise>
		                       						<li <c:if test="${fixesSvc.reqDt ne null}"> class='icon-badge'</c:if>>
				                       					<a href="/portal/rcvfvrSvc/dtlEx/${fixesSvc.svcId }" class="benefit__link">${fixesSvc.svcNm}</a>
				                       					<i class="benefit__icon"></i>
				                       				</li>
			                       				</ul>
		                       				</div>
		                       					</c:otherwise>
		                       				</c:choose>
		                        		</c:otherwise>
		                        	</c:choose>
	                        	</c:forEach>
	                        </div>
	                        <div class="page-navigation">
								<c:if test="${fn:length(fixesSvc.list) > 0}">
			                        <view:navi id="navSvc" cssClass="pagination" href="/portal/rcvfvrSvc/useguidance/rcvfvrSvcSttus" page="${fixesSvc}" pageIndex="pageIndex"> 
			                            <view:first cssClass="page-navigation__first disabled" alt="처음"/>
			                            <view:prev cssClass="page-navigation__prev disabled" alt="이전" />
			                            <div class="page-navigation__num-wrap">
											<view:pageList onCss="page-navigation__active" offCss="page-navigation__num" />
										</div>
			                            <view:next cssClass="page-navigation__next disabled" alt="다음" />
			                            <view:last cssClass="page-navigation__last disabled" alt="마지막"/>
			                        </view:navi>
			                    </c:if>
							</div>
	                    </div>
	                    <div class="tab-content">
	                        <div class="benefit__wrap">
	                            <div class="benefit__box">
	                                <div class="benefit__head">
	                                   <span>ㄱ</span> 
	                                </div>
	                                <ul class="benefit__body">
	                                    <li>가족관계등록부</li>
	                                    <li>거주배정지역 지방여부</li>
	                                    <li>건강보험자격취득일</li>
	                                    <li>고등학교 재학여부</li>
	                                    <li>고용보험가입 사실여부</li>
	                                    <li>국가유공자 자격정보</li>
	                                    <li>국민기초생활수급자(교육급여) 수급정보</li>
	                                    <li>국민기초생활수급자(생계급여) 수급정보</li>
	                                    <li>국민기초생활수급자(의료급여) 수급정보</li>
	                                    <li>국민기초생활수급자(주거급여) 수급정보</li>
	                                    <li>기초연금수급 대상자 정보조회</li>
	                                </ul>
	                            </div>
	                            <div class="benefit__box">
	                                <div class="benefit__head">
	                                    <span>ㄴ</span> 
	                                </div>
	                                <ul class="benefit__body">
	                                    <li>농업경영체 자격정보</li>
	                                    <li>농업경영체증명 사실여부</li>
	                                </ul>
	                                <div class="benefit__head">
	                                    <span>ㄷ</span> 
	                                </div>
	                                <ul class="benefit__body">
	                                    <li>대학생 여부</li>
	                                    <li>대학원생 여부</li>
	                                    <li>대한민국 입국일</li>
	                                    <li>등급판정 결과 조회</li>
	                                </ul>
	                                <div class="benefit__head">
	                                    <span>ㅁ</span> 
	                                </div>
	                                <ul class="benefit__body">
	                                    <li>문화누리카드 대상자 여부</li>
	                                </ul>
	                                <div class="benefit__head">
	                                    <span>ㅂ</span> 
	                                </div>
	                                <ul class="benefit__body">
	                                    <li>보수월액(보험료정보)</li>
									</ul>
	                            </div>
	                            <div class="benefit__box">
	                                <ul class="benefit__body">
	                                    <li>보호기간 5년 이내 여부</li>
	                                    <li>보호대상자 여부</li>
	                                    <li>북한이탈주민 여부</li>
	                                </ul>
	                                <div class="benefit__head">
	                                    <span>ㅅ</span> 
	                                </div>
	                                <ul class="benefit__body">
	                                    <li>산정특례 대상자 정보</li>
	                                    <li>소유농지면적</li>
	                                    <li>실업급여수급 사실여부</li>
	                                </ul>
	                                <div class="benefit__head">
									   <span>ㅇ</span> 
									</div>
									<ul class="benefit__body">
										<li>양식면허(어업면허) 사실여부</li>
										<li>어선원부 사실여부</li>
										<li>어선허가(어업허가) 사실여부</li>										
										<li>어업경영체증명정보</li>
									</ul>
	                            </div>
	                        </div>
	                        <div class="benefit__wrap" style="display :none;">
								<div class="benefit__box">
									<ul class="benefit__body">
										<li>외국인거소사실 여부</li>
										<li>임산부정보</li>
										<li>임업경영체등록정보</li>                               
									</ul>
									<div class="benefit__head">
										<span>ㅈ</span> 
									</div>
									<ul class="benefit__body">
										<li>자활근로자 대상 여부</li>
										<li>장애수당/장애아동수당</li>
										<li>장애인 정보(장애인등급 정보)</li>
										<li>장애인 차량여부 및 등급정보 조회</li>
										<li>장애인연금수급자</li>
										<li>주민등록등본정보</li>
										<li>중학교 재학여부</li>
									</ul>
								</div>
								<div class="benefit__box">	
									<div class="benefit__head">
										<span>ㅊ</span> 
									</div>
									<ul class="benefit__body">
										<li>차상위계층확인</li>
										<li>차상위본인부담금 경감대상자</li>
										<li>차상위자활급여대상자</li>
										<li>차상위장애(아동)수당</li>
										<li>초등학교 재학여부</li>
										<li>축산업등록 대상자 여부</li>
										<li>취업알선서비스 신청 여부</li>
									</ul>
									<div class="benefit__head">
										<span>ㅎ</span> 
									</div>
									<ul class="benefit__body">
										<li>하나원 수료 여부(사회진출일기준)</li>
										<li>하나원 수료 일시(사회진출일)</li>
										<li>한부모가족사실여부 조회</li>
									</ul>
								</div>
								<div class="benefit__box">
									<ul class="benefit__body">
										<li>후계농업인 여부</li>
										<li>희귀질환자 여부</li>
									</ul>
								</div>
							</div>
	                        <div class="page-navigation">
				                <a href="#none" class="page-navigation__first disabled"><span class="hide">처음 페이지</span></a>
				                <a href="#none" class="page-navigation__prev disabled"><span class="hide">이전 페이지</span></a>
				                <div class="page-navigation__num-wrap">
				                    <a href="javascript:viewPage('2,1');" class="page-navigation__active"><span>1</span></a>
				                    <a href="javascript:viewPage('2,2');" class="page-navigation__num"><span>2</span></a>
				                </div>
				                <a href="#none" class="page-navigation__next disabled"><span class="hide">다음 페이지</span></a>
				                <a href="#none" class="page-navigation__last disabled"><span class="hide">마지막 페이지</span></a>
				            </div>
	                    </div>
	                    <div class="tab-content">
	                        <div class="benefit__wrap">
	                            <div class="benefit__box">
	                                <div class="benefit__head">
	                                   <span>ㄱ</span> 
	                                </div>
	                                <ul class="benefit__body">
	                                    <li>고용보험미적용자 출산급여 수급여부</li>
	                                    <li>고졸후학습자장학금(희망사다리 Ⅱ 유형) 수급여부</li>
	                                    <li>과수고품질시설현대화</li>
	                                    <li>국가근로장학금 수급여부</li>
	                                    <li>국가보훈대상자 대부지원 여부</li>
	                                    <li>국가보훈대상자 보철구 지급여부</li>
	                                    <li>국가보훈대상자 양로지원 여부</li>
	                                    <li>국가보훈대상자 의료지원 여부</li>
	                                    <li>국가보훈대상자 주거안정지원 여부</li>
	                                    <li>국가보훈대상자 지급된 교육비 지원여부</li>
	                                    <li>국가보훈대상자 취업지원 여부</li>
	                                </ul>
	                            </div>
	                            <div class="benefit__box">
	                                <ul class="benefit__body">
	                                    <li>국가우수장학금(이공계) 수급여부</li>
	                                    <li>국가유공자 차량 여부</li>
	                                    <li>국가장학금1유형(학생직접지원형) 수급여부</li>
	                                    <li>국가장학금2유형 수급여부</li>
	                                    <li>국민내일배움카드 수강 여부</li>
	                                </ul>
	                                <div class="benefit__head">
	                                    <span>ㄴ</span> 
	                                </div>
	                                <ul class="benefit__body">
	                                    <li>농어촌출신대학생학자금융자</li>
	                                    <li>농업경영이양보조금지급</li>
	                                    <li>농업에너지이용효율화시설지원</li>
	                                </ul>
	                                <div class="benefit__head">
	                                    <span>ㄷ</span> 
	                                </div>
	                                <ul class="benefit__body">
	                                    <li>다자녀장학금 수급여부</li>
	                                    <li>대통령과학장학금 수급여부</li>
	                                </ul>
	                            </div>
	                            <div class="benefit__box">	                                
	                                <div class="benefit__head">
	                                    <span>ㅂ</span> 
	                                </div>
	                                <ul class="benefit__body">
	                                    <li>법학전문대학원 장학금 수급여부</li>
	                                    <li>북한이탈주민 교육비 지원여부</li>
	                                    <li>북한이탈주민 사회보장 지원여부</li>
	                                    <li>북한이탈주민 의료지원 여부</li>
	                                    <li>북한이탈주민 자산형성지원 여부(미래행복통장)</li>
	                                    <li>북한이탈주민 주거지원금 지급여부</li>
	                                    <li>북한이탈주민 지방거주장려금 지급여부</li>
	                                </ul>
	                                <div class="benefit__head">
									   <span>ㅅ</span> 
									</div>
									<ul class="benefit__body">
										<li>산림복지바우처 수급여부</li>
										<li>수산직불금 수급여부</li>
										<li>스포츠강좌 이용권 대상자 여부</li>
									</ul>
	                            </div>
	                        </div>	
	                        <div class="benefit__wrap" style="display : none;">
								<div class="benefit__box">
									<ul class="benefit__body">
										<li>실업크레딧 지원</li>	
									</ul>
								<div class="benefit__head">
									<span>ㅇ</span> 
								</div>
									<ul class="benefit__body">
										<li>예술체육비전장학금 수급 여부</li>
										<li>우수고등학생해외유학장학금 수급 여부</li>
										<li>유기농업자재지원사업</li>
										<li>유기질비료 지원</li>
										<li>육아기 근로시간 단축급여 신청 여부</li>
										<li>인문100년장학금 수급 여부</li>
										<li>일반상환학자금대출</li>
										<li>임신출산 진료비 지원대상여부</li> 
									</ul>
									<div class="benefit__head">
									   <span>ㅈ</span> 
									</div>
									<ul class="benefit__body">
										<li>장기요양급여 복지용구 수급 여부</li>
									</ul>
								</div>
								<div class="benefit__box">
									<ul class="benefit__body">
										<li>장기요양급여 시설급여 수급 여부</li>
										<li>장기요양급여 재가급여 수급 여부</li>
										<li>장기요양급여 특별현금급여 수급 여부</li>
										<li>장애인연금 수급자 여부 조회</li>
										<li>제대군인 교육지원 여부</li>
										<li>제대군인 전직지원금 여부(보훈급여)</li>
										<li>제대군인 직업보도교육 지원 여부</li>
										<li>조사료생산기반확충사업</li>
										<li>중소기업취업연계장학금(희망사다리Ⅰ유형) 수급 여부</li>
										<li>지역인재장학금(국가장학금2유형) 수급 여부</li>
										<li>직업심리검사 완료 여부</li>              	
									</ul>
								</div>
								<div class="benefit__box">
									<div class="benefit__head">
										<span>ㅊ</span> 
									</div>
									<ul class="benefit__body">
										<li>청년 농업인 영농정착지원</li>
										<li>청년내일채움 수급 여부</li>
										<li>출산전후휴가급여 신청 여부</li>
										<li>취업역량강화프로그램 신청 여부</li>
										<li>취업후상환학자금대출</li>	
									</ul>
									<div class="benefit__head">
									   <span>ㅌ</span> 
									</div>
									<ul class="benefit__body">
										<li>토양개량제 지원</li>	
									</ul>
									<div class="benefit__head">
										<span>ㅎ</span> 
									</div>
									<ul class="benefit__body">
										<li>희귀질환자 의료비 수급 정보</li>
										<li>(공익직불 기본형) 면적직불금</li>
										<li>(공익직불 기본형) 소농직불금</li>
									</ul>
								</div>
							</div>
							<div class="benefit__wrap" style="display : none;">
								<div class="benefit__box">
									<ul class="benefit__body">
										<li>(공익직불 선택형) 경관보전직불</li>
										<li>(공익직불 선택형) 친환경농업직불</li>
										<li>FTA 피해보상 수급여부</li>
									</ul>
								</div>
								<div class="benefit__box">	
								</div>
							</div>                        
	                        <div class="page-navigation">
				                <a href="#none" class="page-navigation__first disabled"><span class="hide">처음 페이지</span></a>
				                <a href="#none" class="page-navigation__prev disabled"><span class="hide">이전 페이지</span></a>
				                <div class="page-navigation__num-wrap">
				                    <a href="javascript:viewPage('3,1');" class="page-navigation__active"><span>1</span></a>
				                    <a href="javascript:viewPage('3,2');" class="page-navigation__num"><span>2</span></a>
				                    <a href="javascript:viewPage('3,3');" class="page-navigation__num"><span>3</span></a>
				                </div>
				                <a href="#none" class="page-navigation__next disabled"><span class="hide">다음 페이지</span></a>
				                <a href="#none" class="page-navigation__last disabled"><span class="hide">마지막 페이지</span></a>
				            </div>
	                    </div>
	                    <div class="tab-content">
	                        <div class="benefit__wrap">
	                        	<c:forEach var="reqstSvc" items="${reqstSvc.list}" varStatus="status">
	                        		<c:choose>
		                        		<c:when test="${status.index eq '0' || status.index eq '12' || status.index eq '24'}">
		                        			<c:choose>
		                        				<c:when test="${reqstSvc.svcNm eq '1'}">
		                        					<div class="benefit__box">
		                        						<c:if test="${reqstSvc.svcNmInitial ne '' && reqstSvc.svcNmInitial ne null}">
							                                <div class="benefit__head">
							                                   <span>${reqstSvc.svcNmInitial}</span> 
							                                </div>
														</c:if>
						                                <ul class="benefit__body">
		                        				</c:when>
		                        				<c:otherwise>
		                        					<div class="benefit__box"> 
				                        				<ul class="benefit__body">
					                        				<li <c:if test="${reqstSvc.reqDt ne null}"> class='icon-badge'</c:if>>
					                        					<a href="/portal/rcvfvrSvc/dtlEx/${reqstSvc.svcId }" class="benefit__link">${reqstSvc.svcNm}</a>
					                        					<i class="benefit__icon"></i>
					                        				</li>
		                        				</c:otherwise>
		                        			</c:choose>		                        			
		                        		</c:when>
		                        		<c:when test="${status.index ne '11' && status.index ne '23' && status.index ne '35' && !status.last}">
		                        			<c:choose>
		                        				<c:when test="${reqstSvc.svcNm eq '1'}">
		                        					</ul>
		                        						<c:if test="${reqstSvc.svcNmInitial ne '' && reqstSvc.svcNmInitial ne null}">
							                                <div class="benefit__head">
							                                   <span>${reqstSvc.svcNmInitial}</span> 
							                                </div>
														</c:if>
					                                <ul class="benefit__body">
		                        				</c:when>
		                        				<c:otherwise>
					                        		<li <c:if test="${reqstSvc.reqDt ne null}"> class='icon-badge'</c:if>>
				                       					<a href="/portal/rcvfvrSvc/dtlEx/${reqstSvc.svcId }" class="benefit__link">${reqstSvc.svcNm}</a>
				                       					<i class="benefit__icon"></i>
				                       				</li>
				                       			</c:otherwise>
				                       		</c:choose>
		                       			</c:when>
		                       			<c:otherwise>
		                       				<c:choose>
		                       					<c:when test="${reqstSvc.svcNm eq '1'}">
		                       						</ul>
		                       							<c:if test="${reqstSvc.svcNmInitial ne '' && reqstSvc.svcNmInitial ne null}">
							                                <div class="benefit__head">
							                                   <span>${reqstSvc.svcNmInitial}</span> 
							                                </div>
														</c:if>
													</div>
		                       					</c:when>
		                       					<c:otherwise>
		                       						<li <c:if test="${reqstSvc.reqDt ne null}"> class='icon-badge'</c:if>>
				                       					<a href="/portal/rcvfvrSvc/dtlEx/${reqstSvc.svcId }" class="benefit__link">${reqstSvc.svcNm}</a>
				                       					<i class="benefit__icon"></i>
				                       				</li>
			                       				</ul>
		                       				</div>
		                       					</c:otherwise>
		                       				</c:choose>
		                        		</c:otherwise>
		                        	</c:choose>
	                        	</c:forEach>
							</div>                       
	                        <div class="page-navigation">
								<c:if test="${fn:length(reqstSvc.list) > 0}">
			                        <view:navi id="navSvc" cssClass="pagination" href="/portal/rcvfvrSvc/useguidance/rcvfvrSvcSttus" page="${reqstSvc}" pageIndex="pageIndex"> 
			                            <view:first cssClass="page-navigation__first disabled" alt="처음"/>
			                            <view:prev cssClass="page-navigation__prev disabled" alt="이전" />
			                            <div class="page-navigation__num-wrap">
											<view:pageList onCss="page-navigation__active" offCss="page-navigation__num" />
										</div>
			                            <view:next cssClass="page-navigation__next disabled" alt="다음" />
			                            <view:last cssClass="page-navigation__last disabled" alt="마지막"/>
			                        </view:navi>
			                    </c:if>
							</div>
	                    </div>
	                </div>
	            </div>
	        </div>
		</div>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			pageNavClass();
			
			var tab = "${tab}";
			
			if(tab != '' && tab != null){
				
				var tabTarget = $('.tab-anchor');
			    var tabContent = $('.tab-content');
			    var tabList = $('.tab-list');
			    	
		        $('.tab-list').children('li').eq(tab-1).children('a').addClass('active');
		        $('.tab-list').children('li').eq(tab-1).siblings().find(tabTarget).removeClass('active');
		        tabContent.hide();

		        var tabIndex = $('.tab-list').children('li').eq(tab-1).index();
		        tabContent.eq(tabIndex).show();
			}
			
			if($("#pageIndex").val() != '1' || (tab != '' && tab != null)){
				animate();
			}
		});
	
		function viewPage(viewPage){

			window.scrollTo(0,0);
			
			if(viewPage != '' && viewPage != null){
				var tab = viewPage.substr(0,1)-1;
				var page = viewPage.substr(2)-1;
				$('.tab-content').eq(tab).children('.benefit__wrap').css('display', 'none');
				$('.tab-content').eq(tab).children('.benefit__wrap').eq(page).css('display', '');
				
				if(page < 5){
					$('.page-navigation').eq(tab).children('.page-navigation__num-wrap').children('a').attr('class', 'page-navigation__num');
					$('.page-navigation').eq(tab).children('.page-navigation__num-wrap').children('a').removeAttr('style');
					$('.page-navigation').eq(tab).children('.page-navigation__num-wrap').children('a').eq(page).attr('class', 'page-navigation__active');
					$('.page-navigation').eq(tab).children('.page-navigation__num-wrap').children('a').eq(page).css('color', '#fff');					
				}
			}
			
			animate();
		}
		
		function animate(){
			if($(window).width() < 1024){
	            var tabPanelPot2 = $('.subsidy-status__tab').offset().top;
	            // var tabListHeight = tabList.outerHeight(true);
	            var headerHeight = $('.m-header').outerHeight(true);
	            // var totalHeight = tabListHeight + headerHeight;
	            // $('html, body').animate({scrollTop : tabPanelPot2 - headerHeight}, 1000);
	            $('html, body').scrollTop(tabPanelPot2 - headerHeight);
	        }
		}
		
		//페이지 css
		function pageNavClass(){
			if(document.getElementById("navSvc") != null){
				
				var prev = "page-navigation__prev";
				var next = "page-navigation__next";
				var first = "page-navigation__first";
				var last = "page-navigation__last";
				
				var index = $("#pageIndex").val() *1;
				if(index < 6){
					prev += " disabled";
					first += " disabled";
					
					document.getElementById("navSvc").children[0].children[0].children[0].href = "#none";
					document.getElementById("navSvc").children[0].children[1].children[0].href = "#none";
				}
				if ($("#lastPage").val() == $("#pageIndex").val()){
					next += " disabled";
					last += " disabled";
					document.getElementById("navSvc").children[0].children[3].children[0].href = "#none";
					document.getElementById("navSvc").children[0].children[4].children[0].href = "#none";
				}
				
				document.getElementById("navSvc").children[0].children[1].children[0].className = prev;
				document.getElementById("navSvc").children[0].children[3].children[0].className = next;
				$('.pagination').children('ul').children('li').eq(1).children('a').eq(0).attr('class', prev);
				$('.pagination').children('ul').children('li').eq(2).children('a').eq(0).attr('class', next);
				
				var cnt = 0;
				if("${tab}" == 4){cnt = 2;}
				
				var parentNode = $(".page-navigation__active").eq(cnt);
				var pageIndexNum = $(".page-navigation__active").eq(cnt).children();
				var indexNum = pageIndexNum.text();
				
				pageIndexNum.attr("class", "page-navigation__active");
				pageIndexNum.text("");
				pageIndexNum.append("<span>" + indexNum + "</span>");
				parentNode.contents().unwrap();
				
				$(".page-navigation__prev").text("");
				$(".page-navigation__next").text("");
				
				document.getElementById("navSvc").children[0].children[0].children[0].className = first;
				document.getElementById("navSvc").children[0].children[4].children[0].className = last;
				$('.pagination').children('ul').children('li').eq(0).children('a').eq(0).attr('class', first);
				$('.pagination').children('ul').children('li').eq(3).children('a').eq(0).attr('class', last);
				
				$(".page-navigation__first").text("");
				$(".page-navigation__last").text("");
			}			
		}

	</script>
</body>
</html>
