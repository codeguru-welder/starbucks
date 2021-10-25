<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">

	<head>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
		<meta http-equiv="Expires" content="-1" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="No-Cache" />
		<title>검색결과 | 보조금24</title>
	</head>

	<body>
		<div class="skip-nav">
		    <a href="#content" class="skip-nav__item">본문바로가기</a>
		    <a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
		</div>
		<div id="wrap">
		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp" />

		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" />

		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />
		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
				<jsp:param name="mnb" value="search" />
			</jsp:include>
			<script type="text/javascript" src="/rcvfvrSvc/js/search/ark.js" ></script><!-- 자동완성관련 js -->
    <div id="content" class="web-content">
        <div class="container container--full background-skyblue">
            <div class="container">
                <div class="common-background__type2 search-box search-box--result mgt0">
                    <div class="search-box__form input-wrap">
                    	<form name="search" id="search" action="/portal/rcvfvrSvc/search" method="POST">
                            <input type="hidden" name="startCount" value="${startCount }"/>
                            <input type="hidden" name="sort" value="${sort }"/>
                            <input type="hidden" name="sortOrder" value="${sortOrder }"/>
                            <input type="hidden" name="collection" value="${collection }"/>
                            <input type="hidden" name="range" value="${range }"/>
                            <input type="hidden" name="startDate" value="${startDate }"/>
                            <input type="hidden" name="endDate"value="${endDate }"/>
                            <input type="hidden" name="searchField"value="${searchField }"/>
                            <input type="hidden" name="reQuery" />
                            <input type="hidden" name="stQuery" />
                            <input type="hidden" name="reChk" />
                            <input type="hidden" name="tccd" />
                            <input type="hidden" name="showView" id="showView" value="${showView }" />
                            <input type="hidden" name="realQuery" value="${realQuery }" />
                            <input type="text"  name="query" value="${query }" id="query" autocomplete="off" onkeypress="javascript:pressCheck((event),this);" class="input-text search-box__input input-text2" title="검색어 입력" placeholder="검색어를 입력해주세요." >
                        	<button type="button" class="search-box__button" onClick="javascript:doSearch();" ><span class="relative">검색</span></button>
                        </form>
                    </div>
                    <div class="relation-keyword" id="relationKeyword" ></div>
            </div>
 
            <!-- 자동완성 -->
            	<div id="total-search__wrap" class="total-search__wrap"></div>
            <!-- //자동완성 end -->
                </div>
        </div>
        <div class="web-content__inner">
            <div class="web-content__left">
                <div class="mobile keyword-wrap">
                    <div class="keyword-wrap__list">
                        <div class="keyword-wrap__title">인기검색어</div>
                        <div class="keyword-wrap__scroll">
                            <div class="keyword-wrap__scroll-inner" id="popword_mobile"></div>
                        </div>
                    </div>
                    <div class="keyword-wrap__list">
                        <div class="keyword-wrap__title">최근검색어</div>
                        <div class="keyword-wrap__scroll">
                            <div class="keyword-wrap__scroll-inner" id="mykeyword_mobile"></div>
                        </div>
                    </div>
                </div>
                <div class="container container--full">
                    <hr class="mobile mobile--full">
                    <div class="search-list mgt0 mgt-etc">
                        <div class="search-list__form input-wrap">    	
							<input type="text" class="input-text search-box__input" id="reChk" title="검색어 입력" placeholder="결과내 재검색">
							<div class="radio-wrap">
							    <div class="radio-wrap__item">
							        <input type="radio" class="radio-wrap__input" id="rdo1" name="agree1" checked="">
							        <i class="radio-wrap__icon" aria-hidden="true"></i>
							        <label for="rdo1" class="radio-wrap__label">포함</label>
							    </div>
							    <div class="radio-wrap__item">
							        <input type="radio" class="radio-wrap__input" id="rdo2" name="agree1">
							        <i class="radio-wrap__icon" aria-hidden="true"></i>
							        <label for="rdo2" class="radio-wrap__label">제외</label>
							    </div>
							</div>
							<div class="button-wrap2">
                            	<button class="button-table" type="button" onclick="javascript:checkReSearch();return false;"><span class="relative">검색</span></button>						
                            </div>
                            <div class="select-wrap2">
		                		<div class="select-box">
	                                <select class="select-wrap__item" title="정렬 선택" id="sort">
	                                    <option value="RANK" ${sort.equals('RANK')? "selected" : "" }>정확도순</option>
	                                    <option value="SORT_TTL" ${sort.equals('SORT_TTL')? "selected" : "" }>가나다순</option>
	                                    <option value="VW_CNT" ${sort.equals('VW_CNT')? "selected" : "" }>조회순</option>
	                                    <!-- option value="">인기순</option>
	                                    <option value="">마감순</option>
	                                    <option value="">추천순</option>
	                                    <option value="">최근순</option-->
	                                </select>
	                                <select class="select-wrap__item" title="지원형태 선택" id="tccd">
	                                    <option value="ALL">전체</option>
	                                    <option value="cash"    ${tccd.equals('cash')? "selected" : "" }>현금</option>
	                                    <option value="stuff"   ${tccd.equals('stuff')? "selected" : "" }>현물</option>
	                                    <option value="service" ${tccd.equals('service')? "selected" : "" }>서비스</option>
	                                    <option value="ticket" ${tccd.equals('ticket')? "selected" : "" }>이용권</option>
	                                    <option value="etc"  ${tccd.equals('etc')? "selected" : "" }>기타</option>
	                                </select>    
                                	<div class="button-apply search-list__form">
	                                	<button class="button-table" onclick="javascript:checkSortTccd();return false;">적용</button>
		                            </div>
								</div>
                            </div>
                        </div>
                        <ul class="tab__list js-tab-list tab-card" role="tablist">
                       		<li id="tab1" class="tab__item tab-card__item js-tab is-active" role="tab" aria-controls="tab-panel1" aria-selected="true" tabindex="0">
                                <i class="icon-card" aria-hidden="true"></i>카드보기
                            </li>
                            <li id="tab2" class="tab__item tab-card__item js-tab" role="tab" aria-controls="tab-panel2">
                                <i class="icon-list" aria-hidden="true"></i>목록보기
                            </li>
                            
                        </ul>
                    </div>
                    <hr class="hr-divider mgt20" aria-hidden="true">                    
                    <hr class="mobile mobile--full">     
                    <c:if test="${result.COLLECTIONS.RCV_FVR_SVC.TOTALCOUNT > 0 }">
	                    <div class="search-list mgt20 total-service">
						    <div class="search-list__title search-list__title--result">검색결과 총 <span>${totalCount }건</span>의 혜택을 찾았습니다.</div>
						</div>
					</c:if> 
                    <div id="tab-panel1" class="tabpanel tabpanel-first" role="tabpanel" aria-labelledby="tab1">

                        <c:if test="${result.COLLECTIONS.RCV_FVR_SVC.TOTALCOUNT <= 0 }">
                        	<div class="search-list mgt20 total-service">
	                            <div class="search-list__title search-list__title--result">검색결과 총 <span>0건</span>의 혜택을 찾았습니다.</div>
	                        </div>
	                        <div class="card card-nodata card--keyword02">
	                            <div class="card__nodata">
	                                <!-- 210204 내용 수정 -->
	                                <strong class="search-text">${query}</strong>에 대한 검색결과가 없습니다.
	                                <span>단어의 철자가 정확한 지 확인해주세요.<br>보다 일반적인 단어로 검색해보세요.</span>
	                            </div>
	                        </div>
                        </c:if>
                        
                        <div class="card card--keyword02">
                            <div class="card__list">                            
	                            <c:set var="thisCollection" value="${result.COLLECTIONS.RCV_FVR_SVC }" />
	                            <c:forEach var="document" items="${thisCollection.DOCUMENTS }" varStatus="status">
	                            	<div class="card__item">
	                                    <a href="${document.LINK }" class="card__link">
	                                        <div class="card__contents">
	                                            <strong class="card__title">${document.TTL }</strong>
	                                            <div class="card__text">${document.CONT }</div>
	                                            <div class="card__charge">${document.REFRNC_NM}</div>									
	                                           	<c:forTokens var="meanCd" items="${document.REQST_MEAN_CD}" delims="||">
		                                        	<c:choose>
		                                        		<c:when test="${fn:contains('BF0101',meanCd)}">
				                                            <div class="card__badge">온라인 신청</div>
		                                        		</c:when>
		                                        	</c:choose>
	                                        	</c:forTokens>
	                                        </div>
	                                    </a>
	                                    <a href="#" class="card__share"><span class="hide">공유하기</span></a>
	                                    <div class="card__sns">
	                                        <ul class="card__sns--list" id="/portal/rcvfvrSvc/dtlEx/${document.SVC_ID}">
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
                        
                        <c:if test="${collection ne 'ALL' && totalCount > 10 }">
	                        <div class="page-navigation">
	                            ${pageLinks }
	                        </div>
                        </c:if>
                    </div>
                                                       
                    <div id="tab-panel2" class="tabpanel" role="tabpanel" aria-labelledby="tab2">
                        <c:if test="${result.COLLECTIONS.RCV_FVR_SVC.TOTALCOUNT <= 0 }">
                        	<div class="search-list mgt20 total-service">
	                            <div class="search-list__title search-list__title--result">검색결과 총 <span>0건</span>의 혜택을 찾았습니다.</div>
	                        </div>
	                        <div class="card card-nodata card--keyword02">
	                            <div class="card__nodata">
	                                <!-- 210204 내용 수정 -->
	                                <strong class="search-text">${query}</strong>에 대한 검색결과가 없습니다.
	                                <span>단어의 철자가 정확한 지 확인해주세요.<br>보다 일반적인 단어로 검색해보세요.</span>
	                            </div>
	                        </div>
                        </c:if>
                        <!-- here?? -->
                        
                        <c:if test="${result.COLLECTIONS.RCV_FVR_SVC.TOTALCOUNT > 0 }">
	                        <div class="list-wrap list-wrap--keyword02">
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
	                                	<c:set var="thisCollection" value="${result.COLLECTIONS.RCV_FVR_SVC }" />
	                            		<c:forEach var="document" items="${thisCollection.DOCUMENTS }" varStatus="status">
		                                    <a href="${document.LINK }" class="table__link">
		                                        <ul class="table__tr">
		                                            <li class="ellipsis">${document.TTL }</li>
		                                            <li class="ellipsis">${document.CONT }</li>
		                                            <li class="text-align__center">${document.RCV_ORG_NM }</li>
		                                            <li class="text-align__center">${fn:replace(fn:replace(document.REFRNC_TEL_NO, '/ ', '/</br>'),',','</br>')}</li>
		                                            <li class="text-align__center">
		                                            	<c:if test="${document.REQST_MEAN_CD ne '' && document.REQST_MEAN_CD ne null}" >
															<c:choose>
							                                	<c:when test="${fn:indexOf(document.REQST_MEAN_CD,'BF0101') > -1}">		                                		
							                                		<span class="apply-online">정부24 온라인신청</span>
							                                	</c:when>
							                                	<c:when test="${fn:indexOf(document.REQST_MEAN_CD,'BF0101') < 0 and fn:indexOf(document.REQST_MEAN_CD,'BF0102') > -1}">		                                		
							                                		<span class="apply-site">타사이트신청</span>
							                                	</c:when>
							                                	<c:when test="${fn:indexOf(document.REQST_MEAN_CD,'BF0101') < 0 and fn:indexOf(document.REQST_MEAN_CD,'BF0102') < 0 and fn:indexOf(document.REQST_MEAN_CD,'BF0103') > -1}">		                                		
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
	                    </c:if>
                        <c:if test="${collection ne 'ALL' && totalCount > 10 }">
	                        <div class="page-navigation">
	                            ${pageLinks }
	                        </div>
                        </c:if>
                    </div>
                    
                </div>
            </div>
            <div class="web-content__right">
                <div class="keyword-box">
                    <div class="keyword-box__title">인기검색어</div>
                    <ul class="keyword-box__list" id="popword"></ul>
                </div>
                <div class="keyword-box">
                    <div class="keyword-box__title">최근검색어</div>
                    <ul class="keyword-box__list" id="mykeyword"></ul>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	getPopkeyword();	//통합검색 인기검색어
	
	getRelationkeyword("${query}");	//연관검색어
	getMyKeyword("${query}", "${totalCount}");	//내가찾은검색어

	changeTab() //페이징 이동시, 리스트형으로 보기 , 카드형으로 보기 
	
	//console.log('분석된 엔티티 >>> ${realQuery}'); //임시
	
	//url 복사
	$(".share-list__icon--copy").click(function(){

		var urlTxt = window.location.protocol + "//" + window.location.hostname;
		urlTxt += this.parentElement.parentElement.parentElement.id;
		var copyArea = document.createElement("textarea");
		copyArea.value = urlTxt;

		document.body.appendChild(copyArea);
		copyArea.select();
		document.execCommand("copy");
		document.body.removeChild(copyArea);

		alert("URL이 클립보드에 복사되었습니다.");
	});
    $('body').data('plugin_modal').init();
});
</script>

<!-- 공통 script -->
<!-- <script src="/rcvfvrSvc/library/jquery/jquery.min.js"></script> -->
<!-- <script src="/rcvfvrSvc/library/jquery/jquery-ui.js"></script> -->
<!-- <script src="/rcvfvrSvc/library/slick/slick.js"></script> -->
<!-- <script src="/rcvfvrSvc/js/ui/pualugin.js"></script> -->
<!-- <script src="/rcvfvrSvc/js/ui/common.js"></script> -->
</body>

</html>

