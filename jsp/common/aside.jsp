        <div class="aside">
<%--          <c:out value="${param.gnb}"></c:out>|<c:out value="${param.snb}"></c:out>  --%>
<%--             <c:if test="${(param.gnb eq 'use' && param.snb ne 'evntPartcptn') || param.gnb eq 'mw24'}"> --%>        
            <c:if test="${((param.gnb eq 'use' && param.snb ne 'evntPartcptn') || (param.gnb eq 'useGuide' && param.snb eq 'noMan')) || param.gnb eq 'mw24'}">
            <strong>고객센터</strong>
            <ul class="nav">
                <li class="pc-menu-block">
                    <strong><a href="/new_info/customer/AA090_info_customer_govGuide_1.jsp" <c:if test="${param.snb eq 'useMethod'}">class="active"</c:if>>정부24 이용방법</a></strong>
                </li>
                <li>
                    <strong><a href="/portal/ntcItm" <c:if test="${param.snb eq 'ntcItm'}">class="active"</c:if>>공지사항</a></strong>
                </li>
                <li class="dnone">
                    <strong><a href="/main?a=AA100DataDownListAppNew" <c:if test="${param.snb eq 'dataDown'}">class="active"</c:if>>자료실</a></strong>
                </li>
                <li>
                    <strong>
                        <c:choose>
                            <c:when test="${mobileYn eq 'Y'}"><a href="/mw/new_info/customer/AA090_info_customer_elect.jsp">서비스지원</a></c:when>
                            <c:otherwise><a href="/certIssue?a=AA040PrinterSearchAppNew">서비스지원</a></c:otherwise>
                        </c:choose>
                        <i class="fa fa-angle-down"></i>
                    </strong>
                    <ul>
                        <li class="dnone"><a href="/mw/new_info/customer/AA090_info_customer_printer_list.jsp" <c:if test="${param.snb eq 'printer'}">class="active"</c:if>>프린터 이용안내</a></li>
                        <li class="dnone"><a href="/mw/common/AA060_common_total_install.jsp" <c:if test="${param.snb eq 'install'}">class="active"</c:if>>프로그램 설치 확인</a></li>
                        <li><a href="/mw/new_info/customer/AA090_info_customer_elect.jsp" <c:if test="${param.snb eq 'elect'}">class="active"</c:if>>전자결제안내</a></li>
                        <li><a href="/mw/AA090NoManMinwonView.do" <c:if test="${param.snb eq 'noMan'}">class="active"</c:if>>무인민원발급안내</a></li>
                        <li><a href="/mw/AA020AnyInfoCappView.do" <c:if test="${param.snb eq 'anyMw'}">class="active"</c:if>>어디서나 민원</a></li>
<%--                         <li><a href="/new_info/customer/AA090_CM010_mobile_info.jsp" <c:if test="${param.snb eq 'mobileInfo'}">class="active"</c:if>>모바일 이용안내</a></li> --%>
                    </ul>
                </li>                
                <li>
                    <strong><a href="/portal/faq" <c:if test="${param.snb eq 'faq'}">class="active"</c:if>>자주묻는질문(FAQ)</a></strong>
                </li>
                <li>
                    <strong><a href="#" onclick="checkUserImp(); return false;" <c:if test="${param.snb eq 'imprvm'}">class="active"</c:if>>개선의견수렴</a></strong>
                </li>
                <li>
                    <strong><a href="#" onclick="checkUserOnln(); return false;" <c:if test="${param.snb eq 'onlnResve'}">class="active"</c:if>>온라인 상담예약</a></strong>
                </li>                
            </ul>
            </c:if>
        
<%--             <c:if test="${param.gnb eq 'useGuide'}"> --%>        
            <c:if test="${param.gnb eq 'useGuide' && param.snb ne 'noMan'}">
            <strong>정부24 소개</strong>
            <ul class="nav">
                <li>
                    <strong><a href="/portal/govSumry">정부24 소개</a><i class="fa fa-angle-down"></i></strong>
                    <ul>
                        <li><a href="/portal/govSumry" <c:if test="${param.snb eq 'govSumry'}">class="active"</c:if>>정부24 개요</a></li>
<%--                         <li><a href="/portal/govBi" <c:if test="${param.snb eq 'govBi'}">class="active"</c:if>>정부24 BI</a></li> --%>
<%--                         <li><a href="/portal/govBanner" <c:if test="${param.snb eq 'govBanner'}">class="active"</c:if>>정부24 배너</a></li> --%>
                        <li><a href="/portal/dataviewgov" <c:if test="${param.snb eq 'dataviewgov'}">class="active"</c:if>>데이터로 보는 정부24</a></li>
                    </ul>
                </li>
                <li>
                    <strong><a href="/portal/disable">사이트 이용안내</a><i class="fa fa-angle-down"></i></strong>
                    <ul>
                        <li><a href="/portal/disable" <c:if test="${param.snb eq 'disable'}">class="active"</c:if>>장애인 이용안내</a></li>
                        <li><a href="/portal/privacy" <c:if test="${param.snb eq 'privacy'}">class="active"</c:if>>개인정보처리방침</a></li>
                        <li><a href="/portal/cpyrhtPrtc" <c:if test="${param.snb eq 'cpyrhtPrtc'}">class="active"</c:if>>저작권보호정책</a></li>
                        <%-- <li class="dnone"><a href="/portal/webAcces" <c:if test="${param.snb eq 'webAcces'}">class="active"</c:if>>웹접근성정책</a></li> --%>
                    </ul>
                </li>
                <li class="dnone">
                    <strong><a href="/portal/rss" <c:if test="${param.snb eq 'rss'}">class="active"</c:if>>RSS</a></strong>
                </li>
                <li>
                    <strong><a href="/portal/useStplat" <c:if test="${param.snb eq 'useStplat'}">class="active"</c:if>>이용약관</a></strong>
                </li>
