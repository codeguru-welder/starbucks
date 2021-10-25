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
     2015.10.26    장세란         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <title>공공서비스 공동활용</title>
</head>
<body id="main">
    <div class="wrapper">
       <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp"/>
       
        <div class="mcontents define" id="contents">
            <div class="floatL">
                <h1>공공서비스 공동활용은?</h1>
                <p>정부24에서 제공되는 공공서비스 정보를 개방하여<br/> 누구나 자신만의 서비스나 애플리케이션에 활용할수 있도록<br/> 제공되는 오픈API 서비스입니다.</p>
                <p><img src="/openapi/images/common/openapi_define_text.png" alt="Open API (Open Application Programming Interface) 서비스란? 인터넷 이용자 또는 애플리케이션 개발자가 직접 응용 프로그램과 서비스를 손쉽게 개발할 수 있도록 일정하게 정해진 형식으로 정보를 공개하는 것으로 정부24 에서는 정부에서 시행하고 있는 공공서비스 정보를 오픈API 로 제공합니다."></p>
            </div>
        </div>
        <div class="dev-guide">
            <div class="inner">
                <h2 class="normal">공공서비스 Open API 개발가이드</h2>
                <p>정부24에서 축적하고 있는 기술정보를 공유하고 지원해 드립니다.</p>
                <a href="/openapi/API0001/guide" title="가이드 자세히 보기" class="view-guide">가이드 자세히 보기</a>
            </div>
        </div>
        <div class="notice-wrap">
            <div class="notice">
                <h3 class="normal">공지사항</h3>
                <div class="newsticker-container">
                    <div class="nt-nav">
                        <button type="button" title="멈춤" class="nt-pause">멈춤</button>
                        <button type="button" title="시작" class="nt-start">시작</button>
                        <button type="button" title="이전" class="nt-prev">이전</button>
                        <button type="button" title="다음" class="nt-next">다음</button>   
                    </div>
                    <ul class="newsticker">                        
                        <c:forEach var="nttVo" items="${pageData}" varStatus="status" begin="0" end="2">
                            <li>
                            <view:url var="ntcItmInfo" href="/openapi/ntcItm/${nttVo.nttSeq}" reqParam="true"/>
                                    <a href="${ntcItmInfo}" title="${nttVo.nttTtl}">
                                        <strong class="normal"><c:out value="${util:shortString(nttVo.nttTtl, 33)}"/></strong>
                                        <p><c:out value="${util:shortString(nttVo.nttCts,60)}"  escapeXml="false" /></p>
                                        <span class="date"><fmt:formatDate value="${nttVo.regDh}" pattern="yyyy-MM-dd"/></span>
                                   </a>
                            </li>        
                        </c:forEach>  
                    </ul>
                </div>          
            </div>
            <div class="app-api">
                <h3 class="normal">OpenAPI 신청</h3>
                <p>현재 서비스되고 있는 OpenAPI 목록을 확인하고<br/>신청 할 수 있습니다.</p>
                <p><a href="/openapi/info" title="OpenAPI 신청">OpenAPI 신청하러 가기</a></p>
            </div>
        </div>
        
         <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
    </div><!-- End of class="wrapper" //-->
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>
    <script type="text/javascript" src="/openapi/js/jquery.newsTicker.min.js"></script>
    
    <script type="text/javascript">
    //<![CDATA[
        var nt_example1 = $('.newsticker').newsTicker({
            row_height: 95,
            max_rows: 1,
            autostart: 1,
            duration: 4000,
            prevButton: $('.nt-prev'),
            nextButton: $('.nt-next'),
            stopButton: $('.nt-pause'),
            startButton: $('.nt-start')
        });
	//]]> 
    </script>

</body>
</html>
