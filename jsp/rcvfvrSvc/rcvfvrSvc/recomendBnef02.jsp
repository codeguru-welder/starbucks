<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
	<title>추천혜택 상세 | 서비스 찾기 | 보조금24</title>
</head>

<body>
	<div class="skip-nav">
	    <a href="#content" class="skip-nav__item">본문바로가기</a>
	    <a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
	</div>
	<div id="wrap">
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp" >			
			<jsp:param name="gnb" value="intrcn" />
		</jsp:include>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" />
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
			<jsp:param name="gnb" value="intrcn" />
			<jsp:param name="mnb" value="recomendBnef" />
			<jsp:param name="svcId" value="2" />
		</jsp:include>

	    <div id="content" class="web-content service-typeA">
	        <div class="container">
	            <div class="recommend recommend--type02">
	                <div class="recommend__top">
	                    <div class="recommend__title">
	                        <span>출산 후 몸조리에 더욱</span><br class="mobile"><span> 집중할 수 있었어요</span>
	                    </div>
	                    <div class="recommend__sub-text">
	                        나도 엄마가 처음이에요 <span>30세 이*주씨</span>
	                    </div>
	                </div>
	                <div class="recommend__content">
	                    <div class="recommend-qna">
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">간단한 자기소개 부탁드립니다.</div>
	                            <div class="recommend-qna__answer">한 달 전 건강한 아들을 순산한 30세 초보엄마 이*주입니다.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">정부 혜택에 관심을 갖게 된 계기가 있나요?</div>
	                            <div class="recommend-qna__answer">아무래도 아이가 들어서면서 직장을 그만두게 됐는데, 한 푼이라도 절약할 수 없을까 고민하다보니 자연스레 관심을 가질수밖에 없었어요. 저희 남편이 워낙 꼼꼼한 편이라, 저보다 더 살림을 잘 챙기고 정보에도 밝은데요. 온갖 정부 혜택을 다 알아오더라고요. 물론 저도 맘카페에서 귀동냥으로 듣는 정보들도 많긴 했죠.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">나에게 가장 도움이 된 혜택은 무엇이었나요?</div>
	                            <div class="recommend-qna__answer"><span>행복출산 원스톱 서비스</span>가 가장 기억에 남아요. 출생신고 하는 김에 동사무소에서 신청을 했었는데요. 양육수당, 아동수당, 전기료 경감, 출산장려금, 출산축하선물, 기저귀바우처까지 출산 후 받을 수 있는 복지 서비스를 한 번에 받을 수 있어서 좋았어요. 더욱 맘편하게 몸조리에만 집중할 수 있는 여유가 생겼죠.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">보조금24 이용 소감을 말씀해주세요.</div>
	                            <div class="recommend-qna__answer">사실 엄마들이 이런 국가 지원 서비스를 잘 찾고 이용한다고 알 수도 있지만 제가 그런 정보에는 조금 무딘 편이거든요. 보조금24 이용해보니 저같은 사람에게 딱 맞는 느낌이랄까. 여기저기 안돌아다녀도 한 눈에 보여주니까 너무 편하고 좋아요.</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="button-wrap">	                
	                <div class="float-right">
	                    <a href="/portal/rcvfvrSvc/recomendBnef/1" class="button button-board button--prev"><span>이전</span></a>
	                    <a href="/portal/rcvfvrSvc/recomendBnef/3" class="button button-board button--next"><span>다음</span></a>
	                </div>
	                <div class="float-left">
	                    <a href="/portal/rcvfvrSvc/recomendBnef" class="button button-board button--list"><span>목록</span></a>
	                </div>
	            </div>
	        </div>
	    </div>
	    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
	</div>
</body>
</html>
