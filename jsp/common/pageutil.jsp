    <c:if test="${param.gnb ne 'main'}">
        <div class="title" id="pageCont"> 
            <a href="#" class="fa-prev" role="button"><span class="sr-only">이전페이지</span></a>
            <h1><c:out value="${param.ttl}" escapeXml="false"/></h1>
            <ul class="page-util">
                <c:if test="${param.sns eq 'Y'}">
                    <li class="facebook"><a href="http://www.facebook.com" target="_blank" title="내 페이스북으로 공유하기-새창" onclick="snsPopup('facebook'); return false;" role="button"><span class="sr-only">Facebook</span></a></li>
                    <li class="twitter"><a href="http://www.twitter.com" target="_blank" title="내 트위터로 공유하기-새창" onclick="snsPopup('twitter', '${param.ttl}\r\n'); return false;" role="button"><span class="sr-only">Twitter</span></a></li>
                </c:if>
                <li class="iconBox print"><a href="#none" class="page_print"><span class="sr-only">프린트하기</span></a></li>
            </ul>
        </div>
    </c:if>