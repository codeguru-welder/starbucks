<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<title>전체보기 | 혜택 찾기 | 보조금24</title>
<!-- 개별 script -->
<script src="/rcvfvrSvc/js/svcFind/svcSearchAll.js?time=${toDate}"></script>
</head>
<style>
.page-navigation li {
	display: inline-block;
	border-width: 0px;
	border-style: initial;
	border-color: initial;
	border-image: initial;
	margin: 0px;
	padding: 0px;
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
			<jsp:param name="mnb" value="svcSearchAll" />
		</jsp:include>

		<form:form name="search" method="POST" action="/portal/rcvfvrSvc/svcFind/svcSearchAll">
			<div id="content" class="web-content">
		        <div class="container container--full background-skyblue">
		            <div class="container">
		                <div class="common-background visual-box visual-box--simple3">
		                    <div class="visual-box__inner">
		                        <div class="visual-box__title">보조금24 혜택 전체보기</div>
		                        <div class="visual-box__text visual-box__text--two">도움이 필요한 친구, 이웃에게 혜택을 공유하세요.</div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="container">
		            <div data-element="toggle">
		                <div class="search-list mgt30 total-service">
		                    <div class="search-list__form input-wrap">
	                            <input type="hidden" name="startCount" value="${startCount }"/>
	                            <input type="hidden" name="sortOrder" value="${sortOrder }"/>
	                            <input type="hidden" name="collection" value="${collection }"/>
	                            <input type="hidden" name="range" value="${range }"/>
	                            <input type="hidden" name="startDate" value="${startDate }"/>
	                            <input type="hidden" name="endDate"value="${endDate }"/>
	                            <input type="hidden" name="searchField"value="${searchField }"/>
	                            <input type="hidden" name="reQuery" />
	                            <input type="hidden" name="realQuery" value="${realQuery }" />
	                            <input type="hidden" name="showView" id="showView" value="${showView }" />
	                            <input type="hidden" name="query" />
	                            
	                            <div class="select-wrap">
	                            	<input type="text" name="reChk" class="input-text search-box__input" id="reChk" title="검색어 입력" placeholder="결과내 재검색" onkeypress="javascript:pressCheckSearchAll((event),this);">
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
			                            <button class="button-table" type="button" onclick="javascript:checkReSearchAll();"><span class="relative">검색</span></button>
			                            <button class="button-filter" type="button" data-element="toggle__anchor"><span>상세검색</span></button>
									</div>
		                        </div>
		                    </div>
		                </div>
		                
		                <div class="service-filter" data-element="toggle__panel" style="display: block;">
		                    <!-- 추가 -->
		                    <div class="service-filter__inner pc">
		                        <div class="service-filter__list">
		                            <div class="service-filter__title pc">서비스 분야</div>
		                            <div class="filter">
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_01" value="ALL" name="checkFinc"  ${fn:contains(checkFinc, 'ALL')? "checked" : "" }>
		                                    <label for="chk01_01">전체</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_02"  value="NB0308" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0308')? "checked" : "" }>
		                                    <label for="chk01_02">교육</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_03"  value="NB0306" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0306')? "checked" : "" }>
		                                    <label for="chk01_03">고용안정</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_04" value="NB0302" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0302')? "checked" : "" }>
		                                    <label for="chk01_04">보건/의료</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_05" value="NB0311" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0311')? "checked" : "" }>
		                                    <label for="chk01_05">사회복지</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_06" value="NB0301" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0301')? "checked" : "" }>
		                                    <label for="chk01_06">농어업축산임업</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_07" value="NB0304" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0304')? "checked" : "" }>
		                                    <label for="chk01_07">산업/에너지</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_08" value="NB0309" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0309')? "checked" : "" }>
		                                    <label for="chk01_08">안전보장</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_09" value="NB0303" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0303')? "checked" : "" }>
		                                    <label for="chk01_09">문화활동</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_10" value="NB0305" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0305')? "checked" : "" }>
		                                    <label for="chk01_10">주거안정</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_11" value="NB0312" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0312')? "checked" : "" }>
		                                    <label for="chk01_11">보훈</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk01_12" value="|(!NB0308 !NB0306 !NB0302 !NB0311 !NB0301 !NB0304 !NB0309 !NB0303 !NB0305 !NB0312)" name="checkFinc" ${fn:contains(checkFinc, '!NB0308 !NB0306 !NB0302 !NB0311 !NB0301 !NB0304 !NB0309 !NB0303 !NB0305 !NB0312')? "checked" : "" }>
		                                    <label for="chk01_12">기타</label>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="service-filter__list">
		                            <div class="service-filter__title pc">생애주기별</div>    
		                            <div class="filter">
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk03_01" value="ALL" name="checkAge" ${fn:contains(checkAge, 'ALL')? "checked" : "" }>
		                                    <label for="chk03_01">전체</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk03_02" value="FA0302" name="checkAge" ${fn:contains(fn:replace(checkAge,"!FA",""), 'FA0302')? "checked" : "" }>
		                                    <label for="chk03_02">영유아</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk03_03" value="FA0303|FA0304" name="checkAge" ${fn:contains(fn:replace(checkAge,"!FA",""), 'FA0303|FA0304')? "checked" : "" }>
		                                    <label for="chk03_03">아동/청소년</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk03_04"  value="FA0305" name="checkAge" ${fn:contains(fn:replace(checkAge,"!FA",""), 'FA0305')? "checked" : "" }>
		                                    <label for="chk03_04">청년</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk03_05" value="FA0306|FA0307" name="checkAge" ${fn:contains(fn:replace(checkAge,"!FA",""), 'FA0306|FA0307')? "checked" : "" }>
		                                    <label for="chk03_05">중/장년</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk03_06" value="FA0308" name="checkAge" ${fn:contains(fn:replace(checkAge,"!FA",""), 'FA0308')? "checked" : "" }>
		                                    <label for="chk03_06">노년</label>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="service-filter__list">
		                            <div class="service-filter__title pc">소득기준별</div>
		                            <div class="filter">
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk04_01" value="ALL" name="checkIncomeInfo" ${fn:contains(checkIncomeInfo, 'ALL')? "checked" : "" }>
		                                    <label for="chk04_01">전체</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk04_02" value="FA0402" name="checkIncomeInfo" ${fn:contains(fn:replace(checkIncomeInfo,"!FA",""), 'FA0402')? "checked" : "" }>
		                                    <label for="chk04_02">기초수급자</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk04_03" value="FA0403" name="checkIncomeInfo" ${fn:contains(fn:replace(checkIncomeInfo,"!FA",""), 'FA0403')? "checked" : "" }>
		                                    <label for="chk04_03">차상위</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk04_04" value="FA0404|FA0405|FA0406|FA0408" name="checkIncomeInfo" ${fn:contains(fn:replace(checkIncomeInfo,"!FA",""), 'FA0404|FA0405|FA0406|FA0408')? "checked" : "" }>
		                                    <label for="chk04_04">소득70%이하</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk04_05" value="FA0407" name="checkIncomeInfo" ${fn:contains(fn:replace(checkIncomeInfo,"!FA",""), 'FA0407')? "checked" : "" }>
		                                    <label for="chk04_05">긴급지원대상자</label>
		                                </div>
		                                
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk04_06" value="|(!FA0402 !FA0403 !FA0404 !FA0405 !FA0406 !FA0407 !FA0408)" name="checkIncomeInfo" ${fn:contains(checkIncomeInfo, '!FA0402 !FA0403 !FA0404 !FA0405 !FA0406 !FA0407 !FA0408')? "checked" : "" }>
		                                    <label for="chk04_06">기타</label>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="service-filter__list">
		                            <div class="service-filter__title pc">서비스대상</div>  
		                            <div class="filter">
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_01" value="ALL" name="checkTarget" ${fn:contains(checkTarget, 'ALL')? "checked" : "" }>
		                                    <label for="chk05_01">전체</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_02" value="FA0502|FA0509" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0502|FA0509')? "checked" : "" }>
		                                    <label for="chk05_02">실직/구직자</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_03" value="FA0503|FA0508" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0503|FA0508')? "checked" : "" }>
		                                    <label for="chk05_03">근로자/직장인</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_04" value="FA0510|FA0511" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0510|FA0511')? "checked" : "" }>
		                                    <label for="chk05_04">창업/자영업자</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_05" value="FA0811" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0811')? "checked" : "" }>
		                                    <label for="chk05_05">장애인</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_06" value="FA0812" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0812')? "checked" : "" }>
		                                    <label for="chk05_06">보훈대상자</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_07" value="FA0504" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0504')? "checked" : "" }>
		                                    <label for="chk05_07">농업인</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_08"  value="FA0505" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0505')? "checked" : "" }>
		                                    <label for="chk05_08">어업인</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_09" value="FA0506|FA0507" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0506|FA0507')? "checked" : "" }>
		                                    <label for="chk05_09">임업/축산업인</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_10" value="FA0802|FA0803" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0802|FA0803')? "checked" : "" }>
		                                    <label for="chk05_10">다문화 가정</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_11" value="FA0807" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0807')? "checked" : "" }>
		                                    <label for="chk05_11">임산부/영유아 가정</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_12" value="FA0805|FA0809" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0805|FA0809')? "checked" : "" }>
		                                    <label for="chk05_12">한부모/조손 가정</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_13" value="FA0808" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0808')? "checked" : "" }>
		                                    <label for="chk05_13">소년/소녀 가장</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_14" value="FA0804" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0804')? "checked" : "" }>
		                                    <label for="chk05_14">북한이탈주민</label>
		                                </div>
		                                <div class="filter__item">
		                                    <input type="checkbox" id="chk05_15" value="|(!FA0502 !FA0509 !FA0503 !FA0508 !FA0510 !FA0511 !FA0811 !FA0812 !FA0504 !FA0505 !FA0506 !FA0507 !FA0802 !FA0803 !FA0807 !FA0805 !FA0809 !FA0808 !FA0804)" name="checkTarget" ${fn:contains(checkTarget, '!FA0502 !FA0509 !FA0503 !FA0508 !FA0510 !FA0511 !FA0811 !FA0812 !FA0504 !FA0505 !FA0506 !FA0507 !FA0802 !FA0803 !FA0807 !FA0805 !FA0809 !FA0808 !FA0804')? "checked" : "" }>
		                                    <label for="chk05_15">기타</label>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <!-- //추가 -->
		                    
		                    <div class="service-filter__inner mobile">
		                        <div class="service-filter__list">
		                            <div class="service-filter__mobile-wrap">
		                                <div class="service-filter__title mobile"><button type="button" class="service-filter__anchor" >서비스 분야</button></div>
		                                <div class="filter-wrap">
		                                    <div class="filter">
		                                        <div class="filter__item">
				                                    <input type="checkbox" id="chk11_01" value="ALL" name="checkFinc"  ${fn:contains(checkFinc, 'ALL')? "checked" : "" }>
				                                    <label for="chk11_01">전체</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_02"  value="NB0308" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0308')? "checked" : "" }>
				                                    <label for="chk11_02">교육</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_03"  value="NB0306" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0306')? "checked" : "" }>
				                                    <label for="chk11_03">고용안정</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_04" value="NB0302" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0302')? "checked" : "" }>
				                                    <label for="chk11_04">보건/의료</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_05" value="NB0311" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0311')? "checked" : "" }>
				                                    <label for="chk11_05">사회복지</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_06" value="NB0301" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0301')? "checked" : "" }>
				                                    <label for="chk11_06">농어업축산임업</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_07" value="NB0304" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0304')? "checked" : "" }>
				                                    <label for="chk11_07">산업/에너지</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_08" value="NB0309" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0309')? "checked" : "" }>
				                                    <label for="chk11_08">안전보장</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_09" value="NB0303" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0303')? "checked" : "" }>
				                                    <label for="chk11_09">문화활동</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_10" value="NB0305" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0305')? "checked" : "" }>
				                                    <label for="chk11_10">주거안정</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_11" value="NB0312" name="checkFinc" ${fn:contains(fn:replace(checkFinc,"!NB",""), 'NB0312')? "checked" : "" }>
				                                    <label for="chk11_11">보훈</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk11_12" value="|(!NB0308 !NB0306 !NB0302 !NB0311 !NB0301 !NB0304 !NB0309 !NB0303 !NB0305 !NB0312)" name="checkFinc" ${fn:contains(checkFinc, '!NB0308 !NB0306 !NB0302 !NB0311 !NB0301 !NB0304 !NB0309 !NB0303 !NB0305 !NB0312')? "checked" : "" }>
				                                    <label for="chk11_12">기타</label>
				                                </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="service-filter__list">
		                            <div class="service-filter__mobile-wrap">
		                                <div class="service-filter__title mobile"><button type="button" class="service-filter__anchor">생애주기별</button></div>
		                                <div class="filter-wrap">
		                                    <div class="filter">
		                                        <div class="filter__item">
				                                    <input type="checkbox" id="chk13_01" value="ALL" name="checkAge" ${fn:contains(checkAge, 'ALL')? "checked" : "" }>
				                                    <label for="chk13_01">전체</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk13_02" value="FA0302" name="checkAge" ${fn:contains(fn:replace(checkAge,"!FA",""), 'FA0302')? "checked" : "" }>
				                                    <label for="chk13_02">영유아</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk13_03" value="FA0303|FA0304" name="checkAge" ${fn:contains(fn:replace(checkAge,"!FA",""), 'FA0303|FA0304')? "checked" : "" }>
				                                    <label for="chk13_03">아동/청소년</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk13_04"  value="FA0305" name="checkAge" ${fn:contains(fn:replace(checkAge,"!FA",""), 'FA0305')? "checked" : "" }>
				                                    <label for="chk13_04">청년</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk13_05" value="FA0306|FA0307" name="checkAge" ${fn:contains(fn:replace(checkAge,"!FA",""), 'FA0306|FA0307')? "checked" : "" }>
				                                    <label for="chk13_05">중/장년</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk13_06" value="FA0308" name="checkAge" ${fn:contains(fn:replace(checkAge,"!FA",""), 'FA0308')? "checked" : "" }>
				                                    <label for="chk13_06">노년</label>
				                                </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="service-filter__list">
		                            <div class="service-filter__mobile-wrap">
		                                <div class="service-filter__title mobile"><button type="button" class="service-filter__anchor">소득기준별</button></div>
		                                <div class="filter-wrap">
		                                    <div class="filter">
		                                        <div class="filter__item">
				                                    <input type="checkbox" id="chk14_01" value="ALL" name="checkIncomeInfo" ${fn:contains(checkIncomeInfo, 'ALL')? "checked" : "" }>
				                                    <label for="chk14_01">전체</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk14_02" value="FA0402" name="checkIncomeInfo" ${fn:contains(fn:replace(checkIncomeInfo,"!FA",""), 'FA0402')? "checked" : "" }>
				                                    <label for="chk14_02">기초수급자</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk14_03" value="FA0403" name="checkIncomeInfo" ${fn:contains(fn:replace(checkIncomeInfo,"!FA",""), 'FA0403')? "checked" : "" }>
				                                    <label for="chk14_03">차상위</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk14_04" value="FA0404|FA0405|FA0406|FA0408" name="checkIncomeInfo" ${fn:contains(fn:replace(checkIncomeInfo,"!FA",""), 'FA0404|FA0405|FA0406|FA0408')? "checked" : "" }>
				                                    <label for="chk14_04">소득70%이하</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk14_05" value="FA0407" name="checkIncomeInfo" ${fn:contains(fn:replace(checkIncomeInfo,"!FA",""), 'FA0407')? "checked" : "" }>
				                                    <label for="chk14_05">긴급지원대상자</label>
				                                </div>
				                                
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk14_06" value="|(!FA0402 !FA0403 !FA0404 !FA0405 !FA0406 !FA0407 !FA0408)" name="checkIncomeInfo" ${fn:contains(checkIncomeInfo, '!FA0402 !FA0403 !FA0404 !FA0405 !FA0406 !FA0407 !FA0408')? "checked" : "" }>
				                                    <label for="chk14_06">기타</label>
				                                </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="service-filter__list">
		                            <div class="service-filter__mobile-wrap">
		                                <div class="service-filter__title mobile"><button type="button" class="service-filter__anchor">서비스대상</button></div>
		                                <div class="filter-wrap">
		                                    <div class="filter">
		                                        <div class="filter__item">
				                                    <input type="checkbox" id="chk15_01" value="ALL" name="checkTarget" ${fn:contains(checkTarget, 'ALL')? "checked" : "" }>
				                                    <label for="chk15_01">전체</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_02" value="FA0502|FA0509" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0502|FA0509')? "checked" : "" }>
				                                    <label for="chk15_02">실직/구직자</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_03" value="FA0503|FA0508" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0503|FA0508')? "checked" : "" }>
				                                    <label for="chk15_03">근로자/직장인</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_04" value="FA0510|FA0511" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0510|FA0511')? "checked" : "" }>
				                                    <label for="chk15_04">창업/자영업자</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_05" value="FA0811" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0811')? "checked" : "" }>
				                                    <label for="chk15_05">장애인</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_06" value="FA0812" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0812')? "checked" : "" }>
				                                    <label for="chk15_06">보훈대상자</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_07" value="FA0504" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0504')? "checked" : "" }>
				                                    <label for="chk15_07">농업인</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_08"  value="FA0505" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0505')? "checked" : "" }>
				                                    <label for="chk15_08">어업인</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_09" value="FA0506|FA0507" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0506|FA0507')? "checked" : "" }>
				                                    <label for="chk15_09">임업/축산업인</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_10" value="FA0802|FA0803" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0802|FA0803')? "checked" : "" }>
				                                    <label for="chk15_10">다문화 가정</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_11" value="FA0807" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0807')? "checked" : "" }>
				                                    <label for="chk15_11">임산부/영유아 가정</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_12" value="FA0805|FA0809" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0805|FA0809')? "checked" : "" }>
				                                    <label for="chk15_12">한부모/조손 가정</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_13" value="FA0808" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0808')? "checked" : "" }>
				                                    <label for="chk15_13">소년/소녀 가장</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_14" value="FA0804" name="checkTarget" ${fn:contains(fn:replace(checkTarget,"!FA",""), 'FA0804')? "checked" : "" }>
				                                    <label for="chk15_14">북한이탈주민</label>
				                                </div>
				                                <div class="filter__item">
				                                    <input type="checkbox" id="chk15_15" value="|(!FA0502 !FA0509 !FA0503 !FA0508 !FA0510 !FA0511 !FA0811 !FA0812 !FA0504 !FA0505 !FA0506 !FA0507 !FA0802 !FA0803 !FA0807 !FA0805 !FA0809 !FA0808 !FA0804)" name="checkTarget" ${fn:contains(checkTarget, '!FA0502 !FA0509 !FA0503 !FA0508 !FA0510 !FA0511 !FA0811 !FA0812 !FA0504 !FA0505 !FA0506 !FA0507 !FA0802 !FA0803 !FA0807 !FA0805 !FA0809 !FA0808 !FA0804')? "checked" : "" }>
				                                    <label for="chk15_15">기타</label>
				                                </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="button-wrap">
		                        <button class="button button-reset"><span>초기화</span></button>
		                        <button class="button button-table" onclick="javascript:checkReSearchAll();"><span>선택적용</span></button>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!-- 조건 선택 노출 영역 -->
		        <div class="filter-tag-wrap">
		            <div class="container">
		                <div class="filter-tag">
		                    <div class="filter-tag__list"></div>
		                    <!-- <button class="filter-tag__reset"><span>초기화</span></button> -->
		                </div>
		            </div>
		        </div>
		        <hr class="mobile mobile-bar">
		        <div class="container">
		        	<div class="card__data"><c:if test="${searchWord ne null && searchWord ne '' }"> <span>'${searchWord }'</span>으로 </c:if><c:if test="${searchWord eq null || searchWord eq '' }">총 </c:if><span>${result.COLLECTIONS.RCV_FVR_SVC.TOTALCOUNT}</span>건의 혜택이 있습니다.</div>
		            <div class="select-wrap2">
		                <div class="select-box">
			                <select class="select-wrap__item" title="정렬 선택" id="sort" name="sort">	
			                    <option value="RANK" ${sort.equals('RANK')? "selected" : "" }>정확도순</option>	
	                            <option value="VW_CNT" ${sort.equals('VW_CNT')? "selected" : "" }>조회순</option>                
	                            <option value="SORT_TTL" ${sort.equals('SORT_TTL')? "selected" : "" }>가나다순</option>
			                </select>
			                <select class="select-wrap__item" title="지원형태 선택" id="tccd" name="tccd" >
			                    <option value="ALL">전체</option>
								<option value="cash"    ${tccd.equals('cash')? "selected" : "" }>현금</option>
								<option value="stuff"   ${tccd.equals('stuff')? "selected" : "" }>현물</option>
								<option value="service" ${tccd.equals('service')? "selected" : "" }>서비스</option>
								<option value="ticket" ${tccd.equals('ticket')? "selected" : "" }>이용권</option>
								<option value="etc"  ${tccd.equals('etc')? "selected" : "" }>기타</option>
			                </select>
			                <div class="button-apply search-list__form" >
	                    		<button class="button-table" onclick="javascript:checkReSearchAll();">적용</button>
				            </div>
						</div>
		            </div>
		            
		            <ul class="tab__list js-tab-list tab-card tab-search" role="tablist">
		                <li id="tab1" class="tab__item tab-card__item js-tab is-active" role="tab" aria-controls="tab-panel1" aria-selected="true" tabindex="0">
		                    <i class="icon-card" aria-hidden="true"></i>카드보기
		                </li>
		                <li id="tab2" class="tab__item tab-card__item js-tab" role="tab" aria-controls="tab-panel2">
		                    <i class="icon-list" aria-hidden="true"></i>목록보기
		                </li>
		            </ul>
		        	<div id="tab-panel1" class="tabpanel tabpanel-first" role="tabpanel" aria-labelledby="tab1">
		                <div class="card">
		                    <div class="card__list">
				            	<c:choose>
			                    	<c:when test="${result.COLLECTIONS.RCV_FVR_SVC.TOTALCOUNT <= 0 }">
										<div class="result-field none">
											<span>선택한 검색 결과가 없습니다.</span>
										</div>
									</c:when>
									<c:otherwise>
										<c:set var="thisCollection" value="${result.COLLECTIONS.RCV_FVR_SVC }" />
										<c:forEach var="svcSearchAllList" items="${thisCollection.DOCUMENTS}" varStatus="status">
				                            <div class="card__item">
					                            <a href="/portal/rcvfvrSvc/dtlEx/${svcSearchAllList.SVC_ID }" class="card__link">
					                                <div class="card__contents">
					                                    <strong class="card__title">${svcSearchAllList.TTL }</strong>
														<div class="card__text">${svcSearchAllList.CONT }</div>
					                                    <div class="card__charge">${svcSearchAllList.REFRNC_NM }</div>
					                                    <c:forTokens var="meanCd" items="${svcSearchAllList.REQST_MEAN_CD}" delims="||">
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
					                                <ul class="card__sns--list" id="/portal/rcvfvrSvc/dtlEx/${svcSearchAllList.SVC_ID}">
					                                    <li><a href="#none" class="facebook" title="새창열림" onclick="javascript:snsPopup('facebook', this)">facebook</a></li>
					                                    <li><a href="#none" class="twitter" title="새창열림" onclick="javascript:snsPopup('twitter', this)">twitter</a></li>
					                                    <li><a href="#none" class="etc" title="새창열림">connect</a></li>
					                                </ul>
					                                <button class="sns-close"><span class="hide">닫기</span></button>
					                            </div>
					                        </div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
		                    </div>
		                </div>
		            </div>
		            
		            <div id="tab-panel2" class="tabpanel" role="tabpanel" aria-labelledby="tab2">
						<div class="list-wrap">
							<c:choose>
		                    	<c:when test="${result.COLLECTIONS.RCV_FVR_SVC.TOTALCOUNT <= 0 }">
		                        	<div class="result-field none">
										<span>선택한 검색 결과가 없습니다.</span>
									</div>
								</c:when>
								<c:otherwise>
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
											<c:forEach var="svcSearchAllList" items="${thisCollection.DOCUMENTS}" varStatus="status">
		                        				<a href="/portal/rcvfvrSvc/dtlEx/${svcSearchAllList.SVC_ID }" class="table__link">
					                                <ul class="table__tr">
					                                    <li class="ellipsis">${svcSearchAllList.TTL }</li>
					                                    <li class="ellipsis">${svcSearchAllList.CONT }</li>
					                                    <li class="text-align__center">${svcSearchAllList.RCV_ORG_NM }</li>
					                                    <li class="text-align__center">${fn:replace(fn:replace(svcSearchAllList.REFRNC_TEL_NO, '/ ', '/</br>'),',','</br>')}</li>
					                                    <li class="text-align__center">
					                                    	<c:if test="${svcSearchAllList.REQST_MEAN_CD != ''}" >
																<c:choose>
								                                	<c:when test="${fn:indexOf(svcSearchAllList.REQST_MEAN_CD,'BF0101') > -1}">		                                		
								                                		<span class="apply-online">정부24 온라인신청</span>
								                                	</c:when>
								                                	<c:when test="${fn:indexOf(svcSearchAllList.REQST_MEAN_CD,'BF0101') < 0 and fn:indexOf(svcSearchAllList.REQST_MEAN_CD,'BF0102') > -1}">		                                		
								                                		<span class="apply-site">타사이트신청</span>
								                                	</c:when>
								                                	<c:when test="${fn:indexOf(svcSearchAllList.REQST_MEAN_CD,'BF0101') < 0 and fn:indexOf(svcSearchAllList.REQST_MEAN_CD,'BF0102') < 0 and fn:indexOf(svcSearchAllList.REQST_MEAN_CD,'BF0103') > -1}">		                                		
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
										</c:otherwise>
									</c:choose>		                            		                            
		                        </div>
		                    </div>
		                </div>
		            </div>
		            
		            <c:if test="${collection ne 'ALL' && totalCount > 10 }">
	                    <div class="page-navigation">
	                        ${pageLinks }
	                    </div>
                    </c:if>
		        </div>
		    </div>
    	</form:form>
    	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
	</div>

	<script>
	$(document).ready(function(){
		tag();
		changeTab();
	});

	</script>
</body>
</html>
