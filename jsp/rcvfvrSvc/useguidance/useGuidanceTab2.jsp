<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
<title>간편찾기 이용하기 | 이용안내 | 보조금24</title>

</head>
<body>
	<div class="skip-nav">
		<a href="#content" class="skip-nav__item">본문바로가기</a>
		<a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
	</div>

	<div id="wrap">
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp">
			<jsp:param name="gnb" value="useguidance" />
		</jsp:include>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" /> 
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
			<jsp:param name="gnb" value="useguidance" />
			<jsp:param name="mnb" value="useGuidance2" />
		</jsp:include>
		
		<div id="content" class="web-content">
	        <div class="container container--full background-skyblue">
	            <div class="container">
	                <div class="common-background visual-box visual-box--guide2">
	                    <div class="visual-box__inner">
	                        <!-- 210412 텍스트 수정 -->
	                        <div class="visual-box__title"><strong>간편찾기를 이용</strong>하여 <strong>혜택을 찾아</strong>보세요.</div>
	                        <div class="visual-box__text">연령, 소득별, 개인가구특성 정보를 선택하여 정부지원 혜택을 찾을 수 있습니다.</div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="container">
	            <div class="simple-guide__wrap">
	                <div class="simple-guide__left mobile">
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_simple_use1_mo.png" alt="간편하게 혜택 찾기 mobile-version"></div>
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_simple_use2_mo.png" alt="단계별 조건을 선택 mobile-version"></div>
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_simple_use3_mo.png" alt="간편혜택 결과 확인 mobile-version"></div>
	                </div>
	                <div class="simple-guide__left pc">
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_simple_use1_pc.png" alt="간편하게 혜택 찾기 pc-version"></div>
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_simple_use2_pc.png" alt="단계별 조건을 선택 pc-version"></div>
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_simple_use3_pc.png" alt="간편혜택 결과 확인 pc-version"></div>
	                </div>
	                <div class="simple-guide__right">
	                    <div class="simple-guide__box">
	                        <span class="simple-guide__number">1</span>
	                        <div class="simple-guide__desc">
	                            <span class="simple-guide__title">간편하게 혜택 찾기</span>
	                            <p class="simple-guide__text">혜택찾기 > 간편찾기 메뉴에서 이용할 수 있습니다.</p>
	                        </div>
	                    </div>
	                    <div class="simple-guide__box">
	                        <span class="simple-guide__number">2</span>
	                        <div class="simple-guide__desc">
	                            <span class="simple-guide__title">단계별 조건을 선택</span>
	                            <p class="simple-guide__text">성별/연령대 > 소득구간 > 개인특성 > 가구특성을<br> 순차 선택, 맞춤혜택을 확인할 수 있습니다.</p>
	                        </div>
	                    </div>
	                    <div class="simple-guide__box">
	                        <span class="simple-guide__number">3</span>
	                        <div class="simple-guide__desc">
	                            <span class="simple-guide__title">간편혜택 결과 확인</span>
	                            <p class="simple-guide__text">안내된 혜택의 상세 정보를 확인하세요.</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>

    	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
	</div>

</body>
</html>
