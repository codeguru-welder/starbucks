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
    <c:choose>
        <c:when test="${opApiReqstSysVo.apiReqstSysSeq gt 0}">
            <title>공공서비스 공동활용 | OpenApi 신청 | 수정</title>
        </c:when>
        <c:otherwise>
            <title>공공서비스 공동활용 | OpenApi 신청 | 등록</title>
        </c:otherwise>
    </c:choose>
</head>
<body>
    <div class="wrapper">
     <c:choose>
        <c:when test="${'' eq opApiReqstSysVo.apiReqstSysSeq}">
            <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
                <jsp:param name="gnb" value="opApi"/>
                <jsp:param name="snb" value="opApiReq"/>       
            </jsp:include>
        </c:when>
        <c:otherwise>
            <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
                <jsp:param name="gnb" value="opApi"/>
                <jsp:param name="snb" value="reqSttus"/>       
            </jsp:include>
        </c:otherwise>
    </c:choose>
        <div class="cont-box">
            <div class="cont-inner" id="contents">
<!-- Start Page --> 
                <h1>OpenAPI</h1>
                
                <h2 class="ttit">시스템 정보 <span class="tbl-desc"><span>* 표시</span>는 <span>필수 정보</span>이오니 반드시 작성해 주시기 바랍니다.</span></h2>
                <form:form commandName="opApiReqstSysVo" method="POST">
                        <form:hidden path="apiReqstSysSeq" />
                        <form:hidden path="apiReqstSysOrgCd" />
                        <c:if test="${opApiReqstSysVo.apiReqstProcessSttusCd eq 'YF0103'}">
                            <form:hidden path="apiReqstClsCd" />
                        </c:if>
                <div class="tbl-col">                 
                    <table>
                        <caption>
                            <c:choose>
                                <c:when test="${opApiReqstSysVo.apiReqstSysSeq gt 0}">
                                    <strong>시스템 정보 수정</strong>
                                </c:when>
                                <c:otherwise>
                                    <strong>시스템 정보 등록</strong>
                                </c:otherwise>
                            </c:choose>
                            <span>시스템 명, 도메인, 설명, 운영기관, 인증키, 신청유형 항목으로 구성</span>
                        </caption>
                        <colgroup>
                            <col style="width: 22%">
                            <col style="width: auto">
                        </colgroup>
                        <tr>
                            <th><label class="required" for="apiReqstSysNm">시스템 명</label></th>
                            <td>
                                <form:input path="apiReqstSysNm" cssClass="inbox full default-korean" maxlength="100" title="시스템 명" placeholder="오픈API를 활용할 시스템 명을 입력해주세요."/>
                                <p id="apiReqstSysNmErr"></p>
                                <form:errors element="label" path="apiReqstSysNm" cssClass="error" for="apiReqstSysNm"/>
                            </td>
                        </tr>
                        <tr>
                            <th>시스템 도메인</th>
                            <td>
                                <form:input path="apiReqstSysDomn" cssClass="inbox full default-english" maxlength="150" title="시스템 도메인" placeholder="오픈API를 활용할 시스템의 웹사이트 도메인을 입력해주세요."/>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="required" for="apiReqstSysEpl">시스템 설명</label></th>
                            <td>
                                <form:textarea path="apiReqstSysEpl"  cols="30" rows="6" cssClass="inbox full maxlength showLen default-korean" title="시스템 설명" maxlength="2000" placeholder="오픈API를 활용할 시스템 설명, 서비스 대상, 공공서비스 활용목적 등에 대한 대략적인 설명을 입력해주세요." />
                                <p id="apiReqstSysNmErr"></p>
                                <form:errors element="label" path="apiReqstSysEpl" cssClass="error" for="apiReqstSysEpl"/>
                                <p id="apiReqstSysEplShowLen" class="textarea-length">${fn:length(opApiReqstSysVo.apiReqstSysEpl)}/2000자</p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="required" for="apiReqstSysOrgNm">운영기관</label></th>
                            <td>                            
                                <form:input path="apiReqstSysOrgNm" cssClass="inbox find" readonly="true" title="운영기관 명"/><a href="/openapi/org/popup?target=orgSelect" target="_blank" class="btn blue no-underline" title="기관조회 새창으로 열림" onclick="openPopup('/openapi/org/popup?target=orgSelect', {target:'orgSelect', width:550, height:638});return false;">기관조회</a>
                                <p id="apiReqstSysOrgNmErr"></p>
                                <form:errors element="label" path="apiReqstSysOrgNm" cssClass="error" for="apiReqstSysOrgNm"/>
                            </td>
                        </tr>
                        <c:if test="${opApiReqstSysVo.apiReqstSysSeq ne 0}">
                            <tr>
                            <th>인증키</th>
                                <td>
                                    <c:choose>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                        <c:when test="${empty opApiReqstSysVo.apiReqstSysCrtfck}">
                                            <c:out value="-" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="${opApiReqstSysVo.apiReqstSysCrtfck}"/>
                                        </c:otherwise>
                                    </c:choose>  
                                </td>
                            </tr>
                       </c:if>
                        <tr>
                            <th><label class="required">신청유형</label></th>
                            <td>
                                <div class="label-wrap">
                                    <c:choose>
                                        <c:when test="${opApiReqstSysVo.apiReqstProcessSttusCd eq 'YF0103'}">
                                            <c:out value="${opApiReqstSysVo.apiReqstClsNm}" />
                                        </c:when>
                                        <c:otherwise>
                                            <form:radiobutton path="apiReqstClsCd" value="CA0601" title="서비스 개발" label="서비스 개발" /> 
                                            <form:radiobutton path="apiReqstClsCd" value="CA0602" title="서비스 운영" label="서비스 운영" />
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="useinfo">
                    <h2 class="usetit">이용정보</h2>
                    <table>
                        <caption>
                            <strong>이용정보</strong>
                            <span>일일 허용 조회수, 승인방법, 이용기간 항목으로 구성</span>
                        </caption>
                        <thead>
                         <c:choose>
                            <c:when test="${opApiReqstSysVo.apiReqstProcessSttusCd eq 'YF0103'}">                
                                <tr>
                                    <th>API 명</th>
                                    <th>일일 허용 조회수</th>
                                    <th>만료일자</th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <th rowspan="2">API 명</th>
                                    <th colspan="2">일일 허용 조회수</th>
                                    <th rowspan="2">승인방법</th>
                                    <th rowspan="2">이용기간 (개발/운영)</th>
                                </tr>
                                <tr>
                                    <th>개발</th>
                                    <th>운영</th>
                                </tr>
                            </c:otherwise>
                         </c:choose>
                            
                        </thead>
                        <tbody>           
                        <c:choose>
                            <c:when test="${opApiReqstSysVo.apiReqstProcessSttusCd eq 'YF0103'}">                 
                                <c:forEach var="reqstOpApiVo" items="${apiList}" varStatus="status">
                            <tr>
                                <td class="alignC"><c:out value="${reqstOpApiVo.apiNm}" /></td>
                                <td class="alignC">
                                    <c:choose>                                       
                                        <c:when test="${reqstOpApiVo.apiDailPermVwCnt eq '0' && opApiReqstSysVo.apiReqstClsCd eq 'CA0602'}">무제한</c:when>
                                        <c:otherwise><c:out value="${reqstOpApiVo.apiDailPermVwCnt}" /></c:otherwise>
                                    </c:choose>
                                </td>
                                    <c:choose>
                                        <c:when test="${empty reqstOpApiVo.apiUseEndDtFmt}">
                                            <td class="alignC">무기한</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="alignC"><c:out value="${reqstOpApiVo.apiUseEndDtFmt}" /></td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                            </c:when>
                            <c:otherwise>
                               <c:forEach var="opApiVo" items="${apiList}" varStatus="status">
                                   <tr>
                                      <td class="alignC"><c:out value="${opApiVo.apiNm}" /></td>
                                      <td class="alignC"><c:out value="${opApiVo.apiDevlopDailPermVwCnt}" /></td>
                                      <td class="alignC">
                                          <c:choose>
                                              <c:when test="${opApiVo.apiOperDailPermVwCnt eq 0}">무제한</c:when>
                                              <c:otherwise><c:out value="${opApiVo.apiOperDailPermVwCnt}" /></c:otherwise>
                                          </c:choose>
                                      </td>
                                      <td class="alignC"><c:out value="${opApiVo.apiConfmMthClsNm}" /></td>
                                      <td class="alignC">
                                          <c:choose>
                                              <c:when test="${opApiVo.apiUsePdClsCd eq 'CA0203'}">사용기한 없음</c:when>
                                              <c:otherwise> 승인일로부터 <c:out value="${opApiVo.apiUsePdClsNm}" /></c:otherwise>
                                          </c:choose>
                                      </td>
                                   </tr>
                               </c:forEach>
                            </c:otherwise>
                         </c:choose>                                 
                        </tbody>
                    </table>
                    <p class="caution">※ 과도한 트래픽 발생 시, 서비스 이용에 제한이 있을 수 있습니다.</p>
                </div>

                <h2>담당자 정보</h2>
                <div class="tbl-col">
                    <table>
                        <caption>
                            <c:choose>
                                <c:when test="${opApiReqstSysVo.apiReqstSysSeq gt 0}">
                                    <strong>담당자 정보 수정</strong>
                                </c:when>
                                <c:otherwise>
                                    <strong>담당자 정보 등록</strong>
                                </c:otherwise>
                            </c:choose>
                            <span>담당자명, 전화번호, 이메일 항목으로 구성</span>
                        </caption>
                        <colgroup>
                            <col style="width: 15%">
                            <col style="width: 35%">
                            <col style="width: 15%">
                            <col style="width: 35%">
                        </colgroup>
                        <tr>
                            <th><label class="required" for="apiReqstusrNm">담당자 명</label></th>
                            <td>
                                <form:input path="apiReqstusrNm" cssClass="inbox full default-korean" maxlength="10" title="담당자 명"/>
                                <p id="apiReqstusrNmErr"></p>
                                <form:errors element="label" path="apiReqstusrNm" cssClass="error" for="apiReqstusrNm"/>
                            </td>
                            <th><label class="required" for="apiReqstusrTelNo">담당자 전화번호</label></th>
                            <td>
                                <form:input path="apiReqstusrTelNo" cssClass="inbox full" maxlength="30" title="담당자 전화번호" placeholder="ex. 02-1234-5678"/>
                                <p id="apiReqstusrTelNoErr"></p>
                                <form:errors element="label" path="apiReqstusrTelNo" cssClass="error" for="apiReqstusrTelNo"/>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="required" for="apiReqstusrEmail">담당자 이메일</label></th>
                            <td colspan="3">
                                <form:input path="apiReqstusrEmail" cssClass="inbox full default-english" maxlength="100" title="담당자 이메일"/>
                                <p id="apiReqstusrEmailErr"></p>
                                <form:errors element="label" path="apiReqstusrEmail" cssClass="error" for="apiReqstusrEmail"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="btn-list">
                    <input class="btn lg dark" type="submit" title="저장" value="저장" />
                    <c:choose>
                        <c:when test="${empty opApiReqstSysVo.apiReqstSysSeq || opApiReqstSysVo.apiReqstSysSeq eq 0}">
                            <a href="/openapi/info" title="취소" class="btn lg gray">취소</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/openapi/request/${opApiReqstSysVo.apiReqstSysSeq}" title="취소" class="btn lg gray">취소</a>
                        </c:otherwise>
                    </c:choose>
                </div>
                </form:form>  
                
