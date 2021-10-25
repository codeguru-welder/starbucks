<!DOCTYPE html>
<%--------------------------------------------------------------------------
   파일명 : $URL:  $
   마지막변경일자 : $Date: $
   마지막변경자 : $Author: $ 
   최종버전 : $Revision: $
 ----------------------------------------------------------------------------
   변경이력
 ----------------------------------------------------------------------------
       DATE          AUTHOR             DESCRIPTION
 ---------------   ----------   ---------------------------------------------
     2014.09.24    허은선         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <c:set var="requestUri" value="${requestScope['javax.servlet.forward.request_uri']}"/>
    <c:choose>
        <c:when test="${requestUri eq '/openapi/API0001'}">
            <title>공공서비스 공동활용 | OpenAPI | API 정보 | 공공서비스 목록</title>
        </c:when>
        <c:when test="${requestUri eq '/openapi/API0002'}">
            <title>공공서비스 공동활용 | OpenAPI | API 정보 | 공공서비스 상세</title>
        </c:when>
        <c:when test="${requestUri eq '/openapi/API0003'}">
            <title>공공서비스 공동활용 | OpenAPI | API 정보 | 서비스 분류</title>
        </c:when>
        <c:when test="${requestUri eq '/openapi/API0004'}">
            <title>공공서비스 공동활용 | OpenAPI | API 정보 | 소관 기관 코드</title>
        </c:when>
        <c:otherwise>
            <title>공공서비스 공동활용 | OpenAPI | API 정보</title>
        </c:otherwise>
    </c:choose>
</head>
<body>
    <div class="wrapper">
    
    <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
        <jsp:param name="gnb" value="opApi"/>
        <jsp:param name="snb" value="opApiReq"/>
    </jsp:include>

        <div class="cont-box">
            <div class="cont-inner" id="contents">
