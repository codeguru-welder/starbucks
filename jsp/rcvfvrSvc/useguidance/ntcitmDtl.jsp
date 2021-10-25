<!DOCTYPE html>
<html lang="ko">
	<head>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
		<title>공지사항 상세 | 이용안내 | 보조금24</title>
	</head>

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
		        <!-- <div class="container container--full background-skyblue">
		            <div class="container">
		                <div class="visual-box visual-box--notice">
		                    <div class="visual-box__inner">
		                        <div class="visual-box__title">보조금24 맞춤 수혜서비스에서 <br class="mobile">알려드립니다.</div>
		                        <div class="visual-box__text">공지사항 관련 안내 문구 넣기</div>
		                    </div>
		                </div>
		            </div>
		        </div> -->
		        <div class="container">
		            <div class="board-view">
		                <div class="board-view__top">
		                    <div class="board-view__title"><c:out value="${nttVo.nttTtl}" escapeXml="false"/></div>
		                    <div class="board-view__date">
		                    	<strong>게시일</strong><span><fmt:formatDate value="${nttVo.regDh}" pattern="yyyy-MM-dd"/></span>
		                    	<strong>작성자</strong><span>${nttVo.usrNm }</span>
		                    </div>		                    
		                </div>
		                <div class="board-view__content">
		                	<c:out value="${nttVo.nttCts}" escapeXml="false"/>
		                </div>
		                <div class="board-view__file">
		                    <strong>첨부파일</strong>
							<c:choose>
								<c:when test="${empty nttVo.fileList}">
									등록된 첨부파일이 없습니다.
							    </c:when>
							    <c:otherwise>
							        <c:forEach items="${nttVo.fileList}" var="files">
							            <a href="/fl/${files.flSeq}/${files.crc}" class="board-view__file-download"><c:out value="${files.logicFlNm}"/></a>
							        </c:forEach>
							    </c:otherwise>
							</c:choose>
		                </div>
		            </div>
		            <div class="button-wrap">
		                <div class="float-left">
		                    <a href="/portal/rcvfvrSvc/useguidance/ntcitm" class="button button-board button-list">목록</a>
		                </div>
		                <div class="float-right">
		                	<c:if test='${nttVo.prevSeq != ""}'>
	                        	<a href="/portal/rcvfvrSvc/useguidance/ntcitmDtl/${nttVo.prevSeq}" class="button button-board button-prev">이전</a>
	                        </c:if>
	                        <c:if test='${nttVo.nextSeq != ""}'>
		                    	<a href="/portal/rcvfvrSvc/useguidance/ntcitmDtl/${nttVo.nextSeq}" class="button button-board button-next">다음</a>
		                    </c:if>
		                </div>
		            </div>
		        </div>
		    </div>
		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
		</div>
	</body>
</html>
