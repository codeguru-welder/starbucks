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
     2015.10.27    장세란         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <title>공공서비스 공동활용 | 공지사항 | 목록 </title>    
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
                            <strong>공지사항 검색결과 목록</strong>
                            <span>번호, 제목, 조회수, 등록일자 항목으로 구성</span>
                        </caption>
                        <colgroup>                        
                            <col style="width: 10%">
                            <col style="width: 62%">
                            <col style="width: 10%">
                            <col style="width: 18%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>조회수</th>
                                <th>등록일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty pageData.list}">
                                    <tr>
                                        <td colspan="6" class="text-center">
                                            <c:choose>
                                                <c:when test="${empty nttVo.srchTxt}">
                                                등록된 공지사항이 없습니다.
                                                </c:when>
                                                <c:otherwise>
                                                  &quot;<c:out value="${nttVo.srchTxt}"/>&quot; (으)로 검색된 공지사항이 없습니다.
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:when> 
                                <c:otherwise>  
                                    <view:startListNum var="startNum" pageData="${pageData}" order="desc"/>            
                                    <c:forEach var="nttVo" items="${pageData.list}" varStatus="status">
                                        <view:url var="ntcItmInfo" href="/openapi/ntcItm/${nttVo.nttSeq}" reqParam="true"/>
                                        <tr>
                                            <td><view:listNum startNum="${startNum}" statusIndex="${status.index}"/></td>
                                            <td  class="alignL">
                                                <a href="${ntcItmInfo}" title="<c:out value="${nttVo.nttTtl}"/>"><c:out value="${util:shortString(nttVo.nttTtl, 42)}"/></a>
                                            </td>
                                            <td><c:out value="${nttVo.nttVwCnt}"/></td>
                                            <td><fmt:formatDate value="${nttVo.regDh}" pattern="yyyy-MM-dd"/></td>
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
                
            <!-- End Page //-->             
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->
        
        <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
    </div><!-- End of class="wrapper" //-->
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>
</body>
</html>