<!--                 <li> -->
<%--                     <strong><a href="/portal/siteMap" <c:if test="${param.snb eq 'siteMap'}">class="active"</c:if>>사이트맵</a></strong> --%>
<!--                 </li>                 -->
            </ul>
            </c:if>
              
            <c:if test="${param.gnb eq 'mypage' || param.snb eq 'evntPartcptn'}">
            <strong><a href="javascript:checkUserImsi();">My GOV</a></strong>
            <ul class="nav">
                <li>
                    <strong><a href="/mw/AA040MyResultsList.do">나의 서비스</a><i class="fa fa-angle-down"></i></strong>
                    <ul>
                        <li><a href="/mw/AA040MyResultsList.do" <c:if test="${param.snb eq 'resultList'}">class="active"</c:if>>서비스 신청내역</a></li>
                        <li><a href="/portal/onlnResveList" <c:if test="${param.snb eq 'onlnResve'}">class="active"</c:if>>온라인 상담예약 내역</a></li>
                        <li class="dnone"><a href="/mw/AF010PayRefund.do" onclick="return XecureLinkCommand(this,'AF010PayRefundApp');" <c:if test="${param.snb eq 'payRefund'}">class="active"</c:if>>환불정보조회</a></li>
                        <li class="dnone"><a href="/mw/AA040ViewUserCart.do" <c:if test="${param.snb eq 'userCart'}">class="active"</c:if>>서비스 바구니</a></li>
                        <li class="dnone"><a href="/mw/AA040ViewUserCart.do?tempList=Y" <c:if test="${param.snb eq 'tempCart'}">class="active"</c:if>>임시저장 서비스</a></li>
		                <li class="dnone"><a href="/portal/evntPartcptn" <c:if test="${param.snb eq 'evntPartcptn'}">class="active"</c:if>>이벤트 참여 내역</a></li>
		                <!--<li class="dnone"><a href="/main?a=AA210LifeSvcInfoApp" <c:if test="${param.snb eq 'lifeSvc'}">class="active"</c:if>>나의 생활정보</a></li> 2020.02.10 염희봉 2-3차 프레임워크 전환, 링크 수정 -->
		                <li class="dnone"><a href="#" onclick="checkLvinfoAgree();" <c:if test="${param.snb eq 'lifeSvc'}">class="active"</c:if>>나의 생활정보</a></li>
		                <li class="dnone"><a href="/mw/allDayCareApplyList.do" <c:if test="${param.snb eq 'allDayCare'}">class="active"</c:if>>온종일 돌봄 신청내역</a></li>
                    </ul>
                </li>
