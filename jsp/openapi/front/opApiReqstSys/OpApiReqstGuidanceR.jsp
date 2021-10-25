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
     2015.09.25    장세란         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
   <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <title>공공서비스 공동활용 | OpenApi 신청</title>
</head>
<body>
    <div class="wrapper">

    <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
        <jsp:param name="gnb" value="opApi"/>
        <jsp:param name="snb" value="opApiReq"/>
    </jsp:include>
        <div class="cont-box">
            <div class="cont-inner" id="contents">
<!-- Start Page -->         
                
                <h1>OpenAPI</h1>
                <h2 class="ttit bbor">OpenAPI 서비스란?<span class="abbr">Open Application Programming Interface</span></h2>
                
                <div class="para">
                    <p>인터넷 이용자 또는 애플리케이션 개발자가 직접 응용 프로그램과 서비스를 손쉽게 개발할 수 있도록 일정하게 정해진 형식으로 정보를 공개하는 것으로<!-- <br/>정부24에서는 --> 정부에서 시행하고 있는 공공서비스 정보를 오픈API 로 제공합니다.</p>
                </div>

                <div class="openapi-advantage">
                    <ul>
                        <li>
                            <div class="char1">
                                <strong>공공서비스 정보 실시간 제공</strong>
                                <p>정부에서 제공하는 공공서비스를 실시간으로 제공 받을 수 있으며,<br>정부24(<a href="http://www.gov.kr" target="_blank" title="정부24 웹사이트로 이동-새창">www.gov.kr</a>)와 동일한 정보를 제공합니다.</p>
                            </div>
                        </li>
                        <li>
                            <div class="char2">
                                <strong>다양한 어플리케이션 개발 및 활용</strong>
                                <p>수혜서비스 및 민원, 정책정보를 이용하여 모바일 앱 뿐만 아니라, 웹서비스, 태블릿, 홍보물, 잡지 등 다양한 매체에서 어플리케이션을 개발, 활용할 수 있습니다.</p>
                            </div>
                        </li>
                        <li>
                            <div class="char3">
                                <strong>초보 개발자 및 일반인도 쉽게 활용</strong>
                                <p>개발자들이 보다 쉽게 OpenAPI를 사용할 수 있도록 활용가이드 및 매뉴얼을 제공하고 있으며, <br>궁금한 점은 Q&amp;A 게시판에서 상담 받을 수 있습니다.</p>
                            </div>
                        </li>
                    </ul>
                </div>

                <h2>OpenAPI 신청절차</h2>
                <div class="share-app-process-wrap">
                    <div class="app-process-open">
                        <ol>
                            <li class="step1">
                                <div>
                                    <!-- <strong>STEP 1</strong>
                                    <p>OpenAPI 사용 신청<br/>&lt;사용자&gt;</p> -->
                                </div>
                            </li>
                            <li class="step2">
                                <div>
                                    <!-- <strong>STEP 2</strong>
                                    <p>승인 및 인증키 발급<br/>&lt;행정안전부&gt;</p> -->
                                </div>
                            </li>
                            <li class="step3">
                                <div>
                                    <!-- <strong>STEP 3</strong>
                                    <p>OpenAPI 활용<br/>&lt;사용자&gt;</p> -->
                                </div>
                            </li>
                        </ol>
                    </div>
                    <div class="app-process-open2">
                        <ol>
                            <li class="step1">
                                <div>
                                    <strong>&nbsp;&nbsp;&nbsp;STEP 1</strong>
                                    <p>공공데이터포털에서(data.go.kr)<br/>OpenAPI 활용 신청<br/>&lt;사용자&gt;</p>
                                </div>
                            </li>
                            <li class="step2">
                                <div>
                                    <strong>&nbsp;&nbsp;&nbsp;STEP 2</strong>
                                    <p style="padding-top: 9px;">승인 및 인증키 발급<br/>&lt;행정안전부&gt;</p>
                                </div>
                            </li>
                            <li class="step3">
                                <div>
                                    <strong>&nbsp;&nbsp;&nbsp;STEP 3</strong>
                                    <p style="padding-top: 9px;">OpenAPI 활용<br/>&lt;사용자&gt;</p>
                                </div>
                            </li>
                        </ol>
                    </div>
                </div>
                
                <h2>OpenAPI 목록</h2>
                <ul class="api-list">                    
                        <c:choose>
                              <c:when test="${empty listData}">
	                              <li>
	                                  등록된 OpenAPI가 없습니다.
	                              </li>
                              </c:when>
                              <c:otherwise>
                                <c:forEach var="opApiVo" items="${listData}" varStatus="status">
                                    <li>
                                        <div class="api-item">
                                        <strong><c:out value="${opApiVo.apiNm}" /></strong>
			                            <p><c:out value="${opApiVo.apiEpl}" /></p>
			                            <p>
			                               <c:forEach var="opApiProvdFrVo" items="${opApiVo.opApiProvdFrList}" varStatus="status">
                                               <span><c:out value="${opApiProvdFrVo.apiProvdFrCdNm}"/></span>
                                              </c:forEach>
			                               <span class="update">최종수정일 
			                               <c:if test="${empty opApiVo.modDh}"><fmt:formatDate value="${opApiVo.regDh}" pattern="yyyy-MM-dd"/></c:if>
			                               <fmt:formatDate value="${opApiVo.modDh}" pattern="yyyy-MM-dd"/>
			                               </span>
			                            </p>
			                            </div>
			                            <div class="btn-guide">
				                            <a href="/openapi/${opApiVo.apiId}" title="<c:out value="${opApiVo.apiNm}"/>" class="btn detail">API 상세</a>
				                            <c:choose>
					                            <c:when test="${opApiVo.apiId eq 'API0001' || opApiVo.apiId eq 'API0002'}">
					                                <a href="/openapi/API0001/guide"  title="<c:out value="${opApiVo.apiNm}"/> 가이드" class="btn guide" >API 가이드</a>
					                            </c:when>
					                            <c:otherwise>
					                                <a href="/openapi/${opApiVo.apiId}/guide" title="<c:out value="${opApiVo.apiNm}"/> 가이드" class="btn guide">API 가이드</a>
					                            </c:otherwise>
					                        </c:choose>
                                        </div>
			                        </li>
                                </c:forEach>
                              </c:otherwise>
                        </c:choose>
                </ul>
                 
                <div class="btn-list">
                    <a href="https://www.data.go.kr/data/15014185/openapi.do" title="공공데이터포털 대한민국 공공서비스 정보 새창으로 열림" class="btn lg red" target="_blank">신청</a>
                </div>
                
            <!-- End Page //-->             
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->

    <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
        
    </div><!-- End of class="wrapper" //-->
          
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>

</body>
</html>