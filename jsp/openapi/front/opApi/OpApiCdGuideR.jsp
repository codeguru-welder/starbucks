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
     2014.10.19    허은선         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <c:set var="requestUri" value="${requestScope['javax.servlet.forward.request_uri']}"/>
    <c:choose>
        <c:when test="${requestUri eq '/openapi/API0003/guide'}">
            <title>공공서비스 공동활용 | OpenAPI | 개발 가이드 | 서비스 분류</title>
        </c:when>
        <c:when test="${requestUri eq '/openapi/API0004/guide'}">
            <title>공공서비스 공동활용 | OpenAPI | 개발 가이드 | 소관 기관 코드</title>
        </c:when>
        <c:otherwise>
            <title>공공서비스 공동활용 | OpenAPI | 개발 가이드</title>
        </c:otherwise>
    </c:choose>
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
                <div class="tabmenu">
                    <ul class="tab">
                        <li>
	                        <c:choose>
		                        <c:when test="${requestUri eq '/openapi/API0001/guide'}">
		                            <a href="/openapi/API0001" title="API 정보">API 정보</a>
		                        </c:when>
		                        <c:when test="${requestUri eq '/openapi/API0003/guide'}">
		                            <a href="/openapi/API0003" title="API 정보">API 정보</a>
		                        </c:when>
		                        <c:when test="${requestUri eq '/openapi/API0004/guide'}">
		                            <a href="/openapi/API0004" title="API 정보">API 정보</a>
		                        </c:when>
		                        <c:otherwise>
		                            <a href="/openapi/API0001" title="API 정보">API 정보</a>
		                        </c:otherwise>
	                        </c:choose>
                        </li>
                        <li class="current"><a href="/openapi/API0001/guide" title="개발 가이드">개발 가이드</a></li>
                    </ul>
                </div>
                <div class="tabcontainer">
                    <h2 class="hidden">API 정보</h2>
                    <div class="tab-list">
                        <ul class="num5">
                            <li <c:if test="${requestUri eq '/openapi/API0001/guide' || requestUri eq '/openapi/API0002/guide'}">class="current"</c:if>><a href="/openapi/API0001/guide" title="공공서비스 목록 / 상세">공공서비스 목록 / 상세</a></li>
                            <li <c:if test="${requestUri eq '/openapi/API0003/guide'}">class="current"</c:if>><a href="/openapi/API0003/guide" title="서비스 분류">서비스 분류</a></li>
                            <li <c:if test="${requestUri eq '/openapi/API0004/guide'}">class="current"</c:if>><a href="/openapi/API0004/guide" title="소관 기관 코드">소관 기관 코드</a></li>
                        </ul>
                    </div>
                    <h3 class="hidden">공공서비스 상세</h3>
                    <dl class="service-cat">
                        <c:if test="${requestUri eq '/openapi/API0003/guide'}">
                        <dt>서비스 분류</dt>
                        <dd>
                            <span class="sbox">
                                <select name="lrgAstCd" id="lrgAstCd" title="서비스 대분류 선택" >
                                    <option value="" title="대분류 전체">대분류 전체</option>
                                    <c:forEach var="nodeVo" items="${nodeList}" varStatus="status">
                                        <option value="${nodeVo.svcAstCode}" label="${nodeVo.svcAstName}" title="${nodeVo.svcAstName}">${nodeVo.svcAstName}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="sbox">
                                <select name="mdmAstCd" id="mdmAstCd" title="서비스 중분류 선택" >
                                    <option value="" title="중분류 전체">중분류 전체</option>
                                </select>
                            </span>
                            <span class="sbox">
                                <select name="smallAstCd" id="smallAstCd" title="서비스 소분류 선택" >
                                    <option value="" title="소분류 전체">소분류 전체</option>
                                </select>
                            </span>
                        </dd>
                        </c:if>
                        
                        <c:if test="${requestUri eq '/openapi/API0004/guide'}">
                        <dt>소관기관</dt>
                        <dd>
                            <span class="sbox">
                                <select name="jrsdOrgClsCd" id="jrsdOrgClsCd" title="기관유형 선택" >
                                    <option value="ALL" title="기관유형 전체">기관유형 전체</option>
                                    <c:forEach var="nodeVo" items="${nodeList}" varStatus="status">
                                        <option value="${nodeVo.orgClsCode}" label="${nodeVo.orgClsName}" title="${nodeVo.orgClsName}">${nodeVo.orgClsName}</option>
                                    </c:forEach>
                                </select>
                            </span>
                            <span class="sbox dpnone">
                                <select name="jrsdFsOrgCd" id="jrsdFsOrgCd" title="상위기관 선택" >
                                    <option value="ALL" title="상위기관 전체">상위기관 전체</option>
                                </select>
                            </span>
                            <span class="sbox">
                                <select name="jrsdOrgCd" id="jrsdOrgCd" title="소관기관 선택" >
                                    <option value="ALL" title="소관기관 선택">소관기관 전체</option>
                                </select>
                            </span>
                        </dd>
                        </c:if>
                    </dl><!-- End of class="service-cat" //-->

                    <h4 class="ttit" id="requestInfoTitle">${requestInfoTitle}</h4>
                    <div class="tbl-col">
                        <table>
                            <caption>
                                <strong>요청정보</strong>
                                <span>요청 URL, 결과 XML 항목으로 구성</span>
                            </caption>
                            <colgroup>
                                <col style="width: 22%">
                                <col style="auto">
                            </colgroup>
                            <tr>
                                <th>요청 URL</th>
                                <td>
                                    <div id="requestUrl" class="source-box">
                                        <c:out value="${requestUrl}" escapeXml="true"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>결과 XML</th>
                                <td>
                                    <div class="source-box">
                                        <p tabindex="0"><code id="resultXml" class="code"><c:out value="${resultXml}" escapeXml="true"/></code></p>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div><!-- End of class="tbl-col" //-->

                </div><!-- End of class="tabcontainer" //-->
