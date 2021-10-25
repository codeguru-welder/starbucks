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
     2015.11.24    허은선         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>

    <title>공공서비스 공동활용 | 활용사례</title>
    
    <style type="text/css">
        a[href$='.xls']:before { display:none; }
    </style>
</head>
<body>
    <div class="wrapper">

    <jsp:include page="/WEB-INF/jsp/openapi/common/header.jsp">
        <jsp:param name="gnb" value="useExam"/>
    </jsp:include>
    
        <div class="cont-box">
            <div class="cont-inner" id="contents">
            
    <!-- Start Page -->         
                <h1>활용사례</h1>


                <div class="tabmenu">
                    <ul class="tab">
                        <li class="current"><a href="/openapi/useExam">OpenAPI 활용</a></li>
                        <!-- <li><a href="/openapi/svcCoprtn/insert">제휴문의</a></li> -->
                    </ul>
                </div>
                <div class="tabcontainer">
                    <h2 class="ttit bbor">공공서비스 분류별 활용
                        <span>정부24의 공공서비스는 12개 대분류를 기준으로 제공되며 각 대분류는 중,소분류로 세분화되어 있습니다.<br/>각 분야별로 희망하는 분야의 공공서비스를 선별하여 공공서비스를 활용할 수 있습니다.</span>
                        <!-- <span>공공서비스는 18개 분류로 제공되고, 각 분류는 중분류, 소분류로 세분화되어 있습니다.<br/>사용자는 적용하고자 하는 시스템의 특성에 맞는 공공서비스를 선별하여 맞춤형 공공서비스를 실시간으로 제공할 수 있습니다.</span> -->
                    </h2>

                    <h4 class="ttit icon">육아관련 시스템 활용예시 <span class="imgBtn light icon"><span class="searchorg"></span><a href="/portal/service/category" target="_blank" title="공공서비스 분류 보기 새창으로 열림">공공서비스 분류 보기</a></span></h4>
                    <div class="ex-desc">
                        <div class="ex"><img src="/openapi/images/partner/ex_01.jpg" alt="육아관련 시스템 활용예시"></div>
                        <!-- <div class="desc">
                            <p>정부24의 공공서비스는 18개 대분류를 기준으로 제공되며 각 대분류는 중,소분류로 세분화되어 있습니다. 각 분야별로 희망하는 분야의 공공서비스를 선별하여 공공서비스를 활용할 수 있습니다.
                            </p>
                            <div class="dir">
                                <p>* 육아 관련 분야:</p>
                                <ul>
                                    <li>출생과 사망 > 임신과 출생 > 임산부지원</li>
                                    <li>출생과 사망 > 임신과 출생 > 예비부모건강</li>
                                    <li>출생과 사망 > 임신과 출생 > 출산비용지원</li>
                                    <li>출생과 사망 > 임신과 출생 > 출생</li>
                                    <li>출생과 사망 > 임신과 출생 > 입양과 파양</li>
                                </ul>
                            </div>
                        </div> -->
                    </div>

                    <h4 class="ttit icon">종합병원 시스템 활용예시</h4>
                    <div class="ex-desc">
                        <div class="ex"><img src="/openapi/images/partner/ex_02.jpg" alt="종합병원 시스템 활용예시"></div>
                        <!-- <div class="desc">
                            <p>정부24의 공공서비스는 18개 대분류를 기준으로 제공되며 각 대분류는 중,소분류로 세분화되어 있습니다. 각 분야별로 희망하는 분야의 공공서비스를 선별하여 공공서비스를 활용할 수 있습니다.
                            </p>
                            <div class="dir">
                                <p>* 육아 관련 분야:</p>
                                <ul>
                                    <li>출생과 사망 > 임신과 출생 > 임산부지원</li>
                                    <li>출생과 사망 > 임신과 출생 > 예비부모건강</li>
                                    <li>출생과 사망 > 임신과 출생 > 출산비용지원</li>
                                    <li>출생과 사망 > 임신과 출생 > 출생</li>
                                    <li>출생과 사망 > 임신과 출생 > 입양과 파양</li>
                                </ul>
                            </div>
                        </div> -->
                    </div>

                    <br/>
                    <h2 class="ttit bbor">지역, 기관별 활용
                        <span>정부24에서는 중앙행정기관 및 지방자치단체, 공공기관에서 국민들에게 혜택을 제공하는 공공서비스 정보를 OpenAPI로 제공하고 있습니다.<br/>기관코드(행정표준코드)를 활용하여 원하는 지역별, 기관별로 공공서비스를 활용할 수 있습니다.</span>
                    </h2>
                    <h4 class="ttit icon">구청 시스템 활용예시</h4>
                    <div class="ex-desc">
                        <div class="ex"><img src="/openapi/images/partner/ex_03.jpg" alt="구청 시스템 활용예시"></div>
                        <div class="desc">
                            <div class="dir">
                                <p>* 공공서비스 등록 기관</p>
                                <ul>
                                    <li>보건복지부, 여성가족부 등 51개 중앙행정기관</li>
                                    <li>서울특별시, 경기도 등 17개 광역시도</li>
                                    <li>서울시 은평구 등 226개 기초자치단체</li>
                                    <li>기타 공공기관 316개 이상</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
    <!-- End Page //-->             
            </div><!-- End of class="cont-inner" //-->
        </div><!-- End of class="cont-box-box" //-->

    <jsp:include page="/WEB-INF/jsp/openapi/common/footer.jsp"/>

    </div><!-- End of class="wrapper" //-->

    <script type="text/javascript" src="/openapi/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/openapi/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/openapi/js/jquery.validate.messages_ko.js"></script>
    <script type="text/javascript" src="/openapi/js/default.js"></script>

</body>
</html>