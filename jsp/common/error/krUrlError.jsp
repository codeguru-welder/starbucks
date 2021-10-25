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
     2015.11.24    김준           최초 생성       
     2016.11.04    최오림         행정서비스 통합제공시스템 구축(1차) 반영
 ----------------------------------------------------------------------------%>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/common/common.jsp"/>
<title>입력하신 한글주소에 해당하는 서비스를 찾을 수 없습니다.</title>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
    </header>
    
    <div class="contentsWrap" id="pageCont">
        <div class="contents">
            <div class="cont-inner error-inner">
                <div class="error-wrap">
                    <h2>입력하신 한글주소에 해당하는 서비스를 찾을 수 없습니다.</h2>
                    <p class="desc">
                        <strong>&lt;한글주소 입력방법&gt;</strong>
                        http://www.korea.go.kr + / 정부서비스 + /지역명 + /서비스명<br>
                        단, 지역명은 시군구 단위로 입력되어야 하며 시군구 구분은 슬래시(/)로 합니다.
                    </p>
                    <p class="desc">
                        <strong>&lt;올바른 한글 주소 입력 예&gt;</strong>
                        http://www.korea.go.kr/정부서비스/서울특별시/은평구/ㅇㅇ서비스<br>
                        http://www.korea.go.kr/정부서비스/전라북도/김제시/ㅁㅁ서비스<br>
                        http://www.korea.go.kr/정부서비스/부산광역시/남구/ㅅㅅ서비스
                    </p>
                    <p class="desc">정부24 홈 에서 메뉴이동을 하시거나 통합검색을 통해 원하시는 정보를 확인 하시기 바랍니다.</p>
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