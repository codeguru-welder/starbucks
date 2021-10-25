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
			<jsp:param name="svcId" value="3" />
		</jsp:include>

	    <div id="content" class="web-content service-typeA">
	        <div class="container">
	            <div class="recommend recommend--type03">
	                <div class="recommend__top">
	                    <div class="recommend__title">
	                        <span>갑작스러운 질병에 막막했지만</span><br class="mobile"><span> 희망을 선택했습니다</span>
	                    </div>
	                    <div class="recommend__sub-text">
	                        다발성 근염 진단 받은 <span>45세 박*철씨</span>
	                    </div>
	                </div>
	                <div class="recommend__content">
	                    <div class="recommend-qna">
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">간단한 자기소개 부탁드립니다.</div>
	                            <div class="recommend-qna__answer">안녕하세요. 서울 은평구에 거주하는 45세 박*철입니다.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">정부 혜택에 관심을 갖게 된 계기가 있나요?</div>
	                            <div class="recommend-qna__answer">업무 수행에 무리가 생길 정도로 어깨와 팔뚝 부근의 통증이 심해 병원에 갔어요. 다발성 근염이라는 희귀난치병 진단을 받았죠. 실직 후 건강을 돌보면서 할 수 있는 사업을 준비하다가 마침 코로나가 터졌어요. 지금은 사업을 접고 일을 구하면서 지내고 있습니다. 코로나 때문에 긴급재난지원금을 찾아보다가, 전반적인 보조금 혜택에 관심이 생겼어요.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">나에게 가장 도움이 된 혜택은 무엇이었나요?</div>
	                            <div class="recommend-qna__answer">갑작스러운 희귀병 진단에 막막했습니다. 살림살이도 빠듯한데 당장 병원비 걱정부터 들었으니까요. 다행히 <span>희귀질환자 의료비 지원</span>을 받아 부담을 좀 덜었어요. 희귀난치병의 경우, 우리나라는 산정특례가 되기 때문에 신청을 해서 완료를 받게 되면 진료비, 검사비, 약 값 등 관련 치료비에 관해서는 10%만 본인이 부담하고 공단에서 90%로 지급이 됩니다.</div>
	                        </div>
	                        <div class="recommend-qna__item">
	                            <div class="recommend-qna__question">보조금24 이용 소감을 말씀해주세요.</div>
	                            <div class="recommend-qna__answer">2020년은 참 힘들었어요. 직장도 그만두고 아버님도 돌아가시면서 제 삶의 중심이 흔들리는 느낌이었죠. 그래도 지금은 이런저런 국가 지원 덕분에 극복하려고 노력 중이에요. 보조금24는 이번에 처음 이용해봤는데, 앞으로 종종 방문할 것 같아요. 이런 편리한 서비스를 만들어주셔서 큰 힘이 되고 감사하게 생각합니다.</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="button-wrap">
	                <div class="float-right">
	                    <a href="/portal/rcvfvrSvc/recomendBnef/2" class="button button-board button--prev"><span>이전</span></a>
	                    <a href="/portal/rcvfvrSvc/recomendBnef/4" class="button button-board button--next"><span>다음</span></a>
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
