<div class="breadclumbs-wrap">
    <div class="inner">
        <div class="breadclumbs">
            <ul class="bc-list">
            <c:if test="${param.gnb ne 'main'}">
                <li><a href="/portal/main">Home</a></li> 
            
                <c:if test="${param.gnb eq 'svc' || param.gnb eq 'mw24' || param.gnb eq 'eHanaro'|| param.gnb eq 'frqFindSvc'}">
                	<li><a href="/search/applyMw">서비스</a></li>
                	<c:if test="${param.snb eq 'applyMw' || param.snb eq 'index' || param.snb eq 'publicResrceOpn' || param.snb eq 'publicBcyclRent' || param.snb eq 'myLifeSvc'}">
                		<li><a href="/search/applyMw">신청/확인/공유</a></li>
                        <c:if test="${param.snb eq 'applyMw'}">
                            <li><a href="/search/applyMw">신청&middot;조회&middot;발급</a></li>
                        </c:if>
	                    <c:if test="${param.snb eq 'index'}">
	                        <li><a href="/mw/EgovPageLink.do?link=confirm/AA040_confirm_index">사실/진위확인</a></li>
	                    </c:if> 
	                    <c:if test="${param.snb eq 'publicResrceOpn' || param.snb eq 'publicBcyclRent'}">
	                          <li><a href="/portal/service/publicResrceOpn">공공자원 공유</a></li>
	                    </c:if>	  
                        <c:if test="${param.snb eq 'myLifeSvc'}">
                            <li><a href="/mw/AA210LifeSvcInfo.do">나의 생활정보</a></li>
                        </c:if>   	   	                    
						<%-- <c:if test="${param.snb eq 'publicBcyclRent'}">
	                          <li><a href="/portal/publicBcyclRent/publicBcyclRentInfo">지자체 공영자전거</a></li>
	                    </c:if> --%>	                                      
	                </c:if> 
                    <c:if test="${param.snb eq 'frqFindSvc'}">
	                          <li><a href="/portal/frqfindsvc">자주찾는 서비스</a></li>
	                  </c:if>	              	
                    <c:if test="${param.snb eq 'clmser' || param.snb eq 'recomendThema'|| param.snb eq 'category' || param.snb eq 'keysvc' || param.snb eq 'entrprs' 
                		|| param.snb eq 'cappMw' || param.snb eq 'coronaPolicy'}">
                    	<li><a href="/portal/service/clmser">찾기/안내</a></li>
                    	<c:if test="${param.snb eq 'clmser' }">
                        	<li><a href="/portal/service/clmser">연령/대상별 서비스</a></li>
						</c:if>
                    	<c:if test="${param.snb eq 'recomendThema'}">
