    <div class="util">
        <%-- <sec:authorize access="isAnonymous()">
	        <ul>
	            <li><a href="/usr/login" title="로그인">로그인</a></li>
	            <li><a href="/usr/register" title="회원가입">회원가입</a></li>
	        </ul>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()" var="isAuthenticated">
	        <ul>
	            <li><a href="/usr/logout" title="로그아웃">로그아웃</a></li>
	        </ul>
        </sec:authorize> --%>
    </div>
    <header>
        <h1 class="hidden">대한민국 정부 - 공공서비스 공동활용</h1>
        <p class="logo"><a href="/openapi" title="대한민국 정부 공공서비스 공동활용 메인화면"><img src="/openapi/images/common/top_logo.png" alt="대한민국 정부 - 공공서비스 공동활용"></a></p>
        <!-- <div class="line"></div> -->
        <nav class="nav">
            <ul>
                <li <c:if test="${param.gnb eq 'opApi'}">class="current"</c:if>>
                    <a href="/openapi/info" title="OpenAPI 신청">OpenAPI</a>
                    <%-- <ul class="sm">
                        <li class="current"> 
                        <li <c:if test="${param.snb eq 'opApiReq'}">class="current"</c:if>><a href="/openapi/info" title="OpenAPI 신청">OpenAPI 신청</a></li>
                        <li <c:if test="${param.snb eq 'cnrsSvcReqst'}">class="current"</c:if>><a href="/openapi/service/sharing/info" title="공공서비스 공유신청">공공서비스 공유신청</a></li>
                        <li <c:if test="${param.snb eq 'reqSttus'}">class="current"</c:if>><a href="/openapi/request/list" title="신청 현황">신청 현황</a></li>
                    </ul> --%>
                </li>
                
                <li <c:if test="${param.gnb eq 'useExam'}">class="current"</c:if>>
                    <a href="/openapi/useExam" title="활용사례">활용사례</a>
                </li>
                
                <li <c:if test="${param.gnb eq 'ntcItm'}">class="current"</c:if>>
                    <a href="/openapi/ntcItm/list" title="공지사항">공지사항</a>
                </li>
                
                <%-- <li <c:if test="${param.gnb eq 'qna'}">class="current"</c:if>>
                    <a href="/openapi/qna/list" title="Q&amp;A">Q&amp;A</a>
                </li> --%>
                
                <%-- 
                <li <c:if test="${param.gnb eq ''}">class="current"</c:if>>
                    <a href="#noaction">한글주소서비스 안내</a>
                </li>
                 --%>
            </ul>
        </nav>
    </header>
    