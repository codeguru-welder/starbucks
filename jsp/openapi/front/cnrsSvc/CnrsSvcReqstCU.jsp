<!DOCTYPE html>
<%--------------------------------------------------------------------------
   NAME : $URL$
   DESC :
   VER  : $Revision$
 ----------------------------------------------------------------------------
     변 경 이 력
 ----------------------------------------------------------------------------
       DATE          AUTHOR             DESCRIPTION
 ---------------   ----------   ---------------------------------------------
   2015. 9. 24.      허은선          최초 생성
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <c:choose>
        <c:when test="${cnrsSvcReqstVo.cnrsSvcReqstSeq gt 0}">
            <title>공공서비스 공동활용 | 공공서비스 공유신청 | 수정</title>
        </c:when>
        <c:otherwise>
            <title>공공서비스 공동활용 | 공공서비스 공유신청 | 등록</title>
        </c:otherwise>
    </c:choose>
    <style type="text/css">
        a[href$='.xls']:before { display:none; }
    </style>
</head>
<body>
    <div class="wrapper">

    <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
        <jsp:param name="gnb" value="opApi"/>
        <jsp:param name="snb" value="cnrsSvcReqst"/>
    </jsp:include>
	
	    <div class="cont-box">
	        <div class="cont-inner" id="contents">
	        
	<!-- Start Page -->         
	            <h1>공공서비스 공유신청</h1>
	            
	            <h2 class="ttit">공공서비스 목록 양식 다운로드 </h2>
	            <div class="line-box">
	                <ul>
	                    <li>공공서비스 공유 신청 하시려면 공공서비스 목록 양식이 필요합니다.<br/>
	                        목록 양식을 다운로드 받아서 작성 후 파일첨부 하시기 바랍니다.
	                    </li>
	                    <li style="width: 20%;"><a href="/openapi/service/sharing/formDown" class="btn icon" title="공공서비스 목록 양식 다운로드"><span class="icon down"></span>양식 다운로드</a></li>
	                </ul>
	            </div>
	
	            <h2 class="ttit">공공서비스 파일 정보<span class="tbl-desc"><span>* 표시</span>는 <span>필수 정보</span>이오니 반드시 작성해 주시기 바랍니다.</span></h2>
	            <form:form commandName="cnrsSvcReqstVo" method="POST" enctype="multipart/form-data">
	            <form:hidden path="cnrsSvcReqstSeq"/>
	             <div class="tbl-col">
	                 <table style="width: 100%;">
                         <caption>
						    <c:choose>
						        <c:when test="${cnrsSvcReqstVo.cnrsSvcReqstSeq gt 0}">
						            <strong>공공서비스 파일 정보 수정</strong>
						        </c:when>
						        <c:otherwise>
						            <strong>공공서비스 파일 정보 등록</strong>
						        </c:otherwise>
						    </c:choose>
                             <span>서비스 목록파일, 기관, 서비스 설명, 시스템명, 시스템 도메인 항목으로 구성</span>
                         </caption>
                         <colgroup>
	                        <col style="width: 22%">
	                        <col style="width: auto">
	                     </colgroup>
	                     <tr>
	                         <th><label for="file" class="required">서비스 목록파일</label></th>
	                         <td>
                                 <c:choose>
                                     <c:when test="${!(cnrsSvcReqstVo.cnrsSvcFlSeq gt 0)}">
                                         <ul>
                                             <li>
                                                 <div class="fileset">
	                                                 <div class="customfile">
	                                                    <input type="text" class="fileName" readonly="readonly" title="공유서비스 목록파일">
	                                                    <input type="file" name="file" id="file">
	                                                    <label for="file">파일선택</label>
	                                                 </div>
                                                 </div>
                                                 <p id="fileErr"/>
                                                 <form:errors element="label" path="file" cssClass="error" for="file"/>
                                             </li>
                                         </ul>
                                     </c:when>
                                     <c:when test="${cnrsSvcReqstVo.cnrsSvcReqstSeq gt 0}">
                                         <ul>
                                             <li><a href="/fl/${cnrsSvcReqstVo.cnrsSvcFlSeq}/${cnrsSvcReqstVo.cnrsSvcCrc}" title="${cnrsSvcReqstVo.cnrsSvcLogicFlNm}"><c:out value="${cnrsSvcReqstVo.cnrsSvcLogicFlNm}"/></a>
                                             &nbsp;<a href="#noaction" class="delete-fl vtop" title="삭제">[삭제]</a>
                                             <input type="hidden" name="fileSeqs" value="${files.flSeq}" />
                                             <form:hidden path="cnrsSvcFlSeq"/>
                                             <form:hidden path="cnrsSvcPhyFlNm"/>
                                             <form:hidden path="cnrsSvcLogicFlNm"/>
                                             </li>
                                             <li>
                                                 <div class="fileset dpnone">
			                                         <div class="customfile">
			                                            <input type="text" class="fileName" readonly="readonly" title="공유서비스 목록파일">
			                                            <input type="file" name="file" id="file">
			                                            <label for="file">파일선택</label>
			                                         </div>
		                                         </div>
		                                         <p id="fileErr"/>
		                                         <form:errors element="label" path="file" cssClass="error" for="file"/>
                                             </li>
                                         </ul>
                                     </c:when>
                                     <c:otherwise>
                                         <div class="fileset">
			                                 <div class="customfile">
			                                    <input type="text" class="fileName" readonly="readonly" title="공유서비스 목록파일">
			                                    <input type="file" name="file" id="file">
			                                    <label for="file">파일선택</label>
			                                 </div>
		                                 </div>
		                                 <p id="fileErr"></p>
		                                 <form:errors element="label" path="file" cssClass="error" for="file"/>
                                     </c:otherwise>
                                 </c:choose>
	                         </td>
	                     </tr>
	                     <tr>
	                         <th><label for="cnrsSvcOrgNm" class="required">기관</label></th>
	                         <td>
	                             <form:input path="cnrsSvcOrgNm" cssClass="inbox find" readonly="true" title="공유신청기관 명"/><a href="/openapi/org/popup?target=orgSelect" target="_blank" class="btn blue no-underline" title="기관조회 새창으로 열림" onclick="openPopup('/openapi/org/popup?target=orgSelect', {target:'orgSelect', width:550, height:638});return false;">기관조회</a>
	                             <form:hidden path="cnrsSvcOrgCd"/>
	                             <p id="cnrsSvcOrgNmErr"></p>
	                             <form:errors element="label" path="cnrsSvcOrgNm" cssClass="error" for="cnrsSvcOrgNm"/>
	                         </td>
	                     </tr>
	                     <tr>
	                         <th><label for="cnrsSvcEpl" class="required">서비스 설명</label></th>
                             <td>
                                 <form:textarea path="cnrsSvcEpl" cssClass="inbox full maxlength showLen default-korean" cols="30" rows="5" maxlength="2000" placeholder="공유할 공공서비스의 내용, 대상 등에 대한 대략적인 설명을 입력해주세요."/>
                                 <form:errors element="label" path="cnrsSvcEpl" cssClass="error" for="cnrsSvcEpl"/>
                                 <p id="cnrsSvcEplShowLen" class="textarea-length">${fn:length(cnrsSvcReqstVo.cnrsSvcEpl)}/2000자</p>
                             </td>
	                     </tr>
	                     <tr>
	                         <th><label for="cnrsSvcSysNm">시스템명</label></th>
	                         <td>
	                             <form:input path="cnrsSvcSysNm" cssClass="inbox full maxlength default-korean" maxlength="100" title="공유신청기관 시스템 명" placeholder="공유할 공공서비스가 현재 제공되고 있는 시스템의 웹사이트 명을 입력해주세요."/>
	                         </td>
	                     </tr>
	                     <tr>
	                         <th><label for="cnrsSvcSysDomn">시스템 도메인</label></th>
                             <td>
                                 <form:input path="cnrsSvcSysDomn" cssClass="inbox full maxlength default-english" maxlength="150" title="공유신청기관 시스템 도메인" placeholder="오픈API를 활용할 시스템의 웹사이트 도메인을 입력해주세요."/>
                             </td>
	                     </tr>
	                 </table>    
	             </div>
	
	             <h2>담당자 정보</h2>
	             <div class="tbl-col">
	                 <table>
                         <caption>
                             <c:choose>
                                <c:when test="${cnrsSvcReqstVo.cnrsSvcReqstSeq gt 0}">
                                    <strong>담당자 정보 수정</strong>
                                </c:when>
                                <c:otherwise>
                                    <strong>담당자 정보 등록</strong>
                                </c:otherwise>
                             </c:choose>
                             <span>담당자명, 담당자 전화번호, 담당자 이메일 항목으로 구성</span>
                         </caption>
	                     <colgroup>
	                         <col style="width:15%">
	                         <col style="width:35%">
	                         <col style="width:15%">
	                         <col style="width:35%">
	                     </colgroup>
	                     <tr>
	                         <th><label for="cnrsReqstusrNm" class="required">담당자 명</label></th>
	                         <td>
                                 <form:input path="cnrsReqstusrNm" cssClass="inbox full default-korean" maxlength="10"  title="공유신청 담당자 명"/>
                                 <form:errors element="label" path="cnrsReqstusrNm" cssClass="error" for="cnrsReqstusrNm"/>
                                 <p id="cnrsReqstusrNmErr"></p>
	                         </td>
	                         <th><label for="cnrsReqstusrTelNo" class="required">담당자 전화번호</label></th>
	                         <td>
                                 <form:input path="cnrsReqstusrTelNo" cssClass="inbox full" maxlength="30" title="공유신청 담당자 전화번호" placeholder="ex. 02-1234-5678"/>
                                 <form:errors element="label" path="cnrsReqstusrTelNo" cssClass="error" for="cnrsReqstusrTelNo"/>
                                 <p id="cnrsReqstusrTelNoErr"></p>
	                         </td>
	                     </tr>
	                     <tr>
	                         <th><label for="cnrsReqstusrEmail" class="required">담당자 이메일</label></th>
	                         <td colspan="3">
	                             <form:input path="cnrsReqstusrEmail" cssClass="inbox full default-english" maxlength="100" title="공유신청 담당자 이메일"/>
	                             <form:errors element="label" path="cnrsReqstusrEmail" cssClass="error" for="cnrsReqstusrEmail"/>
	                             <p id="cnrsReqstusrEmailErr"></p>
	                         </td>
	                     </tr>
	                 </table>
	             </div>
	             <div class="btn-list">
                    <c:choose>
                        <c:when test="${cnrsSvcReqstVo.cnrsSvcReqstSeq > 0}">
                            <input class="btn lg dark" type="submit" value="저장" title="저장"/>
                            <a href="/openapi/service/sharing/${cnrsSvcReqstVo.cnrsSvcReqstSeq}" class="btn lg gray" title="취소">취소</a>
                        </c:when>
                        <c:otherwise>
                            <input class="btn lg red" type="submit" value="신청" title="신청"/>
                            <a href="/openapi/service/sharing/info" class="btn lg gray" title="취소">취소</a>
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
    <script type="text/javascript" src="/openapi/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/openapi/js/jquery.validate.messages_ko.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>
    
    <script type="text/javascript">
    //<![CDATA[
    $(document).ready(function() {
        $.validator.addMethod('telRule', function(value, element) {
            return value.length == 0 ? true : value.match(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/);
        }, "전화번호 형식을 맞춰주세요. (02-1234-1234)");

        $.validator.addMethod('xlsFile', function(value, element) {
            return value.length == 0 ? true : value.match("\.(xls)");
        }, "서비스 목록파일은 엑셀파일(.xls)만 등록 가능합니다.");
    	
    	$('#cnrsSvcReqstVo').validate({
    		onkeyup : false,
            ignoreTitle: true,
            rules : {
            	file : {required : true, xlsFile : true},
            	cnrsSvcOrgNm : {required : true, maxlength : 100},
                cnrsSvcEpl : {required : true, maxlength : 2000},
                cnrsReqstusrNm : {required : true, maxlength : 10},
                cnrsReqstusrTelNo : {required : true, telRule : true, maxlength : 30},
                cnrsReqstusrEmail : {required : true, email : true, maxlength : 100}
            },
            errorPlacement: function(err, elem) {
                if ($("#" + elem.attr("name") + "Err").length > 0) {
                    err.insertAfter("#" + elem.attr("name") + "Err");
                } else {
                    err.insertAfter(elem);
                }
            },
            messages : {
            	file : {required : "서비스 목록파일은 필수 등록사항입니다."},
                cnrsSvcOrgNm : {required : "기관은 필수 입력사항입니다."},
                cnrsSvcEpl : {required : "서비스 설명은 필수 입력사항입니다."},
                cnrsReqstusrNm : {required : "담당자 명은 필수 입력사항입니다."},
                cnrsReqstusrTelNo : {required : "담당자 전화번호는 필수 입력사항입니다."},
                cnrsReqstusrEmail : {required : "담당자  이메일은 필수 입력사항입니다."
                	, email : "담당자 이메일이 올바르지 않습니다."}
            },
            submitHandler : function(frm){
                frm.submit();
            }
        });

    	//textarea 글자수 세기
        var LFReg = /\n/g;
    	var eventShowLen = function(){
    		var LFArr = $(this).val().match(LFReg);
            var LFCnt = 0;
            if (LFArr != null) {
                LFCnt = LFArr.length;
            }
    		$("#" + $(this).attr("name") + "ShowLen").html(($(this).val().length + LFCnt) + "/" + $(this).attr("maxlength") + "자");
        };
        $(".showLen").keyup(eventShowLen).blur(eventShowLen);
        
    });
    
    function setRpOrg(orgObj, target) {
        $("#cnrsSvcOrgCd").val(orgObj.orgCd);
        $("#cnrsSvcOrgNm").val(orgObj.orgNm);
        $("#cnrsSvcOrgNm").focus();
    }
    
    // 파일 삭제
    $(".delete-fl").click(function(){
        $(this).parent("li").remove();
        $(".fileset").removeClass("dpnone");
    });
    //]]>    
    </script>

</body>
</html>