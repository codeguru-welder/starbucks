            <div class="header-mobile">
                <div class="head-top">
                    <p class="all-menu"><a href="#navAll" class="common-ico-default"><span class="sr-only">전체메뉴</span></a></p>
                    <h1><a href="/portal/main"><img src="/2018/img/mobile/logo.gif" alt="정부24"></a></h1>
                    <p class="login-menu">
                        <c:if test="${param.gnb eq 'main'}">
                            <a href="javascript:callNativeQr();" class="common-ico-default qr"><span class="sr-only">QR코드</span></a>
                        </c:if>
                        <c:if test="${not empty user && user.USER_ID != null}">
                            <a href="/nlogin/logout?Mcode=10011" class="common-ico-login logout-icon"><span class="sr-only">로그아웃</span></a>
                        </c:if>
                        <c:if test="${not empty user && user.USER_ID == null}">
                            <a href="/nlogin/?Mcode=10003" class="common-ico-login login-icon"><span class="sr-only">로그인</span></a>
                        </c:if>                            
                        <c:if test="${empty user}">
                           <c:if test="${not empty user_imsi}">
                            <a href="/nlogin/logout?Mcode=10011" class="common-ico-login logout-icon"><span class="sr-only">로그아웃</span></a>
                           </c:if>
                           <c:if test="${empty user_imsi}">
                           <a href="/nlogin/?Mcode=10003" class="common-ico-login login-icon"><span class="sr-only">로그인</span></a>
                           </c:if>
                        </c:if>
                        
                    </p>
                </div>
                <!-- all menu 0416 -->
                <div class="gnb-mobile-wrap">
                    <div class="gnb-mobile-inner">
                        <nav class="nav-gnb-user">
                            <ul>
                                <li class="home"><a href="/portal/main">홈</a></li>
                                <!-- GOV2-2 START -->
  <%
  		String pushAlramCnt = "";
  		HttpSession httpsession = request.getSession(false);
  		if( session != null ) {
  			pushAlramCnt = (String)httpsession.getAttribute("sessPushAlramCnt");
  		}
  %>                                
                                <c:if test="${not empty user && user.USER_ID != null}">
<%--                                 	<c:if test="${not empty pushAlramCnt && pushAlramCnt != null && pushAlramCnt != '0'}"> --%>
                                	<%if( pushAlramCnt != null && !"".equals(pushAlramCnt) && !"0".equals(pushAlramCnt)) { %>
                                		<li class="alram"><a href="/portal/pushReceive?userId=<c:out value='${user.USER_ID}'/>"><span><%=pushAlramCnt%></span></a></li>
<%--                                 	</c:if> --%>
									<%}else { %>
<%--                                 	<c:if test="${empty pushAlramCnt || pushAlramCnt == null || pushAlramCnt == '0'}"> --%>
                                		<li class="alram"><a href="/portal/pushReceive?userId=<c:out value='${user.USER_ID}'/>"></a></li>
<%--                                 	</c:if> --%>
									<%} %>
                                </c:if>
                                <!-- GOV2-2 END -->
<%--                                 <c:if test="${empty user || user.USER_ID == null}">	 --%>
<!--                                 <li class="alram"><a href=""><span>+</span>알림</a></li> -->
<%--                                 </c:if> --%>
<!--                                <li class="mobile-mygov"><a href="/portal/myPublicPlner"></a></li> -->
                                <%-- <c:if test="${not empty user && user.USER_ID != null}">
                                    <li class="logout"><a href="/nlogin/logout?Mcode=10011">로그아웃</a></li>
                                    <li class="user"><c:out value="${user.USER_NM}"/> 님</li>
                                </c:if>
                                <c:if test="${empty user}">
                                    <c:if test="${not empty user_imsi}">
                                        <li class="logout"><a href="/nlogin/logout?Mcode=10011">비회원종료</a></li>
                                        <li class="user"><c:out value="${user_imsi.USER_NM}"/> 님</li>
                                    </c:if>
                                    <!-- <li><a href="/nlogin/?Mcode=10003" class="login">로그인</a></li> -->
                                </c:if> --%>
                            </ul>
                        </nav>
                        <a href="#" class="btn-close-gnb"><span>닫기</span></a>
                        <nav class="nav-gnb-menu">
                            <ul class="nav-gnb-mobile">
                                <li>
                                    <a href="#">정부서비스</a>
                                    <ul>
                                        <li><a href="/portal/drtRecptSvc?Mcode=10116">정부서비스 신청</a></li>
                                        <li><a href="/portal/service/category">정부서비스 찾기</a></li>
                                        <!-- <li><a href="/main?a=AA210LifeSvcInfoApp">나의 생활정보</a>  2단계3차 프레임워크 전환 주석처리 -->
                                        <li><a href="/mw/AA210LifeSvcInfo.do">나의 생활정보</a>
                                        <!-- GOV2-2 START -->
										<li><a href="/portal/reqstTmlmtSvc">이달의 정부서비스 안내</a></li>
