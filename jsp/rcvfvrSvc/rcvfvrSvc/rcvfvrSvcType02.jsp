<!DOCTYPE html>
<html lang="ko">
	<head>
		<link rel="stylesheet" type="text/css" href="/webPlugins/portal/ezPDFNext/css/viewer.css">
		<link rel="stylesheet" type="text/css" href="/webPlugins/portal/ezPDFNext/loading/jquery.loadingModal.min.css">
		<script src="/webPlugins/portal/ezPDFNext/js/jquery-3.4.1.min.js"></script>
		<script src="/webPlugins/portal/ezPDFNext/js/polyfill.min.js?time=${toDate}"></script>
		<script src="/webPlugins/portal/ezPDFNext/js/jspdf.umd.js?time=${toDate}"></script>
		<script src="/webPlugins/portal/ezPDFNext/js/viewer.js?time=${toDate}"></script>
		<script src="/webPlugins/portal/ezPDFNext/js/html2canvas.js?time=${toDate}"></script>
		<script src="/webPlugins/portal/ezPDFNext/js/es6-promise.min.js?time=${toDate}"></script>
		<script src="/webPlugins/portal/ezPDFNext/loading/jquery.loadingModal.min.js?time=${toDate}"></script>
		<script src="/webPlugins/portal/ezPDFNext/js/pdfnext.js?time=${toDate}"></script>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
		<title>혜택 상세 | 보조금24</title>

		<!-- 개별 script -->
		<script src="/rcvfvrSvc/js/rcvfvrSvc/rcvfvrSvcType.js?time=${toDate}"></script>
	</head>

	<body>
		<div class="skip-nav">
		    <a href="#content" class="skip-nav__item">본문바로가기</a>
		    <a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
		</div>
		<div id="wrap">
			<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp" >
				<jsp:param name="gnb" value="svcFind" />
			</jsp:include>

			<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" />

			<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />

			<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
				<jsp:param name="gnb" value="svcFind" />
				<jsp:param name="mnb" value="svcDtl" />
				<jsp:param name="snb" value="${util:toHtmlTagBlank(sVo.svcNm)}" />
				<jsp:param name="svcId" value="${sVo.svcId}" />
			</jsp:include>

		    <div id="content" class="web-content service-type02 service-typeB">
		        <div class="container" id="printArea">
		            <!-- [D] background-color 변경 부분 -->
		            <div class="service-top" style="background-color:${fVo.upendBgColorCls}">
		            	<div class="service-typeB--content">
			            	<c:choose>
			            		<c:when test="${fVo.sportFrIconCls eq 'HA0501' || fVo.sportFrIconCls eq null}"><div class="serivce-category serivce-category--line"></c:when>
			            		<c:when test="${fVo.sportFrIconCls eq 'HA0502'}"><div class="serivce-category serivce-category--fill"></c:when>
			            		<c:when test="${fVo.sportFrIconCls eq 'HA0503'}"><div class="serivce-category serivce-category--icon"></c:when>
			            		<c:when test="${fVo.sportFrIconCls eq 'HA0504'}"><div class="serivce-category serivce-category--icon2"></c:when>
			            	</c:choose>
							<c:if test="${sVo.sportFrCdArr != ''}" >
								<c:forEach var="sportFrCd" items="${fn:split(sVo.sportFrCdArr,',')}" varStatus="spStatus">
							    	<c:if test="${sportFrCd eq 'BA0601'}">
							    		<span class="serivce-category__item span serivce-category__item--01">현금</span>
									</c:if>
									<c:if test="${sportFrCd eq 'BA0606'}">
							    		<span class="serivce-category__item span serivce-category__item--02">현물</span>
									</c:if>
									<c:if test="${sportFrCd eq 'BA0608'}">
							    		<span class="serivce-category__item span serivce-category__item--03">서비스</span>
									</c:if>
									<c:if test="${sportFrCd eq 'BA0607'}">
							    		<span class="serivce-category__item span serivce-category__item--04">이용권</span>
									</c:if>
									<c:if test="${sportFrCd eq 'BA0614'}">
							    		<span class="serivce-category__item span serivce-category__item--05">기타</span>
									</c:if>
								</c:forEach>
							</c:if>
		                	</div>
			                <div class="service-top__title">${util:toHtmlTagBlank(sVo.svcNm)}</div>
			                <p class="service-top__text">${util:toHtmlTagBlank(sVo.svcPpo)}</p>
			                
			                <div class="service-typeB__box">
		                        <div class="service-typeB__txt">
		                            <strong class="service-typeB__title">신청수단</strong>
		                            <c:if test="${sVo.reqstMeanCdArr != ''}" >
										<span class="service-typeB__text">
											<c:choose>
			                                	<c:when test="${fn:indexOf(sVo.reqstMeanCdArr,'BF0101') > -1}">		                                		
			                                		정부24 온라인신청
			                                	</c:when>
			                                	<c:when test="${fn:indexOf(sVo.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(sVo.reqstMeanCdArr,'BF0102') > -1}">		                                		
			                                		타사이트 신청
			                                	</c:when>
			                                	<c:when test="${fn:indexOf(sVo.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(sVo.reqstMeanCdArr,'BF0102') < 0 and fn:indexOf(sVo.reqstMeanCdArr,'BF0103') > -1}">		                                		
			                                		방문신청
			                                	</c:when>
												<c:otherwise>
			                                	</c:otherwise>
											</c:choose>
										</span>
									</c:if>
		                        </div>
		                        
		                        <c:choose>
                                	<c:when test="${fn:indexOf(sVo.reqstMeanCdArr,'BF0101') > -1}">		                                		
                                		<input type="hidden" id="directRecptReqstUrl" value="${sVo.directRecptReqstUrl}"/>
							    		<input type="hidden" id="directRecptMobileUrl" value="${sVo.directRecptMobileUrl}"/>
							    		<c:if test="${sVo.onlnReqstSiteUrl ne null && sVo.onlnReqstSiteUrl ne '' && btnEprss ne 'N'}">
			                    			<a href="${util:toHtmlTagBlank(sVo.onlnReqstSiteUrl)}" id="directUrl" class="service-typeB__link">온라인신청 바로가기</a>
			                    		</c:if>
                                	</c:when>
                                	<c:when test="${fn:indexOf(sVo.reqstMeanCdArr,'BF0101') < 0 and fn:indexOf(sVo.reqstMeanCdArr,'BF0102') > -1  && btnEprss ne 'N'}">
                                		<a href="#" class="service-typeB__link" data-element="modal__open" data-target="#lypop02">타사이트 바로가기</a>
                                	</c:when>
									<c:otherwise>
                                	</c:otherwise>
								</c:choose>
		                    </div>
			                </div>
			                <div class="service-typeB--img">
			                    <img src="/rcvfvrSvc/images/C/detail/${fVo.upendBgImgTyCls}" alt="서비스상세 B타입 비주얼 배경이미지">
			                </div>
		              	</div>
		                <div class="service-wrap">
			                <div class="service-wrap__left">
			                    <i class="icon-service icon-service--type01" aria-hidden="true"></i>
			                    누가 받을 수 있나요?
			                </div>
			                <div class="service-wrap__right">
			                    <div class="service-wrap__title-wrap">
			                        <div class="service-wrap__title">지원대상</div>
			                    </div>
			                    <div class="service-wrap__text">
			                        <div class="service-wrap__inner">
		                				${util:toHtmlTagBlank(sVo.sportTg)}
		                			</div>
		                		</div>
		                		<c:if test="${sVo.dupImprtySvc ne null }">
				                    <div class="service-wrap__line-box">
										중복불가 혜택 확인 : ${util:toHtmlTagBlank(sVo.dupImprtySvc)}
				                    </div>
			                    </c:if>
			                    <c:if test="${sVo.slctnStdr ne null && sVo.slctnStdr ne '' }">
			                		 <div class="service-wrap__title-wrap">
				                        <div class="service-wrap__title service-wrap__title--toggle">
				                            선정기준
				                        </div>
				                    </div>
				                    <div class="service-wrap__text">
				                        <div class="service-wrap__inner">
			                				${util:toHtmlTagBlank(sVo.slctnStdr)}
			                			</div>
			                		</div>
			                	</c:if>
	                		</div>
			           </div>
			           <div class="service-wrap">
			               <div class="service-wrap__left">
			                   <i class="icon-service icon-service--type02" aria-hidden="true"></i>
			                   어떤 혜택을 받을 수 있나요?
			               </div>
			               <div class="service-wrap__right">
			                   <div class="service-wrap__title-wrap">
			                       <div class="service-wrap__title">지원내용 </div>
			                   </div>
			                   <div class="service-wrap__text">
			                       <div class="service-wrap__inner">	
		                				${util:toHtmlTagBlank(sVo.svcCts)}
		                			</div>
			                    </div>			
			                </div>
			            </div>
			            <div class="service-wrap">
			                <div class="service-wrap__left">
			                    <i class="icon-service icon-service--type03" aria-hidden="true"></i>
			                    어떻게 신청하나요?
			                </div>
			                <div class="service-wrap__right">
			                    <div class="service-wrap__title-wrap">
			                        <div class="service-wrap__title">신청기간</div>
			                    </div>
			                    <div class="service-wrap__text">
			                        <div class="service-wrap__inner">	                       
			                        	<c:choose>
				                        	<c:when test="${sVo.reqstTmlmtDate ne null && sVo.reqstTmlmtEtc ne null}">
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 0,4)}년도 
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 4,6)}월 
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 6,8)}일 ~
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 8,12)}년도 
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 12,14)}월 
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 14,16)}일 
												</br>(${util:toHtmlTagBlank(sVo.reqstTmlmtEtc)})
											</c:when>
											<c:when test="${sVo.reqstTmlmtDate eq null && sVo.reqstTmlmtEtc ne null}">
												${util:toHtmlTagBlank(sVo.reqstTmlmtEtc)}
											</c:when>
											<c:when test="${sVo.reqstTmlmtDate ne null && sVo.reqstTmlmtEtc eq null}">
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 0,4)}년도 
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 4,6)}월 
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 6,8)}일 ~
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 8,12)}년도 
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 12,14)}월 
				                        		${fn:substring(util:toHtmlTagBlank(sVo.reqstTmlmtDate), 14,16)}일 
											</c:when>
										</c:choose>
			                        </div>
			                    </div>                    
			                    <div class="service-wrap__title-wrap">
			                        <div class="service-wrap__title">신청방법</div>
			                    </div>
			                    <div class="service-wrap__text">
			                        <div class="service-wrap__inner">
			                        	${util:toHtmlTagBlank(sVo.reqstProcss)}
			                        </div>
								</div>
								
		                	<c:if test="${sVo.posesPapers ne null && sVo.posesPapers ne ''}">
			                    <div class="service-wrap__title-wrap">
			                        <div class="service-wrap__title service-wrap__title--toggle"><!-- toggle 버튼이 붙는 타이틀의 경우 service-wrap__title--toggle 클래스 필요 -->
			                            제출서류
			                            <!-- <a href="#" class="service-toggle" data-element="toggle-btn">열기</a> -->
			                        </div>
			                    </div>
			                    <div class="service-wrap__text">
			                        <div class="service-wrap__inner">
			                			${util:toHtmlTagBlank(sVo.posesPapers)}
			                		</div>
			                    </div>
							</c:if>
		                </div>
		            </div>
		            <div class="service-wrap">
		                <div class="service-wrap__left">
		                    <i class="icon-service icon-service--type04" aria-hidden="true"></i>
		                    궁금한 사항이 더 있어요.
		                </div>
		                <div class="service-wrap__right">
		                	<div class="service-wrap__title-wrap">
		                        <div class="service-wrap__title">접수기관</div>
		                    </div>
		                    <div class="service-wrap__text">
		                        <div class="service-wrap__inner">		                        	
		                			${util:toHtmlTagBlank(sVo.rcvOrgNm)}
		                		</div>
		                    </div>
		                    <div class="service-wrap__title-wrap">
		                        <div class="service-wrap__title">문의처</div>
		                    </div>
		                    <div class="service-wrap__text">
		                        <div class="service-wrap__inner">
		                        	<c:forEach var="refrncList" items="${refrncList}">
										○ ${refrncList.refrncNm } <c:if test="${refrncList.refrncTelNo ne '' && refrncList.refrncTelNo ne null }">(☎ ${refrncList.refrncTelNo})</c:if></br>
									</c:forEach>
		                		</div>
		                    </div>
		                </div>
		            </div>
		            <c:if test="${!(lsInfo.size() eq 0 && admrulInfo.size() eq 0 && amllInfo.size() eq 0 && memorRegLsInfo.size() eq 0)}">
		            	<c:set var="sumLawSize" value="${lsInfo.size() +  admrulInfo.size() + amllInfo.size() + memorRegLsInfo.size()}" />
			            <div class="service-wrap">
			            	<div class="service-wrap__left">
			                    <i class="icon-service icon-service--type05" aria-hidden="true"></i>
			                    관계법령을 확인하세요!
			                </div>
			                <div class="service-wrap__right">
			                    <div class="service-wrap__text service-law">
			                        <div class="service-wrap__inner">
                            			<c:if test="${sumLawSize ne 1}"><button class="service-law__button"><span class="hide">관계법령 열기</span></button></c:if>
                            			<div class="service-law__wrap">
                                			<div class="service-law__list">
					                            <c:forEach var="lsInfo" items="${lsInfo}">
				                                	<span><a href="${lsInfo.lsUrl}" target="_blank" title="새창열림">${lsInfo.lsInfo}</a></span>
				                                </c:forEach>
				                                <c:forEach var="admrulInfo" items="${admrulInfo}">
													<span><a href="${admrulInfo.admrulUrl}" target="_blank" title="새창열림">${admrulInfo.admrulInfo}</a></span>
				                                </c:forEach>
				                                <c:forEach var="amllInfo" items="${amllInfo}">
													<span><a href="${amllInfo.amllUrl}" target="_blank" title="새창열림">${amllInfo.amllInfo}</a></span>
				                                </c:forEach>
				                                <c:forEach var="memorRegLsInfo" items="${memorRegLsInfo}">
													<span>${memorRegLsInfo.memorRegInfo}</span>
				                                </c:forEach>
											</div>
										</div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </c:if>
		            
		            <div class="service-last">
		                <div class="service-last__text">
		                    <div>
		                        <strong>최종수정일</strong>
		                        <span>
									<c:set var="modDh" value="${sVo.modDh }" />
			                    	${modDh == null? util:formatDateExt(sVo.svcRegDh, 'yyyyMMddHHmmss', 'yyyy.MM.dd') : util:formatDateExt(sVo.modDh, 'yyyy-MM-dd HH:mm:ss', 'yyyy.MM.dd')}
								</span>
		                    </div>
		                    <div>
		                        <strong>소관기관</strong>
		                        <span>${sVo.orgNm}</span>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="container">
		        	<div class="button-wrap service-button-wrap">
		                <a href="javascript:history.back();" class="button button-board button--list"><span>목록</span></a>
		            </div>
	    		</div>
		    </div>
			<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
		</div>
		<!-- 210415 추가 -->
		<div id="lypop02" class="modal modal--smaller" data-element="modal__element">
		    <div class="modal__container" data-element="modal__element-container">
		        <div class="modal__header">
		            <h1 class="modal__header--title">안내</h1>
		        </div>
		        <div class="modal__contents">
		            <div class="popup-list popup-agree">
		                <p class="popup-list__text">상세 내용 확인 및 혜택 신청을 위해<br>해당 홈페이지로 이동합니다.</p>
		                <div class="button-wrap">
		                    <button class="button button--large button--border" data-element="modal__close"><span class="relative">취소</span></button>
		                    <button class="button button--large" id="webUrl2"><span class="relative">확인</span></button>
		                </div>
		            </div>
		        </div>
		        <button class="modal__btn--close" type="button" data-element="modal__close" title="닫기">닫기</button>
		    </div>
		</div>
	</body>
	<script>
		$(document).ready(function(){
			if($('.service-button__state').children().length < 1){
				$('.service-button__state').css('display', 'none');
			}
			
			var copyTxt = <%=request.getParameter("copy")%>
			
			if(copyTxt){
				$('.button-list').css('display', 'none');
			}	
			
			var regex3 = /^(((http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?/
				
			var url = "${util:toHtmlTagBlank(url)}";
			var urlFir = "";
			var txt = "";
			var txt2 = "";
			var govYn = "";
			var btnEprss = "${btnEprss}";
			
			if(btnEprss == "N"){
				$('.service-typeB__link').css('display', 'none');
			} else if(url != null && url != ""){
				
				// 다중 url
				if(url.indexOf(",nbsp;") > 0){
					urlFir = url.split(',nbsp;');
					//url gov.kr 체크
					for(var i = 0; i<urlFir.length ; i++){
						if(urlFir[i].indexOf("gov.kr")>0 ){
							
							if(urlFir[i].substring(0,1) != "h" && urlFir[i].substring(0,1) == "w"){
								urlFir[i] = "http://" + urlFir[i];
							}
							$("#directUrl").attr("href" , urlFir[i]);
							$("#directUrl").css("display" , "");
							
							govYn = "Y";
							break;
						}else{
							$("#directUrl").css("display" , "none");
						}
					}
					
					for(var i = 0; i<urlFir.length ; i++){
						if(govYn == "Y"){
							if(urlFir[i].indexOf("gov.kr")>0){								
								if(regex3.test(urlFir[i]) && urlFir[i].indexOf("&lt") < 0 && urlFir[i].indexOf("^") < 0 && urlFir[i].indexOf(",") < 0 ){
									if(urlFir[i] != "h" && urlFir[i] == "w"){
										urlFir[i] = "http://" + urlFir[i];
									}
									txt += "<a href='" + urlFir[i] + "' target='_blank' class='service_link'>" + urlFir[i] + "</a>";
								}else{
									txt += "<a>" + urlFir[i] + "</a>";
								}
								txt2 += "window.open('" + urlFir[i] + "'), $('body').data('plugin_modal').close('#lypop02'); return false;";
								break;
							}
							
						}else{
							if(urlFir[i].indexOf("gov.kr")<0){								
								if(regex3.test(urlFir[i]) && urlFir[i].indexOf("&lt") < 0 && urlFir[i].indexOf("^") < 0 && urlFir[i].indexOf(",") < 0 ){
									if(urlFir[i] != "h" && urlFir[i] == "w"){
										urlFir[i] = "http://" + urlFir[i];
									}
									txt += "<a href='" + urlFir[i] + "' target='_blank' class='service_link'>" + urlFir[i] + "</a>";
								}else{
									txt += "<a>" + urlFir[i] + "</a>";
								}
								txt2 = "window.open('" + urlFir[i] + "'), $('body').data('plugin_modal').close('#lypop02'); return false;";
								break;
							}
						}
					}

					document.getElementById("webUrl2").setAttribute("onclick", txt2);
					
				//단건 
				}else{
					if(regex3.test(url) && url.indexOf("&lt") < 0 && url.indexOf("^") < 0 && url.indexOf(",") < 0 ){

						if(url[0] != "h" && url[0] == "w"){
							url = "http://" + url;
						}
						
						if(url.indexOf("gov.kr") > 0){
							
							$("#directUrl").attr("href", url);
							$("#directUrl").css("display" , "");
						}
						txt += "<a href='" + url + "' target='_blank' class='service_link'>" + url + "</a>";
					}else{
						txt+= "<a>" + url + "</a>";
						
						$("#directUrl").css('display', 'none');
					}
					txt2 += "window.open('" + url + "'), $('body').data('plugin_modal').close('#lypop02'); return false;";
					document.getElementById("webUrl2").setAttribute("onclick", txt2);
				}				
			}			
		});
		
		// 타싸이트 링크
		function siteUrlLink() {
			$(".modal__btn--close").trigger("click");		    
		}
	</script>
</html>
