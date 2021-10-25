<!DOCTYPE html>
<html lang="ko">
	<head>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
		<title>나의 신청현황 | 나의 서비스 | 보조금24</title>

		<!-- 개별 script -->
		<script src="/rcvfvrSvc/js/mySvc/myReqststtus.js"></script>
	</head>

	<body>
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
				<jsp:param name="mnb" value="mySttus" />
			</jsp:include>

			<form:form id="reqststtusForm" commandName="reqststtusVo" method="get" action="/portal/rcvfvrSvc/mySvc/myReqststtus">
			    <div id="content" class="web-content">
			        <div class="container container--full background-skyblue">
			            <div class="container">
			                <div class="personalized-benefit">
			                    <div class="personalized-benefit__title">맞춤혜택 <strong>온라인 신청현황</strong>입니다.</div>
			                    <div class="personalized-benefit__text">보조금24에서 신청한 내역만 <br class="mobile">조회 가능합니다.</div>
			                    <div class="personalized-benefit__sub-text">※ 타기관, 방문, 우편 등을 통해 신청하신 <br class="mobile">내용은 해당기관을 통해 확인하시기 바랍니다.</div>
			                </div>
			            </div>
			        </div>
			        <div class="container">
			            <div class="personalized-benefit__list">
			            	<c:forEach var="vo" items="${rSttus}" varStatus="status">
								<div class="personalized-benefit__item">
				                   	<div class="personalized-benefit__left">
				                       	<i class="personalized-benefit__icon personalized-benefit__icon--type0${status.index+1}" aria-hidden="true"></i>
				            			<span class="personalized-benefit__label">${vo.procNm}</span>
									</div>
				                    <div class="personalized-benefit__right">
				                    	<div class="personalized-benefit__count"><strong>${vo.procCnt}</strong>건</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="container">
			            <div class="reference-box">
			            	<input type = "hidden" name = "searchType" value = "${reqststtusVo.searchType}"/>
			                <div class="reference-box__button-wrap">
			                    <button type="button" class="reference__button is-active" onclick="javascript:setDt('0');"><span>1주일</span></button>
			                    <button type="button" class="reference__button" onclick="javascript:setDt('1');"><span>1개월</span></button>
			                    <button type="button" class="reference__button" onclick="javascript:setDt('2');"><span>3개월</span></button>
			                    <button type="button" class="reference__button" onclick="javascript:setDt('3');"><span>6개월</span></button>
			                    <button type="button" class="reference__button" onclick="javascript:setDt('4');"><span>12개월</span></button>
			                    <button type="button" class="reference__button reference__button--etc" onclick="javascript:setDt('5');"><span>직접입력</span></button>
			                </div>
			                <div class="select-date input-wrap">
			                	<input type="hidden" id="fromTempDate" />
			                    <input type="text" name="fromDate" class="input-text input-date" title="시작 기간 선택" onchange="javascript:changeDate();" value="${util:formatDateExt(reqststtusVo.fromDate, 'yyyyMMdd', 'yyyy.MM.dd')}" readonly>
			                    <span class="dash"></span>
			                    <input type="hidden" id="toTempDate" />
			                    <input type="text" name="toDate" class="input-text input-date" title="끝 기간 선택" onchange="javascript:changeDate();" value="${util:formatDateExt(reqststtusVo.toDate, 'yyyyMMdd', 'yyyy.MM.dd')}" readonly>
			                </div>
			                <div class="button-wrap">
			                    <button class="button-table button-reference" type="button" onclick="javascript:search();"><span class="relative">조회하기</span></button>
			                    <button class="button-table button-reset" type="button" onclick="javascript:setDt('0');"><span class="relative">초기화</span></button>
			                </div>
			                <div class="reference-box__content">
			                    <div class="reference-box__title">조회기간</div>
			                    <div class="reference-box__text"></div>
			                </div>
			            </div>
			            <hr class="mobile mobile--full">
			            <div class="search-list">
			                <div class="search-list__title search-list__title--result">${reqststtusVo.nm}님 : <span>${rDtls.size()}건</span></div>
			                <a href="/mw/AA040MyResultsList.do" class="button-detail">신청내역 상세보기</a>
			            </div>
			            <div class="table-vertical apply-list">
			                <table>
			                    <caption><span class="hide">신청내역 - 번호, 신청일자 , 상태, 서비스명, 민원접수번호</span></caption>
			                    <colgroup>
			                        <col style="width:10%">
			                        <col style="width:10%">
			                        <col style="width:10%">
			                        <col>
			                        <col style="width:20%">
			                    </colgroup>
			                    <thead>
			                        <tr>
			                            <th class="table-vertical__th" scope="col">번호</th>
			                            <th class="table-vertical__th" scope="col">신청일자</th>
			                            <th class="table-vertical__th" scope="col">상태</th>
			                            <th class="table-vertical__th table-vertical__th--left" scope="col">서비스명</th>
			                            <th class="table-vertical__th" scope="col">민원접수번호</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:choose>
				                    	<c:when test="${rDtls.size() > 0}">
					                    	<c:forEach var="vo" items="${rDtls}" varStatus="status">
						                        <tr>
						                            <td class="table-vertical__td">${rDtls.size()-status.index}</td>
						                            <td class="table-vertical__td"><c:out value="${util:formatDateExt(vo.reqDt, 'yyyyMMdd', 'yyyy.MM.dd')}"/></td>
						                            <td class="table-vertical__td bold ${vo.cdNm == '신청완료' ? 'color-blue' : ''} }">${vo.cdNm}</td>
						                            <td class="table-vertical__td table-vertical__td--left">
						                            	<!-- <a href="#" class="table-link">${vo.cappBizNm}</a> -->
						                            	${vo.cappBizNm}
						                            </td>
						                            <td class="table-vertical__td">
						                            	${fn:substring(vo.cappReqNo,0,8)}
						                            	-
						                            	${fn:substring(vo.cappReqNo,8,16)}
						                            </td>
						                        </tr>
						                    </c:forEach>
				                    	</c:when>
				                    	<c:otherwise>
					                        <tr>
					                            <td colspan="5" class="table-vertical__td">
					                                <span class="table-vertical__nodata">
					                                    	신청내역이 없습니다.
					                                </span>
					                            </td>
					                        </tr>
				                    	</c:otherwise>
			                    	</c:choose>
			                    </tbody>
			                </table>
			            </div>
			        </div>
			        <div class="container mgt60">
			            <div class="toggle-box">
			                <div class="toggle-box__contents" data-element="toggle-list">
			                    <div class="toggle-box__contents-inner">
			                        <ul class="list-dot">
			                            <li><strong>접수</strong> 접수처리기관에 접수 대기중입니다.</li>
			                            <li><strong>처리중</strong> 접수처리기관에 접수되어 담당자 또는 시스템 처리 중 입니다.</li>
			                            <li><strong>처리완료</strong> 접수처리기관에 접수되어 담당자 또는 시스템 등록 완료 되었습니다.</li>
			                            <li><strong>처리불가</strong> 시스템 장애에 의해 처리할 수 없는 경우로 환급요청 또는 재신청하시기 바랍니다.</li>
			                            <li><strong>신청완료</strong> 민원신청이 완료되어 처리기관으로 접수되었습니다. 담당자가 처리 중입니다.</li>
			                        </ul>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
		    </form:form>
		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
		</div>
	</body>
</html>
