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
     2015.11.23    최오림         최초 생성       
     2016.11.04    최오림         행정서비스 통합제공시스템 구축(1차) 반영
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/common/common.jsp"/>
<title>요청하신 페이지에 오류가 발생 하였습니다.</title>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
    </header>
    
    <div class="contentsWrap" id="pageCont">
        <div class="contents">
            <div class="cont-inner error-inner">
                <div class="error-wrap">
                    <h2>죄송합니다.<br>파일 업로드 중 오류가 발생하였습니다.</h2>
                    <p class="desc">허용되지 않은 형식의 파일이거나 허용된 최대 용량을 넘었습니다.</p>
                    <p class="desc">허용 가능한 파일의 확장자는 hwp, doc, docx, xls, xlsx, pdf, ppt, pptx, zip, jpg, jpeg, gif, png, txt 입니다.</p>
                    <p class="desc">허용 가능한 최대 용량은 100M 입니다.</p>
                </div>
                <p class="btns center type1">
                    <span class="ibtn large dark line">
                        <a href="#none" onclick="history.back(); return false;">이전화면</a>
                    </span>
                    <span class="ibtn large dark">
                        <a href="/portal/main">정부24</a>
                    </span>
                </p>
            </div>
        </div>
    </div>
    
        <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>