<!-- 음성검색 추가 css -->
<link href="/2018/lib/css/voice.css" rel="stylesheet" type="text/css" />
<!-- 음성검색 추가 css -->

	<div id="skipnavi">
    <c:choose>
        <c:when test="${not empty param.gnb && param.gnb eq 'newMain'}">
		<a href="#container" class="skip">본문 바로가기</a>
        </c:when>
        <c:otherwise>
		<a href="#pageCont" class="skip">본문 바로가기</a>
        </c:otherwise>
    </c:choose>
		<a href="#gnb" class="skip">주메뉴 바로가기</a>
	</div>
		<c:choose>
			<c:when test="${not empty param.gnb && param.gnb eq 'newMain'}">
		<c:if test = "${toDate lt '2021052820'}">
			<script type="text/javascript">
			    $(document).ready(function() {
			        $('.notice-banner-close-btn').click(function() {
			            var chkd = $("#noticeBanner").is(":checked");
			            if(chkd){
			                $.cookie('notice-banner-element', 'hidden', {expires : 1});
			            }
			            $('.notice-banner-element').hide();
			        });
			        if($.cookie('notice-banner-element') == 'hidden'){
			            $('.notice-banner-element').hide();
			        }else{
			            $('.notice-banner-element').show();
			        }
			    });
			</script>

			<div class="notice-banner-element type02" style="display: none;">
				<div class="notice-banner-inner">
					<div class="notice-banner-txt">
						<p class="banner-title">정부24 <span>시스템 중단</span> 안내 - 시스템 점검 작업</p>
						<span class="stop-date"><em class="banner-subtit">중단일시</em>'21.05.28 (금) 20:00 ~ 05.29 (토) 08:00</span>
						<span><em class="banner-subtit">대&nbsp;&nbsp; 상</em>정부24 모든 서비스</span>
						<a href="/portal/ntcItm/76561"><span class="link_next">자세히보기</span></a>
					</div>
					<div class="notice-banner-close">
						<span class="checkbox-area"><input type="checkbox" name="" id="noticeBanner"><label for="noticeBanner"><span></span>오늘 하루동안 열지 않기</label></span>
						<span class="notice-banner-close-btn"><a href="#" class="main-ico-set" title="닫기"></a></span>
					</div>
				</div>
			</div>
		</c:if>

		<div class="wrapper-element main">
			</c:when>
			<c:when test="${not empty param.gnb && param.gnb eq 'newMygov'}">
		<div class="wrapper-element mygov">
			</c:when>
			<c:otherwise>
		<div class="wrapper-element">
			</c:otherwise>
		</c:choose>


		<!-- mobile search layer -->
		<!-- 202004 상단메뉴영역변경작업(검색포함) -->
		<div class="header-search-layer search-area">
			<div class="header-search-inner">
				<form:form id="headerSearchForm1" name="headerSearchForm1"  method="get">
					<fieldset>
						<legend class="hd-element">검색</legend>
						<div class="input-search-wrap">
							<div class="input-wrap">
								<label for="srhQueryForHeader1" class="hd-element">검색어 입력</label>
								<input type="search" class="input-search" id="srhQueryForHeader1" name="srhQuery"  maxlength="25" autocomplete="off" placeholder="검색어를 입력해 주세요." onKeyPress="if(event.keyCode==13){moreViewSearch1('${mobileYn}'); return false;}">
	                            <input type="hidden" name="Mcode" value="10020"/>
							</div>
							<div class="btn-area">
<c:if test="${appYn eq 'Y'}"><!-- 음성검색 앱전용 -->
								<button class="btn-voice" type="button" onclick="callNativeStt(srhQuery, '1');"><span class="hd-element">음성검색</span></button>
</c:if>
								<button class="btn-search" id="search_btn" name="search_btn" type="button"  onclick="moreViewSearch1('${mobileYn}'); return false;"><span class="hd-element">문자검색</span></button>
							</div>
						</div>
						<div class="renew-search">
							<div class="keyword-layer">
								<div class="keyword-layer-inner">
									<div class="direct-service">
										<p>서비스 바로가기</p>
										<ul id="ark_apply2"></ul>
									</div>
									<ul class="keyword-auto" id="ark_main2"></ul>
								</div>
							</div>
						</div>
						<button class="btn-close"><span>닫기</span></button>
					</fieldset>
				</form:form>
			</div>
		</div>
		<div class="mask-layout"></div>
		<!--// 202004 상단메뉴영역변경작업(검색포함) -->
		<!--// mobile search layer -->
		<!-- header -->
<c:choose>
	<c:when test="${not empty param.gnb && param.gnb eq 'newMain'}">
		<div class="header-element main">
	</c:when>
	<c:otherwise>
		<div class="header-element">
	</c:otherwise>
</c:choose>

			 <div class="top-area">
			 	<div class="inner-area">
					<!-- 202005 외국인서비스 추가 -->
					<div class="renew-lang-select toggle-group">
						<a href="/" class="toggle-btn">For Foreigners</a>
						<ul class="toggle-target">
							<li><a href="/portal/foreigner/ko" target="_blank" title="새창열림">한국어</a></li>
							<li><a href="/portal/foreigner/en" target="_blank" title="새창열림">ENG</a></li>
							<li><a href="/portal/foreigner/zh" target="_blank" title="새창열림" lang="ch">中文</a></li>
						</ul>
					</div>
					<!-- //202005 외국인서비스 추가 -->
			 		<ul class="left-element">
<script type="text/javascript">
function onepassLogin() {
    window.open("/nlogin/onepassLogin", "", "width=800, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=no");
}
</script>
			 			<li><a href="https://kids.gov.kr/?Mcode=10129" target="_blank" title="새창열림">어린이</a></li>
	                    <c:choose>
	                        <c:when test="${param.gnb eq 'mw24'}">
<%-- 	                        <c:when test="${1==1}"> --%>
		                        <!-- <li class="dnone"><a href="/main?a=AA041Request000IndexApp&amp;LANGUAGE=eng" target="_blank" title="새창열림" onclick="window.open(this.href, 'foreign', 'width=1020,height=650,scrollbars=1,left=0,top=0,toolbar=0,directories=0,status=0,menubar=0,resizable=1');return false;">민원서비스 FOREIGNER</a></li> -->
		                        <%-- <li class="dnone"><a href="/etc/AA090_g4c_admin.jsp">e하나로민원</a></li> --%>
		                        <!-- digital onepass login 확인
		                        <c:if test="${empty onepass_id}">
		                            <li><a href="javascript:onepassLogin();"  title="로그인창연동">DigitalOnePass</a></li>
		                        </c:if>
		                        -->
	                       		<c:if test="${not empty onepass_id}">
