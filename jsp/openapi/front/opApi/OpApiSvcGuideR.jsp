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
     2014.10.26    허은선         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <c:set var="requestUri" value="${requestScope['javax.servlet.forward.request_uri']}"/>
    <c:choose>
        <c:when test="${requestUri eq '/openapi/API0001/guide' || requestUri eq '/openapi/API0002/guide'}">
            <title>공공서비스 공동활용 | OpenAPI | 개발 가이드 | 공공서비스 목록 / 상세</title>
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
                        <li><a href="/openapi/API0001" title="API 정보">API 정보</a></li>
                        <li class="current"><a href="/openapi/API0001/guide" title="개발 가이드">개발 가이드</a></li>
                    </ul>
                </div>
                <div class="tabcontainer">
                    <h2 class="hidden">API 정보</h2>
                    <div class="tab-list">
                        <ul class="num5">
                            <c:set var="requestUri" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                            <li <c:if test="${requestUri eq '/openapi/API0001/guide' || requestUri eq '/openapi/API0002/guide'}">class="current"</c:if>><a href="/openapi/API0001/guide" title="공공서비스 목록 / 상세">공공서비스 목록 / 상세</a></li>
                            <li <c:if test="${requestUri eq '/openapi/API0003/guide'}">class="current"</c:if>><a href="/openapi/API0003/guide" title="서비스 분류">서비스 분류</a></li>
                            <li <c:if test="${requestUri eq '/openapi/API0004/guide'}">class="current"</c:if>><a href="/openapi/API0004/guide" title="소관 기관 코드">소관 기관 코드</a></li>
                        </ul>
                    </div>
                    <h3 class="hidden">공공서비스 목록/상세</h3>
                    <form:form id="opApiGuideForm" commandName="opApiGuideVo" method="GET">
                    <dl class="service-cat">
                        <dt>서비스 분류</dt>
                        <dd>
                            <span class="sbox">
                                <form:select path="lrgAstCd" title="서비스 대분류 선택" >
                                    <form:option value="" label="대분류 전체"/>
                                    <c:forEach var="nodeVo" items="${lrgAstList}" varStatus="status">
                                        <form:option value="${nodeVo.svcAstCode}" label="${nodeVo.svcAstName}" title="${nodeVo.svcAstName}"/>
                                    </c:forEach>
                                </form:select>
                            </span>
                            <span class="sbox">
                                <form:select path="mdmAstCd" title="서비스 중분류 선택" >
                                    <option value="" label="중분류 전체">중분류 전체</option>
                                </form:select>
                            </span>
                            <span class="sbox">
                                <form:select path="smallAstCd" title="서비스 소분류 선택" >
                                    <option value="" label="소분류 전체">소분류 전체</option>
                                </form:select>
                            </span>
                        </dd>
                        <dt>소관기관</dt>
                        <dd>
                            <span class="sbox">
                                <form:select path="jrsdOrgClsCd" title="기관유형 선택" >
                                    <form:option value="ALL" label="기관유형 전체"/>
                                    <c:forEach var="nodeVo" items="${jrsdOrgClsList}" varStatus="status">
                                        <form:option value="${nodeVo.orgClsCode}" label="${nodeVo.orgClsName}" title="${nodeVo.orgClsName}"/>
                                    </c:forEach>
                                </form:select>
                            </span>
                            <span class="sbox dpnone">
                                <form:select path="jrsdFsOrgCd" title="상위기관 선택" >
                                    <option value="ALL" label="상위기관 전체">상위기관 전체</option>
                                </form:select>
                            </span>
                            <span class="sbox">
                                <form:select path="jrsdOrgCd" title="소관기관 선택" >
                                    <option value="ALL" label="소관기관 전체">소관기관 전체</option>
                                </form:select>
                            </span>
                        </dd>
                        <dt>검색어</dt>
                        <dd>
                            <form:input path="srchTxt" class="inbox big long" title="검색어" placeholder="검색어를 입력하세요."/>
                            <button class="btn icon" title="검색"><span class="icon search"></span>검색</button>
                        </dd>
                    </dl><!-- End of class="service-cat" //-->

                    <h2 class="ttit">검색결과 <span class="tbl-desc">전체 
                    <c:if test="${empty pageData.list}">0</c:if>
                    <fmt:formatNumber value="${pageData.totalCount}" type="number"/>건</span></h2>
                    <div class="tbl-list">
                        <table>
                            <caption>
                                <strong>서비스 검색결과 목록</strong>
                                <span>번호, 서비스명, 서비스목적, 소관기관 항목으로 구성</span>
                            </caption>
                            <colgroup>
                                <col style="width: 10%">
                                <col style="width: 30%">
                                <col style="width: 35%">
                                <col style="width: 25%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th class="alignL">서비스명</th>
                                    <th class="alignL">서비스목적</th>
                                    <th class="alignL">소관기관</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${empty pageData.list}">
                                    <tr>
                                        <td colspan="4" class="alignC">
                                            <c:choose>
                                                <c:when test="${opApiGuideVo.resultCode ne '00'}">
                                                    검색된 서비스가 없습니다.
                                                </c:when>
                                                <c:when test="${empty opApiGuideVo.srchTxt}">
                                                    등록된 서비스가 없습니다.
                                                </c:when>
                                                <c:otherwise>
                                                    &quot;<c:out value="${opApiGuideVo.srchTxt}"/>&quot; (으)로 검색된 서비스가 없습니다.
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <view:startListNum var="startNum" pageData="${pageData}" order="desc"/>
	                                <c:forEach var="vo" items="${pageData.list}" varStatus="status">
	                                <c:set var="svcNm" value="${util:removeHtml(vo.nodeMap.svcNm)}"/>
	                                <c:set var="svcPpo" value="${util:removeHtml(vo.nodeMap.svcPpo)}"/>
                                        <tr>
                                            <td class="alignC"><view:listNum startNum="${startNum}" statusIndex="${status.index}"/></td>
                                            <td><a href="#noaction" onclick="selectSvc('${vo.nodeMap.svcId}'); return false;" title="<c:out value="${svcNm}"/>"><c:out value="${util:shortString(svcNm, 36)}" escapeXml="false"/></a></td>
                                            <td title="<c:out value="${svcPpo}"/>"><c:out value="${util:shortString(svcPpo, 46)}" escapeXml="false"/></td>
                                            <td><c:out value="${vo.nodeMap.jrsdDptAllNm}"/></td>
	                                    </tr>
	                                </c:forEach>
                                </c:otherwise>
                            </c:choose>  
                            </tbody>
                        </table>
                    </div><!-- End of class="tbl-list" //-->
                    
	                <c:if test="${fn:length(pageData.list) > 0}">
                    <view:navi id="nav" cssClass="pagination" href="/openapi/API0001/guide" page="${pageData}" pageIndex="pageIndex">    
                        <view:first img="/openapi/images/common/ico_first_01.gif" alt="맨 처음 페이지"/>
                        <view:prev img="/openapi/images/common/ico_prev_01.gif" alt="이전 페이지"/>
                        <view:pageList onCss="active" />
                        <view:next img="/openapi/images/common/ico_next_01.gif" alt="다음 페이지"/>
                        <view:last img="/openapi/images/common/ico_last_01.gif" alt="맨 마지막 페이지"/>
                    </view:navi>
	                </c:if>
                
                    <div id="divSvc" class="dpnone">
                    <h4 class="ttit">서비스 상세정보 <span class="desc">※ 해당 상세정보는 요약된 정보입니다.</span></h4>
                    <div class="tbl-col">
                        <table>
                            <caption>
                                <strong>서비스 상세정보</strong>
                                <span>서비스 명, 서비스 목적, 소관 기관 항목으로 구성</span>
                            </caption>
                            <colgroup>
                                <col style="width: 20%">
                                <col style="width: 80%">
                            </colgroup>
                            <tr>
                                <th>서비스 명</th>
                                <td><span id="spanSvcNm"></span></td>
                            </tr>
                            <tr>
                                <th>서비스 목적</th>
                                <td><span id="spanSvcPpo"></span></td>
                            </tr>
                            <tr>
                                <th>소관 기관</th>
                                <td><span id="spanJrsdDptAllNm"></span></td>
                            </tr>
                        </table>
                    </div><!-- End of class="tbl-col" //-->
                    </div>
                    
                    <h4 class="ttit" id="requestInfoTitle">${requestInfoTitle}</h4>
                    <div class="tbl-col">
                        <table>
                            <caption>
                                <strong>요청정보</strong>
                                <span>요청 URL, 결과 XML 항목으로 구성</span>
                            </caption>
                            <colgroup>
                                <col style="width: 20%">
                                <col style="width: 80%">
                            </colgroup>
                            <tr>
                                <th>요청 URL</th>
                                <td>
                                    <div id="requestUrl" class="source-box">
                                        <c:out value="${requestUrl}" escapeXml="true"/>
                                    </div>
                                </td>
                            </tr>
                            <tr id="trSvcInfoKrUrl" class="dpnone">
                                <th>한글 URL</th>
                                <td>
                                    <div id="divSvcInfoKrUrl" class="source-box">
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
                </form:form>
                
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
        
        $(document).ready(function(){
            var lrgAstCd = '${opApiGuideVo.lrgAstCd}';
            var mdmAstCd = '${opApiGuideVo.mdmAstCd}';
            var jrsdOrgClsCd = '${opApiGuideVo.jrsdOrgClsCd}';
            var jrsdOrgCd = '${opApiGuideVo.jrsdOrgCd}';
            var jrsdFsOrgCd = '${opApiGuideVo.jrsdFsOrgCd}';

            //검색 시 대분류를 선택했었다면 중분류 List를 가져온다.
            if (lrgAstCd != '') {
                selectLrLvlAstList(lrgAstCd, 'mdmAstCd', 2);
              $('#lrgAstCd').val(lrgAstCd);
            }
            //검색 시 중분류를 선택했었다면 소분류 List를 가져온다.
            if (mdmAstCd != '') {
                selectLrLvlAstList(mdmAstCd, 'smallAstCd', 3);
            }
            //검색 시 기관유형을 선택했었다면 상위기관 또는 소관기관 List를 가져온다.
            if (jrsdOrgClsCd != '' && jrsdOrgClsCd != 'ALL') {
                if (jrsdOrgClsCd == "BA0303") {
                    $("select[name=jrsdFsOrgCd]").parent().removeClass("dpnone");
                    //selectOrgClsIdlAdmStdOrgList(jrsdOrgClsCd, 'jrsdOrgCd');
                    selectOrgClsIdlAdmStdOrgList(jrsdOrgClsCd, 'jrsdFsOrgCd');
                    selectOrgClsIdlAdmStdOrgList(jrsdFsOrgCd, "jrsdOrgCd", "jrsdFsOrgCd");
                    
                } else {
                    selectOrgClsIdlAdmStdOrgList(jrsdOrgClsCd, 'jrsdOrgCd');
                }
                $('#jrsdOrgClsCd').val(jrsdOrgClsCd);
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
                 },
                 error : function(e) {
                     alert('기관 유형 별 행정표준기관 목록 조회 중 오류 발생');
                 }
             });
        };
        
        
        //하위 분류 List 가져오기 (선택한 분류 코드에 따른 하위 분류 List를 가져와서 selectBox로 목록 구성)
        //parameter : astCd (분류 코드)
        //lrAstCdName (하위 분류 코드 명(selectBox의 name으로 사용할 String을 넣는다))
        //lvl (2: 중분류 List, 3: 소분류 List)
        function selectLrLvlAstList(astCd, lrAstCdName, lvl) {
            var params = {
            	level : (lvl == 2) ? 'medium' : 'small'
                ,codeValue : astCd
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
                    if (lvl == 2) {
	                    $('select[name=' + lrAstCdName+ ']').html(tmpLrgEmptyMdmAst);
	                    srhLrLvlAstCd = '${opApiGuideVo.mdmAstCd}';
                    } else {
	                    $('select[name=' + lrAstCdName+ ']').html(tmpMdmEmptySmallAst);
	                    srhLrLvlAstCd = '${opApiGuideVo.smallAstCd}';
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
                selectLrLvlAstList(lrgAstCd, 'mdmAstCd', 2);
                $('#mdmAstCd').val("");
            //대분류 '없음' 선택 시 중분류, 소분류 List 없어야 함.
            } else {
                $('select[name=mdmAstCd]').html(tmpLrgEmptyMdmAst);
                $('select[name=smallAstCd]').html(tmpMdmEmptySmallAst);
            }
	    });
	    
		
	    //중분류 selectBox 선택
        $(document).on('change', 'select[name=mdmAstCd]', function() {
            var mdmAstCd = $(this).val();
            
            //중분류 선택 시 소분류 List 가져온다.
            if (mdmAstCd != "") {
                selectLrLvlAstList(mdmAstCd, 'smallAstCd', 3);
                $('#smallAstCd').val("");
            //중분류 '없음' 선택 시 소분류 List 없어야 함.
            } else {
                $('select[name=smallAstCd]').html(tmpMdmEmptySmallAst);
            }
        });
	  

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

        //서비스 상세조회
        function selectSvc(svcId){
            var params = {
                svcId : svcId
            };
            $.ajax({
                url : '/openapi/API0002/guide.json',
                type : 'GET',
                data : params,
                dataType : "json",
                cache : false,
                success : function(data){
                    
                    //서비스 상세정보 표시
                    $('#divSvc').removeClass("dpnone");
                    $('#trSvcInfoKrUrl').removeClass("dpnone");
                	
                    if (data.nodeList.length > 0) {
                        $("#spanSvcNm").text(data.nodeList[0].svcNm);
                        $("#spanSvcPpo").text(data.nodeList[0].svcPpo);
                        $("#spanJrsdDptAllNm").text(data.nodeList[0].jrsdDptAllNm);
                        $("#divSvcInfoKrUrl").text(data.nodeList[0].svcInfoKrUrl);
                    }else {
                    	$("#spanSvcNm").text("-");
                        $("#spanSvcPpo").text("-");
                        $("#spanJrsdDptAllNm").text("-");
                        $("#divSvcInfoKrUrl").text("-");
                    }
                    
                    $('#resultXml').text(data.resultXml);
                    $('#requestUrl').html(data.requestUrl);
                    $('#requestInfoTitle').text(data.requestInfoTitle);

                },
                error : function(e){
                    alert("상세 조회 중 오류가 발생하였습니다.");
                }
            });
        }
 
    //]]>    
    </script>

</body>
</html>
