<!DOCTYPE html>
<html lang="ko">
	<head>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
		<title>공지사항 목록 | 이용안내 | 보조금24</title>

		<!-- 개별 script -->
		<script src="/rcvfvrSvc/js/useguidance/ntcitm.js"></script>
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
				<jsp:param name="gnb" value="useguidance" />
			</jsp:include>

		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" />

		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />

		   	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
				<jsp:param name="gnb" value="useguidance" />
				<jsp:param name="mnb" value="ntcitm" />
			</jsp:include>

		    <div id="content" class="web-content">
		        <div class="container container--full background-skyblue">
		            <div class="container">
		                <div class="visual-box visual-box--notice">
		                    <div class="visual-box__inner">
		                        <div class="visual-box__title">보조금24에서 알려드립니다.</div>
		                        <div class="visual-box__text">맞춤혜택 관련 소식을 빠르고 정확하게 알려 드리는 공간입니다.</div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <hr class="mobile">
		        <div class="container">

		            <div class="search-list notice">
			            <form:form commandName="searchVo" method="get">
			            	<input type="hidden" id="totalCnt" value="${pageData.totalCount}"/>
			                <div class="search-list__title search-list__title--result">총 <span style="margin-left:5px"><fmt:formatNumber value="${pageData.totalCount}" type="number"/></span>건의 공지사항이 있습니다.</div>
			                <div class="search-list__form input-wrap float-right">
			                    <div class="select-wrap">
			                        <form:select path="srchType" cssClass="select-wrap__item" title="구분 선택">
		                                <form:option value="ALL" label="전체" />
		                                <form:option value="ttl" label="제목" />
		                                <form:option value="cts" label="내용" />
		                            </form:select>
			                        <form:input path="srchTxt" maxlength="100" title="검색어 입력" class="input-text" placeholder="검색어를 입력하세요."/>
			                        <input class="button-table" type="submit" value="검색"></input>
			                    </div>
			                </div>
		                </form:form>
		            </div>

		            <div class="table-vertical notice">
		                <table>
		                    <caption><span class="hide">공지사항 - 번호, 제목, 게시일</span></caption>
		                    <colgroup>
		                        <col style="width:10%">
		                        <col>
		                        <col style="width:10%">
		                    </colgroup>
		                    <thead>
		                        <tr>
		                            <th class="table-vertical__th" scope="col">번호</th>
		                            <th class="table-vertical__th" scope="col">제목</th>
		                            <th class="table-vertical__th" scope="col">게시일</th>
		                        </tr>
		                    </thead>
		                    <tbody>
	                        <c:choose>
								<c:when test="${empty pageData.list}">
	                                <tr>
	                                    <td colspan="3" class="text-center">
	                                        <c:choose>
	                                            <c:when test="${empty nttVo.srchTxt}">
	                                            	등록된 게시물이 없습니다.
	                                            </c:when>
	                                            <c:otherwise>
	                                              &quot;<c:out value="${nttVo.srchTxt}"/>&quot; (으)로 검색된 게시물이 없습니다.
	                                            </c:otherwise>
	                                        </c:choose>
	                                    </td>
	                                </tr>
	                            </c:when>
	                            <c:otherwise>
	                                <view:startListNum var="startNum" pageData="${pageData}" order="desc"/>
	                                <c:forEach var="nttVo" items="${pageData.list}" varStatus="status">
	                                	<view:url var="nttInfo" href="/portal/rcvfvrSvc/useguidance/ntcitmDtl/${nttVo.nttSeq}" reqParam="true"/>
	                                    <tr ${nttVo.ntcYn eq 'Y' ? 'style="font-weight:bold;"' : ""}>
	                                        <td class="table-vertical__td">
                                                <view:listNum startNum="${startNum}" statusIndex="${status.index}" ntcYn="${nttVo.ntcYn}"/>
	                                        </td>
	                                        <td class="table-vertical__td table-vertical__td--left">
	                                            <a href="${nttInfo}" class="table-link">
	                                                <c:if test="${nttVo.upNttSeq != 0 }">
	                                                    <c:forEach begin="0" end="${(nttVo.nttLevel -2) * 3}">&nbsp;</c:forEach>┗&nbsp;Re:
	                                                </c:if>
	                                                <c:choose>
                                                        <c:when test="${nttVo.ntcYn eq 'Y'}"><c:out value="${nttVo.nttTtl}"/></c:when>
                                                        <c:otherwise><c:out value="${nttVo.nttTtl}"/></c:otherwise>
	                                                </c:choose>

                                                    <c:if test="${nttVo.secretSntncYn eq 'Y'}">
                                                        <i class="icon-lock"></i>
                                                    </c:if>
	                                                <c:if test="${nttVo.delYn eq 'Y'}">
                                                        <i class="icon-remove"></i>
                                                    </c:if>
	                                            </a>
	                                        </td>
	                                        <td class="table-vertical__td"><fmt:formatDate value="${nttVo.regDh}" pattern="yyyy-MM-dd"/></td>
	                                    </tr>
	                                </c:forEach>
	                            </c:otherwise>
                            </c:choose>
		                    </tbody>
		                </table>
		            </div>

					<c:if test="${fn:length(pageData.list) > 0}">
						<input type="hidden" id="lastPage" value="${pageData.lastPage}"/>
						<input type="hidden" id="pageIndex" value="${pageData.pageIndex}"/>
						<div class="page-navigation">
	                        <view:navi id="nav" href="/portal/rcvfvrSvc/useguidance/ntcitm" page="${pageData}" pageIndex="pageIndex">
							    <view:first/>
							    <view:prev/>
							    <div class="page-navigation__num-wrap">
							    	<view:pageList onCss="page-navigation__active" offCss="page-navigation__num"/>
							    </div>
							    <view:next/>
							    <view:last/>
	                        </view:navi>
			            </div>

						<!--
			            <div class="button-wrap mobile mgt30">
			                <button class="button button-more"><span class="relative">더보기</span></button>
			            </div>
			            -->
		            </c:if>
		        </div>
		    </div>

		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
		</div>
	</body>
</html>
