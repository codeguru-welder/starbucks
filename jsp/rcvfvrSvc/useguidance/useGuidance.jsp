<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
<title>나의 혜택 이용하기 | 이용안내 | 보조금24</title>

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
			<jsp:param name="mnb" value="useGuidance1" />
		</jsp:include>
		
		<div id="content" class="web-content">
	        <div class="container container--full background-skyblue">
	            <div class="container">
	                <div class="common-background visual-box visual-box--guide">
	                    <div class="visual-box__inner">
	                        <div class="visual-box__title"><strong>나의 맞춤혜택</strong>을 <strong>찾아</strong>보세요.</div>
	                        <!-- 210412 텍스트 수정 -->
	                        <div class="visual-box__text">내가 받을 수 있는 정부혜택 확인 및 신청방법을 알려드립니다.</div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="container">
	            <div class="simple-guide__wrap">
	                <div class="simple-guide__left mobile">
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_benefit_use1_mo.png" alt="보조금24 이용 동의 mobile-version"></div>
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_benefit_use2_mo.png" alt="나의 맞춤혜택 확인 mobile-version"></div>
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_benefit_use3_mo.png" alt="일부 온라인신청 기능 mobile-version"></div>
	                </div>
	                <div class="simple-guide__left pc">
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_benefit_use1_pc.png" alt="보조금24 이용 동의 pc-version"></div>
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_benefit_use2_pc.png" alt="나의 맞춤혜택 확인 pc-version"></div>
	                    <div class="simple-guide__img"><img src="/rcvfvrSvc/images/C/img_benefit_use3_pc.png" alt="일부 온라인신청 기능 pc-version"></div>
	                </div>
	                <div class="simple-guide__right">
	                    <div class="simple-guide__box">
	                        <span class="simple-guide__number">1</span>
	                        <div class="simple-guide__desc">
	                            <span class="simple-guide__title">보조금24 이용 동의</span>
	                            <p class="simple-guide__text">'보조금24'메뉴 접속 시 이용 동의 후 맞춤혜택을<br class="mobile"> 확인할 수<br class="pc"> 있습니다.(최초 1회)</p>
	                        </div>
	                    </div>
	                    <div class="simple-guide__box">
	                        <span class="simple-guide__number">2</span>
	                        <div class="simple-guide__desc">
	                            <span class="simple-guide__title">나의 맞춤혜택 확인</span>
	                            <p class="simple-guide__text">받을 수 있고, 받고 있는 혜택을 확인할 수 있습니다.</p>
	                        </div>
	                    </div>
	                    <div class="simple-guide__box">
	                        <span class="simple-guide__number">3</span>
	                        <div class="simple-guide__desc">
	                            <span class="simple-guide__title">일부 온라인신청 기능</span>
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