<!-- Start Page -->
                <h1>OpenAPI</h1>
                <div class="tabmenu">
                    <ul class="tab">
                        <li class="current"><a href="/openapi/API0001" title="API 정보">API 정보</a></li>
                        <c:choose>
                            <c:when test="${requestUri eq '/openapi/API0001' || requestUri eq '/openapi/API0002'}">
                                <li><a href="/openapi/API0001/guide" title="개발 가이드">개발 가이드</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/openapi/${opApiVo.apiId}/guide" title="개발 가이드">개발 가이드</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
                <div class="tabcontainer">
                    <h2 class="hidden">API 정보</h2>
                    <div class="tab-list">
                        <ul class="num5">
                            <c:set var="requestUri" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                            <li <c:if test="${requestUri eq '/openapi/API0001'}">class="current"</c:if>><a href="/openapi/API0001" title="공공서비스 목록">공공서비스 목록</a></li>
                            <li <c:if test="${requestUri eq '/openapi/API0002'}">class="current"</c:if>><a href="/openapi/API0002" title="공공서비스 상세">공공서비스 상세</a></li>
                            <li <c:if test="${requestUri eq '/openapi/API0003'}">class="current"</c:if>><a href="/openapi/API0003" title="서비스 분류">서비스 분류</a></li>
                            <li <c:if test="${requestUri eq '/openapi/API0004'}">class="current"</c:if>><a href="/openapi/API0004" title="소관 기관 코드">소관 기관 코드</a></li>
                        </ul>
                    </div>

                    <h3 class="hidden">공공서비스 상세</h3>
                    <h4 class="ttit">API 상세정보</h4>
                    <div class="tbl-col">
                        <table>
                            <caption>
                                <strong>API 상세정보</strong>
                                <span>API명, 설명, 데이터 제공형태, 요청 URL, 기술문서, 승인방법, 이용기간, 일일 허용 조회수(개발), 일일 허용 조회수(운영), 서비스 시작일자 항목으로 구성</span>
                            </caption>
                            <colgroup>
                                <col style="width: 22%">
                                <col style="width: 28%">
                                <col style="width: 22%">
                                <col style="width: 28%">
                            </colgroup>
                            <tr>
                                <th>API명</th>
                                <td colspan="3">
                                    <c:out value="${opApiVo.apiNm}"/>
                                </td>
                            </tr>
                            <tr>
                                <th>설명</th>
                                <td colspan="3">
                                    <c:out value="${util:toHtmlTag(opApiVo.apiEpl)}" escapeXml="false"/>
                                </td>
                            </tr>
                            <tr>
                                <th>데이터 제공형태</th>
                                <td colspan="3">
                                    <c:forEach var="opApiProvdFrVo" items="${opApiVo.opApiProvdFrList}" varStatus="status">
                                        <c:out value="${opApiProvdFrVo.apiProvdFrCdNm}"/>
                                        <c:if test="${!status.last}">&nbsp;/&nbsp;</c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <th>요청 URL</th>
                                <td colspan="3">
                                    <c:out value="${util:toHtmlTag(opApiVo.apiRequstUrl)}" escapeXml="false"/>
                                </td>
                            </tr>
                            <tr>
                                <th>기술문서</th>
                                <td colspan="3">
                                    <a href="/openApiGuide.pdf" download="공공서비스_OpenAPI_활용가이드" target="_blank" title="공공서비스_OpenAPI_활용가이드.pdf">공공서비스_OpenAPI_활용가이드.pdf</a>
                                    <%-- <c:choose>
                                        <c:when test="${empty opApiVo.fileList}">
                                                등록된 첨부파일이 없습니다.
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${opApiVo.fileList}" var="files">
                                                <a href="/fl/${files.flSeq}/${files.crc}" title="${files.logicFlNm}"><c:out value="${files.logicFlNm}"/></a><br/>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose> --%>
                                </td>
                            </tr>
                            <tr>
                                <th>승인방법</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${opApiVo.apiConfmMthClsCd eq 'CA0501'}">심의승인</c:when>
                                        <c:when test="${opApiVo.apiConfmMthClsCd eq 'CA0502'}">자동승인</c:when>
                                    </c:choose>
                                </td>
                                <th>이용기간</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${opApiVo.apiUsePdClsCd eq 'CA0201'}">1년</c:when>
                                        <c:when test="${opApiVo.apiUsePdClsCd eq 'CA0202'}">2년</c:when>
                                        <c:when test="${opApiVo.apiUsePdClsCd eq 'CA0203'}">무기한</c:when>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>일일 허용 조회수(개발)</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${opApiVo.apiDevlopDailPermVwCnt gt 0}">
                                            <fmt:formatNumber value="${opApiVo.apiDevlopDailPermVwCnt}" type="number"/>
                                        </c:when>
                                        <c:otherwise>
                                            무제한
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <th>일일 허용 조회수(운영)</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${opApiVo.apiOperDailPermVwCnt gt 0}">
                                            <fmt:formatNumber value="${opApiVo.apiOperDailPermVwCnt}" type="number"/>
                                        </c:when>
                                        <c:otherwise>
                                            무제한&nbsp;(과도한 트래픽 발생 시 사용에<br/>제한이 있을 수 있습니다.)
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>서비스 시작일자</th>
                                <td colspan="3">
                                    <c:out value="${opApiVo.apiSvcStDtFmt}"/>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <h4 class="ttit">요청 변수(Request Parameter)</h4>
                    <div class="tbl-row cellC">
                        <table>
                            <caption>
                                <strong>요청 변수(Request Parameter)</strong>
                                <span>번호, 변수, 필수여부 상세내용 항목으로 구성</span>
                            </caption>
                            <colgroup>
                                <col style="width: 5%">
                                <col style="width: 15%">
                                <col style="width: 15%">
                                <col style="width: auto">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>변수</th>
                                    <th>필수여부</th>
                                    <th>상세 내용</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty opApiVo.opApiRequstIntrmdVriablList}">
                                        <tr>
                                            <td colspan="4">
                                                등록된 요청 변수가 없습니다.            
                                            </td>
                                        </tr>    
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="opApiRequstIntrmdVriablVo" items="${opApiVo.opApiRequstIntrmdVriablList}" varStatus="status">
                                        <tr>
                                            <td><c:out value="${status.index +1}"/></td>
                                            <td>
                                                <c:out value="${opApiRequstIntrmdVriablVo.apiRequstIntrmdVriablNm}"/>
                                            </td>
                                            <td>
                                            <c:choose>
                                                <c:when test="${opApiRequstIntrmdVriablVo.mdtrYn eq 'Y'}">필수</c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                            </td>
                                            <td class="cont">
                                                <c:out value="${util:toHtmlTag(opApiRequstIntrmdVriablVo.apiRequstIntrmdVriablEpl)}" escapeXml="false"/>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>

                    <h4 class="ttit">출력 결과(Response Message)</h4>
                    <div class="tbl-row cellC">
                        <table>
                            <caption>
                                <strong>출력 결과(Response Message)</strong>
                                <span>번호, 출력항목, 상세내용 항목으로 구성</span>
                            </caption>
                            <colgroup>
                                <col style="width: 5%">
                                <col style="width: 15%">
                                <col style="width: auto">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>항목</th>
                                    <th>상세내용</th>
                                </tr>
                            </thead>
                            <tbody>
                                 <c:choose>
                                    <c:when test="${empty opApiVo.opApiRplItmList}">
                                        <tr>
                                            <td colspan="3">
                                                등록된 출력 결과가 없습니다.
                                            </td>
                                        </tr>    
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="opApiRplItmVo" items="${opApiVo.opApiRplItmList}" varStatus="status">
                                        <tr>
                                            <td><c:out value="${status.index +1}"/></td>
                                            <td>
                                                <c:out value="${opApiRplItmVo.apiRplItmNm}"/>
                                            </td>
                                            <td class="cont">
                                                <c:out value="${util:toHtmlTag(opApiRplItmVo.apiRplItmEpl)}" escapeXml="false"/>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
	                <div class="btn-list">
	                    <a href="https://www.data.go.kr/data/15014185/openapi.do" title="공공데이터포털 대한민국 공공서비스 정보 새창으로 열림" class="btn lg red" target="_blank">신청</a>
	                </div>

                </div><!-- End of class="tabcontainer" //-->
<!-- End Page //-->
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->
        
        <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
        
    </div><!-- End of class="wrapper" //-->
    
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>

</body>
</html>
