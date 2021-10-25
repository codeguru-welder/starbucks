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
     2015.10.29    장세란         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <title>공공서비스 공동활용 | 공지사항 | 상세</title>
</head>
<body>
    <div class="wrapper">
        <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
            <jsp:param name="gnb" value="ntcItm"/>
        </jsp:include>
                <div class="cont-box">
            <div class="cont-inner" id="contents">
            <!-- Start Page -->         
                <h1>공지사항</h1>
                
                <div class="tbl-col">
                    <table>
                        <caption>
                            <strong>공지사항 상세</strong>
                            <span>제목, 등록일시, 조회수, 내용, 첨부파일 항목으로 구성</span>
                        </caption>
                        <colgroup>
                            <col style="width: 20%">
                            <col style="width: 30%">
                            <col style="width: 20%">
                            <col style="width: 30%">
                        </colgroup>
                        <tr>
                            <th>제목</th>
                            <td colspan="3"><c:out value="${nttVo.nttTtl}" escapeXml="false"/></td>
                        </tr>
                        <tr>
                            <th>등록일시</th>
                            <td> <fmt:formatDate value="${nttVo.regDh}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <th>조회수</th>
                            <td><c:out value="${nttVo.nttVwCnt}" /></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3" style="height:153px; vertical-align: top !important;">
                                <c:out value="${nttVo.nttCts}" escapeXml="false"/>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3">
                                <c:choose>
                                    <c:when test="${empty nttVo.fileList}">
                                         등록된 첨부파일이 없습니다.
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${nttVo.fileList}" var="files">
                                            <a href="/fl/${files.flSeq}/${files.crc}" title="${files.logicFlNm}"><c:out value="${files.logicFlNm}"/></a><br/>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </td>                            
                        </tr>
                    </table>
                </div>
                <div class="btn-list">
                    <view:url var="ntcItmListUrl" href="/openapi/ntcItm/list" reqParam="true"/>
                    <a href="${ntcItmListUrl}" title="공지사항 목록" class="btn lg gray">목록</a>
                </div>

            <!-- End Page //-->             
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->
        
        <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
    </div><!-- End of class="wrapper" //-->
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>
</body>
</html>