<!-- End Page //-->
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->
        
        <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
        
    </div><!-- End of class="wrapper" //-->
    
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>
    <script type="text/javascript" src="/openapi/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/openapi/js/jquery.validate.messages_ko.js"></script>

    <script type="text/javascript">
        //<![CDATA[
       
        //기관조회 팝업 수행  
        function setRpOrg(orgObj, target) {
           $("#apiReqstSysOrgNm").focus();
           $("#apiReqstSysOrgCd").val(orgObj.orgCd);
           $("#apiReqstSysOrgNm").val(orgObj.orgNm);
        };

        $(document).ready(function() {
            $.validator.addMethod('telNo', function(value, element) {
                return value.length == 0 ? true : value.match(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/);
            }, '전화번호 형식을 맞춰주세요. (02-1234-1234)');
     
        $('#opApiReqstSysVo').validate({
            onkeyup : false,
            ignoreTitle: true,
            rules : {
           	apiReqstSysNm : {required : true, maxlength : 100}, // 시스템 명
           	apiReqstSysDomn : {maxlength : 150}, // 시스템 도메인
           	apiReqstSysEpl : {required : true, maxlength : 2000},// 시스템 설명
            apiReqstSysOrgNm : {required : true, maxlength : 200}, // 운영기관
            apiReqstClsCd : {required : true}, // 신청유형
            apiReqstusrNm : {required : true, maxlength : 10}, // 담당자명
            apiReqstusrTelNo : {required : true, telNo : true}, // 전화번호
            apiReqstusrEmail : {required : true, email : true, maxlength : 100} // 이메일
            },
            errorPlacement: function(err, elem) {
                if ($("#" + elem.attr("name") + "Err").length > 0) {
                    err.insertAfter("#" + elem.attr("name") + "Err");
                } else {
                    err.insertAfter(elem);
                }
            },
            messages : {
           	    apiReqstSysNm : {required : "시스템 명은 필수 입력사항입니다."}, // 시스템 명
                apiReqstSysEpl : {required : "시스템 설명은 필수 입력사항입니다."},// 시스템 설명
                apiReqstSysOrgNm : {required : "운영기관은 필수 입력사항입니다."}, // 운영기관
                apiReqstClsCd : {required : "신청유형은 필수 선택사항입니다."}, // 신청유형
                apiReqstusrNm : {required : "담당자 명은 필수 입력사항입니다."}, // 담당자명
                apiReqstusrTelNo : {required : "담당자 전화번호는 필수 입력사항입니다."}, // 전화번호
                apiReqstusrEmail : {required : "담당자 이메일은 필수 입력사항입니다."
                    , email : "이메일이 올바르지 않습니다."} // 이메일
            },
            submitHandler : function(frm) {
                frm.submit();
            }
        });  
                     
        //textarea 글자수 세기
        var eventShowLen = function(){
            $("#" + $(this).attr("name") + "ShowLen").html($(this).val().length + "/" + $(this).attr("maxlength") + "자");
        };
        $(".showLen").keydown(eventShowLen).blur(eventShowLen); 
    });    
    //]]>    
    </script>
</body>
</html>