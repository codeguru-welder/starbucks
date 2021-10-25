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
     2015.12.07    황평수         최초 생성       
     2016.11.04    최오림         행정서비스 통합제공시스템 구축(1차) 반영
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/common/common.jsp"/>
<title>서비스를 찾을 수 없습니다.</title>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
    </header>
    
    <div class="contentsWrap" id="pageCont">
        <div class="contents">
            <div class="cont-inner error-inner">
                <div class="error-wrap">
                    <h2>서비스를 찾을 수 없습니다.</h2>
                    <p class="desc"><c:out value="${errorMessage}"/> 상태의 서비스입니다.<br/>정부24 홈 에서 메뉴이동을 하시거나 통합검색을 통해 원하시는 정보를 확인 하시기 바랍니다.</p>
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