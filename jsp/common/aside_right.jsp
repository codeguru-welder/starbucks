        <div class="aside">
        
            <c:if test="${param.gnb eq 'svc'}">
                <c:if test="${not empty user.UNITY_USR_SEQ}">
                <div class="as-con as-list">
                    <p class="as-tit">즐겨 찾은 서비스</p>
                    <ol class="line-wrap bul-num num-white" id="intrstGrpSrhList">
                    </ol>
                </div>
                </c:if>
                <div class="as-con as-list">
                    <p class="as-tit">오늘 본 서비스</p>
                    <ul class="line-wrap bul-dot" id="myDocList">
                    </ul>
                </div>
                <div class="as-con as-list">
                    <c:choose>
                        <c:when test="${not empty user.UNITY_USR_SEQ}">
                            <p class="as-tit">내게 맞는 서비스 보기</p>
                        </c:when>
                        <c:otherwise>
                            <p class="as-tit">더 많은 서비스 보기</p>
                        </c:otherwise>
                    </c:choose>
                    <ol class="line-wrap bul-num num-white" id="recomendSvcList">
                    </ol>
                </div>
            </c:if>
            
            <c:if test="${not empty lnkNewsList}">
            <div class="as-con as-list">
                <p class="as-tit">최신 국정소식</p>
                <ul class="line-wrap bul-dot">
                    <c:forEach var="lnkNewsVo" items="${lnkNewsList}">
                    <li><span><a href="/portal/ntnadmNews/${lnkNewsVo.lnkNewsSeq}"><c:out value="${lnkNewsVo.newsTtl}" escapeXml="false"/></a></span></li>
                    </c:forEach>
                </ul>
            </div>
            </c:if>
            
            <c:if test="${param.gnb eq 'news'}">
                <div class="as-con as-list">
                    <p class="as-tit">민원 조회 Best</p>
                    <ul class="box-wrap bul-ico">
                        <li><a href="/mw/AA020InfoCappView.do?HighCtgCD=A01004&CappBizCD=13100000015">주민등록표등본(초본)</a></li>
                        <li><a href="/mw/AA020InfoCappView.do?HighCtgCD=A01004&CappBizCD=13100000016">전입신고</a></li>
                        <li><a href="/mw/AA020InfoCappView.do?HighCtgCD=A09002&CappBizCD=13100000084">지방세 세목별 과세증명</a></li>
                        <li><a href="/mw/AA020InfoCappView.do?HighCtgCD=A01002&CappBizCD=13000000016">병적증명서 발급</a></li>
                        <li><a href="/mw/AA020InfoCappView.do?HighCtgCD=&CappBizCD=13100000026">토지(임야)대장열람.등본</a></li>
                        <li><a href="/mw/AA020InfoCappView.do?HighCtgCD=A09005&CappBizCD=15000000013">토지이용계획확인 신청</a></li>
                        <li><a href="/mw/AA020InfoCappView.do?HighCtgCD=&CappBizCD=13100000027">지적도(임야도)열람등본교부신청</a></li>
                        <li><a href="/mw/AA020InfoCappView.do?HighCtgCD=&CappBizCD=15000000098">건축물대장등초본발급(열람)신청</a></li>
                    </ul>
                </div>
            </c:if>
            
            <%-- <div class="as-con as-contact img-wrap">
                <img src="/2017/img/page/as_contact_gov24_s.png" alt="정부24 고객센터 : 문의전화 1588-2188 (평일 09:00 ~ 18:00)">
            </div> --%>
            
            <!-- <div class="as-con">
                <a href="/portal/mrfnOpinionClct/imprvm"><img src="/2017/img/page/as_contact_temp_s.jpg" alt="개선사항에 대한 의견을 남겨주세요-바로가기"></a>
            </div> -->
            
        </div><!-- //aside -->