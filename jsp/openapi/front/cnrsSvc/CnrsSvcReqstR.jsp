<!DOCTYPE html>
<%--------------------------------------------------------------------------
   NAME : $URL$
   DESC :
   VER  : $Revision$
 ----------------------------------------------------------------------------
     변 경 이 력
 ----------------------------------------------------------------------------
       DATE          AUTHOR             DESCRIPTION
 ---------------   ----------   ---------------------------------------------
   2015. 9. 25.      허은선          최초 생성
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <title>공공서비스 공동활용 | 공공서비스 공유신청 | 상세</title>
</head>
<body>
    <div class="wrapper">

    <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
        <jsp:param name="gnb" value="opApi"/>
        <jsp:param name="snb" value="cnrsSvcReqst"/>
    </jsp:include>

        <div class="cont-box">
            <div class="cont-inner" id="contents">
<!-- Start Page -->         
                <h1>공공서비스 공유신청</h1>
                
                <h2 class="ttit">공공서비스 파일 정보</h2>
                <div class="tbl-col">
                    <table>
                        <caption>
                            <strong>공공서비스 파일 정보</strong>
                            <span>서비스 목록파일, 서비스 설명, 기관, 시스템 명, 시스템 도메인, 신청일자, 처리일자 처리결과 항목으로 구성</span>
                        </caption>
                        <colgroup>
                            <col style="width: 22%">
                            <col style="width: auto">
                        </colgroup>
                        <tr>
                            <th>서비스 목록파일</th>
                            <td><a href="/fl/${cnrsSvcReqstVo.cnrsSvcFlSeq}/${cnrsSvcReqstVo.cnrsSvcCrc}" title="${cnrsSvcReqstVo.cnrsSvcLogicFlNm}"><c:out value="${cnrsSvcReqstVo.cnrsSvcLogicFlNm}"/></a></td>
                        </tr>
                        <tr>
                            <th>서비스 설명</th>
                            <td><c:out value="${util:toHtmlTag(cnrsSvcReqstVo.cnrsSvcEpl)}" escapeXml="false"/></td>
                        </tr>
                        <tr>
                            <th>기관</th>
                            <td><c:out value="${cnrsSvcReqstVo.cnrsSvcOrgNm}"/></td>
                        </tr>
                        <tr>
                            <th>시스템 명</th>
                            <td>
                            <c:choose>
                                <c:when test="${!empty cnrsSvcReqstVo.cnrsSvcSysNm}">
                                    <c:out value="${cnrsSvcReqstVo.cnrsSvcSysNm}"/>
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>시스템 도메인</th>
                            <td>
                            <c:choose>
                                <c:when test="${!empty cnrsSvcReqstVo.cnrsSvcSysDomn}">
                                    <c:out value="${cnrsSvcReqstVo.cnrsSvcSysDomn}"/>
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>신청일자</th>
                            <td><fmt:formatDate value="${cnrsSvcReqstVo.regDh}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                        <tr>
                            <th>처리상태</th>
                            <td><c:out value="${cnrsSvcReqstVo.cnrsSvcProcessSttusNm}" /></td>
                        </tr>
                        <c:if test="${cnrsSvcReqstVo.cnrsSvcProcessSttusCd eq 'YF0203'}">
                        <tr>
                            <th>처리일자</th>
                            <td>
	                        <c:choose>
	                            <c:when test="${!empty cnrsSvcReqstVo.cnrsSvcProcessDt}">
	                                <c:out value="${cnrsSvcReqstVo.cnrsSvcProcessDtFmt}"/>
	                            </c:when>
	                            <c:otherwise>-</c:otherwise>
	                        </c:choose>
	                        </td>
                        </tr>
                        <tr>
                            <th>처리결과</th>
                            <td>
                            <c:choose>
                                <c:when test="${!empty cnrsSvcReqstVo.cnrsSvcProcessRslt}">
                                    <c:out value="${cnrsSvcReqstVo.cnrsSvcProcessRslt}"/>
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                            </td>
                        </tr>
                        </c:if>
                    </table>
                </div>
                <h2>담당자 정보</h2>
                <div class="tbl-col">
                    <table>
                        <caption>
                            <strong>담당자 정보</strong>
                            <span>담당자명, 담당자 전화번호, 담당자 이메일 항목으로 구성</span>
                        </caption>
                        <colgroup>
                            <col style="width:15%">
                            <col style="width:35%">
                            <col style="width:15%">
                            <col style="width:35%">
                        </colgroup>
                        <tr>
                            <th>담당자명</th>
                            <td><c:out value="${cnrsSvcReqstVo.cnrsReqstusrNm}"/></td>
                            <th>담당자 전화번호</th>
                            <td><c:out value="${cnrsSvcReqstVo.cnrsReqstusrTelNo}"/></td>
                        </tr>
                        <tr>
                            <th>담당자 이메일</th>
                            <td colspan="3"><c:out value="${cnrsSvcReqstVo.cnrsReqstusrEmail}"/></td>
                        </tr>
                    </table>
                </div>
                
                <view:url var="cnrsSvcReqstUpdateUrl" href="/openapi/service/sharing/${cnrsSvcReqstVo.cnrsSvcReqstSeq}/update" reqParam="true"/>
                <view:url var="cnrsSvcReqstListUrl" href="/openapi/request/list" reqParam="true"/>
                <form:form action="/openapi/service/sharing/${cnrsSvcReqstVo.cnrsSvcReqstSeq}/delete" method="POST">
	                <div class="btn-list">
	                    <c:if test="${cnrsSvcReqstVo.cnrsSvcProcessSttusCd eq 'YF0201'}">
	                        <!-- 처리상태가 공유신청일때만 수정 및 삭제 버튼 출력 -->
	                        <a href="${cnrsSvcReqstUpdateUrl}" class="btn lg dark" title="수정">수정</a>
	                        <input class="btn lg gray" type="submit" value="삭제" onclick="return confirm('삭제하시겠습니까?')" title="삭제"/>
	                    </c:if>
	                    <a href="${cnrsSvcReqstListUrl}" class="btn lg gray" title="신청 현황 목록">목록</a>
	                </div>
                </form:form>

<!-- End Page //-->                     
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->

        <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
        
    </div><!-- End of class="wrapper" //-->
    
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>

</body>
</html>
