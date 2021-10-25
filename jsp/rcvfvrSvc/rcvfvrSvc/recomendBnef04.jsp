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
			<jsp:param name="svcId" value="4" />
		</jsp:include>

	    <div id="content" class="web-content service-typeA">
	        <div class="container">
	            <div class="recommend recommend--type04">
	                <div class="recommend__top">
	                    <div class="recommend__title">
	                        <span>찾아와주고 전화해주니</span><br class="mobile"><span> 자식보다 반갑죠</span>
	                    </div>
	                    <div class="recommend__sub-text">
	                        홀로 살지만 외롭지 않은 <span>78세 김*형씨</span>
	                    </div>
	                </div>
	                <div class="recommend__content">
	                    <div class="recommend-qna">
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">간단한 자기소개 부탁드립니다.</div>
	                            <div class="recommend-qna__answer">경기도 수원에 살고 있는 78세 김*형입니다.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">정부 혜택에 관심을 갖게 된 계기가 있나요?</div>
	                            <div class="recommend-qna__answer">받아주는 데가 없으니 먹고 살려고 부지런히 동사무소 드나들었어요. 가면 잘 안내해주는데, 내가 귀가 어두워서 알아듣기가 힘들어요. 말도 어렵고. 계속 묻기가 미안해서 혼자 읽어보려고 하면, 눈이 침침해서 보이지도 않죠. 그래도 혹시나 하는 마음에 계속 가봐요.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">나에게 가장 도움이 된 혜택은 무엇이었나요?</div>
	                            <div class="recommend-qna__answer">아내는 10년 전에 암으로 떠나보냈어요. 혼자 사니까 적적한데, 일주일에 여러 번 전화도 해주고 직접 찾아도 와주더라고요. 동사무소 직원이 신청해보라고 권유했던 걸로 기억나요. <span>노인돌봄 서비스</span>였던 것 같아요. 태풍이라도 오면 매일매일 전화가 와요. 잘 계시냐고. 가끔은 몇 년 째 연락없는 자식보다 더 예쁘고 마음이 든든해요.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">보조금24 이용 소감을 말씀해주세요.</div>
	                            <div class="recommend-qna__answer">국가에서 우리 노인들을 위해 지원을 해줘서 얼마나 고마운지 모르겠어요. 내가 컴퓨터를 할 줄 몰라서 잘 모르겠지만, 듣자하니 동사무소 직원분들도 보조금24 덕분에 좀 더 수월하게 안내가 가능해졌다고 좋아하더라고요. 그럼 뭐 잘 된 거 아닙니까.</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="button-wrap">
	                <div class="float-right">
	                    <a href="/portal/rcvfvrSvc/recomendBnef/3" class="button button-board button--prev"><span>이전</span></a>
	                    <!-- <a href="#" class="button button-board button-next">다음</a> -->
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