<!-- 202006 원스톱/생애주기/꾸러미 서비스 메뉴명 링크 변경 -->
						<li><a href="/portal/fertility.do">원스톱/생애주기/꾸러미 서비스</a></li>
                        </c:if>
	                    <c:if test="${param.snb eq 'category' }">
	                        <li><a href="/portal/service/category">분야별 서비스</a></li>
	                    </c:if>                        
                        <c:if test="${param.snb eq 'keysvc'}">
                        	<li><a href="/new_info/customer/keywordThemaSvc.jsp">키워드로 보는 서비스</a></li>
                        </c:if>
	                    <c:if test="${param.snb eq 'entrprs'}">
	                         <li><a href="/search/svcmidCor">기업단체서비스</a></li>
	                    </c:if>

                        <c:if test="${param.snb eq 'cappMw'}">
                            <li><a href="/main?a=AA090CappBizSiteMapApp2">외국인  서비스</a></li>
                        </c:if>                          
                        <c:if test="${param.snb eq 'coronaPolicy'}">
                            <li><a href="/portal/coronaPolicy/list">코로나19 정부지원</a></li>
                        </c:if>                          
                    </c:if>                    

                    <c:if test="${param.snb eq 'svcInfo' && not empty param.snbTtl}">
                          <li><c:out value="${param.snbTtl}"/></li>
                    </c:if>

                    <c:if test="${param.snb eq 'anyMw' }">
                        <li><a href="/portal/ntcItm">고객센터</a></li>
                        <c:if test="${param.snb eq 'anyMw'}">
                            <li><a href="/mw/AA020AnyInfoCappView.do">어디서나 민원</a></li>
                        </c:if>
                    </c:if>
                    
                    <c:if test="${param.snb eq 'cnfirm' || param.snb eq 'ingam' || param.snb eq 'selfCnfirm' || param.snb eq 'resRegCnfirm'
                                 || param.snb eq 'resCnfirm' || param.snb eq 'userJuminCert' || param.snb eq 'jumincard' || param.snb eq 'household'
                                 || param.snb eq 'builder' || param.snb eq 'multi' || param.snb eq 'company' || param.snb eq 'icfrm' || param.snb eq 'children'}">
                                 
                        <li><a href="/search/applyMw">신청/확인/공유</a></li>
	                    <li><a href="/mw/EgovPageLink.do?link=confirm/AA040_confirm_index">사실/진위확인</a></li>
	                    <c:if test="${param.snb eq 'cnfirm'}">
	                        <li><a href="/confrm?a=AA040ConfirmIdApp">인터넷발급문서 진위확인</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'ingam'}">
	                        <li><a href="/ingam/ingam.jsp?img=031">인감증명발급 사실확인</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'selfCnfirm'}">
	                        <li><a href="/selfcnfirm/self_cnfirm.jsp">본인서명발급 사실확인</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'resRegCnfirm'}">
	                        <li><a href="/etc/AA090_resident_reg_truth_confirm.jsp">주민등록 등초본 발급 진위확인</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'resCnfirm'}">
	                        <li><a href="/etc/AA090_resident_confirm.jsp">주민등록 등초본 발급 내역확인</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'userJuminCert'}">
	                        <li><a href="/main?a=AA090UserJuminIsCertApp&amp;img=031">주민등록증 진위확인/잠김해제</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'jumincard'}">
	                        <li><a href="AA090_jumincard_issue_situation.jsp">주민등록증발급상황조회</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'household'}">
	                        <li><a href="/etc/AA040_multi_icfrm.jsp?gubun=household">세대주 확인</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'builder'}">
	                        <li><a href="/etc/AA040_multi_icfrm.jsp?gubun=builder">시공자 확인</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'multi'}">
	                        <li><a href="/etc/AA040_multi_icfrm.jsp?gubun=multi">양수인 확인</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'company'}">
	                        <li><a href="/etc/AA090_company_login.jsp?num=1">중점관리지정업체 확인</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'icfrm'}">
	                        <li><a href="/etc/AA040_multi_icfrm.jsp?gubun=elec">전자본인서명 확인·법정대리인동의</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'children'}">
	                        <li><a href="/etc/AA090_children_icfrm.jsp">자녀확인</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'happybirth'}">
	                        <li><a href="/mw/EgovPageLink.do?link=oneStop/AA090_happy_birth_proc">행복출산 통합신청상황 확인</a></li>
	                    </c:if>	     	                    
	                  </c:if>
					<c:if test="${param.snb eq 'refund' || param.snb eq 'g4cAdmin' || param.snb eq 'insertResultInfo' || param.snb eq 'redingCharge'|| param.snb eq 'resultInfoListY' || param.snb eq 'mydata'||param.snb eq 'myDataUsage'||param.snb eq 'basicInformationList'||param.snb eq 'myDataPakageList'}">
						<c:if test="${param.snb eq 'refund'}">
							<li><a href="/etc/AA090_pkg_srch_refund.jsp">미환급금 찾기</a></li>
						</c:if>
						<c:if test="${param.snb eq 'g4cAdmin'}">
							<li><a href="/etc/AA090_g4c_admin.jsp">행정정보공동이용 소개</a></li>
						</c:if>
						<c:if test="${param.snb eq 'mydata'}">
							<li><a href="/portal/mydata/myDataIntroduction">마이데이터란?</a></li><!-- 20201217 마이데이터 -->
						</c:if>
						<c:if test="${param.snb eq 'myDataUsage'}">
							<li><a href="/portal/mydata/myDataUsage">이용방법</a></li><!-- 20201217 마이데이터 -->
						</c:if>
						<c:if test="${param.snb eq 'basicInformationList'}">
							<li><a href="/portal/mydata/basicInformationList">기본정보목록</a></li><!-- 20201217 마이데이터 -->
						</c:if>
						<c:if test="${param.snb eq 'myDataPakageList'}">
							<li><a href="/portal/mydata/myDataPakageList">마이꾸러미목록</a></li><!-- 20201217 마이데이터 -->
						</c:if>
						<c:if test="${param.snb eq 'resultInfoListY'}">
							<li><a href="/adisvc/AA240_insert_resultInfo_list.jsp">사전동의 후 공동이용 가능한 업무</a></li>
						</c:if>
						<c:if test="${param.snb eq 'insertResultInfo'}">
							<li><a href="/etc/AA240_insert_resultInfo.jsp">행정정보공동이용 사전동의 안내</a></li>
						</c:if>
						<c:if test="${param.snb eq 'redingCharge'}">
							<li><a href="/etc/AA240_readingCharge.jsp">행정정보공동이용 열람청구 안내</a></li>
						</c:if>
					</c:if>                       
               </c:if>                
                
               <c:if test="${param.gnb eq 'news' || param.gnb eq 'org'}">
               
               		<c:if test="${param.snb eq 'listAll' || param.snb eq 'gvrnPolicy' || param.snb eq 'intro' || param.snb eq 'gvrnReport' || param.snb eq 'gvrnPublish' || param.snb eq 'brmAll' || param.snb eq 'gvrnData'}">
                		<li><a href="/portal/gvrnPolicy/intro">정책정보</a></li>
                        <c:if test="${param.snb eq 'brmAll'}">
                            <li><a href="/portal/gvrnPolicy/listBrmAll">분야별 정책정보</a></li>
                        </c:if>
	                    <c:if test="${param.snb eq 'gvrnPolicy'}">
	                        <li><a href="/portal/gvrnPolicy?policyType=G00301">정책뉴스</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'gvrnReport'}">
	                        <li><a href="/portal/gvrnPolicy?policyType=G00302">연구보고서</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'gvrnPublish'}">
	                        <li><a href="/portal/gvrnPolicy?policyType=G00303">간행물</a></li>
	                    </c:if>
	                    <c:if test="${param.snb eq 'gvrnData'}">
	                        <li><a href="/portal/gvrnPolicy?policyType=G00304">정책자료</a></li>
	                    </c:if>	                    
                    </c:if>
                    
                    <c:if test="${param.snb eq 'orgInfoList' || param.snb eq 'orgSite' || param.snb eq 'puborg' || param.snb eq 'mobileApp' || param.snb eq 'vfnews' || param.snb eq 'cnstexhb' || param.snb eq 'locgov' || param.snb eq 'admstinstCmt'}">
                    	<li><a href="/portal/orgInfo">기관 정보</a></li> 
                        <c:if test="${param.snb eq 'orgInfoList'}">
                            <li><a href="/portal/orgInfo">정부/지자체 조직도</a></li>
                        </c:if>                     
                        <c:if test="${param.snb eq 'orgSite' || param.snb eq 'mobileApp' }">
                            <li><a href="/portal/orgSite">정부/지자체 운영사이트</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'admstinstCmt'}">
                            <li><a href="/portal/admstinstCmt">행정기관위원회</a></li>
                        </c:if>                             
                        <c:if test="${param.snb eq 'locgov'}">
                            <li><a href="/portal/locgovNews">지자체 소식</a></li>
                        </c:if>                             
                        <c:if test="${param.snb eq 'vfnews'}">
                            <li><a href="/portal/vfnews">지자체 축제/행사</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'cnstexhb'}">
                            <li><a href="/portal/cnstexhb">공모전</a></li>
                        </c:if>
                    </c:if>
               </c:if>    
               
               <c:if test="${param.gnb eq 'mypage' || param.snb eq 'evntPartcptn'}">
                    <li><a href="/portal/myPublicPlner">My GOV</a></li>
                    <c:if test="${param.snb eq 'resultList' || param.snb eq 'onlnResve' || param.snb eq 'payRefund' || param.snb eq 'userCart' || param.snb eq 'tempCart'  || param.snb eq 'evntPartcptn'  || param.snb eq 'lifeSvc' || param.snb eq 'allDayCare'}">
                        <li><a href="/mw/AA040MyResultsList.do">나의 서비스</a></li>
                        <c:if test="${param.snb eq 'resultList' || param.snb eq 'payRefund'}">
                            <li><a href="/mw/AA040MyResultsList.do">서비스신청내역</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'onlnResve'}">
                            <li><a href="/portal/onlnResveList">온라인 상담예약 내역</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'userCart'}">
                            <li><a href="/mw/AA040ViewUserCart.do">서비스 바구니</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'tempCart'}">
                            <li><a href="/mw/AA040ViewUserCart.do?tempList=Y">임시저장 서비스</a></li>
                        </c:if>
	                    <c:if test="${param.snb eq 'evntPartcptn'}">
	                        <li><a href="/portal/evntPartcptn">이벤트 참여 내역</a></li>
	                    </c:if>                        
                        <c:if test="${param.snb eq 'lifeSvc'}">
                            <li><a href="javascript:checkLvinfoAgree();">나의 생활정보</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'allDayCare'}">
                            <li><a href="/mw/allDayCareApplyList.do">온종일 돌봄 신청내역</a></li>
                        </c:if>          
                    </c:if>

                    <c:if test="${param.snb eq 'mgrView' || param.snb eq 'leaveUsr' || param.snb eq 'userCerti' || param.snb eq 'authIntro' || param.snb eq 'ssoManage'}">
                        <li><a href="/nlogin/usr/mgrView">회원정보</a></li>
                        <c:if test="${param.snb eq 'mgrView'}">
                            <li><a href="/nlogin/usr/mgrView">회원정보 관리</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'leaveUsr'}">
                            <li><a href="/nlogin/usr/leaveUsr">회원탈퇴</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'userCerti'}">
                            <li><a href="/nlogin/certRegForm">인증 등록/관리</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'authIntro'}">
                            <li><a href="/nlogin/authIntro">복합인증 관리</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'ssoManage'}">
                            <li><a href="/main?a=AA060SSOManageApp">통합인증 관리</a></li>
                        </c:if>
                    </c:if>
                </c:if>
                
                <c:if test="${(param.gnb eq 'use' && param.snb ne 'evntPartcptn') || (param.gnb eq 'useGuide' && (param.snb eq 'noMan' || param.snb eq 'install'))}">
                    <li><a href="/portal/ntcItm">고객센터</a></li>
                    <c:if test="${param.snb eq 'useMethod'}">
                        <li><a href="">정부24이용방법 </a></li>
                    </c:if>                    
                    <c:if test="${param.snb eq 'ntcItm'}">
                        <li><a href="/portal/ntcItm">공지사항</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'faq'}">
                        <li><a href="/portal/faq">자주묻는질문(FAQ)</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'printer' || param.snb eq 'install' || param.snb eq 'elect' || param.snb eq 'noMan' || param.snb eq 'mobileInfo'}">
                        <li><a href="/mw/new_info/customer/AA090_info_customer_elect.jsp">서비스지원</a></li>
                        <c:if test="${param.snb eq 'printer'}">
                            <li><a href="/mw/new_info/customer/AA090_info_customer_printer_list.jsp">프린터 이용안내</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'install'}">
                            <li><a href="/mw/common/AA060_common_total_install.jsp">프로그램 설치 확인</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'elect'}">
                            <li><a href="/mw/new_info/customer/AA090_info_customer_elect.jsp">전자결제안내</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'noMan'}">
                            <li><a href="/mw/new_info/customer/AA090_CM010_No_man_popup.jsp">무인민원발급안내</a></li>
                        </c:if>
                    </c:if>
                     <c:if test="${param.snb eq 'dataDown'}">
                        <li><a href="/main?a=AA100DataDownListAppNew">자료실</a></li>
                    </c:if>                   
                    <c:if test="${param.snb eq 'imprvm'}">
                        <li><a href="/portal/mrfnOpinionClct/imprvm">개선의견수렴</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'onlnResve'}">
                        <li><a href="/portal/onlnResve">온라인 상담예약</a></li>
                    </c:if>

                </c:if>
                
                <c:if test="${param.gnb eq 'useGuide_foreigners'}">
	                 <c:if test="${param.snb eq 'forForeignerGuidance'}">
                        	<li><a href="/portal/forForeignerGuidance">For Foreigners</a></li>
                     </c:if>  
                </c:if>
                                 
                <c:if test="${ (param.gnb eq 'useGuide' && param.snb ne 'noMan' ) || param.snb eq 'siteMap'}">
                    <li><a href="/portal/govSumry">정부24 소개</a></li>
                    <c:if test="${param.snb eq 'govSumry' || param.snb eq 'govBi' || param.snb eq 'bbororo' || param.snb eq 'front' || param.snb eq 'govBanner' || param.snb eq 'dataviewgov'}">
                        <c:if test="${param.snb eq 'govSumry' || param.snb eq 'govBi' || param.snb eq 'bbororo' || param.snb eq 'govBanner'}">
                            <li><a href="/portal/govSumry">정부24 개요</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'dataviewgov'}">
                            <li><a href="/portal/dataviewgov">데이터로 보는 정부24</a></li>
                        </c:if>
                        
