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
     2015.11.02    장세란         최초 생성
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <c:choose>
        <c:when test="${nttVo.nttSeq gt 0}">
            <title>공공서비스 공동활용 | Q&amp;A | 수정</title>
        </c:when>
        <c:otherwise>
            <title>공공서비스 공동활용 | Q&amp;A | 등록</title>
        </c:otherwise>
    </c:choose>
</head>
<body>
    <div class="wrapper">
        <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
            <jsp:param name="gnb" value="qna"/>
        </jsp:include>
        <div class="cont-box">
            <div class="cont-inner" id="contents">
            <!-- Start Page -->
                <h1>Q&amp;A</h1>
                <h2><span class="tbl-desc"><span>* 표시</span>는 <span>필수 정보</span>이오니 반드시 작성해 주시기 바랍니다.</span></h2>
                <form:form commandName="nttVo" method="POST" enctype="multipart/form-data">
                <form:hidden path="nttSeq"/>
                <form:hidden path="usrId"/>
                     
                <div class="tbl-col">
                    <table>
                        <caption>
                            <c:choose>
                                <c:when test="${nttVo.nttSeq gt 0}">
                                    <strong>Q&amp;A 수정</strong>
                                </c:when>
                                <c:otherwise>
                                    <strong>Q&amp;A 등록</strong>
                                </c:otherwise>
                            </c:choose>
                            <span>작성자, 등록일자, 공개여부 내용, 첨부파일 항목으로 구성</span>
                        </caption>
                        <colgroup>
                            <col style="width: 20%">
                            <col style="width: 30%">
                            <col style="width: 20%">
                            <col style="width: 30%">
                        </colgroup>
                        <tr>
                            <th>작성자</th>
                            <td>
                                        <c:out value="${nttVo.usrId}"/>
                            </td>
                            <th>등록일시</th>
                            <td>
                                <c:if test="${empty nttVo.regDh}"> - </c:if>
                                <fmt:formatDate value="${nttVo.regDh}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                        </tr>
                        <tr>
                            <th>공개여부</th>
                            <td colspan="3">
                                <div class="label-wrap">
                                    <form:radiobutton path="secretSntncYn" value="N" label="공개" /> 
                                    <form:radiobutton path="secretSntncYn" value="Y" label="비공개" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="nttTtl" class="required">제목</label></th>
                            <td colspan="3">
                             <form:input path="nttTtl" cssClass="inbox full required maxlength default-korean" maxlength="200" title="Q&A 제목"/>
                                 <form:errors element="label" path="nttTtl" cssClass="error" for="nttTtl"/>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="nttCts" class="required">내용</label></th>
                            <td colspan="3">
                                <form:textarea path="nttCts" cssClass="inbox full showLen required maxlength default-korean" cols="30" rows="5" maxlength="2000" title="Q&A 내용"/>
                                <form:errors element="label" path="nttCts" cssClass="error" for="nttCts"/> 
                                <p id="nttCtsShowLen" class="textarea-length">${fn:length(nttVo.nttCts)}/2000자</p>
                            </td>
                        </tr>
                        <c:choose>
                        <c:when test="${nttVo.nttSeq > 0}">
                            <tr>
                                <th style="vertical-align: baseline; padding-top: 14px;">첨부파일</th>
                                <td colspan="3">
                                    <ul>
                                        <c:choose>
                                            <c:when test="${empty nttVo.fileList}">
                                                <li>등록된 첨부파일이 없습니다.</li>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${nttVo.fileList}" var="files">
                                                    <li>
                                                        <a href="/fl/${files.flSeq}/${files.crc}" title="${files.logicFlNm}"><c:out value="${files.logicFlNm}" /></a> &nbsp;
                                                        <a href="#noaction" title="삭제" class="delete-fl">[삭제]</a>
                                                        <input type="hidden" name="fileSeqs" value="${files.flSeq}" />
                                                     </li>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                    <ul>
                                        <li>
                                            <div class="fileset">
                                                <div class="customfile">
                                                    <input type="text" class="fileName" readonly="readonly" title="Q&amp;A 첨부파일">
                                                    <input type="file" name="files" id="file" class="validAttachFileExt">
                                                    <label for="file" title="파일선택">파일선택</label>
                                                </div>
                                                <button type="button" title="파일 추가" class="btn light icon add-fl">추가 +</button>
                                                <button type="button" title="파일 삭제" class="btn light icon delete-fl dpnone">삭제 -</button>
                                            </div>
                                        </li>
                                    </ul>
                                    <p id="filesErr"></p>
                                    <form:errors element="label" path="files" cssClass="error" for="files"/>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <th style="vertical-align: baseline; padding-top: 14px;">첨부파일</th>
                                <td colspan="3">
                                    <ul>
                                        <li>
                                            <div class="fileset">
                                                <div class="customfile">
                                                    <input type="text" class="fileName" readonly="readonly" title="Q&amp;A 첨부파일">
                                                    <input type="file" name="files" id="file" class="validAttachFileExt">
                                                    <label for="file" title="파일선택" >파일선택</label>
                                                </div>
                                                <button type="button" title="파일 추가" class="btn light icon add-fl">추가 +</button>
                                                <button type="button" title="파일 삭제" class="btn light icon delete-fl dpnone">삭제 -</button>
                                            </div>
                                        </li>
                                    </ul>
                                    <p id="filesErr"></p>
                                    <form:errors element="label" path="files" cssClass="error" for="files"/>
                                </td>
                            </tr>
                        </c:otherwise>
                        </c:choose>
                    </table>
                </div>
                <div class="btn-list">
                    <input class="btn lg dark" type="submit" title="저장" value="저장" />
                    <c:choose>
	                    <c:when test="${nttVo.nttSeq > 0}">
                            <view:url var="qnaInfoUrl" href="/openapi/qna/${nttVo.nttSeq}" reqParam="true"/>
                            <a href="${qnaInfoUrl}" title="취소" class="btn lg gray">취소</a>
	                    </c:when>
	                    <c:otherwise>
                            <a href="/openapi/qna/list" title="취소" class="btn lg gray">취소</a>
	                    </c:otherwise>
                    </c:choose>
                </div>
                </form:form>
            <!-- End Page //-->
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->
        
        <!-- 웹필터 -->
        <%@ include file="/portal/includePlugins/webfilter/webfilter/inc/initCheckWebfilter.jsp"%>
    
        <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
        
    </div><!-- End of class="wrapper" //-->
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/openapi/js/jquery.validate.messages_ko.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>
    
    <script type="text/javascript">
    //<![CDATA[
    $(document).ready(function() {

    	/*
    	//웹필터 적용하면 jquery.validator submit이 자동으로 되는 문제점이 있어서
    	//서버 validation으로 변경하고 해당 스크립트는 주석처리합니다.
    	
    	//첨부파일 확장자 Validator
        $.validator.addMethod("validAttachFileExt"
                , function(value, element) {
                      var result = true;
                      $("input[name='files']").each(function(index) {
                          if ($(this).val() != "" && !(/${fn:replace(approvalExts, ',', '|')}/i).test($(this).val().toLowerCase())) {
                        	  result = false; return false;
                          }
                      });
                      return result;
                    }, "허용되지 않은 파일 확장자입니다.<br/>(${approvalExts}) 파일만 첨부가 가능합니다.");
    	
        $('#nttVo').validate({
            onkeyup : false,
            ignoreTitle: true,
            rules : {},
            errorPlacement: function(err, elem) {
          		if (elem.attr("name") == "files") {
          		    err.attr("for", "files");
          		    $("label[for='files']").remove();
          		}
          		if ($("#" + elem.attr("name") + "Err").length > 0) {
                    err.insertAfter("#" + elem.attr("name") + "Err");
                } else {
                    err.insertAfter(elem);
                }
            },
            messages : {
            	nttTtl : {required: "Q&amp;A제목은 필수 입력사항입니다."}
                , nttCts : {required: "Q&amp;A내용은 필수 입력사항입니다."}
            	
            },
            submitHandler : function(frm){
                frm.submit();
                //submitWebFilter('nttVo');
            }
        }); */
        
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
    
    
        // 파일 필드 삭제 이벤트
        var eventDeleteLi = function(){
            $(this).closest("li").remove();
               };

        var fileFieldNum = 1;
        // 파일 필드 추가
         $(".add-fl").click(function(){
    	    var li = $(this).closest("li");
    	    var obj = li.clone().appendTo(li.parent("ul"));
    	
            obj.find("#file").attr('id', 'file'+ fileFieldNum);
            obj.find("label[for='file']").attr('for', 'file'+ fileFieldNum);
            obj.find(".fileName").val("");
            fileFieldNum++;
        
            obj.find("button.add-fl").remove();
        
            var deleteBtn = obj.find("button.delete-fl");
            deleteBtn.removeClass("dpnone").on("click", eventDeleteLi);
        
            $(".customfile input[type='file']").on("change", eventSetFileName);
        });

        // 파일 필드 삭제
        $(".delete-fl").click(eventDeleteLi);
    
        //파일첨부 시, 파일명 세팅 이벤트
        var eventSetFileName = function(){
            var fileName = $(this).val().split(/\\/).pop();
            $(this).prev('.fileName').val(fileName);
        };
    });
    //]]>
    </script>
</body>
</html>