<!-- End Page //-->
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->
        
        <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>
        
    </div><!-- End of class="wrapper" //-->
    
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>

    <script type="text/javascript">
    //<![CDATA[
         var tmpLrgEmptyMdmAst = "<option value=''>중분류 전체</option>";
         var tmpMdmEmptySmallAst = "<option value=''>소분류 전체</option>";
         var tmpJrsdFsOrgEmptyJrsdFsOrg = "<option value='ALL'>상위기관 전체</option>";
         var tmpJrsdOrgClsEmptyJrsdOrg = "<option value='ALL'>소관기관 전체</option>";

         //하위 분류 List 가져오기 (선택한 분류 코드에 따른 하위 분류 List를 가져와서 selectBox로 목록 구성)
         //parameter : astCd (분류 코드)
         //lrAstCdName (하위 분류 코드 명(selectBox의 name으로 사용할 String을 넣는다))
         //lvl (medium: 중분류 List, small: 소분류 List)
         function selectLrLvlAstList(astCd, lrAstCdName, lvl) {
             var params = {
                 level : lvl
                 ,codeValue : astCd
                 ,resultXmlNdYn : 'Y'
             };
             
             $.ajaxSetup({
                 async: false
             });
             
             $.ajax({
                 url : '/openapi/API0003/guide.json',
                 type : 'GET',
                 data : params,
                 dataType : "json",
                 cache : false,
                 success : function(data){
                     var srhLrLvlAstCd = '';
                     
                     //'없음'
                     if (lvl == 'medium') {
                         $('select[name=' + lrAstCdName+ ']').html(tmpLrgEmptyMdmAst);
                         srhLrLvlAstCd = '${opApiGuideVo.mdmAstCd}';
                     } else if(lvl == 'small') {
                         $('select[name=' + lrAstCdName+ ']').html(tmpMdmEmptySmallAst);
                         srhLrLvlAstCd = '${opApiGuideVo.smallAstCd}';
                     } else {
                         $('select[name=' + lrAstCdName+ ']').html("<option value=''>대분류 전체</option>");
                         srhLrLvlAstCd = '${opApiGuideVo.lrgAstCd}';
                     }
                     
                     //하위 분류 List html로 그린다.
                     for (var i = 0; i < data.nodeList.length; i++) {
                         if (srhLrLvlAstCd == data.nodeList[i].svcAstCode) {
                             
                             $('select[name=' + lrAstCdName+ ']').append("<option value='" + data.nodeList[i].svcAstCode
                                     + "' title='"+ data.nodeList[i].svcAstName + "' selected='selected'>" + data.nodeList[i].svcAstName + "</option>");
                         } else {
                             $('select[name=' + lrAstCdName+ ']').append("<option value='" + data.nodeList[i].svcAstCode
                                     + "' title='"+ data.nodeList[i].svcAstName+ "'>" + data.nodeList[i].svcAstName + "</option>");
                         }
                     }
                     
                     $('#requestInfoTitle').text(data.requestInfoTitle);
                     $('#resultXml').text(data.resultXml);
                     $('#requestUrl').html(data.requestUrl);
                 },
                 error : function(e){
                     alert("목록 조회 중 오류가 발생하였습니다.");
                 }
             });
         };
         
         
         
         //대분류 selectBox 선택
         $(document).on('change', 'select[name=lrgAstCd]', function() {
             var lrgAstCd = $(this).val();
             
             //대분류 선택 시 중분류 List 가져온다.
             if (lrgAstCd != "") {
                 $('select[name=smallAstCd]').html(tmpMdmEmptySmallAst);
                 selectLrLvlAstList(lrgAstCd, 'mdmAstCd', 'medium');
                 $('#mdmAstCd').val("");
             //대분류 '없음' 선택 시 중분류, 소분류 List 없어야 함.
             } else {
                 $('select[name=mdmAstCd]').html(tmpLrgEmptyMdmAst);
                 $('select[name=smallAstCd]').html(tmpMdmEmptySmallAst);
                 selectLrLvlAstList(lrgAstCd, 'lrgAstCd', '');
             }
         });
         
         
         //중분류 selectBox 선택
         $(document).on('change', 'select[name=mdmAstCd]', function() {
             var mdmAstCd = $(this).val();
             
             //중분류 선택 시 소분류 List 가져온다.
             if (mdmAstCd != "") {
                 selectLrLvlAstList(mdmAstCd, 'smallAstCd', 'small');
                 $('#smallAstCd').val("");
             //중분류 '없음' 선택 시 소분류 List 없어야 함.
             } else {
                 $('select[name=smallAstCd]').html(tmpMdmEmptySmallAst);
                 selectLrLvlAstList($('#lrgAstCd').val(), 'mdmAstCd', 'medium');
             }
         });

         
         /**
          * 기관 유형 별 행정표준기관 List 가져오기 (선택한 기관 유형에 따른 행정표준기관 List를 가져와서 selectBox로 목록 구성)
          * @param orgClsCd (기관 유형 코드 -> 'BA0301' : 중앙행정기관,
          *                       'BA0302' : 광역시도, 'BA0303' : 시군구, 'BA0304' : 교육청, 'BA0305' : 공공기관)
          * @param jrsdOrgName 소관기관 name (selectBox의 name으로 사용할 String을 넣는다.)
          * @param from 시군구시 '광역시도' 단계가 늘어나서 추가함
          */
         var selectedOrgFlag = true;
         function selectOrgClsIdlAdmStdOrgList(orgClsCd, jrsdOrgName, from) {

              var params = {
                      srchType : (from == "jrsdFsOrgCd") ? 'jrsdOrgCd' : 'jrsdFsOrgCd'
                      , codeValue : (from == "jrsdFsOrgCd") ? 'BA0303' : orgClsCd
                      , upCodeValue : (from == "jrsdFsOrgCd") ? orgClsCd : ''
                      , resultXmlNdYn : 'Y'
              };

              if (orgClsCd == "BA0303" && from != "jrsdFsOrgCd") {
                  jrsdOrgName = "jrsdFsOrgCd";
                  orgCd = '${opApiGuideVo.jrsdFsOrgCd}';
              }

              $.ajax({
                  url : '/openapi/API0004/guide.json',
                  type : 'GET',
                  data : params,
                  dataType : "json",
                  cache : false,
                  async: false,
                  success : function(data){
                      
                      var chkOrgCd = '';
                      
                      if (orgClsCd == "BA0303" && from != "jrsdFsOrgCd") {
                          chkOrgCd = '${opApiGuideVo.jrsdFsOrgCd}';
                          $('select[name=' + jrsdOrgName+ ']').html(tmpJrsdFsOrgEmptyJrsdFsOrg);
                      } else {
                          chkOrgCd = '${opApiGuideVo.jrsdOrgCd}';
                          $('select[name=' + jrsdOrgName+ ']').html(tmpJrsdOrgClsEmptyJrsdOrg);
                      }
                      
                      //기관 유형 별 행정표준기관 List html로 그린다.
                      for (var i = 0; i < data.nodeList.length; i++) {
                          
                          var selected = "";
                          if (selectedOrgFlag && chkOrgCd == data.nodeList[i].orgCode) {
                              selected = "selected='selected'";
                              if (jrsdOrgName == 'jrsdOrgCd') {
                                  selectedOrgFlag = false;
                              }
                          }
                          $('select[name=' + jrsdOrgName+ ']').append("<option value='" + data.nodeList[i].orgCode
                              + "' title='" + data.nodeList[i].orgName + "' " + selected + ">" + data.nodeList[i].orgName + "</option>");
                      }
                      
                      $('#requestInfoTitle').text(data.requestInfoTitle);
                      $('#resultXml').text(data.resultXml);
                      $('#requestUrl').html(data.requestUrl);
                  },
                  error : function(e) {
                      alert('기관 유형 별 행정표준기관 목록 조회 중 오류 발생');
                  }
              });
         };
         
         
         //소관기관유형 selectBox 선택
         $(document).on('change', 'select[name=jrsdOrgClsCd]', function() {
             var jrsdOrgClsCd = $(this).val();
             
             // 기관유형이 시군구일때 '광역시도' 보여줌
             if (jrsdOrgClsCd == "BA0303") {
                 $("select[name=jrsdFsOrgCd]").parent().removeClass("dpnone").val("ALL");
                 $('select[name=jrsdOrgCd]').html(tmpJrsdOrgClsEmptyJrsdOrg);
             } else {
                 $("select[name=jrsdFsOrgCd]").parent().addClass("dpnone").val("ALL");
             }
             
             if (jrsdOrgClsCd != "ALL") {
                 selectOrgClsIdlAdmStdOrgList(jrsdOrgClsCd, "jrsdOrgCd");
                 $('#jrsdFsOrgCd').val("ALL");
             } else {
                 $('select[name=jrsdOrgCd]').html(tmpJrsdOrgClsEmptyJrsdOrg);
             }
         });

         // 기관유형 '시군구' 일 경우 광역시도 목록 change 이벤트
         $("select[name=jrsdFsOrgCd]").change(function() {
             if ($(this).val() != "ALL") {
                 selectOrgClsIdlAdmStdOrgList($(this).val(), "jrsdOrgCd", "jrsdFsOrgCd");
                 $('#jrsdOrgCd').val("ALL");
             } else {
                 $('select[name=jrsdOrgCd]').html(tmpJrsdOrgClsEmptyJrsdOrg);    
             }
         });

         
    //]]>    
    </script>

</body>
</html>
