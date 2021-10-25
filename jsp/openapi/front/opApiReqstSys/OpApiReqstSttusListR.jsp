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
    <title>공공서비스 공동활용 | 신청현황</title>
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
                <h1>신청 현황</h1>
                
                <%-- <h2 class="ttit">OpenAPI 신청 현황</h2>
                <div class="tbl-list cellC">
                    <table>
                        <caption>
                            <strong>오픈 API 신청 현황</strong>
                            <span>오픈API 시스템명, 도메인, 신청일자, 승인일자, 처리상태 항목으로 구성</span>
                        </caption>                           
                        <colgroup>
                            <col style="width: 30%"/>
                            <col style="width: 30%"/>
                            <col style="width: 15%"/>
                            <col style="width: 15%"/>
                            <col style="width: 10%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="alignL">시스템명</th>
                                <th class="alignL">시스템 도메인</th>
                                <th>신청일자</th>
                                <th>승인일자</th>
                                <th>처리상태</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:choose>
                                    <c:when test="${empty pageData}">
                                        <tr>
                                            <td colspan="5" class="text-center">등록된 게시물이 없습니다.</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="opApiReqstSysVo" items="${pageData}" varStatus="status">
                                            <view:url var="opApiReqstSysInfo" href="/openapi/request/${opApiReqstSysVo.apiReqstSysSeq}" reqParam="true" />
                                            <tr>
                                                <td class="tit"><a href="${opApiReqstSysInfo}" title="<c:out value="${opApiReqstSysVo.apiReqstSysNm}"/>"><c:out value="[${opApiReqstSysVo.apiReqstClsNmFmt}] ${util:shortString(opApiReqstSysVo.apiReqstSysNm, 20)}"/></a></td>
                                                <td class="tit">                                                     
                                                    <c:choose>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                     <c:when test="${empty opApiReqstSysVo.apiReqstSysDomn}">
                                                         <c:out value="-" />
                                                     </c:when>
                                                     <c:otherwise>
                                                         <a href="${opApiReqstSysInfo}" title="<c:out value="${opApiReqstSysVo.apiReqstSysDomn}"/>"><c:out value="${util:shortString(opApiReqstSysVo.apiReqstSysDomn, 20)}" /></a>
                                                     </c:otherwise>
                                                 </c:choose>
                                                </td>
                                                 <c:choose>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                     <c:when test="${empty opApiReqstSysVo.apiReqstDtFmt}">
                                                         <td><c:out value="-" /></td>
                                                     </c:when>
                                                     <c:otherwise>
                                                         <td><c:out value="${opApiReqstSysVo.apiReqstDtFmt}" /></td>
                                                     </c:otherwise>
                                                 </c:choose>
                                                 <c:choose>
											         <c:when test="${empty opApiReqstSysVo.apiConfmDtFmt}">
												         <td><c:out value="-" /></td>
											         </c:when>
											         <c:otherwise>
											             <td><c:out value="${opApiReqstSysVo.apiConfmDtFmt}" /></td>
											         </c:otherwise>
										         </c:choose>
												<td><c:out value="${opApiReqstSysVo.apiReqstProcessSttusNm}" /></td>
											</tr>
                                        </c:forEach>
                                    </c:otherwise>
                              </c:choose>
                        </tbody>
                    </table>
                </div> --%>

                <h2 class="ttit">공공서비스 공유 현황</h2>
                <div class="tbl-list cellC">
                    <table>
                        <caption>
                            <strong>공공서비스 공유 현황</strong>
                            <span>공공서비스 공유 기관, 서비스 설명, 신청일자, 처리일자, 처리상태 항목으로 구성</span>
                        </caption>
                        <colgroup>
                            <col style="width: 30%"/>
                            <col style="width: 30%"/>
                            <col style="width: 15%"/>
                            <col style="width: 15%"/>
                            <col style="width: 10%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="alignL">기관</th>
                                <th class="alignL">서비스 설명</th>
                                <th>신청일자</th>
                                <th>처리일자</th>
                                <th>처리상태</th>
                            </tr>
                        </thead>
                        <tbody>                            
                            <c:choose>
                                    <c:when test="${empty cnrsList}">
                                        <tr>
                                            <td colspan="5" class="text-center">등록된 게시물이 없습니다.</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="cnrsSvcReqstVo" items="${cnrsList}" varStatus="status">
                                            <view:url var="cnrsSvcReqstInfo" href="/openapi/service/sharing/${cnrsSvcReqstVo.cnrsSvcReqstSeq}" reqParam="true" />
                                            <tr>
                                                <td class="tit"><a href="${cnrsSvcReqstInfo}" title="<c:out value="${cnrsSvcReqstVo.cnrsSvcOrgNm}"/>"><c:out value="${util:shortString(cnrsSvcReqstVo.cnrsSvcOrgNm, 20)}" /></a></td>
                                                <td class="tit"><a href="${cnrsSvcReqstInfo}" title="<c:out value="${cnrsSvcReqstVo.cnrsSvcEpl}"/>"><c:out value="${util:shortString(cnrsSvcReqstVo.cnrsSvcEpl, 20)}"/></a></td>
                                                <td><c:out value="${cnrsSvcReqstVo.regDhFmt}" /></td>
                                                 <c:choose>
                                                     <c:when test="${empty cnrsSvcReqstVo.cnrsSvcProcessDtFmt}">
                                                         <td><c:out value="-" /></td>
                                                     </c:when>
                                                     <c:otherwise>
                                                         <td><c:out value="${cnrsSvcReqstVo.cnrsSvcProcessDtFmt}" /></td>
                                                     </c:otherwise>
                                                 </c:choose>
                                                <td><c:out value="${cnrsSvcReqstVo.cnrsSvcProcessSttusNm}" /></td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
                
                <h2>※ OpenAPI 신청 현황은 <a href="http://www.data.go.kr" target="_blank" style="color: #2671D0;">공공데이터포털</a>의 마이페이지에서 확인하실 수 있습니다.</h2>
<!-- End Page //-->
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->
        
        <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
        
    </div><!-- End of class="wrapper" //-->
    
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>

</body>
</html>
