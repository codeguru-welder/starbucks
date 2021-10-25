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
    <title>공공서비스 공동활용 | Q&amp;A | 목록</title>    
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
                
                <div class="search-box">
                    <form:form id="opApiNtcItmForm" commandName="searchVo" method="get" action="">
                    <span class="sbox">
                        <form:select path="srchType" cssClass="w450" title="검색영역선택">
                            <form:option value="ALL" title="전체" label="전체" />
                            <form:option value="ttl" title="제목" label="제목" />
                            <form:option value="cts" title="내용" label="내용" />
                        </form:select>
                    </span>
                        <form:input path="srchTxt" maxlength="100" title="검색어 입력" id="srchTxt" cssClass="inbox big long default-korean"  placeholder="검색어를 입력하세요" />
                        <button class="btn icon"><span class="icon search"></span>검색</button>
                    </form:form>
                </div>
                
               <h2 class="ttit">검색결과 <span class="tbl-desc">전체 <fmt:formatNumber value="${pageData.totalCount}" type="number"/>건</span></h2>
          
                <div class="tbl-list cellC">
                    <table>
                        <caption>
                            <strong>Q&amp;A 검색결과 목록</strong>
                            <span>제목, 공개여부, 작성자, 조회수 항목으로 구성</span>
                        </caption>
                        <colgroup>                        
                            <col style="width: 10%">
                            <col style="width: 50%">
                            <col style="width: 10%">
                            <col style="width: 20%">
                            <col style="width: 10%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>공개여부</th>
                                <th>작성자</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty pageData.list}">
                                    <tr>
                                        <td colspan="6" class="text-center">
                                            <c:choose>
                                                <c:when test="${empty nttVo.srchTxt}">
                                                    등록된 Q&A가 없습니다.
                                                </c:when>
                                                <c:otherwise>
                                                  &quot;<c:out value="${nttVo.srchTxt}"/>&quot; (으)로 검색된 Q&A가 없습니다.
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:when> 
                                <c:otherwise>  
                                    <view:startListNum var="startNum" pageData="${pageData}" order="desc"/>            
                                        <c:forEach var="nttVo" items="${pageData.list}" varStatus="status">
                                            <view:url var="qnaInfoUrl" href="/openapi/qna/${nttVo.nttSeq}" reqParam="true"/>
                                            <tr>
                                                <td><view:listNum startNum="${startNum}" statusIndex="${status.index}"/></td>
                                                <td class="alignL">
                                                    <c:set var="shortNttTtl" value="${util:shortString(nttVo.nttTtl, 35 - (nttVo.nttLevel+1))}"/>
                                                    <c:forEach begin="2" end="${nttVo.nttLevel}">
                                                         &nbsp;&nbsp;
                                                    </c:forEach>
                                                    <c:if test="${nttVo.upNttSeq != 0 }">┗ &nbsp;</c:if>                                                    
                                                    <c:choose>  
                                                        <c:when test="${nttVo.delYn eq 'N'}">
                                                        <c:choose>
                                                            <c:when test="${(nttVo.secretSntncYn eq 'N') || ((nttVo.secretSntncYn eq 'Y')&&(nttVo.fsNttRegrSeq eq sessionUsrVo.usrSeq))}">
	                                                             <a href="${qnaInfoUrl}" title="<c:out value="${nttVo.nttTtl}"/> 상세화면"><c:out value="${shortNttTtl}"/></a>
	                                                        </c:when>
	                                                        <c:otherwise>
	                                                            <a href="#noaction" title="<c:out value="${nttVo.nttTtl}"/>" onclick="checkSecretSnTncYn(); return false;"><c:out value="${shortNttTtl}"/></a>
	                                                        </c:otherwise>	                                                    
	                                                    </c:choose>
	                                                    </c:when>
	                                                    <c:otherwise>
                                                            삭제된 게시물입니다.
	                                                    </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${nttVo.secretSntncYn eq 'N'}">
                                                            공개
                                                        </c:when>
                                                        <c:otherwise>
                                                            비공개
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
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
                                                <td><c:out value="${nttVo.nttVwCnt}"/></td>
                                            </tr>
                                        </c:forEach>   
                            </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
                
                <c:if test="${fn:length(pageData.list) > 0}">
                    <view:navi id="nav" cssClass="pagination" href="/openapi/ntcItm/list" page="${pageData}" pageIndex="pageIndex">    
                        <view:first img="/openapi/images/common/ico_first_01.gif" alt="맨 처음 페이지"/>
                        <view:prev img="/openapi/images/common/ico_prev_01.gif" alt="이전 페이지"/>
                        <view:pageList onCss="active" />
                        <view:next img="/openapi/images/common/ico_next_01.gif" alt="다음 페이지"/>
                        <view:last img="/openapi/images/common/ico_last_01.gif" alt="맨 마지막 페이지"/>
                    </view:navi>
                </c:if>
                
                <div class="btn-list">
                    <a href="/openapi/qna/insert" title="등록" class="btn lg dark">등록</a>
                </div>
                
            <!-- End Page //-->             
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->
        
        <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
    </div><!-- End of class="wrapper" //-->
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>

    <script type="text/javascript">
    //<![CDATA[
    $(document).ready(function() {
        if ('${message}' != '') {
            alert('${message}');
        }
    });
                           
    function checkSecretSnTncYn() {
        alert("비공개 게시물입니다.");
    };
    //]]>
    </script>   
</body>
</html>