<!--                 <li> -->
<!--                     <strong><a href="/portal/myPublicPlner/indSvcFind">나의 서비스</a><i class="fa fa-angle-down"></i></strong> -->
<!--                     <ul> -->
<%--                         <li><a href="/portal/myPublicPlner/indSvcFind" <c:if test="${param.snb eq 'indSvcFind'}">class="active"</c:if>>혜택 보관함</a></li> --%>
<%--                         <li><a href="javascript:checkLvinfoAgree();" <c:if test="${param.snb eq 'lifeSvc'}">class="active"</c:if>>나의 생활정보</a></li> --%>
<%--                         <li><a href="/portal/myPublicSvc/intrstGrpMgr" <c:if test="${param.snb eq 'intrstGrpMgr'}">class="active"</c:if>>관심 서비스</a></li> --%>
<%--                         <li><a href="/portal/svcSchdul" <c:if test="${param.snb eq 'svcSchdul'}">class="active"</c:if>>서비스 일정관리</a></li> --%>
<%--                         <li class="dnone"><a href="/portal/myPublicSvc/oflnHst" <c:if test="${param.snb eq 'oflnHst'}">class="active"</c:if>>정부서비스 목록열람</a></li> --%>
<!--                     </ul> -->
<!--                 </li> -->
                <li>
                    <strong><a href="/nlogin/usr/mgrView">회원정보</a><i class="fa fa-angle-down"></i></strong>
                    <ul>
                        <li><a href="/nlogin/usr/mgrView" <c:if test="${param.snb eq 'mgrView'}">class="active"</c:if>>회원정보 관리</a></li>
                        <li><a href="/nlogin/usr/leaveUsr" <c:if test="${param.snb eq 'leaveUsr'}">class="active"</c:if>>회원탈퇴</a></li>
                        <li><a href="/nlogin/certRegForm" <c:if test="${param.snb eq 'userCerti'}">class="active"</c:if>>인증등록/관리</a></li>
                        <li class="dnone"><a href="/nlogin/authIntro" <c:if test="${param.snb eq 'authIntro'}">class="active"</c:if>>복합인증관리</a></li>
                        <%-- <li class="dnone"><a href="/main?a=AA060SSOManageApp" <c:if test="${param.snb eq 'ssoManage'}">class="active"</c:if>>통합인증 관리</a></li> --%>
                    </ul>
                </li>
            </ul>
            </c:if>
            <c:if test="${param.gnb eq 'eHanaro'}">
            <strong>e하나로민원 안내</strong>
            <ul class="nav">
                <li>
                    <strong>행정정보공동이용 소개<i class="fa fa-angle-down"></i></strong>
                    <ul>
                        <li><a href="/etc/AA090_g4c_admin.jsp" <c:if test="${param.snb eq 'summary'}">class="active"</c:if>>행정정보공동이용 소개</a></li>
                        <li><a href="/etc/AA090_pkg_srch_refund.jsp" <c:if test="${param.snb eq 'pkg'}">class="active"</c:if>>미환급금찾기</a></li>
                    </ul>
                </li>
                  <li>
                    <strong>행정정보공동이용 업무<i class="fa fa-angle-down"></i></strong>
                    <ul>
                        <li><a href="/main?a=AA240ServiceInfoListApp&mode=Y" <c:if test="${param.snb eq 'resultInfoList' and mode eq 'Y'}">class="active"</c:if>>사전동의 후 공동이용 가능한 업무</a></li>
                        <li><a href="/main?a=AA240ServiceInfoListApp&mode=N" <c:if test="${param.snb eq 'resultInfoList'  and mode eq 'N'}">class="active"</c:if>>사전동의 없이 공동이용 가능한 업무</a></li>
                    </ul>
                </li>
                  <li>
                    <strong>행정정보공동이용 사전동의 <i class="fa fa-angle-down"></i></strong>
                    <ul>
                        <li><a href="/etc/AA240_insert_resultInfo.jsp" <c:if test="${param.snb eq 'resultInfo'}">class="active"</c:if>>안내</a></li>
                        <li><a href="/main?a=AA240ServiceListApp" <c:if test="${param.snb eq 'serviceList'}">class="active"</c:if>>공동이용사전동의 신청</a></li>
                        <li><a href="/main?a=AA240ServiceResultListApp" <c:if test="${param.snb eq 'resultList'}">class="active"</c:if>>처리결과확인</a></li>
                        <li><a href="/main?a=AA240DisagreeServiceResultListApp" <c:if test="${param.snb eq 'disagreeServiceResultList'}">class="active"</c:if>>사전동의 없이 공동이용한 내역조회</a></li>
                    </ul>
                </li>
                  <li>
                    <strong>행정정보공동이용 열람청구 <i class="fa fa-angle-down"></i></strong>
                    <ul>
                        <li><a href="/etc/AA240_readingCharge.jsp" <c:if test="${param.snb eq 'readingCharge'}">class="active"</c:if>>안내</a></li>
                        <li><a href="/main?a=AA240OpenDemandSrchApp" <c:if test="${param.snb eq 'demandSrch'}">class="active"</c:if>>열람청구신청</a></li>
                        <li><a href="/main?a=AA240DisagreeResultListApp" <c:if test="${param.snb eq 'disagreeResultList'}">class="active"</c:if>>처리내역조회</a></li>
                    </ul>
                </li>
                  <li>
                    <strong>주소변경알리미 <i class="fa fa-angle-down"></i></strong>
                    <ul>
                        <li><a href="/mypage/AA040_address_chargeInfo.jsp" <c:if test="${param.snb eq 'addrChargeInfo'}">class="active"</c:if>>안내/담당자/연락처</a></li>
<%--                         <li><a href="/main?a=AA040AddressApplyApp" <c:if test="${param.snb eq 'addrApply'}">class="active"</c:if>>주소변경알리미 신청</a></li> --%>
                        <li><a href="/main?a=AA040AddressShowApp" <c:if test="${param.snb eq 'addrShow'}">class="active"</c:if>>처리결과확인</a></li>
                    </ul>
                </li>
                <li>
                    <strong>주민번호/성명변경알리미 <i class="fa fa-angle-down"></i></strong>
                    <ul>
                        <li><a href="/mypage/AA050_rrn_chargeInfo.jsp" <c:if test="${param.snb eq 'rrnChargeInfo'}">class="active"</c:if>>안내/담당자/연락처</a></li>
                        <li><a href="/main?a=AA050RrnApplyApp" <c:if test="${param.snb eq 'rrnApply'}">class="active"</c:if>>주민번호/성명변경알림 신청</a></li>
                        <li><a href="/main?a=AA050RrnResultApp" <c:if test="${param.snb eq 'rrnResult'}">class="active"</c:if>>처리결과확인</a></li>
                    </ul>
                </li>
            </ul>
            </c:if>
        </div>