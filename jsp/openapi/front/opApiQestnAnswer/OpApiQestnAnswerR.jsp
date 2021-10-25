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
     2015.11.02    장세란         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <title>공공서비스 공동활용 | Q&amp;A | 상세</title>
</head>
<body>
    <div class="wrapper">
        <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
            <jsp:param name="gnb" value="qna"/>
        </jsp:include>
                <div class="cont-box">
            <div class="cont-inner" id="contents">
            <!-- Start Page -->         
            <h1>Q&amp;A</h1>
                <c:choose>
                    <c:when test="${nttVo.upNttSeq == 0 }">
                        <h2>질문</h2>
                    </c:when>
                    <c:otherwise>
                        <h2>답변</h2>
                    </c:otherwise>
                </c:choose>

                <div class="tbl-col">
                    <table>
                        <caption>
                            <c:choose>
                                <c:when test="${nttVo.upNttSeq == 0 }">
                                    <strong>Q&amp;A 질문 상세</strong>
                                    <span>제목, 작성자, 등록일자, 내용, 첨부파일 항목으로 구성</span>
                                </c:when>
                                <c:otherwise>
                                    <strong>Q&amp;A 답변 상세</strong>
                                    <span>제목, 작성자, 등록일자, 내용, 첨부파일 항목으로 구성</span>
                                </c:otherwise>
                            </c:choose>
                        </caption>
                        <colgroup>
                            <col style="width: 20%">
                            <col style="width: 30%">
                            <col style="width: 20%">
                            <col style="width: 30%">
                        </colgroup>
                        <tr>
                            <th>제목</th>
                            <td colspan="3" ><c:out value="${nttVo.nttTtl}" escapeXml="false"/></td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>
                                <c:choose>
                                    <c:when test="${sessionUsrVo.usrSeq eq nttVo.regrSeq}">
                                        <c:out value="${nttVo.usrId}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${util:privacyEmail(nttVo.usrId)}"/>   
                                    </c:otherwise>
                                 </c:choose>
                            </td>
                            <th>등록일시</th>
                            <td><fmt:formatDate value="${nttVo.regDh}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3" style="height:153px; vertical-align:top !important;">
                                <c:out value="${nttVo.nttCts}"  escapeXml="false"/>
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

                <view:url var="qnaListUrl" href="/openapi/qna/list" reqParam="true"/>
                <view:url var="qnaUpdateUrl" href="/openapi/qna/${nttVo.nttSeq}/update" reqParam="true"/>
                <form:form action="/openapi/qna/${nttVo.nttSeq}/delete" method="POST">
                    <div class="btn-list">
                        <c:if test="${nttVo.regrSeq eq sessionUsrVo.usrSeq }">
                            <a href="${qnaUpdateUrl}" title="수정" class="btn lg dark">수정</a>
                            <input class="btn lg gray" type="submit" value="삭제" title="삭제" onclick="return confirm('삭제하시겠습니까?')" />
                        </c:if>
                        <a href="${qnaListUrl}" title="Q&amp;A 목록" class="btn lg gray">목록</a>
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

