<!DOCTYPE html>
<html lang="ko">
	<head>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
		<title>나의 혜택 | 나의 서비스 | 보조금24</title>

		<!-- 개별 script -->
		<script src="/rcvfvrSvc/js/mySvc/myRcvfvrsvc.js?time=${toDate}"></script>		
		<!-- <script src="/rcvfvrSvc/js/tracer/jquery.min.js"></script> -->
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/commonTracer.jsp" />
	</head>

	<body>
		<div id="waitPage" style="display:none"><jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/mySvc/wait_default.jsp" /></div>
		<div class="skip-nav">
		    <a href="#content" class="skip-nav__item">본문바로가기</a>
		    <a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
		</div>
		<div id="wrap">
		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp">
				<jsp:param name="gnb" value="mySvc" />
			</jsp:include>

			<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" />

		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />

		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
				<jsp:param name="gnb" value="mySvc" />
				<jsp:param name="mnb" value="mySvc" />
			</jsp:include>
			
			<input type="hidden" id="updatePsbYn" value="${iVo.updatePsbYn}" />
			<input type="hidden" id="showView" />
			<input type="hidden" id="mobileYn" value="${mobileYn }" />
			
		    <div id="content" class="web-content">
		    	<c:choose>
		    		<c:when test="${svcYn eq 'Y'}">
		    			<div class="container background-skyblue">
				            <div class="container">
		                		<div class="common-background my-info">
				                    <div class="my-info__left">
				                        <div class="my-info__title">
				                            <strong>${iVo.cpttrNm}님</strong>의 <strong>혜택</strong>입니다.
				                        </div>
				                        <div class="my-info__text-wrap">
				                            <button type="button" class="button-update" onclick="javascript:checkSession();"><span>최신 정보 가져오기</span><i class="icon icon-update"></i></button>
				                            <div class="my-info__text">최종수정일 : ${iVo.updateTime}</div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
		    		</c:when>
		    		<c:otherwise>
		    			<div class="container container--full background-skyblue">
				            <div class="container">
				                <div class="common-background my-info">
				                    <div class="my-info__left">
				                        <div class="my-info__title">
				                            <strong>${user.USER_NM}</strong>님, <strong>나의 혜택을 조회하세요.</strong>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
		    		</c:otherwise>
		    	</c:choose>
        		
		        <c:if test="${errList.lnkSvcNm ne '' && errList.lnkSvcNm ne null }">
		        	<div class="alert__wrap">
			            <div class="alert__box">
			                <strong class="alert__title">알림</strong>
			                <p class="alert__text">${errList.lnkSvcNm }의 연계 시스템 장애로 일부 서비스 제공이 원활하지 않습니다. 서비스 이용에 참고하시기 바랍니다.</p>
			            </div>
			        </div>
		        </c:if>
		        
		        <c:choose>
		        	<c:when test="${svcYn eq 'Y'}">
						<div class="container">
							<div class="total-benefit__tab">
				                <!-- tab -->
				                <input type="hidden" value="<%=request.getParameter("tab")%>" id="viewTab" />
				                <ul class="wrap-tab">
				                    <li class="tab1">
				                        <a href="#" class="wrap-tab__item">
				                            <div class="total-benefit__item">
				                                <div class="total-benefit__name">신청하세요</div>
				                                <div class="total-benefit__number">(${rView.rsltCnt2}건)</div>
				                            </div>
				                        </a>
				                    </li>
				                    <li class="tab2">
				                        <a href="#" class="wrap-tab__item">
				                            <div class="total-benefit__item total-benefit__item--ty02">
				                                <div class="total-benefit__name">확인해보세요</div>
				                                <div class="total-benefit__number">(${rView.rsltCnt3}건)</div>                               
				                            </div>
				                        </a>
				                    </li>
				                    <li class="tab3">
				                        <a href="#" class="wrap-tab__item">
				                            <div class="total-benefit__item total-benefit__item--ty03">
				                                <div class="total-benefit__name">받고있어요</div>
				                                <div class="total-benefit__number">(${rView.rsltCnt1}건)</div>
				                            </div>
				                        </a>
				                    </li>
				                </ul>
								<!-- panel -->
				                <!-- 신청하세요 -->
				                <div class="total-benefit__panel">
									<c:choose>
										<c:when test="${rView.rsltCnt2 ne 0}">
											<div class="accordion-card__title">
						                        <!-- 210225 재수정 -->
		                        				<span class="title-name">신청하면 받을 수 있는 혜택을 찾았어요.<br class="mobile"> 현재 받고 있는 혜택도 보일 수 있어요.</span>
						                    </div>
						                    <div class="search-list search-list--block"><!-- 혜택이 2가지 이상 일때 search-list--block 클래스를 추가해주세요 -->
						                        <ul class="tab__list js-tab-list tab-card" role="tablist">
						                            <li id="tab1" class="tab__item tab-card__item js-tab is-active" role="tab" aria-controls="tab-panel1" aria-selected="true" tabindex="0" name="tab1">
						                                <i class="icon-card" aria-hidden="true"></i>카드보기
						                            </li>
						                            <li id="tab2" class="tab__item tab-card__item js-tab" role="tab" aria-controls="tab-panel2" name="tab2">
						                                <i class="icon-list" aria-hidden="true"></i>목록보기
						                            </li>
						                        </ul>
						                    </div>
											<div class="container container--full mgt0">
												<!-- 카드형 -->
						                        <div id="tab-panel1" class="tabpanel tabpanel-first" role="tabpanel" aria-labelledby="tab1">
						                            <div class="accordion__panel" data-element="accordion__panel">
						                                <!-- 컨텐츠 영역-->
						                                <div class="accordion-card__inner">
						                                    <div class="card">
						                                        <div class="card__list">
						                                        	<c:forEach var="rData" items="${rData}" varStatus="status">
						                                    			<c:if test="${rData.guidanceClsCd eq 'ZZ2502'}">
						                                    				<div class="card__item">
								                                                <a href="javascript:showDetail('${rData.svcId}');" class="card__link">
								                                                    <div class="card__contents">
								                                                    	<strong class="card__title">${rData.svcNm}</strong> 
			                                                        					<div class="card__text">${rData.svcPpo}</div>
								                                                        <div class="card__charge">${rData.refrncNmArr }</div>				                                                        
																						<c:if test="${rData.rsltOrder ne 0}">
										                                    				<div class="card__name">${rData.rsltNm}</div>
										                                    			</c:if>
										                                    			<c:if test="${rData.reqstMeanCdArr != ''}" >
																							<c:forEach var="reqstMeanCd" items="${fn:split(rData.reqstMeanCdArr,',')}" varStatus="spStatus">
																						    	<c:if test="${reqstMeanCd eq 'BF0101'}">
								                                                        			<div class="card__badge">온라인 신청</div>
																								</c:if>
																							</c:forEach>
																						</c:if>
								                                                    </div>
								                                                </a>
								                                                <a href="#" class="card__share"><span class="hide">공유하기</span></a>
								                                                <div class="card__sns">
								                                                    <ul class="card__sns--list" id="/portal/rcvfvrSvc/dtlEx/${rData.svcId}">
								                                                        <li><a href="#none" class="facebook" title="새창열림" onclick="javascript:snsPopup('facebook', this)">facebook</a></li>
													                                    <li><a href="#none" class="twitter" title="새창열림" onclick="javascript:snsPopup('twitter', this)">twitter</a></li>
													                                    <li><a href="#none" class="etc" title="새창열림">connect</a></li>
								                                                    </ul>
								                                                    <button class="sns-close"><span class="hide">닫기</span></button>
								                                                </div>
								                                            </div>
						                                    			</c:if>
						                                    		</c:forEach>			                                    		
						                                        </div>
						                                    </div>
						                                </div>
						                                <!--// 컨텐츠 영역 -->
						                            </div>
						                            <!-- //혜택 2, 3가지 일때-->
						        
						                        </div>
						                        <!-- //카드형 -->
						
						                        <!-- 리스트형 -->
						                        <div id="tab-panel2" class="tabpanel" role="tabpanel" aria-labelledby="tab2">			        
						                            <div class="accordion__panel" data-element="accordion__panel">
						                                <!-- 컨텐츠 영역-->
						                                <div class="accordion-card__inner">
						                                    <div class="tab__table">
						                                        <div class="table__header">
						                                            <ul class="table__tr">
						                                                <li>서비스명</li>
						                                                <li>지원내용</li>
		                                                				<li>접수기관</li>
			                                                			<li>문의처</li>
						                                                <li>신청방법</li>
						                                            </ul>
						                                        </div>
						                                        <div class="table__body">			                                        
						                                        	<c:forEach var="rData" items="${rData}" varStatus="status">
						                                    			<c:if test="${rData.guidanceClsCd eq 'ZZ2502'}">
								                                            <a href="javascript:showDetail('${rData.svcId}');" class="table__link">
								                                                <ul class="table__tr">
								                                                    <li class="ellipsis">
								                                                    	<c:if test="${rData.rsltOrder ne 0}">
								                                                    		<strong>[${rData.rsltNm}]</strong>
										                                    			</c:if>
								                                                    	${rData.svcNm}
								                                                    </li>
								                                                    <li class="ellipsis">${rData.svcPpo}</li>
								                                                    <li class="text-align__center">${rData.rcvOrgNm}</li>
								                                                    <li class="text-align__center">${fn:replace(fn:replace(rData.refrncArr, '/ ', '/</br>'),',','</br>')}</li>
								                                                    <li class="text-align__center">
								                                                    	 <c:if test="${rData.reqstMeanCdArr != ''}" >
																							<c:choose>
															                                	<c:when test="${fn:indexOf(rData.reqstMeanCdArr,'BF0101') > -1}">		                                		
															                                		<span class="apply-online">정부24 온라인신청</span>
															                                	</c:when>
															                                	<c:when test="${fn:indexOf(rData.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(rData.reqstMeanCdArr,'BF0102') > -1}">		                                		
															                                		<span class="apply-site">타사이트신청</span>
															                                	</c:when>
															                                	<c:when test="${fn:indexOf(rData.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(rData.reqstMeanCdArr,'BF0102') < 0 and fn:indexOf(rData.reqstMeanCdArr,'BF0103') > -1}">		                                		
															                                		<span class="apply-visit">방문신청</span>
															                                	</c:when>
																								<c:otherwise>
															                                	</c:otherwise>
																							</c:choose>
																						</c:if>
								                                                    </li>					                                                    
								                                                </ul>
								                                            </a>
																		</c:if>
																	</c:forEach>
						                                        </div>
						                                    </div>
						                                </div>
						                                <!--// 컨텐츠 영역 -->
						                            </div>						                            
						                            <!-- //혜택 2, 3가지 일때 -->						        
						                        </div>
						                        <!-- //리스트형 -->
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="search-list search-list--block"><!-- 혜택이 2가지 이상 일때 search-list--block 클래스를 추가해주세요 -->
						                    </div>
						                    <div class="container container--full mgt0">
												<div class="no-data">
						                            <div class="container">
						                                <div class="no-data__top">
						                                    <div class="no-data__text">신청시 받을 수 있는 혜택을 찾을 수 없어요</div>
						                                    <!-- <div class="no-data__sub-text">추후 자격정보를 추가 연계할 예정이며,<br class="mobile"> 혜택 안내 정보는 달라질 수 있습니다.</div> -->
						                                    <div class="no-data__button-wrap">
						                                        <div class="no-data__box">
						                                            <p class="no-data__desc">보조금24에서 안내하는 전체 서비스를 확인하실 수 있어요.</p>
						                                            <button type="button" class="no-data__button" onclick="location.href='/portal/rcvfvrSvc/svcFind/svcSearchAll'">
						                                                <span>혜택 전체보기</span>
						                                            </button>
						                                        </div>
						                                        <div class="no-data__box">
						                                            <p class="no-data__desc">자격요건에 따른 혜택을 간편하게 찾아보세요.</p>
						                                            <button type="button" class="no-data__button" onclick="location.href='/portal/rcvfvrSvc/svcFind/simpleFindStepOne'">
						                                                <span>혜택 간편찾기</span>
						                                            </button>
						                                        </div>
						                                    </div>
						                                </div>
						                            </div>
						                        </div>
											</div>
										</c:otherwise>	
									</c:choose>
								</div>
							<!-- 확인해보세요 -->
			                <div class="total-benefit__panel total-benefit--type02">
								<c:choose>
									<c:when test="${rView.rsltCnt3 ne 0}">
										<div class="accordion-card__title">
											<!-- 210225 재수정 -->
		                        			<span class="title-name">지원대상과 선정요건 등 확인이 필요하며,<br class="mobile"> 접수심사에 따라 결과가 다를 수 있어요.</span>
					                    </div>
					                    <div class="search-list search-list--block"><!-- 혜택이 2가지 이상 일때 search-list--block 클래스를 추가해주세요 -->
					                        <ul class="tab__list js-tab-list tab-card" role="tablist">
					                            <li id="tab3" class="tab__item tab-card__item js-tab" role="tab" aria-controls="tab-panel3" aria-selected="true" tabindex="0" name="tab3">
					                                <i class="icon-card" aria-hidden="true"></i>카드보기
					                            </li>
					                            <li id="tab4" class="tab__item tab-card__item js-tab" role="tab" aria-controls="tab-panel4" name="tab4">
					                                <i class="icon-list" aria-hidden="true"></i>목록보기
					                            </li>
					                        </ul>
					                    </div>
					                    <div class="container container--full mgt0">
					                        <!-- 카드형 -->
					                        <div id="tab-panel3" class="tabpanel tabpanel-first" role="tabpanel" aria-labelledby="tab3">
					                            <div class="accordion__panel" data-element="accordion__panel">
					                                <!-- 컨텐츠 영역-->
					                                <div class="accordion-card__inner">
					                                    <div class="card">
					                                        <div class="card__list">
					                                        	<c:forEach var="rData" items="${rData}" varStatus="status">
					                                    			<c:if test="${rData.guidanceClsCd eq 'ZZ2503'}">
							                                            <div class="card__item">
							                                                <a href="javascript:showDetail('${rData.svcId}');" class="card__link">
							                                                    <div class="card__contents">
							                                                    	<strong class="card__title">${rData.svcNm}</strong> 
		                                                        					<div class="card__text">${rData.svcPpo}</div>
							                                                        <div class="card__charge">${rData.refrncNmArr }</div>
																					<c:if test="${rData.rsltOrder ne 0}">
									                                    				<div class="card__name">${rData.rsltNm}</div>
									                                    			</c:if>
									                                    			<c:if test="${rData.reqstMeanCdArr != ''}" >
																						<c:forEach var="reqstMeanCd" items="${fn:split(rData.reqstMeanCdArr,',')}" varStatus="spStatus">
																					    	<c:if test="${reqstMeanCd eq 'BF0101'}">
							                                                        			<div class="card__badge">온라인 신청</div>
																							</c:if>
																						</c:forEach>
																					</c:if>
							                                                    </div>
							                                                </a>
							                                                <a href="#" class="card__share"><span class="hide">공유하기</span></a>
							                                                <div class="card__sns">
							                                                    <ul class="card__sns--list" id="/portal/rcvfvrSvc/dtlEx/${rData.svcId}">
							                                                        <li><a href="#none" class="facebook" title="새창열림" onclick="javascript:snsPopup('facebook', this)">facebook</a></li>
												                                    <li><a href="#none" class="twitter" title="새창열림" onclick="javascript:snsPopup('twitter', this)">twitter</a></li>
												                                    <li><a href="#none" class="etc" title="새창열림">connect</a></li>
							                                                    </ul>
							                                                    <button class="sns-close"><span class="hide">닫기</span></button>
							                                                </div>
							                                            </div>
																	</c:if>
																</c:forEach>
					                                        </div>
					                                    </div>
					                                </div>
					                                <!--// 컨텐츠 영역 -->
					                            </div>
					                            <!-- //혜택 2, 3가지 일때-->
					        
					                        </div>
					                        <!-- //카드형 -->
					
					                        <!-- 리스트형 -->
					                        <div id="tab-panel4" class="tabpanel pc" role="tabpanel" aria-labelledby="tab4">
					                            <div class="accordion__panel" data-element="accordion__panel">
					                                <!-- 컨텐츠 영역-->
					                                <div class="accordion-card__inner">
					                                    <div class="tab__table">
					                                        <div class="table__header">
					                                            <ul class="table__tr">
					                                                <li>서비스명</li>
					                                                <li>지원내용</li>
		                                                			<li>접수기관</li>
		                                                			<li>문의처</li>
					                                                <li>신청방법</li>
					                                            </ul>
					                                        </div>
					                                        <div class="table__body">			                                        
					                                        	<c:forEach var="rData" items="${rData}" varStatus="status">
					                                    			<c:if test="${rData.guidanceClsCd eq 'ZZ2503'}">
							                                            <a href="javascript:showDetail('${rData.svcId}');" class="table__link">
							                                                <ul class="table__tr">
							                                                    <li class="ellipsis">
							                                                    	<c:if test="${rData.rsltOrder ne 0}">
							                                                    		<strong>[${rData.rsltNm}]</strong>
									                                    			</c:if>
							                                                    	${rData.svcNm}
							                                                    </li>
							                                                    <li class="ellipsis">${rData.svcPpo}</li>
							                                                    <li class="text-align__center">${rData.rcvOrgNm}</li>
							                                                    <li class="text-align__center">${fn:replace(fn:replace(rData.refrncArr, '/ ', '/</br>'),',','</br>')}</li>
							                                                    <li class="text-align__center">
							                                                    	 <c:if test="${rData.reqstMeanCdArr != ''}" >
																						<c:choose>
														                                	<c:when test="${fn:indexOf(rData.reqstMeanCdArr,'BF0101') > -1}">		                                		
														                                		<span class="apply-online">정부24 온라인신청</span>
														                                	</c:when>
														                                	<c:when test="${fn:indexOf(rData.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(rData.reqstMeanCdArr,'BF0102') > -1}">		                                		
														                                		<span class="apply-site">타사이트신청</span>
														                                	</c:when>
														                                	<c:when test="${fn:indexOf(rData.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(rData.reqstMeanCdArr,'BF0102') < 0 and fn:indexOf(rData.reqstMeanCdArr,'BF0103') > -1}">		                                		
														                                		<span class="apply-visit">방문신청</span>
														                                	</c:when>
																							<c:otherwise>
														                                	</c:otherwise>
																						</c:choose>
																					</c:if>
							                                                    </li>
							                                                </ul>
							                                            </a>
																	</c:if>
																</c:forEach>
					                                        </div>
					                                    </div>
					                                </div>
					                                <!--// 컨텐츠 영역 -->
					                            </div>
					                            <!-- //혜택 2, 3가지 일때 -->
					        
					                        </div>
					                        <!-- //리스트형 -->
					                    </div>
									</c:when>
									<c:otherwise>
										<div class="no-data">
				                            <div class="container">
				                                <div class="no-data__top">
				                                    <!-- 210302 수정 -->
		                                    		<div class="no-data__text">받을 가능성이 높은 혜택을 찾을 수가 없어요.</div>
				                                    <!-- <div class="no-data__sub-text">추후 자격정보를 추가 연계할 예정이며,<br class="mobile"> 혜택 안내 정보는 달라질 수 있습니다.</div> -->
				                                    <div class="no-data__button-wrap">
				                                        <div class="no-data__box">
				                                            <p class="no-data__desc">보조금24에서 안내하는 전체 서비스를 확인하실 수 있어요.</p>
				                                            <button type="button" class="no-data__button" onclick="location.href='/portal/rcvfvrSvc/svcFind/svcSearchAll'">
				                                                <span>혜택 전체보기</span>
				                                            </button>
				                                        </div>
				                                        <div class="no-data__box">
				                                            <p class="no-data__desc">자격요건에 따른 혜택을 간편하게 찾아보세요.</p>
				                                            <button type="button" class="no-data__button" onclick="location.href='/portal/rcvfvrSvc/svcFind/simpleFindStepOne'">
				                                                <span>혜택 간편찾기</span>
				                                            </button>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
									</c:otherwise>
								</c:choose>			                    
			                </div>
			                
			                <!-- 받고있어요 -->
			                <div class="total-benefit__panel total-benefit--type03">
								<c:choose>
									<c:when test="${rView.rsltCnt1 ne 0}">									
					                    <div class="accordion-card__title">
					                        <!-- 210225 재수정 -->
		                        			<span class="title-name">받고 있는 혜택입니다.<br class="mobile"> 이전에 받았던 혜택도 보일 수 있어요.</span>
					                    </div>
					                    <div class="search-list search-list--block"><!-- 혜택이 2가지 이상 일때 search-list--block 클래스를 추가해주세요 -->
					                        <ul class="tab__list js-tab-list tab-card" role="tablist">
					                            <li id="tab5" class="tab__item tab-card__item js-tab" role="tab" aria-controls="tab-panel5" aria-selected="true" tabindex="0" name="tab5">
					                                <i class="icon-card" aria-hidden="true"></i>카드보기
					                            </li>
					                            <li id="tab6" class="tab__item tab-card__item js-tab" role="tab" aria-controls="tab-panel6" name="tab6">
					                                <i class="icon-list" aria-hidden="true"></i>목록보기
					                            </li>
					                        </ul>
					                    </div>
					                    <div class="container container--full mgt0">
					                        <!-- 카드형 -->
					                        <div id="tab-panel5" class="tabpanel tabpanel-first" role="tabpanel" aria-labelledby="tab5">
					                            <div class="accordion__panel" data-element="accordion__panel">
					                                <!-- 컨텐츠 영역-->
					                                <div class="accordion-card__inner">
					                                    <div class="card">
					                                        <div class="card__list">
					                                            <c:forEach var="rData" items="${rData}" varStatus="status">
					                                    			<c:if test="${rData.guidanceClsCd eq 'ZZ2501'}">
							                                            <div class="card__item">
							                                                <a href="javascript:showDetail('${rData.svcId}','N');" class="card__link">
							                                                    <div class="card__contents">
							                                                    	<strong class="card__title">${rData.svcNm}</strong>
		                                                        					<div class="card__text">${rData.svcPpo}</div>
							                                                        <div class="card__charge">${rData.refrncNmArr }</div>
																					<c:if test="${rData.rsltOrder ne 0}">
									                                    				<div class="card__name">${rData.rsltNm}</div>
									                                    			</c:if>
									                                    			<c:if test="${rData.reqstMeanCdArr != ''}" >
																						<c:forEach var="reqstMeanCd" items="${fn:split(rData.reqstMeanCdArr,',')}" varStatus="spStatus">
																					    	<c:if test="${reqstMeanCd eq 'BF0101'}">
							                                                        			<div class="card__badge">온라인 신청</div>
																							</c:if>
																						</c:forEach>
																					</c:if>
							                                                    </div>
							                                                </a>
							                                                <a href="#" class="card__share"><span class="hide">공유하기</span></a>
							                                                <div class="card__sns">
							                                                    <ul class="card__sns--list" id="/portal/rcvfvrSvc/dtlEx/${rData.svcId}">
							                                                        <li><a href="#none" class="facebook" title="새창열림" onclick="javascript:snsPopup('facebook', this)">facebook</a></li>
												                                    <li><a href="#none" class="twitter" title="새창열림" onclick="javascript:snsPopup('twitter', this)">twitter</a></li>
												                                    <li><a href="#none" class="etc" title="새창열림">connect</a></li>
							                                                    </ul>
							                                                    <button class="sns-close"><span class="hide">닫기</span></button>
							                                                </div>
							                                            </div>
																	</c:if>
																</c:forEach>			                                            
					                                        </div>
					                                    </div>
					                                </div>
					                                <!--// 컨텐츠 영역 -->
					                            </div>
					                            <!-- //혜택 2, 3가지 일때-->
					        
					                        </div>
					                        <!-- //카드형 -->
					
					                        <!-- 리스트형 -->
					                        <div id="tab-panel6" class="tabpanel" role="tabpanel" aria-labelledby="tab6">
					        
					                            <div class="accordion__panel" data-element="accordion__panel">
					                                <!-- 컨텐츠 영역-->
					                                <div class="accordion-card__inner">
					                                    <div class="tab__table">
					                                        <div class="table__header">
					                                            <ul class="table__tr">
					                                                <li>서비스명</li>
					                                                <li>지원내용</li>
		                                                			<li>접수기관</li>
		                                                			<li>문의처</li>
					                                                <li>신청방법</li>
					                                            </ul>
					                                        </div>
					                                        <div class="table__body">
					                                            <c:forEach var="rData" items="${rData}" varStatus="status">
					                                    			<c:if test="${rData.guidanceClsCd eq 'ZZ2501'}">
							                                            <a href="javascript:showDetail('${rData.svcId}','N');" class="table__link">
							                                                <ul class="table__tr">
							                                                    <li class="ellipsis">
							                                                    	<c:if test="${rData.rsltOrder ne 0}">
							                                                    		<strong>[${rData.rsltNm}]</strong>
									                                    			</c:if>
							                                                    	${rData.svcNm}
							                                                    </li>
							                                                    <li class="ellipsis">${rData.svcPpo}</li>
							                                                    <li class="text-align__center">${rData.rcvOrgNm}</li>
							                                                    <li class="text-align__center">${fn:replace(fn:replace(rData.refrncArr, '/ ', '/</br>'),',','</br>')}</li>				                                                   
							                                                    <li class="text-align__center">
							                                                    	 <c:if test="${rData.reqstMeanCdArr != ''}" >
							                                                    	 	<c:choose>
														                                	<c:when test="${fn:indexOf(rData.reqstMeanCdArr,'BF0101') > -1}">		                                		
														                                		<span class="apply-online">정부24 온라인신청</span>
														                                	</c:when>
														                                	<c:when test="${fn:indexOf(rData.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(rData.reqstMeanCdArr,'BF0102') > -1}">		                                		
														                                		<span class="apply-site">타사이트신청</span>
														                                	</c:when>
														                                	<c:when test="${fn:indexOf(rData.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(rData.reqstMeanCdArr,'BF0102') < 0 and fn:indexOf(rData.reqstMeanCdArr,'BF0103') > -1}">		                                		
														                                		<span class="apply-visit">방문신청</span>
														                                	</c:when>
																							<c:otherwise>
														                                	</c:otherwise>
																						</c:choose>
																					</c:if>
							                                                    </li>
							                                                </ul>
							                                            </a>
																	</c:if>
																</c:forEach>
					                                        </div>
					                                    </div>
					                                </div>
					                                <!--// 컨텐츠 영역 -->
					                            </div>
					                            <!-- //혜택 2, 3가지 일때 -->
					                        </div>       
					                        <!-- //리스트형 -->
					                    </div>
									</c:when>
									<c:otherwise>
										<div class="no-data">
				                            <div class="container">
				                                <div class="no-data__top">
				                                    <!-- 210302 수정 -->
		                                    		<div class="no-data__text">현재 받고 있는 혜택을 찾을 수가 없어요.</div>
				                                    <!-- <div class="no-data__sub-text">추후 자격정보를 추가 연계할 예정이며,<br class="mobile"> 혜택 안내 정보는 달라질 수 있습니다.</div> -->
				                                    <div class="no-data__button-wrap">
				                                        <div class="no-data__box">
				                                            <p class="no-data__desc">보조금24에서 안내하는 전체 서비스를 확인하실 수 있어요.</p>
				                                            <button type="button" class="no-data__button" onclick="location.href='/portal/rcvfvrSvc/svcFind/svcSearchAll'">
				                                                <span>혜택 전체보기</span>
				                                            </button>
				                                        </div>
				                                        <div class="no-data__box">
				                                            <p class="no-data__desc">자격요건에 따른 혜택을 간편하게 찾아보세요.</p>
				                                            <button type="button" class="no-data__button" onclick="location.href='/portal/rcvfvrSvc/svcFind/simpleFindStepOne'">
				                                                <span>혜택 간편찾기</span>
				                                            </button>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
										</div>
									</c:otherwise>
								</c:choose>
			                </div>
			            </div>
			        </div>
			        <c:if test="${rView.rsltCnt4 ne 0}">
						<div class="container container--full background-press">
				            <div class="container">
				                <div class="press-area">
				                    <div class="press-area__title">긴급지원</div>
				                    <div class="card">
				                        <div class="card__list">
		                                   	<c:forEach var="rData" items="${rData}" varStatus="status">
		                                   		<c:if test="${rData.guidanceClsCd eq 'ZZ2504'}">
		                                   			<div class="card__item">
		                                                <a href="javascript:showDetail('${rData.svcId}');" class="card__link">
		                                                    <div class="card__contents">
		                                                    	<strong class="card__title">${rData.svcNm}</strong>
		                                                    	<div class="card__text">${rData.svcPpo}</div>
						                                        <div class="card__charge">${rData.refrncNm}</div>
						                                        <c:if test="${rData.rsltOrder ne 0}">
				                                    				<div class="card__name">${rData.rsltNm}</div>
				                                    			</c:if>
				                                    			<c:if test="${rData.reqstMeanCdArr != ''}" >
																	<c:forEach var="reqstMeanCd" items="${fn:split(rData.reqstMeanCdArr,',')}" varStatus="spStatus">
																    	<c:if test="${reqstMeanCd eq 'BF0101'}">
		                                                        			<div class="card__badge">온라인 신청</div>
																		</c:if>
																	</c:forEach>
																</c:if>															
		                                                    </div>
		                                                </a>
		                                                <a href="#" class="card__share"><span class="hide">공유하기</span></a>
		                                                <div class="card__sns">
		                                                    <ul class="card__sns--list" id="/portal/rcvfvrSvc/dtlEx/${rData.svcId}">
		                                                        <li><a href="#none" class="facebook" title="새창열림" onclick="javascript:snsPopup('facebook', this)">facebook</a></li>
							                                    <li><a href="#none" class="twitter" title="새창열림" onclick="javascript:snsPopup('twitter', this)">twitter</a></li>
							                                    <li><a href="#none" class="etc" title="새창열림">connect</a></li>
		                                                    </ul>
		                                                    <button class="sns-close"><span class="hide">닫기</span></button>
		                                                </div>
		                                            </div>
		                                   		</c:if>
		                                   	</c:forEach>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
					</c:if>
				</c:when>
				<c:otherwise>
					<div class="custom-benefits__wrap">
		                <p class="custom-benefits__title">맞춤혜택 조회하기를 누르면<br class="mobile"> 나의 혜택을 확인할 수 있습니다.</p>
		                <a href="#" onclick="javascript:checkSession();" class="custom-benefits__link"><span>맞춤혜택 조회하기</span></a>
		            </div>
				</c:otherwise>
	        </c:choose>
			
			<div class="agree__wrap">
				<div class="agree__box guide">
	                <a href="/portal/rcvfvrSvc/useguidance/rcvfvrSvcSttus" class="agree__link">
	                    <strong class="agree__title">맞춤안내 305종 확인!</strong>
	                    <p class="agree__desc">자격/수급정보, 온라인신청25종도<br class="mobile"> 확인할 수 있어요!</p>
	                </a>
	            </div>
	            <div class="agree__box faq">
	                <a href="/portal/rcvfvrSvc/useguidance/faq?accordionYn=N" class="agree__link">
	                    <strong class="agree__title">보조금24에 대한 궁금증!</strong>
	                    <p class="agree__desc">자주묻는 질문(FAQ)에서 확인하세요!</p>
	                </a>
	            </div>
			</div>
	    </div>
	    		
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/mySvc/myRcvfvrsvcPop01.jsp" />
		<%-- <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/mySvc/myRcvfvrsvcPop02.jsp" /> --%>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/mySvc/myRcvfvrsvcPop03.jsp" />
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/mySvc/myRcvfvrsvcPop04.jsp" />
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/mySvc/myRcvfvrsvcPop05.jsp" />
		
	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
</body>
</html>