<%--                         <c:if test="${param.snb eq 'govBi'}"> --%>
<!--                             <li><a href="/portal/govBi">정부24 BI</a></li> -->
<%--                         </c:if> --%>
<%--                         <c:if test="${param.snb eq 'bbororo'}"> --%>
<!--                             <li><a href="/new_info/introduce/AA090_info_introduce_bbororo.jsp">홍보대사 소개</a></li> -->
<%--                         </c:if> --%>
<%--                         <c:if test="${param.snb eq 'front'}"> --%>
<!--                             <li><a href="/new_info/introduce/AA090_info_introduce_front.jsp">홍보동영상</a></li> -->
<%--                         </c:if> --%>
<%--                         <c:if test="${param.snb eq 'govBanner'}"> --%>
<!--                             <li><a href="/portal/govBanner">정부24 배너</a></li> -->
<%--                         </c:if> --%>

                    </c:if>
                    <c:if test="${param.snb eq 'disable' || param.snb eq 'privacy' || param.snb eq 'cpyrhtPrtc' || param.snb eq 'webAcces' || param.snb eq 'sample' || param.snb eq 'widget'}">
                        <li><a href="/portal/disable">사이트 이용안내</a></li>
                        <c:if test="${param.snb eq 'disable'}">
                            <li><a href="/portal/disable">장애인 이용안내 등</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'privacy'}">
                            <li><a href="/portal/privacy">개인정보처리방침</a></li>
                        </c:if>
                        <c:if test="${param.snb eq 'cpyrhtPrtc'}">
                            <li><a href="/portal/cpyrhtPrtc">저작권보호정책</a></li>
                        </c:if>
