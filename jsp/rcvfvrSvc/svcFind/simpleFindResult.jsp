<!DOCTYPE html>
<html lang="ko">
<%@page import="java.util.*" %>
<head>
<meta http-equiv="Cache-control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
<title>간편찾기 결과 | 간편찾기 | 혜택 찾기 | 보조금24</title>

<!-- 개별 script -->
<script src="/rcvfvrSvc/js/svcFind/simpleFindResult.js?time=${toDate}"></script>
</head>
<%
	String copy = request.getParameter("copy");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
%>
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
			<jsp:param name="gnb" value="svcFind" />
		</jsp:include>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" />
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
			<jsp:param name="gnb" value="svcFind" />
			<jsp:param name="mnb" value="simpleFind" />
		</jsp:include>
		<form:form commandName="simpleFindVo" method="get" action="/portal/rcvfvrSvc/svcFind/simpleFindResult" id="simpleFindVo">
			<div id="content" class="web-content">
				<div class="container container--full background-skyblue">
		            <div class="container">
		                <div class="common-background visual-box visual-box--simple2">
		                    <div class="visual-box__inner">
                        		<div class="visual-box__title"><strong>간편</strong> <strong>혜택</strong>찾기 <strong>결과</strong>입니다.</div>
		                        <div class="visual-box__text">URL 복사로 친구와 공유하세요.<button class="button button-copy" onclick="javascript:copyUrl();">
		                        		<span class="relative">URL 복사</span>
		                        	</button>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>				
				<div class="container container--full tag-area">
					<div class="container">
						<div class="tag-area__title">선택정보</div>
						<div class="tag-area__list" id="search-box__form"></div>
						<button class="button-reselect" onClick="location.href='/portal/rcvfvrSvc/svcFind/simpleFindStepOne'"><span>다시 선택하기</span></button>
					</div>
				</div>
				<div class="container">
					<input type="hidden" id="cdNm" />
					<input type="hidden" id="pageIndex" name="pageIndex" value="${simpleFindList.pageIndex }" />
					<input type="hidden" id="lastPage" name="lastPage" value="${simpleFindList.lastPage }" />
					<input type="hidden" id="showView" name="showView" value="${simpleFindVo.showView }" />
					<input type="hidden" id="copy" name="copy" value=<%=copy %> />
					<c:if test="${simpleFindList.totalCount ne 0}">
						<div class="card__data">총 <span>${simpleFindList.totalCount }건</span>의 혜택이 있습니다.</div>
						<ul class="tab__list js-tab-list tab-card tab-search" role="tablist">
							<li id="tab1" class="tab__item tab-card__item js-tab is-active" role="tab" aria-controls="tab-panel1" aria-selected="true" tabindex="0">
			                    <i class="icon-card" aria-hidden="true"></i>카드보기
			                </li>
			                <li id="tab2" class="tab__item tab-card__item js-tab" role="tab" aria-controls="tab-panel2">
			                    <i class="icon-list" aria-hidden="true"></i>목록보기
			                </li>
						</ul>
					</c:if>		            
					<c:choose>
						<c:when test="${simpleFindList.totalCount eq 0}">
							<hr class="mobile mobile--full" aria-hidden="true">
							<div class="search-list mgt20 total-service">
				                <div class="search-list__title search-list__title--result">검색결과 총 <span>0건</span>의 혜택을 찾았습니다.</div>
				            </div>
				            <div class="nodata-wrap">
				                <div class="nodata-wrap__item">
				                    검색결과를 찾을 수 없습니다.<br>
				                </div>
				            </div>
						</c:when>
						<c:otherwise>
							<div id="tab-panel2" class="tabpanel" role="tabpanel" aria-labelledby="tab2">
								<div class="list-wrap">
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
											<view:startListNum var="startNum" pageData="${simpleFindList}" order="asc" />
											<c:forEach var="simpleFindList" items="${simpleFindList.list}" varStatus="status">
												 <a href="/portal/rcvfvrSvc/dtlEx/${simpleFindList.svcId }" class="table__link">
					                                <ul class="table__tr">
					                                    <li class="ellipsis">${simpleFindList.svcNm }</li>
					                                    <li class="ellipsis">${simpleFindList.svcPpo }</li>
					                                    <li class="text-align__center">${simpleFindList.rcvOrgNm}</li>
					                                    <li class="text-align__center">${fn:replace(fn:replace(simpleFindList.refrncArr, '/ ', '/</br>'),',','</br>')}</li>
					                                    <li class="text-align__center">
					                                    	<c:if test="${simpleFindList.reqstMeanCdArr ne '' && simpleFindList.reqstMeanCdArr ne null}" >
																<c:choose>
								                                	<c:when test="${fn:indexOf(simpleFindList.reqstMeanCdArr,'BF0101') > -1}">		                                		
								                                		<span class="apply-online">정부24 온라인신청</span>
								                                	</c:when>
								                                	<c:when test="${fn:indexOf(simpleFindList.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(simpleFindList.reqstMeanCdArr,'BF0102') > -1}">		                                		
								                                		<span class="apply-site">타사이트신청</span>
								                                	</c:when>
								                                	<c:when test="${fn:indexOf(simpleFindList.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(simpleFindList.reqstMeanCdArr,'BF0102') < 0 and fn:indexOf(simpleFindList.reqstMeanCdArr,'BF0103') > -1}">		                                		
								                                		<span class="apply-visit">방문신청</span>
								                                	</c:when>
																	<c:otherwise>
								                                	</c:otherwise>
																</c:choose>
															</c:if>
					                                    </li>
					                                </ul>
					                            </a>																					
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<div id="tab-panel1" class="tabpanel tabpanel-first" role="tabpanel" aria-labelledby="tab1">
								<div class="card">
									<div class="card__list">										
										<view:startListNum var="startNum" pageData="${simpleFindList}" order="asc" />
										<c:forEach var="simpleFindList" items="${simpleFindList.list}" varStatus="status">
											<div class="card__item">
					                            <a href="/portal/rcvfvrSvc/dtlEx/${simpleFindList.svcId }" class="card__link">
					                                <div class="card__contents">
					                                    <strong class="card__title">${simpleFindList.svcNm }</strong>
					                                    <div class="card__text">${simpleFindList.svcPpo }</div>
					                                    <div class="card__charge">${simpleFindList.refrncNmArr}</div>
					                                    <c:if test="${simpleFindList.reqstMeanCdArr ne '' && simpleFindList.reqstMeanCdArr ne null}" >
															<c:forEach var="sReqstMeanCd" items="${fn:split(simpleFindList.reqstMeanCdArr,',')}" varStatus="spStatus">
														    	<c:if test="${sReqstMeanCd eq 'BF0101'}">
					                                    			<div class="card__badge">온라인 신청</div>
																</c:if>
															</c:forEach>
														</c:if>
					                                </div>
					                            </a>
					                            <a href="#" class="card__share"><span class="hide">공유하기</span></a>
					                            <div class="card__sns">
					                                <ul class="card__sns--list" id="/portal/rcvfvrSvc/dtlEx/${simpleFindList.svcId}">
														<li><a href="#none" class="facebook" title="새창열림" onclick="javascript:snsPopup('facebook', this)">facebook</a></li>
														<li><a href="#none" class="twitter" title="새창열림" onclick="javascript:snsPopup('twitter', this)">twitter</a></li>
														<li><a href="#none" class="etc" title="새창열림">connect</a></li>
													</ul>
					                                <button class="sns-close"><span class="hide">닫기</span></button>
					                            </div>
					                        </div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="page-navigation">
								<div class="page-navigation">
									<c:if test="${fn:length(simpleFindList.list) > 0}">
				                        <view:navi id="navSvc" cssClass="pagination" href="/portal/rcvfvrSvc/svcFind/simpleFindResult" page="${simpleFindList}" pageIndex="pageIndex">
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
						</c:otherwise>
					</c:choose>
				</div>
				<c:if test="${(not empty user && user.USER_ID == null) || empty user}">
					<div class="container">
			            <div class="accout-box">
			                <div class="accout-box__text">로그인을 하시면 <span>나의 맞춤혜택</span>을 <br class="mobile">확인하실 수 있습니다.</div>
			                <a href="/nlogin/?curr_url=/portal/rcvfvrSvc/main" class="accout-box__anchor">로그인</a>
			            </div>
			        </div>
		        </c:if>
			</div>
		</form:form>		
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
		<script>
			changeTab();
		</script>
		
	</div>
</body>
</html>