<%-- 								<c:if test="${1==1}"> --%>
									<link href="/common/digitalOnepass/css/one_popup_style.css" rel="stylesheet" type="text/css" />
				                    <li class=" topMenu">
				                        <a class="service_more"  href="javascript:showhide();" >
				                            DigitalOnePass
				                            <div class="service_box"  id="service_box" style="z-index:99999;" style="display:none;" >
				                                <div class="bullet"><img src="/common/digitalOnepass/images/bullet.png" /></div>
				                                <div class="service_box01">
				                                    <div class="s-box pa_12 m_b10">
				                                        <div class="txt c-red pa_b10">서비스</div>
				                                        <div class="pa_b10"  id="uses-service"></div>
				                                    </div>
				                                    <div class="bl">
				                                        <p class="line_a"></p>
				                                    </div>
				                                    <div class="s-box pa_12 m_b10">
				                                        <div class="txt c-red pa_b10">미가입 서비스</div>
				                                        <div class="pa_b10"  id="not-uses-service"></div>
				                                    </div>
				                        <div class="service_btn">
				                            <button onclick="onClickLogout()" class="btn join_btn_pinkred">로그아웃</button>
				                        </div>
				                                </div>
				                            </div>
				                        </a>
				                    </li>
					                <script type="text/javascript" src="/common/digitalOnepass/js/rsa/jquery-1.12.4.js"></script>
					                <script type="text/javascript" src="/common/digitalOnepass/js/puremvc/puremvc-1.0.1.min.js"></script>
					                <script type="text/javascript" src="/common/digitalOnepass/js/onepass-popup.js"></script>

					                <script type="text/javascript">

					                function showhide() {  // 플래시 또는 html에서 오브젝트id값에 의한 호출
					                    var seogd = document.getElementById('service_box');  // 호출된 id값을 seogd 변수로 치환
					                       if ( seogd.style.display != 'none' ) { // 만약 seogd가 none이 아니면 즉, 보여지는 상태이면
					                           seogd.style.display = 'none';   // seogd를 숨기고
					                       } else {
					                      seogd.style.display = ''; // seogd이 숨김 상태이면 나타내라
					                     }
					               }
					                    function onClickLogout() {
					                        window.open("/nlogin/logout_main", "", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=no" );
					                    }


					                    <%
					                    int chkVal = 0 ;
					                        if("" == session.getAttribute("onepass_id")){
					                            chkVal = 1 ;
					                        }else if(null == session.getAttribute("onepass_id") ){
					                            chkVal = 2 ;
					                        }else if("null" == session.getAttribute("onepass_id")){
					                            chkVal = 3 ;
					                        }else{
					                            chkVal = 4 ;
					                        }

					                        if(chkVal > 3){

					                            String onepass_id = "";
					                            onepass_id = String.valueOf(session.getAttribute("onepass_id"));
					                        %>
					                        popup.startup('<%= onepass_id %>');

					                        $("#service_box").hide();
					                    <%    }%>
					                </script>
		                        </c:if>
	                        	<!-- digital onepass login 끝 -->
	                        </c:when>
	                        <c:otherwise>
								<!-- <li><a href="http://life.gov.kr/?Mcode=10128" target="_blank" title="새창열림">생활플러스</a></li> -->
		                        <!-- <li><a href="http://kids.gov.kr/?Mcode=10129" target="_blank" title="새창열림">어린이</a></li> -->
		                        <!-- digital onepass login 확인
		                        <c:if test="${empty onepass_id}">
		                            <li><a href="javascript:onepassLogin();"  title="로그인창연동">DigitalOnePass</a></li>
		                        </c:if>
		                        -->
	                        	<c:if test="${not empty onepass_id}">
<%-- 	                        	<c:if test="${1==1}">   --%>
									<link href="/common/digitalOnepass/css/one_popup_style.css" rel="stylesheet" type="text/css" />
				                    <li class=" topMenu">
				                        <a class="service_more"  href="javascript:showhide();" >
				                            DigitalOnePass
				                            <div class="service_box"  id="service_box" style="z-index:99999;"  style="display:none;">
				                                <div class="bullet"><img src="/common/digitalOnepass/images/bullet.png" /></div>
				                                <div class="service_box01">
				                                    <div class="s-box pa_12 m_b10">
				                                        <div class="txt c-red pa_b10">서비스</div>
				                                        <div class="pa_b10"  id="uses-service"></div>
				                                    </div>
				                                    <div class="bl">
				                                        <p class="line_a"></p>
				                                    </div>
				                                    <div class="s-box pa_12 m_b10">
				                                        <div class="txt c-red pa_b10">미가입 서비스</div>
				                                        <div class="pa_b10"  id="not-uses-service"></div>
				                                    </div>
							                        <div class="service_btn">
							                            <button onclick="onClickLogout()" class="btn join_btn_pinkred">로그아웃</button>
							                        </div>
				                                </div>
				                            </div>
				                        </a>
				                    </li>
					                <script type="text/javascript" src="/common/digitalOnepass/js/rsa/jquery-1.12.4.js"></script>
					                <script type="text/javascript" src="/common/digitalOnepass/js/puremvc/puremvc-1.0.1.min.js"></script>
					                <script type="text/javascript" src="/common/digitalOnepass/js/onepass-popup.js"></script>

					                <script type="text/javascript">

					                function showhide() {  // 플래시 또는 html에서 오브젝트id값에 의한 호출
					                    var seogd = document.getElementById('service_box');  // 호출된 id값을 seogd 변수로 치환
					                       if ( seogd.style.display != 'none' ) { // 만약 seogd가 none이 아니면 즉, 보여지는 상태이면
					                           seogd.style.display = 'none';   // seogd를 숨기고
					                       } else {
					                      seogd.style.display = ''; // seogd이 숨김 상태이면 나타내라
					                     }
					                }
				                    function onClickLogout() {
				                        window.open("/nlogin/logout_main", "", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=no" );
				                    }

				                    <%
				                    int chkVal = 0 ;
			                        if("" == session.getAttribute("onepass_id")){
			                            chkVal = 1 ;
			                        }else if(null == session.getAttribute("onepass_id") ){
			                            chkVal = 2 ;
			                        }else if("null" == session.getAttribute("onepass_id")){
			                            chkVal = 3 ;
			                        }else{
			                            chkVal = 4 ;
			                        }

			                        if(chkVal > 3){

			                            String onepass_id = "";
			                            onepass_id = String.valueOf(session.getAttribute("onepass_id"));
			                        %>
			                        popup.startup('<%= onepass_id %>');

			                        $("#service_box").hide();

				                 <%}%>
				                </script>
	                        </c:if>
	                        <!-- digital onepass login 끝 -->
	                     </c:otherwise>
                    </c:choose>

			 		</ul>
			 		<ul class="right-element">
						<c:if test="${not empty user}">
							<li><a href="javascript:checkUserImsi();">My GOV</a></li>
							<li><a href="/nlogin/logout?Mcode=10011">로그아웃</a></li>
						</c:if>
						<c:if test="${empty user}">
		                	<c:if test="${not empty user_imsi or not empty user_jumin}">
		                	<!-- 비회원 my gov 추가 -->
			                	<c:set var="hrefMyResultsPageUrl" value="/mw/AA040MyResultsList.do"/>
			                	<c:if test="${appYn eq 'Y' or mobileYn eq 'Y' }">
									<c:set var="hrefMyResultsPageUrl" value="/main?a=AA040MyResultsListApp"/>
								</c:if>
							  <li><a href="${hrefMyResultsPageUrl }">My GOV</a></li>
							  <li><a href="/nlogin/logout?Mcode=10011">비회원종료</a></li>
							</c:if>
<!--                        <li><a href="/nlogin/loginOnepassChannel?serviceType=LOGIN">디지털원패스</a></li> -->
			 				<li><a href="/nlogin?Mcode=10003">로그인</a></li>
							<li><a href="/nlogin/usr?Mcode=10004">회원가입</a></li>
			 			</c:if>
			 			<li><a href="/portal/govSumry?Mcode=11005">정부24소개</a></li>
<%-- 			 			<c:if test="${mobileYn ne 'Y'}" > --%>
<!-- 			 			<li><a href="/etc/AA090_g4c_admin.jsp?Mcode=12000">e하나로민원</a></li> -->
<%-- 			 			</c:if> --%>
<%-- 202005 외국인서비스 추가	<li><a href="/portal/forForeignerGuidance?Mcode=11273">For Foreigners</a></li> --%>
			 			<li><a href="/portal/siteMap?Mcode=11274">사이트맵</a></li>
			 			<!-- 05-16 추가 -->
			 			<li>
			 				<span>화면크기</span>
			 				<span class="zoom-element">
			 					<span class="zoom-btn out"><a href="#" onClick="javascript:zoomControl.zoomOut()"><span class="hd-element">화면축소</span></a></span><span class="zoom-text"><a href="#" title="화면확대축소 초기화" onClick="javascript:zoomControl.zoomReset()">100%</a></span><span class="zoom-btn in"><a href="#" onClick="javascript:zoomControl.zoomIn()"><span class="hd-element">화면확대</span></a></span><!-- 접근성 -->
			 				</span>
			 			</li><!--// 05-16 추가 -->
			 		</ul>
			 	</div>
			 </div>
			 <div class="body-area">
			 	<div class="gnb-element">
			 		<div class="btn-menu-all"><a href="#" role="button"><span>전체메뉴</span></a></div><!-- responsive -->
			 		<h1 class="logo-area"><a href="/portal/main"><img src="/2019/lib/image/img-gov-logo.png" alt="정부24"></a></h1>
			 		<!-- mobile search -->
			 		<div class="mobile-other-element">
						<ul>
<%-- 202004 상단메뉴영역변경작업(검색포함) --%>
<c:choose>
	<c:when test="${not empty param.gnb && param.gnb eq 'newMain'}">
		<c:if test="${appYn eq 'Y'}">
							<li class="top-qrcode"><a href="javascript:callNativeQr();" role="button"><span>QR코드</span></a></li>
		</c:if>
	</c:when>
	<c:otherwise>
							<li class="top-search"><a href="#" role="button"><span>검색</span></a></li>
	</c:otherwise>
</c:choose>
	                        <li class="top-mygov"><a href="javascript:checkUserImsi();" role="button"><span>My Gov</span></a></li>
						</ul>
			 		</div>
			 		<!--// -->
			 		<!-- gnb -->
			 		<div class="gnb-mobile-element"><!-- responsive -->
			 			<div class="gnb-header">
		                        <c:if test="${not empty user && user.USER_ID != null}">
		                            <a href="/nlogin/logout?Mcode=10011" class="gnb-btn-login logout"><span class="login-text">로그아웃</span></a>
		                        </c:if>
		                        <c:if test="${not empty user && user.USER_ID == null}">
		                            <a href="/nlogin/?Mcode=10003" class="gnb-btn-login login"><span class="login-text">로그인</span></a>
		                            <a href="/nlogin/usr?Mcode=10004" class="gnb-btn-login join"><span class="login-text">회원가입</span></a>
		                        </c:if>
		                        <c:if test="${empty user}">
		                           <c:if test="${not empty user_imsi}">
		                            <a href="/nlogin/logout?Mcode=10011" class="gnb-btn-login logout"><span class="login-text">로그아웃</span></a>
		                           </c:if>
		                           <c:if test="${empty user_imsi}">
		                           <a href="/nlogin/?Mcode=10003" class="gnb-btn-login login"><span class="login-text">로그인</span></a>
		                           <a href="/nlogin/usr?Mcode=10004" class="gnb-btn-login join"><span class="login-text">회원가입</span></a>
		                           </c:if>
		                        </c:if>
<%
  		String pushAlramCnt = "";
  		HttpSession httpsession = request.getSession(false);
  		if( session != null ) {
  			pushAlramCnt = (String)httpsession.getAttribute("sessPushAlramCnt");
  		}
%>
							<c:if test="${mobileYn eq 'Y'}" ><!-- 알리미 열때 Z > Y 로 변경할 것 -->
                                <c:if test="${not empty user && user.USER_ID != null}">
                                	<%if( pushAlramCnt != null && !"".equals(pushAlramCnt) && !"0".equals(pushAlramCnt)) { %>
 										<a href="/portal/pushReceive?userId=<c:out value='${user.USER_ID}'/>" class="alarm-push new"><span class="hd-element"><%=pushAlramCnt%></span></a>
									<%}else {%>
  										<a href="/portal/pushReceive?userId=<c:out value='${user.USER_ID}'/>" class="alarm-push"><span class="hd-element">종</span></a>
									<%}%>
                                </c:if>
                            </c:if>
							<a href="#" class="btn-menu-all-close"><span class="hd-element">메뉴닫기</span></a>
						</div>
				 		<ul class="gnb-area" id="gnb"><!-- 04-30 -->
				 			<li>
				 				<a href="#">
				 					서비스<span></span>
				 				</a>
				 				<div class="depth-2 pos1">
				 					<div class="gnb-visual gv-1">
					 					<span class="title">서비스</span>
					 				</div>
					 				<div class="gnb-menu">
										<ul class="has-gnb-other">
											<li>
												<a href="#" class="gnb-other">신청/확인/공유<span>하위메뉴열기</span></a>
												<ul class="depth-3">
													<li><a href="/search/applyMw?Mcode=11166">신청·조회·발급</a></li>
													<li><a href="/mw/AA210LifeSvcInfo.do?Mcode=11195">나의 생활정보</a></li>
													<li><a href="/mw/EgovPageLink.do?link=confirm/AA040_confirm_index&Mcode=11167">사실/진위확인</a></li>
													<li><a href="/portal/service/publicResrceOpn?Mcode=11168">공공자원 공유</a></li>
													<c:if test="${mobileYn ne 'Y'}">
													<li><a href="/etc/AA090_g4c_admin.jsp?Mcode=12000">행정정보공동이용<br>(e하나로민원)</a></li>
													<%-- <li><a href="/portal/mydata/myDataIntroduction?Mcode=11195">마이데이터<br><em class="point_txt" style="font-size: 14px;">'21년 서비스 예정</em></a></li> --%>
													</c:if>
												</ul>
											</li>
											<li>
												<a href="#" class="gnb-other">찾기/안내<span>하위메뉴열기</span></a>
												<ul class="depth-3">
<!-- 202006 원스톱/생애주기/꾸러미 서비스 메뉴명 링크 변경 -->	<li><a href="/portal/fertility.do?Mcode=11169">원스톱/생애주기/꾸러미 서비스</a></li>
													<li><a href="/portal/service/clmser?Mcode=11170">연령/대상별 서비스</a></li>
													<li><a href="/search/svcmidMw?Mcode=11171">분야별 서비스</a></li>
<%-- 202004 상단메뉴영역변경작업(검색포함)					<li><a href="/new_info/customer/keywordThemaSvc.jsp?Mcode=11172">키워드로 보는 서비스</a></li> --%>
													<li><a href="/search/svcmidCor?Mcode=11173">기업단체 서비스</a></li>
<!-- 202005 외국인서비스 추가 -->							<li><a href="/portal/foreigner" target="_blank" title="새창열림">외국인 서비스</a></li>
<!-- 202005 위치찾기서비스 명칭 수정 -->					<li><a href="/portal/mapGis" target="_blank" title="새창열림">돌봄시설 등 위치 찾기</a></li>
													<li><a href="/portal/coronaPolicy/list?Mcode=11193">코로나19 정부지원</a></li>
												</ul>
											</li>
<%-- 										<c:if test="${mobileYn ne 'Y'}" > --%>
<!-- 											<li> -->
<!-- 												<a href="#" class="gnb-other">e하나로민원<span>하위메뉴닫기</span></a> -->
<!-- 												<ul class="depth-3"> -->
<!-- 													<li><a href="/etc/AA090_pkg_srch_refund.jsp?Mcode=12001">미환급금 찾기</a></li> -->
<!-- 													<li><a href="/main?a=AA240ServiceInfoListApp&mode=Y&Mcode=12002">사전동의 공동이용 업무</a></li> -->
<!-- 													<li><a href="/etc/AA240_insert_resultInfo.jsp?Mcode=12003">공동이용사전동의 신청</a></li> -->
<!-- 													<li><a href="/etc/AA240_readingCharge.jsp?Mcode=12004">열람청구신청</a></li> -->
<!-- 													<li><a href="/mypage/AA040_address_chargeInfo.jsp?Mcode=12005">주소변경알리미</a></li> -->
<!-- 													<li><a href="/mypage/AA050_rrn_chargeInfo.jsp?Mcode=12006">주민번호/성명변경알리미</a></li> -->
<!-- 												</ul> -->
<!-- 											</li>											 -->
<%-- 										</c:if> --%>
										</ul>
					 				</div>
				 				</div>
				 			</li>

							<li class="etc-menu">
								<a href="/portal/rcvfvrSvc/main">보조금24 <strong class="lb_new">N</strong> <span></span> </a>
							</li>

				 			<li>
				 				<a href="#">
				 					정책정보<span></span>
				 				</a>
				 				<div class="depth-2 pos2">
				 					<div class="gnb-visual gv-2">
					 					<span class="title">정책정보</span>
					 				</div>
					 				<div class="gnb-menu">
					 					<ul>
						 					<li><a href="/portal/gvrnPolicy/listAll?Mcode=11175">분야별 정책정보</a></li>
						 					<li><a href="/portal/gvrnPolicy?policyType=G00301&Mcode=11143">정책뉴스</a></li>
						 					<li><a href="/portal/gvrnPolicy?policyType=G00302&Mcode=11147">연구보고서</a></li>
						 					<li><a href="/portal/gvrnPolicy?policyType=G00303&Mcode=11145">간행물</a></li>
						 					<li><a href="/portal/gvrnPolicy?policyType=G00304&Mcode=11159">정책자료</a></li>
						 				</ul>
					 				</div>
				 				</div>
				 			</li>
				 			<li>
				 				<a href="#">
				 					기관정보<span></span>
				 				</a>
				 				<div class="depth-2 pos3">
				 					<div class="gnb-visual gv-3">
					 					<span class="title">기관정보</span>
					 				</div>
					 				<div class="gnb-menu">
					 					<ul>
						 					<li><a href="/portal/orgInfo?Mcode=11180">정부/지자체 조직도</a></li>
						 					<li><a href="/portal/orgSite?Mcode=11181">정부/지자체 운영사이트</a></li>
						 					<li><a href="/portal/admstinstCmt?Mcode=11191">행정기관위원회</a></li>
						 					<li><a href="/portal/locgovNews?Mcode=11182">지자체소식</a></li>
						 					<!-- 코로나19 -->
						 					<!-- <li><a href="/portal/vfnews?Mcode=11183">지자체 축제/행사</a></li> -->
						 					<li><a href="/portal/cnstexhb?Mcode=11184">공모전</a></li>
						 				</ul>
					 				</div>
				 				</div>
				 			</li>
				 			<li>
				 				<a href="#">
				 					고객센터<span></span>
				 				</a>
				 				<div class="depth-2 pos4">
				 					<div class="gnb-visual gv-4">
					 					<span class="title">고객센터</span>
					 				</div>
					 				<div class="gnb-menu">
					 					<ul>
                                   <c:choose>
                                       <c:when test="${mobileYn eq 'Y'}" >
    						 				<li><a href="/new_info/customer/AA090_info_customer_govGuide_mobile.jsp">정부24 이용방법</a></li>
                                       </c:when>
                                       <c:otherwise>
    						 				<li class="pc-menu-block"><a href="/new_info/customer/AA090_info_customer_govGuide_1.jsp?Mcode=11185">정부24 이용방법</a></li>
                                       </c:otherwise>
                                   </c:choose>
						 					<li><a href="/portal/ntcItm?Mcode=11186">공지사항</a></li>
						 					<c:if test="${mobileYn ne 'Y'}" >
						 						<li><a href="/main?a=AA100DataDownListAppNew&Mcode=11187">자료실</a></li>
						 					</c:if>
											<li>
												<a href="/mw/new_info/customer/AA090_info_customer_printer_list.jsp?Mcode=11188">서비스지원<span>하위메뉴열기</span></a>
												<ul class="depth-3 mobile-only">
													<li><a href="/mw/new_info/customer/AA090_info_customer_printer_list.jsp?Mcode=11006">프린터 이용 안내</a></li>
													<li><a href="/mw/new_info/customer/AA090_info_customer_elect.jsp?Mcode=11006">전자결제 안내</a></li>
													<li><a href="/mw/AA090NoManMinwonView.do?Mcode=11006">무인민원 발급 안내</a></li>
													<li><a href="/mw/AA020AnyInfoCappView.do">어디서나 민원</a></li>
												</ul>
											</li>
						 					<li><a href="/portal/faq?Mcode=11189">자주묻는질문(FAQ)</a></li>
											<li><a href="#" onclick="checkUserImp(); return false;">개선의견수렴</a></li>
						 					<li><a href="#" onclick="checkUserOnln(); return false;">온라인 상담예약</a></li>
						 				</ul>
					 				</div>
				 				</div>
				 			</li>
							<li class="mobile-menu">
								<a href="#">정부24 소개</a>
								<div class="depth-2 pos5">
									<div class="gnb-menu">
										<ul>
											<li>
												<a href="">정부24 개요<span>하위메뉴열기</span></a>
												<ul class="depth-3">
													<li><a href="/portal/govSumry">정부24 개요</a></li>
												</ul>
											</li>
											<li>
												<a href="">사이트 이용안내<span>하위메뉴열기</span></a>
												<ul class="depth-3">
													<li><a href="/portal/disable">장애인 이용 안내</a></li>
													<li><a href="/portal/privacy">개인정보 처리방침</a></li>
													<li><a href="/portal/cpyrhtPrtc">저작권 보호정책</a></li>
												</ul>
											</li>
											<c:if test="${mobileYn ne 'Y'}" >
												<li><a href="/portal/siteMap?Mcode=11274">사이트맵</a></li>
											</c:if>
										</ul>
									</div>

								</div>
							</li>
							<li class="mobile-menu">
								<a href="#">My Gov</a>
								<div class="depth-2 pos6">
									<div class="gnb-menu">
										<ul>
											<li>
												<a href="#">나의 서비스<span>하위메뉴열기</span></a>
												<ul class="depth-3">
<%-- 202004 상단메뉴영역변경작업(검색포함) : 모바일과 다른 부분 병합함. --%>
<c:set var="hrefMyResultsPageUrl" value="/mw/AA040MyResultsList.do"/>
<c:if test="${appYn eq 'Y' or mobileYn eq 'Y' }">
	<c:set var="hrefMyResultsPageUrl" value="/main?a=AA040MyResultsListApp"/>
</c:if>
													<li><a href="${hrefMyResultsPageUrl }">서비스 신청내역</a></li>
													<li><a href="/portal/onlnResveList">온라인 상담예약 내역</a></li>
													<li><a href="/portal/evntPartcptn">이벤트 참여</a></li>
													<li><a href="#" onclick="checkLvinfoAgree(); return flase;">나의 생활정보</a></li>   <!-- 2020.02.10 염희봉 2-3차 프레임워크 전환, 링크 수정 -->
													<li><a href="/mw/allDayCareApplyList.do">온종일 돌봄 신청내역</a></li>
												</ul>
											</li>
											<li>
												<a href="#">회원정보<span>하위메뉴열기</span></a>
												<ul class="depth-3">
													<li><a href="/nlogin/usr/mgrView">회원정보 관리</a></li>
													<li><a href="/nlogin/usr/leaveUsr">회원탈퇴</a></li>
													<li><a href="/nlogin/bioAuthMng">지문 및 간편비밀번호 등록/해지</a></li>
													<li><a href="/nlogin/certRegForm" <c:if test="${empty user or (not empty user_imsi or not empty user_jumin)}">onclick="javascript:alert('간편인증 또는 인증서(공동, 금융) 등록은 로그인 상태에서만 가능합니다.')"</c:if>>인증등록/관리</a></li>
													<c:if test="${mobileYn ne 'Y'}" >
														<li><a href="/nlogin/authIntro">복합인증 관리</a></li>
													</c:if>
<%-- 202004 상단메뉴영역변경작업(검색포함) : 모바일과 다른 부분 병합함. --%>
<c:if test="${mobileYn eq 'Y' && (user.USER_ID == 'lady7choi' || user.USER_ID == 'rojhw' || user.USER_ID == 'sslee4321' || user.USER_ID == 'coco201' || user.USER_ID =='viterman' )}" >
													<li><a href="/nlogin/bioAuthMngBio">지문 및 간편비밀번호 등록/해지(B)</a></li>
</c:if>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</li>
							<li class="mobile-menu">
								<a href="#none" class="img_box" onclick="javascript:fnHdElecAgreeAjax('main')"><img src="/2019/lib/image/main-mobile/mo_servicewallet.png" alt="전자문서지갑"></a>
<!-- 								<div class="depth-2 pos6"> -->
<!-- 									<div class="gnb-menu"> -->
<!-- 										<ul> -->
<!-- 											<li> -->
<!-- 												<a href="#">나의 전자문서지갑<span>하위메뉴열기</span></a> -->
<!-- 												<ul class="depth-3"> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('IssuList')">내증명서</a></li> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('PresentnList')">보낸내역</a></li> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('RtrvlTargetList')">보내기취소</a></li> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('StreList')">장바구니</a></li> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('ReceptList')">받은증명서</a></li> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('NtcnInfoList')">알림함</a></li> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('portalLoginPinNo')">포털로그인 비밀번호</a></li> -->
<!-- 												</ul> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="#">알림마당<span>하위메뉴열기</span></a> -->
<!-- 												<ul class="depth-3"> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('BbsNoticeList')">공지사항</a></li> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('BbsFaqList')">FAQ</a></li> -->
<!-- 												</ul> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="# ">전자문서지갑관리<span>하위메뉴열기</span></a> -->
<!-- 												<ul class="depth-3"> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('ecdwAdres')">나의지갑주소보기</a></li> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('Agre')">전자지갑생성</a></li> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('ecdwDetail')">전자지갑변경</a></li> -->
<!-- 													<li><a href="#none" onclick="javascript:fnHdElecAgreeAjax('secsnReqst')">전자지갑폐기</a></li> -->
<!-- 												</ul> -->
<!-- 											</li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<!-- 								</div> -->
							</li>
							<%-- <li class="mobile-menu">
								<a href="/portal/mydata/myDataIntroduction?Mcode=11258" class="img_box"><img src="/2019/lib/image/main-mobile/mo_mydata.png" alt="마이데이터"></a>
							</li> --%>
				 		</ul><!--// gnb -->
				 	</div>
				 	<!--// gnb -->
				 	<!-- search -->
				 	<!-- 202004 상단메뉴영역변경작업(검색포함) -->
				 	<c:if test="${param.gnb eq 'newMain'}">
				 		<div class="guide-element">
				 			<a href="/new_info/customer/AA090_info_customer_govGuide_1.jsp?MCode=11185"><span class="guide-bul"></span>처음오셨나요? <span class="guide-arrow"></span></a>
				 		</div>
			 		</c:if>
			 		<c:if test="${ empty param.gnb || param.gnb ne 'newMain'}">
			 			<div class="renew-search">
							<div class="keyword-group">
								<div class="keyword-search">
									<div class="form">
										<form id="headerSearchForm" name="headerSearchForm"  method="get">
											<fieldset>
												<legend>검색</legend>
												<div class="search">
													<input type="text" name="srhQuery" id="srhQueryForHeader" title="검색어 입력" placeholder="" onKeyPress="if(event.keyCode==13){moreViewSearch('${mobileYn}'); return false;}">
													<input type="hidden" name="Mcode" value="10021"/>
								 					<button type="submit" id="focusout" onclick="moreViewSearch('${mobileYn}'); return false;"><span>검색</span></button>
												</div>
											</fieldset>
										</form>
										<div class="keyword-layer">
											<div class="keyword-layer-inner">
												<div class="direct-service">
													<p>서비스 바로가기</p>
													<ul id="ark_apply"></ul>
												</div>
												<ul class="keyword-auto" id="ark_main"></ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
			 		</c:if>
			 		<!--// 202004 상단메뉴영역변경작업(검색포함) -->
			 		<!--// search -->
			 	</div>
			 </div>
		</div><!--// header -->
	</div>

<script type="text/javascript">
//<![CDATA[
$(document).ready(function() {
    var str = $.cookie("initMainCookie");
    if(!str == "") {
        $("input[value='" + str + "']").click();
    } else {
        $("#set-basic").click();
    }

    $(".keyword-list-area .keyword-item").on('click',function(){

    	var index = $("a").index(this);
    	var strWord = $("a:eq(" + index + ")").text();


    	strWord = strWord.replace("#","");
    	$("#headerSearchForm1 [id='srhQueryForHeader1']").val(strWord);
    	//favSearchWordHeader('${mobileYn}',strWord);
    	moreViewSearch1('${mobileYn}');

    });

<c:if test="${empty param.gnb || param.gnb ne 'newMain'}">
<!-- 202004 as-is 헤더 자동완성(와이즈넛) -->
/*     akcInitHeader('${mobileYn}');

	$('#headerSearchForm [id="srhQuery"]').on('click focus', function() {
	    var $autoSt = $('.autocomplete');
	    $('.autocomplete').addClass('open');
	    tglAkcVsbHeader(true);
	});

	$('#headerSearchForm [id="search_btn"]').on('focus', function() {
	    $('.autocomplete').removeClass('open');
	});


	$('#headerSearchForm .search-area').on('mouseleave', function() {
	    $('.autocomplete').removeClass('open');
	    tglAkcVsbHeader(false);
	});

	$('#headerSearchForm .input-wrap').on('mouseleave', function() {
	    $('.autocomplete').removeClass('open');
	    tglAkcVsbHeader(false);
	});	 */
<!--// 202004 as-is 헤더 자동완성(와이즈넛) -->
</c:if>

	<!-- 202004 자동완성 호출(와이즈넛) -->
		callArk("main");   //헤더 자동완성 호출
	<!--// 202004 자동완성 호출(와이즈넛) -->
});

//초기 메인 화면 설정
function setInitMainCookie() {
    $.cookie("initMainCookie", $("input[name=initsetting]:radio:checked").val(), { path: '/', expires: 365 });
    alert("시스템 초기화면 설정이 완료되었습니다.");
}

var isMobile = "<c:out value='${mobileYn}'/>";
var isApp = "<c:out value='${appYn}'/>";

// 사용자 생활정보 동의 여부 체크
function checkLvinfoAgree() {
    var loginType = '<c:out value="${user.LOGIN_TYPE}" />';
    var lvinfoAgree = '<c:out value="${user.LVINFO_AGREE_YN}" />';

    if(loginType == "multipleAuthLogin" || loginType == "certiLogin") {
        if(lvinfoAgree == "Y") {
            location.href = "/mw/AA210LifeMySvcMy.do"; //나의 생활정보 목록  2020.02.10 염희봉 2-3차 프레임워크 전환, 링크 수정
        } else {
            if(confirm("생활정보서비스 대상자가 아닙니다.\n생활정보 서비스를 이용하시겠습니까?")) {
                var returnUrl = encodeURI("/nlogin/usr/addInfo");
                location.href = "/mw/AA210LifeSvcAddInfo.do?returnUrl=" + returnUrl;  //추가정보 수정 페이지  2020.02.10 염희봉 2-3차 프레임워크 전환, 링크 수정
            }
        }
    } else if(loginType == "generalLogin") {
        if(lvinfoAgree == "Y") {
            if(confirm("간편인증 또는 인증서(공동, 금융) 로그인을 해야 이용할 수 있는 기능입니다.\n로그인페이지로 이동하시겠습니까?")) {
                //location.href = "/nlogin?curr_url=/mw/AA210LifeMySvcMy.do";  //로그인 페이지
                location.href = "/nlogin";  //로그인 페이지
            }
        } else {
            if(confirm("생활정보서비스 대상자가 아닙니다.\n생활정보 서비스를 이용하시겠습니까?")) {
                var returnUrl = encodeURI("/nlogin/usr/addInfo");
                location.href = "/mw/AA210LifeSvcAddInfo.do?returnUrl=" + returnUrl;  //추가정보 수정 페이지  2020.02.10 염희봉 2-3차 프레임워크 전환, 링크 수정
            }
        }
    }
    	else{
    		if(confirm("간편인증 또는 인증서(공동, 금융) 로그인을 해야 이용할 수 있는 기능입니다.\n로그인페이지로 이동하시겠습니까?")) {
	    		//location.href = "/nlogin?curr_url=/mw/AA210LifeMySvcMy.do";
	    		location.href = "/nlogin";
    		}
    }
}
  
//사용자 생활정보 동의 여부 체크, 로그인하지 않았을때 로그인 페이지로 바로 이동
function checkLvinfoAgree2() {
    var loginType = '<c:out value="${user.LOGIN_TYPE}" />';
    var lvinfoAgree = '<c:out value="${user.LVINFO_AGREE_YN}" />';

    if(loginType == "multipleAuthLogin" || loginType == "certiLogin") {
        if(lvinfoAgree == "Y") {
            location.href = "/mw/AA210LifeMySvcMy.do"; //나의 생활정보 목록   2020.02.10 염희봉 2-3차 프레임워크 전환, 링크 수정
        } else {
            if(confirm("생활정보서비스 대상자가 아닙니다.\n생활정보 서비스를 이용하시겠습니까?")) {
                var returnUrl = encodeURI("/nlogin/usr/addInfo");
                location.href = "/mw/AA210LifeSvcAddInfo.do?returnUrl=" + returnUrl;  //추가정보 수정 페이지  2020.02.10 염희봉 2-3차 프레임워크 전환, 링크 수정
            }
        }
    } else if(loginType == "generalLogin") {
        if(lvinfoAgree == "Y") {
            if(confirm("간편인증 또는 인증서(공동, 금융) 로그인을 해야 이용할 수 있는 기능입니다.\n로그인페이지로 이동하시겠습니까?")) {
                location.href = "/nlogin";  //로그인 페이지
            }
        } else {
            if(confirm("생활정보서비스 대상자가 아닙니다.\n생활정보 서비스를 이용하시겠습니까?")) {
                var returnUrl = encodeURI("/nlogin/usr/addInfo");
                location.href = "/mw/AA210LifeSvcAddInfo.do?returnUrl=" + returnUrl;  //추가정보 수정 페이지  2020.02.10 염희봉 2-3차 프레임워크 전환, 링크 수정
            }
        }
    }
    	else{
        location.href = "/nlogin";  //로그인 페이지
    }
}



//비회원 로그인 사용자 MyGov 접근 시, 민원신청내역으로 이동
function checkUserImsi() {
    var userImsi = "${not empty user_imsi}";
    var	gnb = "${param.gnb}";

    if(userImsi != "true") {
    	if(gnb == "newMain"){			//202004 상단메뉴영역변경작업(검색포함) main->newMain
        	location.href = "/portal/myPublicPlner?Mcode=11009";
    	} else{
        	location.href = "/portal/myPublicPlner";
    	}
    } else {
        if(confirm("비회원로그인 사용자는 이용할 수 없습니다. 민원신청내역을 이용하시겠습니까?")) {
        	if(gnb == "newMain"){   	//202004 상단메뉴영역변경작업(검색포함) main->newMain
        		var searchForQmark = '${hrefMyResultsPageUrl}';
        		if(searchForQmark.indexOf('?') > -1){
        			location.href = "${hrefMyResultsPageUrl}&Mcode=11009";
        		} else {
        			location.href = "${hrefMyResultsPageUrl}?Mcode=11009";
        		}
        	} else{
            	location.href = "${hrefMyResultsPageUrl}";
        	}
    	}
	}
}

<%-- 202004 상단메뉴영역변경작업(검색포함) : 반응형 변경작업으로 변경추가함. --%>
//음성검색 실행
var setSttVal = "";
function callNativeStt(inputId, val) {      // inputId: 음성인식 버튼이 눌린 input의 고유값
	setSttVal = val;
	//console.log("setSttVal : " + setSttVal);

	if (typeof(window.NativeBridge) === 'undefined') {
	  location.href = 'ios://callNativeStt?inputId='+inputId;    // call iOS
	} else {
	  window.NativeBridge.callNativeStt(inputId);    // call Android
	}
}

//음성검색 리턴
function setInputText(inputId, value) {         // inputId: 음성인식 버튼이 눌린 input의 고유값
	if (setSttVal == "1") {
		$("#headerSearchForm1 input[name=srhQuery]").val(value);
		moreViewSearch1('${mobileYn}');
	} else {
		$("#headerSearchForm input[name=srhQuery]").val(value);
		moreViewSearch('${mobileYn}');
	}
}

//앱함수  call - 알람종 푸쉬관련
function setFcmToken(userId) {
	if (typeof(window.NativeBridge) === 'undefined') {
		//푸시장애 확인을 위한 딜레이
		setTimeout(function () {
	  		location.href = 'ios://setFcmToken?userId='+userId;   // call iOS
		}, 500);
	} else {
	//alert(userId);
		setTimeout(function () {
	  		window.NativeBridge.setFcmToken(userId);    			// call Android
		}, 500);
	}
}
//앱에서 처리결과를 받기 위한 함수
function setFcmTokenResult(retCd) {  //retCd : boolean
//alert(retCd);
	if( retCd ) {
		//$.cookie("saveFcmTokenYn", "true", { path: "/", expires: 1 });  1일후에 삭제
		$.cookie("saveFcmTokenYn", "true", { path: "/"});  //웹브라우저 닫으면 삭제
	}
}

<c:if test="${param.gnb eq 'newMain'}">
function fpConfPwdPopForQr(procType, userId, loginGb, keyStr) {
	if(userId == null || userId =="") {
		alert("사용자 정보가 없습니다.");
		return;
	}
	var url = "/nlogin/fpConfPwdPop?procType="+ procType + "&userId=" + userId + "&loginGb=" + loginGb + "&keyStr=" + keyStr;
	location.href = url;
}
//QR코드 cleck 시 아래 함수 호출
function callNativeQr(){
    if (typeof(window.NativeBridge) === 'undefined') {
      location.href = 'ios://callNativeQr';    // call iOS
    } else {
      window.NativeBridge.callNativeQr();    // call Android
    }
}
</c:if>
<%--// 202004 상단메뉴영역변경작업(검색포함) : 반응형 변경작업으로 변경추가함. --%>

//개선의견수렴 메뉴 클릭 시, 로그인하지 않았거나 비회원일 경우 로그인 페이지로 이동
function checkUserImp() {
    var loginType = '<c:out value="${user.LOGIN_TYPE}" />';
    var userImsi = "${not empty user_imsi}";
    
    if(loginType == "generalLogin" || loginType == "multipleAuthLogin" || loginType == "certiLogin") {
    	location.href ="/portal/mrfnOpinionClct/imprvm?Mcode=11190";
    } else if(userImsi == "true"){
    	if(confirm("개선의견수렴은 회원로그인을 해야 이용하실 수 있습니다.\n로그인 페이지로 이동하시겠습니까?")){
           	location.href = "/nlogin?curr_url=/portal/mrfnOpinionClct/imprvm";
    	}
	} else{
		if(confirm("개선의견수렴은 회원로그인을 해야 이용하실 수 있습니다.\n로그인 페이지로 이동하시겠습니까?")){
			location.href = "/nlogin?curr_url=/portal/mrfnOpinionClct/imprvm";
		}
	}
}

//온라인 상담예약 메뉴 클릭 시, 로그인하지 않았거나 비회원일 경우 로그인 페이지로 이동
function checkUserOnln() {
    var loginType = '<c:out value="${user.LOGIN_TYPE}" />';
    var userImsi = "${not empty user_imsi}";
    
    if(loginType == "generalLogin" || loginType == "multipleAuthLogin" || loginType == "certiLogin") {
    	location.href ="/portal/onlnResve?Mcode=11192";
    } else if(userImsi == "true"){
    	if(confirm("온라인 상담예약은 회원로그인을 해야 이용하실 수 있습니다.\n로그인 페이지로 이동하시겠습니까?")){
           	location.href = "/nlogin?curr_url=/portal/onlnResve";
    	}
	} else{
		if(confirm("온라인 상담예약은 회원로그인을 해야 이용하실 수 있습니다.\n로그인 페이지로 이동하시겠습니까?")){
			location.href = "/nlogin?curr_url=/portal/onlnResve";
		}
	}
}
//]]>
</script>
<c:if test="${param.gnb eq 'newMain'}">
    <!-- QR인증 인증서 검증 폼 2018-04-20 -->
    <form id="frm_qrcert" name="frm_qrcert" action="/nlogin/qrByIdPwd" method="POST">
       <input type="hidden" name="a"  value ="/nlogin/qrByIdPwd"/>
       <input type="hidden" name="currUrl" value="/" />
       <input type="hidden" id="vidMsg" name="vidMsg" value="" />
       <input type="hidden" id="xml" name="xml" value="" />
       <input type='hidden' id="pkcs1Msg" name="pkcs1Msg" value="" />
       <input type="hidden" name="randomnum" value="" />
       <input type="hidden" name="loginType" value="certiLogin" />
       <input type="hidden" name="certiType" id="certiType" />
       <input type="hidden" name="certiType2" id="certiType2" />
       <input type="hidden" name="sessionId" value=""/>
       <input type="hidden" name="userId" value="" />
       <input type="hidden" id="isTouchYn" name="isTouchYn" />
    </form>
</c:if>
<!-- 전자지갑 추가 -->
<script type="text/javascript">
//<![CDATA[
	var appYn = "${appYn}";
	var mobileYn = "${mobileYn}";
	var androidYn = "${androidYn}";
	var iosYn = "${iosYn}";
	// 전자지갑 동의 여부
	function fnHdElecAgreeAjax(gubun) {
		var user = "${not empty user}"
		if(user == "true") {
			// 회원 로그인
			$.ajax({
				type : 'post',
		        url : '/main?a=AA040ElecWalletAjaxApp',
		        cache : false,
		        data : "type_code=Lnk&user_id=" + "${user.USER_ID}" + "&gubun=" + gubun,
		        async : false,
		        dataType : 'json',
		        success : function(result) {
		        	var elecWalletCd = result.elecWalletCd;
		        	var userId = result.userId;
		        	var msgCont = result.msgCont;
					if(!fnHdElecWalletCheck(elecWalletCd, userId, msgCont)) {
						return false;
					};
					eWalletLnk(gubun)
		        },
				complete: function() {
				},
		        error: function(request,status,error) {
		            // 에러코드
					alert("전자지갑 동의 여부 조회 중 에러가 발생하였습니다.");
					// input name, code 초기화
		            return false;
		        }
		    });
		} else {
			if(gubun == "BbsNoticeList" || gubun == "BbsFaqList") {
				eWalletLnk(gubun)
			} else {
				alert("로그인을 하셔야 합니다.");
<c:if test="${param.gnb eq 'newMain'}">
				// 202004 상단메뉴영역변경작업(검색포함) : 모바일과 다른 부분 병합함.
				location.href = '/nlogin/?Mcode=10003';
</c:if>
			}
		}
	}

	var tmpUserId = "";
	var iOsConfirmGbn = "";
	var iOsConfirmLnkGbn = "";
	// 행공 전자지갑 이동
	function eWalletLnk(gubun) {
		var deviceID;

		if (typeof(window.NativeBridge) === 'undefined') {
			iOsConfirmGbn = "D1";
			iOsConfirmLnkGbn = gubun;
			location.href = 'ios://getADID';	// call iOS
			return false;
		} else {
			deviceID = window.BrowserActivity.getADID();	// call Android
		}
		eWalletLnkExec(gubun, deviceID);
	}

	// 행공 전자문서지갑 이동 실행
	function eWalletLnkExec(gubun, deviceId) {
		$.ajax({
	        url : '/main?a=AA040ElecWalletGetLnkAjaxApp',
	        type : 'POST',
	        data : 'type_code=Lnk&gubun=' + gubun + '&device_id=' + deviceId,
	        dataType : 'json',
	        async : false,
	        success : function(result) {
	            var returnUrl = result.returnUrl;
	            setTimeout('location.href="' + returnUrl + '"', 500);
// 	            window.open(returnUrl);
	        },
	        error : function(request, status, error) {
	        }
		});

	}

	// 행공 전자지갑 체크
	//elecWalletCd - 00:신청가능, 01:동의안함, 02:CI 없음, 03:법인번호 없음, 04:지갑없음, 99:정부24 동의 실패
	function fnHdElecWalletCheck(elecWalletCd, userId, msgCont) {
		if("00" == elecWalletCd){
			//다음으로
			return true;
		}

		if("01" == elecWalletCd) {
			var eWltAgrNoti = "전자지갑 정보 제공에 동의 하시겠습니까? \n";
			eWltAgrNoti += " 1.개인정보를 제공 받는 자 : 전자증명서 발급·유통 센터 \n";
			eWltAgrNoti += " 2. 제공하는 개인정보의 항목  \n";
			eWltAgrNoti += "  - 개인회원 : 성명, 성별, 휴대전화번호, 광고식별자";

			// iOS confirm 버그로 인한 분기 추가
			if(iosYn == "Y"){
				// confirmIOS 호출
				iOsConfirmGbn = "M1";
				tmpUserId = userId;
				confirm(eWltAgrNoti+"native2");
			} else {
				if(confirm(eWltAgrNoti)) {
					// 동의 테이블 저장 후 다음으로
					fnHdElecTransAgreeAjax(userId);
				} else {
					// input name, code 초기화
					return false;
				}
			}
		}

		if("02" == elecWalletCd) {
			//CI 없음
			alert("휴대폰 인증이 되지 않은 회원 및 법인은 전자문서지갑이 발급되지 않습니다.");
			// input name, code 초기화
			return false;
		}

		if("03" == elecWalletCd) {
			//법인번호 없음
			alert("법인번호가 없습니다.");
			// input name, code 초기화
			return false;
		}

		if(elecWalletCd.search("04") > -1) {
			//지갑없음
			// iOS confirm 버그로 인한 분기 추가
			if(iosYn == "Y"){
				// confirmIOS 호출
				iOsConfirmGbn = "M4";
				tmpUserId = userId;
				confirm(msgCont+"native2");
			} else {
				if(mobileYn == "Y" && appYn == "Y") {
					if(confirm(msgCont)) {
						// PC/모바일 분기해서 모바일일때 링크 PC면 alert
						var deviceID;
						if(androidYn == "Y") {
					    	deviceID = window.BrowserActivity.getADID();
					    }
						fnHdElecWalletCreateAjax(deviceID, userId);
					} else {
						// input name, code 초기화
						return false;
					}
				} else {
					alert("전자문서지갑을 이용하지 않는 사용자입니다. 전자문서지갑을 먼저 발급 받으신 후 증명서를 신청 바랍니다.\n ※ 전자문서지갑은 PC가 아닌 모바일(정부24앱)에서만 발급 가능합니다.");
					alert("전자문서지갑을 이용하지 않는 사용자이므로, '온라인발급(본인출력)'으로 진행됩니다.");
					// input name, code 초기화
					return false;
				}
			}
		}

		if("99" == elecWalletCd) {
			//정부24 동의 실패
			alert("휴대폰 인증이 되지 않은 회원 및 법인은 전자문서지갑이 발급되지 않습니다.");
			// input name, code 초기화
			return false;
		}
	}

	// 아이폰 confirm 버그로 인한 function 추가2
	function confirmIOS2(result){
	    if(result){
	    	<%--
	    	M1:아이폰에서 정부24 3자제공동의 시,
	    	M4:아이폰에서 전자지갑 생성동의 시,
	    	D1:아이폰에서 전자지갑 생성관련 모바일식별자 얻기,
	    	--%>
	    	if(iOsConfirmGbn == "M1") {
		    	// 동의 테이블 저장 후 다음으로
		    	fnHdElecTransAgreeAjax(tmpUserId);
	    	} else if(iOsConfirmGbn == "M4") {
	    		location.href = 'ios://getADID';
	    	}
		} else {
			return false;
		}
	}

	// 행공 전자지갑 동의확인하기
	function fnHdElecTransAgreeAjax(user_id) {
		$.ajax({
			type : 'post',
			url : '/main?a=AA040ElecWalletAjaxApp',
			data : "type_code=Ist&user_id=" + user_id,
			cache : false,
			async : false,
			dataType : 'json',
			success : function(result) {
				var elecWalletCd = result.elecWalletCd;
				var userId = result.userId;
				var msgCont = result.msgCont;
				if(!fnHdElecWalletCheck(elecWalletCd, userId, msgCont)) {
					return false;
				};
			},
			complete: function() {
			},
			error: function(request,status,error) {
				// 에러코드
				alert("전자문서지갑 동의 여부 확인 중 에러가 발생하였습니다.");
				// input name, code 초기화
				return false;
			}
		});
	}

	// 행공 전자지갑 생성
	function fnHdElecWalletCreateAjax(deviceID, user_id) {
		$.ajax({
			type : 'post',
			url : '/main?a=AA040ElecWalletGetLnkAjaxApp',
			data : 'type_code=Lnk&gubun=Agre&user_id=' + user_id + '&device_id=' + deviceID,
			cache : false,
			async : false,
			dataType : 'json',
			success : function(result) {
				var returnUrl = result.returnUrl;
	            setTimeout('location.href="' + returnUrl + '"', 500);
// 				window.open(returnUrl);
			},
			complete: function() {
			},
			error: function(request,status,error) {
				// 에러코드
				alert("전자문서지갑 생성 중 에러가 발생하였습니다.");
				// input name, code 초기화
				return false;
			}
		});
	}

	var tmpDeviceID;
	// iOS 모바일식별자 얻기
	function idfaInfo(param) {
		tmpDeviceID = param;
		if(iOsConfirmGbn == "D1") {
			eWalletLnkExec(iOsConfirmLnkGbn, tmpDeviceID);
		}
		if(iOsConfirmGbn == "M4") {
			fnHdElecWalletCreateAjax(tmpDeviceID, tmpUserId);
		}
	}

    //xss 관련 문자 치환 검색엔진 등 페이지에서 사용중 제거시 영향도 파악 필요
    function specCharChk(strVal){
    	strVal = strVal.replace(/[\<\>\'\\\"\/\%\(\)\{\}\;\=]/g,"");
    	return strVal;
    }
//]]>

 // 20210430 퍼블
    $(document).ready(function() {
        $(".tbl-toggle tr.tr-visible").click(function(){
            $(this).next("tr").toggle();
            return false;
        });
    });
    // //20210430 퍼블
</script>

<script type="text/javascript" src="/common/js/mcodeCall.js"></script>

