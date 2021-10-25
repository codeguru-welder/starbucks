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
     2015.10.14    최오림         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>

    <title>공공서비스 공동활용 | 제휴 문의 | 등록</title>
    
    <style type="text/css">
        .error {color:red !important;}
    </style>
</head>
<body>
    <div class="wrapper">

    <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
        <jsp:param name="gnb" value="useExam"/>
        <jsp:param name="snb" value="svcCoprtn"/>
    </jsp:include>
    
        <div class="cont-box">
            <div class="cont-inner" id="contents">

    <!-- Start Page -->   
                <h1>활용사례</h1>

                <div class="tabmenu">
                    <ul class="tab">
                        <li><a href="/openapi/useExam">OpenAPI 활용</a></li>
                        <!-- <li class="current"><a href="/openapi/svcCoprtn/insert">제휴문의</a></li> -->
                    </ul>
                </div>
                <div class="tabcontainer partnership">
                    <div class="ask-info">
                        <p>정부24에서 제공하는 정부의 모든 정책서비스를 위젯으로 제공해드립니다.</p>
                        <ul>
                            <li>
                                <p>전화문의</p>
                                <p><strong>070-4667-2584</strong> (평일 09:00 ~ 18:00)</p>
                            </li>
                            <li>
                                <p>이메일문의</p>
                                <p><a href="mailto:gov24@korea.kr"><strong>gov24@korea.kr</strong></a></p>
                            </li>

                        </ul>
                    </div>
                    <h2>제휴 문의</h2>
	                <c:if test="${not empty message}">
	                   <h2 class="error">${message}</h2>
	                </c:if>
	              
	                <form:form commandName="svcCoprtnVo" method="POST">
	                    <form:hidden path="coprtnYn"/>
	                    <div class="tbl-col">
	                        <table>
	                            <caption>
	                                <strong>서비스 제휴 문의</strong>
	                                <span>사이트(기관)명, 전화번호, 사이트주소(URL), 제휴 요청 내용 항목으로 구성</span>
	                            </caption>
		                        <colgroup>
		                            <col style="width: 15%">
		                            <col style="width: 35%">
                                    <col style="width: 15%">
                                    <col style="width: 35%">
		                        </colgroup>
	                            <tr>
	                                <th><label for="coprtnOrgNm" class="required">사이트(기관)명</label></th>
	                                <td>
	                                    <form:input path="coprtnOrgNm" cssClass="inbox full default-korean" maxlength="100"/>
	                                    <form:errors path="coprtnOrgNm" cssClass="error"/>
	                                </td>
	                                <th><label for="coprtnOrgTelNo" class="required">전화번호</label></th>
	                                <td>
	                                    <form:input path="coprtnOrgTelNo" cssClass="inbox full" maxlength="30" placeholder="ex. 02-2100-0000"/>
	                                    <form:errors path="coprtnOrgTelNo" cssClass="error"/>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th><label for="coprtnOrgSiteUrl" class="required">사이트주소(URL)</label></th>
	                                <td colspan="3">
	                                    <form:input path="coprtnOrgSiteUrl" cssClass="inbox full default-english" maxlength="500" placeholder="http://"/>
	                                    <form:errors path="coprtnOrgSiteUrl" cssClass="error"/>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th><label for="coprtnRequstCts" class="required">제휴 요청 내용</label></th>
	                                <td colspan="3">
	                                    <form:textarea path="coprtnRequstCts" rows="4" cssClass="inbox full default-korean" maxlength="2000"/>
	                                    <form:errors path="coprtnRequstCts" cssClass="error"/>
	                                </td>
	                            </tr>        
	                        </table>
	                    </div>
	                    <div class="btn-list alC">
	                        <input class="btn lg red" type="submit" value="신청" title="신청"/>
	                    </div>
	                </form:form>

                    <h2>제휴 활용 방법</h2>
                    <div class="partnership-info">
                        <div class="basic">
                            <strong>기본형 : 검색툴 제공</strong>
                            <p>정부24의 모든 정책서비스를 검색할 수 있도록 하는 검색창을 제공합니다.<br/>
                               누구나 정부24의 검색창을 홈페이지 및 고유 서비스에 활용할 수 있습니다.</p>
<code>
	<textarea>
		<script>
		   (function() {
		       var sw = document.createElement('script');
		       sw.id = '__kpse_script__';
		       sw.type = 'text/javascript';
		       sw.async = true;
		       sw.src = 'http://www.gov.kr/js/kpse_widget.js?r=' + (Math.random() * 10) + '&tp=0000';
		       var s = document.getElementsByTagName('script')[0];
		       s.parentNode.insertBefore(sw, s);
		   })();
		</script>
		<div id="__kpse_search__"></div>
	</textarea>