<%--                         <c:if test="${param.snb eq 'webAcces'}"> --%>
<!--                             <li><a href="/portal/webAcces">웹접근성정책</a></li> -->
<%--                         </c:if> --%>
<%--                         <c:if test="${param.snb eq 'sample'}"> --%>
<!--                             <li><a href="/main?a=AA040WHMinwonSampleAppNew">민원신청서 작성예시</a></li> -->
<%--                         </c:if> --%>
<%--                         <c:if test="${param.snb eq 'widget'}"> --%>
<!--                             <li><a href="/new_info/customer/AA090_info_g4cwidgetservice.jsp">민원24 위젯서비스</a></li> -->
<%--                         </c:if> --%>
                    </c:if>
<%--                     <c:if test="${param.snb eq 'dic'}"> --%>
<!--                         <li><a href="/main?a=AA170WHDicAppNew">행정전문용어사전</a></li> -->
<%--                     </c:if> --%>
                    <c:if test="${param.snb eq 'rss'}">
                        <li><a href="/portal/rss">RSS</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'useStplat'}">
                        <li><a href="/portal/useStplat">이용약관</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'siteMap'}">
                        <li><a href="/portal/siteMap">사이트맵</a></li>
                    </c:if>                    
                </c:if>                
                
                <c:if test="${param.gnb eq 'mber'}">
                    <c:if test="${param.snb eq 'login'}">
                        <li><a href="/nlogin">로그인</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'join'}">
                        <li><a href="/nlogin/usr">회원가입</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'idFind'}">
                        <li><a href="/nlogin/findUsrId">아이디찾기</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'pwdFind'}">
                        <li><a href="/nlogin/findUsrPwd">비밀번호찾기</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'veraport'}">
                        <li><a href="/nlogin/veraport">보안프로그램설치</a></li>
                    </c:if>
                </c:if>
                
                <c:if test="${param.gnb eq 'search'}">
                    <li><a href="/search?srhQuery=<c:out value='${searchVo.srhQuery}'/>">통합검색</a></li>
                    <c:if test="${param.snb eq 'apply'}">
                        <li><a href="/search/apply?srhQuery=<c:out value='${searchVo.srhQuery}'/>">신청서비스</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'svcmid'}">
                        <li><a href="/search/svcmid?srhQuery=<c:out value='${searchVo.srhQuery}'/>">서비스안내</a></li>
                    </c:if> 
                    
                    <c:if test="${param.snb eq 'pi'|| param.snb eq 'pn' || param.snb eq 'pu' || param.snb eq 'rr' || param.snb eq 'pd'}">
                        <li><a href="/search/pi?policyType=G00301&srhQuery=<c:out value='${searchVo.srhQuery}'/>">정책정보</a></li>
                    </c:if>

                     <c:if test="${param.snb eq 'news'|| param.snb eq 'onparty' || param.snb eq 'webapp'}">
                        <li><a href="/search/news/local?srhQuery=<c:out value='${searchVo.srhQuery}'/>">기관정보</a></li>
                    </c:if>
                                                            
                    <c:if test="${param.snb eq 'faq'|| param.snb eq 'board' }">
                        <li><a href="/search/faq/?srhQuery=<c:out value='${searchVo.srhQuery}'/>">고객센터</a></li>
                    </c:if>
                                              
                </c:if>
                
                <c:if test="${param.gnb eq 'eHanaro'}">
                    <li><a href="/etc/AA090_g4c_admin.jsp">서비스</a></li>
                    <c:if test="${param.snb eq 'summary'}">
                        <li><a href="/etc/AA090_g4c_admin.jsp">행정정보공동이용 소개</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'pkg'}">
                        <li><a href="/etc/AA090_pkg_srch_refund.jsp">미환급금 찾기</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'resultInfo'}">
                        <li><a href="/etc/AA240_insert_resultInfo.jsp">행정정보공동이용 사전동의 안내</a></li>
                    </c:if>
                    <c:if test="${param.snb eq 'resultInfoList'}">
                    	<c:if test="${mode eq 'Y'}">
                        <li><a href="/main?a=AA240ServiceInfoListApp&mode=Y">사전동의 후 공동이용 가능한 업무</a></li>
                        </c:if>
                        <c:if test="${mode eq 'N'}">
                        <li><a href="/main?a=AA240ServiceInfoListApp&mode=N">사전동의 없이 공동이용 가능한 업무</a></li>
                        </c:if>
                    </c:if>
                        <c:if test="${param.snb eq 'serviceList'}">
                        <li><a href="/main?a=AA240ServiceListApp">공동이용 사전동의 신청</a></li>
                    	</c:if>
                    	<c:if test="${param.snb eq 'resultList'}">
                        <li><a href="/main?a=AA240ServiceResultListApp">처리결과확인</a></li>
                    	</c:if>
                    	<c:if test="${param.snb eq 'disagreeServiceResultList'}">
                        <li><a href="/main?a=AA240ServiceResultListApp">사전동의 없이 공동이용한 내역조회</a></li>
                    	</c:if>
	                   <c:if test="${param.snb eq 'readingCharge'}">
	                       <li><a href="/etc/AA240_readingCharge.jsp">안내</a></li>
	                   </c:if>
	                   <c:if test="${param.snb eq 'demandSrch'}">
	                       <li><a href="/main?a=AA240OpenDemandSrchApp">열람청구신청</a></li>
	                   </c:if>
	                   <c:if test="${param.snb eq 'disagreeResultList'}">
	                       <li><a href="/main?a=AA240DisagreeResultListApp">처리내역조회</a></li>
	                   </c:if>
	                   <c:if test="${param.snb eq 'addrChargeInfo'}">
	                       <li><a href="/mypage/AA040_address_chargeInfo.jsp">안내/담당자/연락처</a></li>
	                   </c:if>
	                   <c:if test="${param.snb eq 'addrApply'}">
	                       <li><a href="/main?a=AA040AddressApplyApp">주소변경알리미 신청</a></li>
	                   </c:if>
	                   <c:if test="${param.snb eq 'addrShow'}">
	                       <li><a href="/main?a=AA040AddressShowApp">처리결과확인</a></li>
	                   </c:if>
	                   
	                   <c:if test="${param.snb eq 'rrnChargeInfo'}">
	                       <li><a href="/mypage/AA050_rrn_chargeInfo.jsp">안내/담당자/연락처</a></li>
	                   </c:if>
	                   <c:if test="${param.snb eq 'rrnApply'}">
	                       <li><a href="/main?a=AA050RrnApplyApp">주민번호/성명변경알림 신청</a></li>
	                   </c:if>
	                   <c:if test="${param.snb eq 'rrnResult'}">
	                       <li><a href="/main?a=AA050RrnResultApp">처리결과확인</a></li>
	                   </c:if>	                   	                   	                   
	                   <c:if test="${param.snb eq 'signetProof'}">
	                       <li><a href="/adisvc/AA240_indvdl_signet_proof_create.jsp">인감정보 열람 신청</a></li>
	                   </c:if>	                   	                   	                   
                </c:if>
                
            </c:if>         
            </ul>
        </div>
    </div>
</div>