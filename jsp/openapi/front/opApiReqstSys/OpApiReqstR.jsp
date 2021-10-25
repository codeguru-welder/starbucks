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
     2015.09.25    장세란         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <title>공공서비스 공동활용 | OpenApi 신청 | 상세</title>
</head>
<body>
    <div class="wrapper">
    
    <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
        <jsp:param name="gnb" value="opApi"/>
        <jsp:param name="snb" value="reqSttus"/>
    </jsp:include>
    
    <div class="cont-box">
        <div class="cont-inner" id="contents">
        
        <!-- Start Page -->         
            <h1>OpenAPI</h1>
            
            <h2 class="ttit">시스템 정보</h2>
            <form:form  commandName="opApiReqstSysVo" method="POST" >
            <div class="tbl-col">
                <table>
                    <caption>
                        <strong>시스템 정보</strong>
                        <span>시스템 명, 도메인, 설명, 운영기관, 인증키, 신청일자, 승인일자, 처리상태 신청유형 항목으로 구성</span>
                    </caption>
                    <colgroup>
                        <col style="width: 22%">
                        <col style="width: 28%">
                        <col style="width: 22%">
                        <col style="width: 28%">
                    </colgroup>
                    <tr>
                        <th>시스템 명</th>
                        <td colspan="3"><c:out value="${opApiReqstSysVo.apiReqstSysNm}" /></td>
                    </tr>
                    <tr>
                        <th>시스템 도메인</th>
                        <td colspan="3">
                            <c:choose>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                <c:when test="${empty opApiReqstSysVo.apiReqstSysDomn}">
                                    <c:out value="-" />
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${opApiReqstSysVo.apiReqstSysDomn}"/>
                                </c:otherwise>
                            </c:choose>                             
                        </td>
                    </tr>
                    <tr>
                        <th >시스템 설명</th>
                        <td colspan="3"><c:out value="${util:toHtmlTag(opApiReqstSysVo.apiReqstSysEpl)}" escapeXml="false"/></td>
                    </tr>
                    <tr>
                        <th>운영기관</th>
                        <td colspan="3"><c:out value="${opApiReqstSysVo.apiReqstSysOrgNm}"/></td>
                    </tr>
                    <tr>
                        <th>인증키</th>
                        <td colspan="3">
                            <c:choose>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                <c:when test="${empty opApiReqstSysVo.apiReqstSysCrtfck}">
                                    <c:out value="-" />
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${opApiReqstSysVo.apiReqstSysCrtfck}"/>
                                </c:otherwise>
                            </c:choose>  
                        </td>
                    </tr>
                    <tr>
                        <th>신청일시</th>
                            <c:choose>
                                <c:when test="${empty opApiReqstSysVo.apiReqstDhFmt}">
                                    <td><c:out value="-" /></td>
                                </c:when>
                                <c:otherwise>
                                     <td><c:out value="${opApiReqstSysVo.apiReqstDhFmt}"/></td>
                                </c:otherwise>
                            </c:choose>
                        <th>승인일시</th>
                            <c:choose>
                                <c:when test="${empty opApiReqstSysVo.apiConfmDhFmt}">
                                    <td><c:out value="-" /></td>
                                </c:when>
                                <c:otherwise>
                                    <td><c:out value="${opApiReqstSysVo.apiConfmDhFmt}" /></td>
                                </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <th>처리상태</th>
                        <td colspan="3"><c:out value="${opApiReqstSysVo.apiReqstProcessSttusNm}" /></td>
                    </tr>
                    <tr>
                        <th>신청유형</th>
                        <td colspan="3"><c:out value="${opApiReqstSysVo.apiReqstClsNm}"/></td>
                    </tr>
                </table>
            </div>

            <div class="useinfo">
                <h2 class="usetit">이용정보</h2>
                <table>
                    <caption>
                        <strong>이용정보</strong>
                        <span>일일 허용 조회수, 승인방법, 이용기간 항목으로 구성</span>
                    </caption>
                    <thead>
                    <c:choose>
                        <c:when test="${opApiReqstSysVo.apiReqstProcessSttusCd eq 'YF0103'}">
                        <colgroup>
                            <col style="width: 30%">
                            <col style="width: 35%">
                            <col style="width: 35%">
                        </colgroup>
                          <tr>
                              <th>API 명</th>
                              <th>일일 허용 조회수</th>
                              <th>만료일자</th>
                          </tr>
                        </c:when>
                        <c:otherwise>
                          <tr>
                              <th rowspan="2">API 명</th>
                              <th colspan="2">일일 허용 조회수</th>
                              <th rowspan="2">승인방법</th>
                              <th rowspan="2">이용기간 (개발/운영)</th>
                          </tr>
                          <tr>
                              <th>개발</th>
                              <th>운영</th>
                          </tr>
                        </c:otherwise>
                    </c:choose>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${opApiReqstSysVo.apiReqstProcessSttusCd eq 'YF0103'}">
                        <c:forEach var="reqstOpApiVo" items="${listData}" varStatus="status">
                            <tr>
                                <td class="alignC"><c:out value="${reqstOpApiVo.apiNm}" /></td>
                                <td class="alignC">
                                    <c:choose>                                       
                                        <c:when test="${reqstOpApiVo.apiDailPermVwCnt eq '0' && opApiReqstSysVo.apiReqstClsCd eq 'CA0602'}">무제한</c:when>
                                        <c:otherwise><c:out value="${reqstOpApiVo.apiDailPermVwCnt}" /></c:otherwise>
                                    </c:choose>
                                </td>
                                <c:choose>
                                    <c:when test="${empty reqstOpApiVo.apiUseEndDtFmt}">
                                        <td class="alignC">무기한</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="alignC"><c:out value="${reqstOpApiVo.apiUseEndDtFmt}" /></td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                        </c:when>
                        <c:otherwise>
                         <c:forEach var="opApiVo" items="${listData}" varStatus="status">
                                <tr>
                                  <td class="alignC"><c:out value="${opApiVo.apiNm}" /></td>
                                  <td class="alignC"><c:out value="${opApiVo.apiDevlopDailPermVwCnt}" /></td>
                                  <td class="alignC">
                                      <c:choose>
                                          <c:when test="${opApiVo.apiOperDailPermVwCnt eq 0}">무제한</c:when>
                                          <c:otherwise><c:out value="${opApiVo.apiOperDailPermVwCnt}" /></c:otherwise>
                                      </c:choose>
                                  </td>
                                  <td class="alignC"><c:out value="${opApiVo.apiConfmMthClsNm}" /></td>
                                  <td class="alignC">
                                      <c:choose>
                                          <c:when test="${opApiVo.apiUsePdClsCd eq 'CA0203'}">사용기한 없음</c:when>
                                          <c:otherwise> 승인일로부터 <c:out value="${opApiVo.apiUsePdClsNm}" /></c:otherwise>
                                      </c:choose>
                                  </td>
                                </tr>
                              </c:forEach>  
                        
                        </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <p class="caution">※ 과도한 트래픽 발생 시, 서비스 이용에 제한이 있을 수 있습니다.</p>
            </div>

            <h2>담당자 정보</h2>
            <div class="tbl-col">
                <table>
                    <caption>
                        <strong>담당자 정보</strong>
                        <span>담당자 이름, 전화번호, 이메일 항목으로 구성</span>
                    </caption>
                    <colgroup>
                        <col style="width: 15%">
                        <col style="width: 35%">
                        <col style="width: 15%">
                        <col style="width: 35%">
                    </colgroup>
                    <tr>
                        <th>담당자명</th>
                        <td><c:out value="${opApiReqstSysVo.apiReqstusrNm}"/></td>
                        <th>담당자 전화번호</th>
                        <td><c:out value="${opApiReqstSysVo.apiReqstusrTelNo}"/></td>
                    </tr>
                    <tr>
                        <th>담당자 이메일</th>
                        <td colspan="3"><c:out value="${opApiReqstSysVo.apiReqstusrEmail}"/></td>
                    </tr>
                </table>
            </div>
            
            <c:if test="${not empty opApiReqstSysVo}">
            <div class="btn-list">                 
                <view:url var="opApiReqstUpdate" href="/openapi/request/${opApiReqstSysVo.apiReqstSysSeq}/update" reqParam="true"/>
                <view:url var="opApiReqstList" href="/openapi/request/list" reqParam="true"/>

                <c:if test="${opApiReqstSysVo.apiReqstProcessSttusCd eq 'YF0101'}">
                    <a href="#noaction" onclick="requestOpApiReqst(); return false;" title="신청" class="btn lg red">신청</a>
                </c:if>
                <a href="${opApiReqstUpdate}" title="수정" class="btn lg dark">수정</a>
                <c:if test="${opApiReqstSysVo.apiReqstProcessSttusCd ne 'YF0103'}">
                    <a href="#noaction" onclick="deleteOpApiReqst(); return false;" title="삭제" class="btn lg gray">삭제</a>
                </c:if>
                <a href="${opApiReqstList}" title="오픈API 신청현황" class="btn lg gray">목록</a>
            </div>
            </c:if>
            </form:form>
        <!-- End Page //-->             
        </div><!-- End of class="cont-inner" //-->
    </div><!-- End of class="cont-box-box" //-->

    <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
    
    </div><!-- End of class="wrapper" //-->
    
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>
    
    <script type="text/javascript">
    //<![CDATA[
        //API 신청 승인 요청
        function requestOpApiReqst() {
            if(!confirm('OpenAPI 사용승인신청을 하시겠습니까?')){
                return;
            }
            $('#opApiReqstSysVo').attr('action', '/openapi/${opApiReqstSysVo.apiReqstSysSeq}/reqst');
            $('#opApiReqstSysVo').submit();
        };
        
        //API신청 삭제
        function deleteOpApiReqst() {
            if(!confirm('OpenAPI 신청정보를 삭제하시겠습니까?')){
                return;
            }
            $('#opApiReqstSysVo').attr('action', '/openapi/request/${opApiReqstSysVo.apiReqstSysSeq}/delete');
            $('#opApiReqstSysVo').submit();
        };
    //]]>
    </script>
</body>
</html>