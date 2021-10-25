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
    2015.09.15    김준         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <title>공공서비스 공동활용 | 기관선택 팝업</title>
</head>
<body id="pop">
    <div class="pop-wrap">
        <h1>기관선택</h1>
        <div class="pop-contents">
            <div class="search-box">
                <form:form commandName="admStdOrgVo" method="get">
                    <span class="sbox" style="width: 183px;">
                        <form:select path="srchOrgClsCd" title="기관유형 선택" >
                            <c:forEach var="cdVo" items="${orgClsCdList}" varStatus="status">
                                <form:option value="${cdVo.cd}" label="${cdVo.cdNm}" title="${cdVo.cdNm}"/>
                            </c:forEach>
                            <form:option value="000000" title="직접입력" label="직접입력"/>
                        </form:select>
                    </span>
                    <span id="spanOrgClsCd" class="sbox" style="width: 161px; display: none;">
                        <form:select path="orgClsCd" title="상위기관 선택" >
                            <form:option value="all" title="상위기관 전체" label="상위기관 전체"/>
                            <c:forEach var="cdVo" items="${admStdOrgList}" varStatus="status">
		                        <form:option value="${cdVo.orgCd}" label="${cdVo.orgNm}" title="${cdVo.orgNm}"/>
		                    </c:forEach>
                        </form:select>
                    </span>
                    <form:input path="srchTxt" maxlength="100" title="검색어" cssClass="inbox big pop default-korean" placeholder="검색어를 입력하세요." cssStyle="width: 167px;"/>
                    <input id="typedOrgNm" maxlength="100" title="검색어" class="inbox big pop default-korean" placeholder="기관명을 입력하세요." style ="width: 254px; display: none;" onkeypress="if(event.keyCode == 13){clickSetOrgBtn();}"/>
                    <button id="search_button" class="btn icon" title="기관검색"><span class="icon search"></span>검색</button>
                </form:form>
            </div>

            <div class="scroll">
                <div class="tbl-list cellC">
                    <table>
                        <caption>
                            <strong>기관 목록조회</strong>
                            <span>검색된 기관명과 기관을 선택할 수 있습니다.</span>
                        </caption>
                        <colgroup>
                                <col width="10%" />
                                <col width="80%" />
                                <col width="10%" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>기관명</th>
                                <th>선택</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty rpOrgList}">
                                    <tr>
                                        <td colspan="3">검색된 기관이 없습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="map" items="${rpOrgList}" varStatus="status">
                                        <tr>
                                            <td>${status.index +1}</td>
                                            <td><label for="radio${status.index}"><c:out value="${map['title']}"/></label></td>
                                            <td>
                                                <input type="hidden" id="orgCd_${status.index}" value="${map['key']}"/>
                                                <input type="hidden" id="orgNm_${status.index}" value="${map['title']}"/>
                                                <input type="radio" name="orgCheck" id="radio${status.index}" value="${status.index}" title="${map['title']} 선택">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="btn-list">
                <a href="#noaction" class="btn lg red" onclick="return setOrgPopup($.getUrlVar('namespace'))" title="선택"><span id="setOrgBtn">선택</span></a>
                <a href="#noaction" class="btn lg gray" onclick="window.close();" title="취소">취소</a>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>

    <script type="text/javascript">
    //<![CDATA[

    $(document).ready(function() {
        var paramOrgClsCd = '${param.srchOrgClsCd}'; 
        if(paramOrgClsCd != '') {
            if(paramOrgClsCd == 'BA0303') {
                displayBA0303();
            } else if ((paramOrgClsCd != 'BA0303')){
                displayNotBA0303();
            }
        }
        
        // 검색 조건의 기관 유형 선택
        $('#srchOrgClsCd').change(function() {
            if ($('#srchOrgClsCd').val() == '000000') { //직접입력일 경우
                $('#srchTxt').css('display', 'none');
                $('#spanOrgClsCd').css('display', 'none');
                $('#search_button').css('display', 'none');
                $('#typedOrgNm').css('display', '');
                $('tbody').empty();
                $('tbody').html('<tr><td colspan="3">기관명을 입력하고 아래 선택버튼을 클릭하세요.</td></tr>');
            } else if ($('#srchOrgClsCd').val() == 'BA0303') { //시군구일 경우
                displayBA0303();
            } else if ($('#srchOrgClsCd').val() != 'BA0303') { //시군구가 아닐 경우
                displayNotBA0303()    
            }
        });
    });
    
    function displayBA0303() {
        $('#srchTxt').css('display', 'none');
        $('#typedOrgNm').css('display', 'none');
        $('#spanOrgClsCd').css('display', '');
        $('#search_button').css('display', '');
    }

    function displayNotBA0303() {
        $('#spanOrgClsCd').css('display', 'none');
        $('#typedOrgNm').css('display', 'none');
        $('#srchTxt').css('display', '');
        $('#search_button').css('display', '');
        $('#orgClsCd').val('all');
    }
    
    // 기관 선택
    function setOrgPopup(_namespace) {
        
        var orgCd = '', orgNm = '';
        
        if ($("input:radio[name='orgCheck']").is(':checked')) {
            var idx = $("input:radio[name='orgCheck']:checked").val();
            orgCd = $('#orgCd_' + idx).val();
            orgNm = $('#orgNm_' + idx).val();
        } else {
            if ($('#srchOrgClsCd').val() == '000000') {
                orgNm = $('#typedOrgNm').val();
            }
            
            if (orgNm == '') {
                if ($('#srchOrgClsCd').val() == '000000') {
                    alert('입력된 기관이 없습니다.');
                } else {
                    alert('선택된 기관이 없습니다.');
                    
                }
                return false;
            }
        }
        
        var namespace = window.opener[_namespace] || window.opener;
        if (namespace.setRpOrg === 'undefined') {
            alert('부모 페이지에 함수가 존재하지 않습니다.');
            return false;
        } else {
            namespace.setRpOrg({
                orgCd : orgCd,
                orgNm : orgNm,
            }, $.getUrlVar('target'));
            window.close();
        };
    };
    
    //직접입력 시 Enter Key 기능 - 선택버튼 클릭
    function clickSetOrgBtn(){
        $('#setOrgBtn').click();
    }
    //]]>
    </script>
</body>
</html>