</code>
                            <div class="btn-list alC">
                                <span class="imgBtn light"><a href="#" onclick="copySource(); return false;">소스 복사하기</a></span>
                            </div>
                        </div>
                        <div class="example">
                            <strong>사용예시</strong>
                            <p><img src="/openapi/images/partner/partner_ex01.jpg" alt="사용예시"></p>
                        </div>
                    </div>
                    <p><strong>맞춤형 : 검색툴(통합, 분야별), 추천공공서비스</strong></p>
                    <p>공공서비스를 제공하고자 하는 사이트의 성격 및 기능에 맞는 맞춤형 공공서비스와 검색툴을 제공할 수 있습니다.</p>
                    <ul class="ex-capture">
                        <li>
                            <img src="/openapi/images/partner/partner_ex02.jpg" alt="예시 : 육아정보사이트">
                            <p>예시 : 육아정보사이트 > <strong>육아 검색 위젯</strong> 제공</p>
                        </li>
                        <li>
                            <img src="/openapi/images/partner/partner_ex03.jpg" alt="예시 : 민원24">
                            <p>예시 : 민원24 > <strong>검색툴 + 추천공공서비스</strong> 제공</p>
                        </li>
                    </ul>
                    <h2>제휴처</h2>
                    <div class="partner-list">
                        <ul>
                            <!-- <li><a href="http://www.mosf.go.kr" target="_blank" title="기획재정부 새창으로 열림"><img src="/openapi/images/partner/partner_03.jpg" alt="기획재정부"></a></li> -->
                            <li><a href="http://www.duo.co.kr" target="_blank" title="듀오 한국대표 결혼정보회사 새창으로 열림"><img src="/openapi/images/partner/partner_01.jpg" alt="듀오"></a></li>
                            <li><a href="http://www.boram.com/main.do" target="_blank" title="보람상조 새창으로 열림"><img src="/openapi/images/partner/partner_11.jpg" alt="보람상조"></a></li>
                            <li><a href="http://www.momsdiary.co.kr" target="_blank" title="진짜엄마의시작 맘스다이어리 새창으로 열림"><img src="/openapi/images/partner/partner_07.jpg" alt="맘스다이어리"></a></li>
                            <li><a href="http://www.jeonbuk.go.kr" target="_blank" title="전라북도 새창으로 열림"><img src="/openapi/images/partner/partner_05.jpg" alt="전라북도"></a></li>
                            <li><a href="http://www.gen.go.kr/main/main.php" target="_blank" title="광주광역시 교육청 새창으로 열림"><img src="/openapi/images/partner/partner_08.jpg" alt="광주광역시 교육청"></a></li>
                            <!-- <li><a href="http://kdic.or.kr/" target="_blank" title="예금보험공사 새창으로 열림"><img src="/openapi/images/partner/partner_06.jpg" alt="예금보험공사"></a></li> -->
                            <!-- <li><a href="http://www.worktv.or.kr" target="_blank" title="한국직업방송 새창으로 열림"><img src="/openapi/images/partner/partner_04.jpg" alt="한국직업방송"></a></li> -->
                            <!-- <li><a href="http://www.kmdianews.com/" target="_blank" title="의료기기뉴스라인 새창으로 열림"><img src="/openapi/images/partner/partner_10.jpg" alt="의료기기뉴스라인"></a></li> -->
                            <li><a href="http://www.youthpress.net/xe/" target="_blank" title="대한민국청소년 기자단 새창으로 열림"><img src="/openapi/images/partner/partner_09.jpg" alt="대한민국청소년 기자단"></a></li>
                            
                            <!-- 새로운 위젯이 추가되도 GKL위젯은 항상 마지막 고정!!  -->
 							<!-- <li><a href="http://www.grandkorea.com " target="_blank" title="GKL그랜드코리아레저 새창으로 열림"><img src="/openapi/images/partner/partner_02.jpg" alt="GKL"></a></li> -->
 						</ul>
                    </div>
                </div>
                
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
$(document).ready(function() {
    $.validator.addMethod('telRule', function(value, element) {
        return value.length == 0 ? true : value.match(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/);
    }, '전화번호 형식에 맞지 않습니다.');
 
    $('#svcCoprtnVo').validate({
        onkeyup : false,
        rules : {
            // 사이트(기관)명
            coprtnOrgNm : {required : true},
            // 사이트주소(URL)
            coprtnOrgSiteUrl : {required : true},
            // 제휴 요청 내용
            coprtnRequstCts : {required : true},
            // 전화번호
            coprtnOrgTelNo : {required : true, telRule : true}
        },
        messages : {},
        submitHandler : function(frm) {
            frm.submit();
        }
    });    
});  

/* code 복사 */
var searchSrc="<script>\r\n" +
"   (function() {\r\n" +
"       var sw = document.createElement('script');\r\n" +
"       sw.id = '__kpse_script__';\r\n" +
"       sw.type = 'text/javascript';\r\n" +
"       sw.async = true;\r\n" +
"       sw.src = 'http://www.gov.kr/js/kpse_widget.js?r=' + (Math.random() * 10) + '&tp=0000';\r\n" +
"       var s = document.getElementsByTagName('script')[0];\r\n" +
"       s.parentNode.insertBefore(sw, s);\r\n" +
"   })();\r\n" +
"<"+"/script>\r\n" +
"<div id=\"__kpse_search__\"></div>\r\n";

/* 소스 복사 */
function copySource() {
    var IE = false;
    // IE 체크
    if ( document.all || navigator.userAgent.match(/Trident\/7\./) ) {
        IE = true;
    }
    if ( IE ) {
        if ( confirm("클립보드에 복사하시겠습니까?") ) {
            window.clipboardData.setData("Text", searchSrc);
        }
    } else {
        temp = prompt("Ctrl+C를 눌러 클립보드에 복사하세요", searchSrc);
    }
    return false;
}

//]]>
</script>

</body>
</html>