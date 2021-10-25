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
			<jsp:param name="svcId" value="1" />
		</jsp:include>

    	<div id="content" class="web-content service-typeA"> <!-- 210203 service-typeA class 추가 -->
	        <div class="container">
	            <div class="recommend recommend--type01">
	                <div class="recommend__top">
	                    <div class="recommend__title">
	                        <span>취업에 대한 조급증을</span><br class="mobile"><span> 내려놓게 됐죠</span>
	                    </div>
	                    <div class="recommend__sub-text">
							취업준비 중인 <span>27세 신*영씨</span>
	                    </div>
	                </div>
	                <div class="recommend__content">
	                    <div class="recommend-qna">
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">간단한 자기소개 부탁드립니다.</div>
	                            <div class="recommend-qna__answer">안녕하세요! 취업을 준비 중인 당당한 백수 신*영입니다.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">정부 혜택에 관심을 갖게 된 계기가 있나요?</div>
	                            <div class="recommend-qna__answer">졸업하면 취업은 어떻게든 되겠지 했는데, 생각보다 취준 기간이 길어져서 마음이 조급했어요. 친구들은 대기업에 척척 붙는데, 저만 낙오되는 느낌이 들어 우울해지기도 했고요. 답답한 마음에 웹서핑만 주구장창 하다가 우연히 청년들을 위한 혜택이 많다는 것을 발견했어요.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">나에게 가장 도움이 된 혜택은 무엇이었나요?</div>
	                            <div class="recommend-qna__answer">단연 서울시 <span>청년수당</span>이죠. 6개월 동안 매달 50만원을 받을 수 있다고 생각하니 심리적으로 여유가 생기고 뭔가 해보겠다는 의욕도 강해졌어요. 야심차게 시작한 유튜브가 예상 외로 큰 인기를 끌면서 광고 제안을 받기도 했고요. 취업의 길만 생각했는데, 유튜버로서의 길도 생각해보게 된 계기가 됐어요. <br>개인적으로 청년수당이라는 제도는 미래를 고민하는 청년들에게 아주 좋은 기회라고 생각해요.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">보조금24 이용 소감을 말씀해주세요.</div>
	                            <div class="recommend-qna__answer">이리저리 검색해서 정보 모으는 과정이 귀찮게 느껴질 때가 많았는데, 이런 서비스가 나와서 좋은 것 같아요. 저는 검색을 잘하는 편이라 사실 정보를 찾는 데는 크게 무리가 없지만, 인터넷 활용에 어려움을 느끼시는 저희 부모님에게는 큰 도움이 될 것 같아요. 더욱 발전하는 보조금24가 됐으면 합니다!</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="button-wrap">	            
	                <div class="float-right">
	                    <!-- <a href="/portal/rcvfvrSvc/recomendBnef/4" class="button button-board button-prev">이전</a> -->
	                    <a href="/portal/rcvfvrSvc/recomendBnef/2" class="button button-board button--next"><span>다음</span></a>
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
