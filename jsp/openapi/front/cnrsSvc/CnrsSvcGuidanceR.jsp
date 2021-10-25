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
     2014.09.24    허은선         최초 생성       
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
    <jsp:include page="/WEB-INF/jsp/openapi/common/common.jsp"/>
    <title>공공서비스 공동활용 | 공공서비스 공유신청</title>
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
                <h2 class="ttit bbor">공공서비스 공유 신청이란?</h2>
                
                <div class="para">
                    <p>각 기관이나 단체에서 보유하고 있는 공공서비스 목록을 공유해주세요.<br>
                    공유해주신 서비스는 공동활용시스템을 통해 공공서비스 입력창구에서 활용할 수 있도록 변환됩니다.</p>
                </div>

                <h2>공공서비스 공유 신청 절차</h2>
                <div class="share-app-process-wrap">
                    <div class="share-app-process">
                        <ol>
                            <li class="step1">
                                <div>
                                    <strong>STEP 1</strong>
                                    <p>표준서식(엑셀) 다운로드<br/>&lt;사용자&gt;</p>
                                </div>
                            </li>
                            <li class="step2">
                                <div>
                                    <strong>STEP 2</strong>
                                    <p>공공서비스 공유 신청<br/>&lt;사용자&gt;</p>
                                </div>
                            </li>
                            <li class="step3">
                                <div>
                                    <strong>STEP 3</strong>
                                    <p>데이터로 변환<br/>&lt;행정안전부&gt;</p>
                                </div>
                            </li>
                        </ol>
                    </div>
                </div>
                
                <div class="btn-list">
                    <a href="/openapi/service/sharing/request" class="btn lg red" title="신청">신청</a>
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