<!--                                         <li><a href="/portal/publicBcyclRent/publicBcyclRentInfo">지자체 공영자전거</a></li> -->
                                        <!-- GOV2-2 END -->
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">민원서비스</a>
                                    <ul>
                                        <li><a href="/portal/minwon/search">중앙민원</a></li>
                                        <li><a href="/portal/autonomy_minwon/search">자치민원</a></li>
                                        <li><a href="/mw/EgovPageLink.do?link=confirm/AA040_confirm_index">확인서비스</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">정책정보</a>
                                    <ul>
                                        <li><a href="/portal/gvrnPolicy/listBrmAll">정책정보 찾기</a></li>
                                        <li><a href="/portal/orgInfo">기관정보</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">MY GOV</a>
                                    <!-- 0607  추가-->
                                    <a href="/portal/myPublicPlner" class="mygov-other"><i class="ion-ios-arrow-thin-right"></i><span class="sr-only">마이페이지 바로가기</span></a>
                                    <!--// 0607 추가-->
                                    <ul>
                                        <li><a href="/main?a=AA040MyResultsListApp">나의신청내역</a></li>
                                        <li><a href="/nlogin/usr/mgrView">회원정보</a>
                                            <c:if test="${not empty user}">
                                                <ul>
                                                    <li class="active"><a href="/nlogin/usr/mgrView">회원정보 관리</a></li>
                                                    <li><a href="/nlogin/usr/leaveUsr">회원탈퇴</a></li>
                                                    <li><a href="/nlogin/certRegForm">인증 등록/관리</a></li>
<!--                                                     <li><a href="/nlogin/bioAuthMng">지문 및 간편비밀번호 등록/해지</a></li> -->
                                                </ul>
                                            </c:if>
                                            <c:if test="${empty user}">
                                                <c:choose>
                                                    <c:when test="${not empty user_imsi}">
                                                        <ul>
                                                            <li class="active"><a href="/nlogin/usr/mgrView">회원정보 관리</a></li>
                                                            <li><a href="/nlogin/usr/leaveUsr">회원탈퇴</a></li>
                                                            <li><a href="/nlogin/certRegForm">인증 등록/관리</a></li>
<!--                                                             <li><a href="/nlogin/bioAuthMng">지문 및 간편비밀번호 등록/해지</a></li> -->
                                                        </ul>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <ul>
                                                            <li class="active"><a href="/nlogin/?Mcode=10003">회원정보 관리</a></li>
                                                            <li><a href="/nlogin/?Mcode=10003">회원탈퇴</a></li>
                                                            <li><a href="/nlogin/?Mcode=10003">인증 등록/관리</a></li>
<!--                                                             <li><a href="/nlogin/bioAuthMng">지문 및 간편비밀번호 등록/해지</a></li>                                                          -->
                                                        </ul>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">고객센터</a>
                                    <ul>
                                        <li><a href="/portal/ntcItm">공지사항</a></li>
                                        <li><a href="/portal/faq">자주찾는질문</a></li>
                                        <li><a href="/portal/mrfnOpinionClct/imprvm">개선의견수렴</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">이용안내</a>
                                    <ul>
                                        <li><a href="/portal/govSumry">정부24소개</a></li>
                                        <li><a href="/portal/disable">장애인이용안내</a></li>
                                        <li><a href="/portal/privacy">개인정보처리방침</a></li>
                                        <li><a href="/portal/cpyrhtPrtc">저작권보호정책</a></li>
                                        <li><a href="/certIssue?a=AA040PrinterSearchAppNew">민원발급지원</a>
                                            <ul>
                                                <li class="active"><a href="/new_info/customer/AA090_info_customer_elect.jsp">전자결제안내</a></li>
                                                <li><a href="/new_info/customer/AA090_CM010_No_man_popup.jsp">무인민원발급기안내</a></li>
                                                <li><a href="/new_info/customer/AA090_CM010_mobile_info.jsp">모바일 이용안내</a></li>
                                            </ul>
                                        </li>                                        
                                        <li><a href="/mw/AA090NoManMinwonView.do">무인민원발급안내</a></li>                                      
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!--// all menu 0416 -->
                
                <c:if test="${param.gnb eq 'main'}">
                <!-- search -->
                <form:form id="searchForm" name="searchForm" action="/search" method="get" onsubmit="return intSearch();">
                    <fieldset>
                        <legend>검색</legend>
                        <div class="search-wrap">
                            <button title="검색" id="search_btn" name="search_btn" type="submit"><span class="ion-ios-search-strong"></span></button>
                            <label for="search-name"></label>
                            <input type="text" id="srhQuery" name="srhQuery"  value="" placeholder="검색어를 입력해 주세요" maxlength="25" autocomplete="off">
                            <p class="voice-btn"><a href="javascript:callNativeStt(srhQuery);"><span class="ion-android-microphone"></span><span class="sr-only">음성검색</span></a></p>
                            <input type="hidden" id="realQuery" name="realQuery" value=""/>
                            <input type="hidden" id="Mcode" name="Mcode" value="10020"/>
                            <!--자동완성 2018-05-03 start  -->
                            <div class="autocomplete">
                               <div id="ark" >
                                   <ul class="tab-auto">
                                       <li class="word-recent">
                                           <ul class="resultbox"><li class="text_none"><p>검색어를 입력해주세요.</p></li></ul>
                                       </li>
                                       <li class="word-de">                                                 
                                           <dl class="terms">
                                               <dt><strong>용어</strong>설명</dt>
                                               <dd class="resultbox2">용어설명</dd>
                                           </dl>
                                       </li>
                                   </ul>
                               </div>
                           </div>
                           <!--// 자동완성  2018-05-03 end -->                              
                        </div>                      
                    </fieldset> <!-- // search -->                
                </form:form>
                </c:if>
            </div>