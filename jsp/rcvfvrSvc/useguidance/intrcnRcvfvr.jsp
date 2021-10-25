<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
	<title>보조금24 소개 | 보조금24란 | 보조금24</title>
</head>
<body>
	<div class="skip-nav">
		<a href="#content" class="skip-nav__item">본문바로가기</a>
		<a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
	</div>

	<div id="wrap">
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp">
			<jsp:param name="gnb" value="intrcn" />
		</jsp:include>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" /> 
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
			<jsp:param name="gnb" value="intrcn" />
			<jsp:param name="mnb" value="rcvfvr" />
		</jsp:include>
		
		<div id="content" class="web-content">
	        <div class="intro-section">
	            <div class="intro-subsidy">
	                <strong class="intro-title">보조금24란?</strong>
	                <!-- 210216 텍스트 수정 -->
	                <span class="intro-subsidy__desc">보조금24는 일일이 기관 또는 기관별 홈페이지를 방문하지 않고 내가 받을 수 있는 정부 혜택을 정부24에서 확인할 수 있는 서비스입니다.</span>
	                <div class="intro-subsidy__content">
	                    <div class="intro-subsidy__before">
	                        <i class="intro-subsidy__top">Before</i>
	                        <p class="intro-subsidy__text">내가 받을 수 있는 서비스는 뭐지?<br>어디서 확인하지?</p>
	                    </div>
	                    <div class="intro-subsidy__after">
	                        <i class="intro-subsidy__top">after</i>
	                        <p class="intro-subsidy__text">정부24 로그인 한번으로<br>쉽게 알 수 있네!</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="intro-section02">
	            <div class="intro-confirm">
	                <div class="intro-confirm__inner">
	                    <p class="intro-confirm__desc">* 해마다 더 많은 정부 혜택을 확인할 수 있습니다.</p>
	                    <ul class="intro-confirm__box">
	                        <li class="intro-confirm__list">
	                            <span class="intro-confirm__date">2021년 4월</span>
	                            <strong class="intro-confirm__service">중앙부처 서비스</strong>
	                        </li>
	                        <li class="intro-confirm__list">
	                            <span class="intro-confirm__date">2021년 12월</span>
                            	<strong class="intro-confirm__service">지자체 서비스</strong>
	                        </li>
	                        <li class="intro-confirm__list">
	                            <span class="intro-confirm__date">2022년</span>
                            	<strong class="intro-confirm__service">공공기관 서비스</strong>
	                        </li>
	                    </ul>
	                    <p class="intro-confirm__text">[20년도] 행정기관의 약 100종의 정보연계 추진 <br class="mobile">→ [21년도] 총 200여 종의 정보연계 확대</p>
	                </div>
	            </div>
	        </div>
	        <div class="intro-section03">
	           <div class="intro-benefit">
	                <strong class="intro-title">보조금24란, 이런 점이 좋아요!</strong>
	                <ul class="intro-benefit__box">
	                    <li class="intro-benefit__list list-img1">
	                        <strong class="intro-benefit__title">한 곳에!</strong>
	                        <p class="intro-benefit__desc">정부, 지자체, 공공기관에서<br>제공하는 각종 혜택을 한 곳에!</p>
	                    </li>
	                    <li class="intro-benefit__list list-img2">
	                        <strong class="intro-benefit__title">한 눈에!</strong>
	                        <p class="intro-benefit__desc">현재 받고 있고, 향후 받을 수<br>있는 각종 혜택을 한 눈에!</p>
	                    </li>
	                    <li class="intro-benefit__list list-img3">
	                        <strong class="intro-benefit__title">한 번에!</strong>
	                        <p class="intro-benefit__desc">나에게 맞는 혜택을 확인하고<br>신청까지 한 번에!</p>
	                    </li>
	                </ul>
	                <p class="intro-benefit__text">* [21년 4월] 약 25종 온라인 신청가능 <br class="mobile">→ [21년 말] 약 50종 온라인 신청확대</p>
	                <p class="intro-benefit__text">* [21년 4월] 개인(14세 미만 자녀 포함) 혜택 확인 가능 <br class="mobile">→ [21년 말] 가족 혜택 확인 가능 (동일 세대원의 사전 동의 시)</p>
	           </div>
	        </div>
	        <div class="intro-section04">
	            <div class="intro-search">
	                <div class="intro-search__inner">
	                    <strong class="intro-title">보조금24, 들여다보기</strong>
	                    <div class="intro-search__content">
	                        <a href="https://www.youtube.com/watch?v=C3Tq2sI1-Xs" class="intro-search__video" target="_blank" title="새창열림">
	                            <img src="/rcvfvrSvc/images/C/bg_video.png" alt="정부24에서 만나는 뜻밖의 혜택 영상보기" class="pc">
	                            <img src="/rcvfvrSvc/images/C/bg_video_m.png" alt="정부24에서 만나는 뜻밖의 혜택 영상보기" class="mobile">
	                        </a>
	                        <a href="#" class="intro-search__card" data-element="modal__open" data-target="#lypopCard" aria-controls="#lypopCard">
	                            <img src="/rcvfvrSvc/images/C/bg_card.png" alt="보조금24 그것이 알고 싶다! 카드뉴스 보기" class="pc">
	                            <img src="/rcvfvrSvc/images/C/bg_card_m.png" alt="보조금24 그것이 알고 싶다! 카드뉴스 보기" class="mobile">
	                        </a> 
	                        <a href="#" class="intro-search__webtoon" data-element="modal__open" data-target="#lypop02" aria-controls="#lypop02">
	                            <img src="/rcvfvrSvc/images/C/bg_webtoon.png" alt="보조금24 웹툰보기" class="pc">
	                            <img src="/rcvfvrSvc/images/C/bg_webtoon_m.png" alt="보조금24 웹툰보기" class="mobile">
	                        </a> 
	                    </div>
	                </div>
	            </div>
	            <div class="intro-case">
	                <p class="intro-case__title">보조금24를 사례로 살펴볼까요?</p>
	                <a href="/portal/rcvfvrSvc/recomendBnef" class="intro-case__button">바로가기</a>
	            </div>
	        </div>
	    </div>

    	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
    	
    	
		<div id="lypopCard" class="modal modal--news" data-element="modal__element">
		    <div class="modal__container" data-element="modal__element-container">
		        <div class="modal__header">
		            <h1 class="modal__header--title">카드뉴스 팝업</h1>
		        </div>
		        <div class="modal__contents">
		            <div class="modal-slider">
		                <div class="modal-slider__belt" data-slider="arrow3">
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_00.png" alt="정부24가 만든 국가보조금 맞춤형 서비스, 보조금24 그것이 알고 싶다!">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_01.jpg" alt="'몰라서' 한국보건사회연구원(2019)의 보고서에 따르면 지자체 복지담당자 70.9%가 꼽은 대상자의 국가보조금 비신청 사유 1위입니다. 왜 몰랐을까요?">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_02.jpg" alt="국민을 위한 보조금이 국민에게는 너무 멀었습니다. 중앙부처, 지자체,  공공기관 등에서 괸리하는 보조금 및 서비스 혜택만 약 수만개에 이릅니다. 이렇게 많은 혜택 중에 무엇이 나에게 해당되는지 국민들은 알 수가 없었습니다.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_03.jpg" alt="불편함은 수혜서비스 통합 플랫폼 보조금24의 탄생을 이끈 원동력이 됐습니다. 한 곳에! 중앙부처, 지자체, 공공기관에서 제공하는 각종 혜택을 한 곳에!, 한 눈에! 현재 받고 있고, 향후 받을 수 있는 각종 혜택을 한 눈에!, 한 번에! 나에게 맞는 혜택을 확인하고 신청까지 한 번에!">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_04.jpg" alt="보조금24는 국민이 만든 서비스입니다. 보조금24(39.5%)가 온나라보조금(28.3%), 나라드림24(32.1%)을 제치고 국민이 선정한 브랜드 명칭이 되었고, 국민이 뽑은 홈페이지 디자인으로 제작되었습니다. 이는 국가보조금 맞춤형서비스 대국민 투표 이벤트를 통해 선정 되었고, 투표분야는 브랜드명칭, 홈페이지 디자인이고, 투표기간은 2020년 9월 23일에서 10월 7일까지 이며, 투표인원은 총 9,767명 입니다.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_05.jpg" alt="보조금24는 국민의 삶을 이렇게 바꿔나갑니다. 전에는 내가 받을 수 있는 서비스가 무엇인지, 내가 수혜 자격에 해당될지 고민이었는데 이제는 정부24 로그인 한번으로 내게 맞는 혜택이 다 나옵니다.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_06.jpg" alt="보조금24는 성장하고 있습니다. 2021년 4월 중앙부처서비스, 2021년 12월 지자체 서비스, 2022년 공공기관 서비스, 또다른 행정 혁신을 만드는 큰 작업인 만큼, 더 많은 국민들이 혜택을 받을 수 있도록 단계별로 서비스를 확대할 예정입니다.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_news_07.png" alt="2021년 4월 말 정부24(www.gov.kr)에서 보조금24의 첫 출발을 함께 해주세요!">
		                        </div>
		                    </div>
		                </div>
		                
		                <!-- page_count -->
		                <span class="modal-slider__page-count">
		                    <span class="wrap">
		                        <span class="now">1</span>
		                        <span class="max">9</span>
		                    </span>
		                </span>
		                <!-- // page_count -->
		            </div>
		        </div>
		        <button class="modal__btn--close" type="button" data-element="modal__close" title="닫기">닫기</button>
		    </div>
		</div>
		
		<!-- 210218 추가 -->
		<div id="lypop02" class="modal modal--news" data-element="modal__element">
		    <div class="modal__container" data-element="modal__element-container">
		        <div class="modal__header">
		            <h1 class="modal__header--title">웹툰 팝업</h1>
		        </div>
		        <div class="modal__contents">
		            <div class="modal-slider">
		                <div class="modal-slider__belt" data-slider="arrow3">
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_00.png" alt="정부24가 만든 국가 보조금 맞춤형 서비스, 보조금24">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_01.jpg" alt="여러분은 알고 계셨나요? 중앙부처, 지자체가 국민에게 제공하는 혜택이 수천 개">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_02.jpg" alt="수많은 혜택 중에 내가 받을 혜택은 몇 개? 일일이 찾기 어렵고 신청하기는 더 힘들고">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_03.jpg" alt="정부24에서 선보이는 새로운 서비스! 보조금24">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_04.jpg" alt="중앙부처가 제공하는 300여 종의 서비스">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_05.jpg" alt="국민 누구나 쉽고 편하게, 일일이 찾아다닐 필요 없이 정부24에서 한 번에, 개인정보 입력없이 이용동의 한버으로 누구나 쉽게, 정보취약계층은 주민센터에 가면 안내받을 수 있어요.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_06.jpg" alt="2021년 4월 중앙부처서비스, 2021년 12월 지자체 서비스, 2022년 공공기관 서비스로 보조금24는 계속됩니다.">
		                        </div>
		                    </div>
		                    <div class="modal-slider__inner">
		                        <div class="modal-slider__item">
		                            <img src="/rcvfvrSvc/images/C/img_webtoon_07.png" alt="2021년 4월 말 정부24에서 만나요.">
		                        </div>
		                    </div>
		                </div>
		                
		                <!-- page_count -->
		                <span class="modal-slider__page-count">
		                    <span class="wrap">
		                        <span class="now">1</span>
		                        <span class="max">9</span>
		                    </span>
		                </span>
		                <!-- // page_count -->
		            </div>
		        </div>
		        <button class="modal__btn--close" type="button" data-element="modal__close" title="닫기">닫기</button>
		    </div>
		</div>
	</div>

</body>
</html>
