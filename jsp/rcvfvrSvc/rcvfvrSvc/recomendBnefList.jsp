<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
	<title>일상속 보조금24 이야기 | 보조금24란 | 보조금24</title>
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
		</jsp:include>

	    <div id="content" class="web-content">
	        <div class="container container--full background-skyblue">
	            <div class="container">
                <div class="common-background visual-box visual-box--recommend">
	                    <div class="visual-box__inner">
	                        <div class="visual-box__title">더 나은 세상을 만들기 위한 <br class="mobile">노력과 <strong>혜택 정보</strong>까지 </div>
	                        <div class="visual-box__text">기획기사로 구성한 보조금24의 <br class="mobile">다양한 이야기를 만나보세요.</div> <!-- 210204 -->
	                    </div>
	                </div>
	            </div>
	        </div>
	       	<div class="container">
	            <div class="search-list mgt30 search-filter">
	                <div class="search-list__form input-wrap">
	                    <!-- 210204 -->
	                    <!-- <div class="select-wrap">
	                        <select class="select-wrap__item" title="정렬 선택">
	                            <option value="">인기순</option>
	                            <option value="">마감순</option>
	                            <option value="">추천순</option>
	                            <option value="">최근순</option>
	                            <option value="">가나다순</option>
	                        </select>
	                        <button class="button-table" type="button"><span>조회</span></button>
	                    </div> -->
	                </div>
	            </div>
	        </div>
	        <div class="container">
	            <div class="card card--keyword03">
	            	<div class="card__list card__type1">
	                    <div class="card__item card__item--case01">
	                        <a href="/portal/rcvfvrSvc/recomendBnef/1" class="card__link">
	                            <div class="card__contents">
	                                <div class="card__title"><span>취업준비 중인<br> 신*영</span>님의<br class="mobile"> 이야기</div>
	                            </div>
	                        </a>
	                    </div>
	                    <div class="card__item card__item--case02">
	                        <a href="/portal/rcvfvrSvc/recomendBnef/2" class="card__link">
	                            <div class="card__contents">
	                                <div class="card__title"><span>엄마가 처음인<br> 이*주</span>님의<br class="mobile"> 이야기</div>
	                            </div>
	                        </a>
	                    </div>
	                    <div class="card__item card__item--case03">
	                        <a href="/portal/rcvfvrSvc/recomendBnef/3" class="card__link">
	                            <div class="card__contents">
	                                <div class="card__title"><span>다발성 근염 진단<br class="pc"> 박*철</span>님의<br class="mobile"> 이야기</div>
	                            </div>
	                        </a>
	                    </div>
	                    <div class="card__item card__item--case04">
	                        <a href="/portal/rcvfvrSvc/recomendBnef/4" class="card__link">
	                            <div class="card__contents">
	                                <div class="card__title"><span>홀로 살지만 외롭지 않은 김*형</span>님의 이야기</div>
	                            </div>
	                        </a>
	                    </div>
	                </div>
	            </div>
	            <!-- <div class="page-navigation">
	                <a href="#" class="page-navigation__first"><span class="hide">처음 페이지</span></a>
	                <a href="#" class="page-navigation__prev"><span class="hide">이전 페이지</span></a>
	                <div class="page-navigation__num-wrap">
	                    <a href="#" class="page-navigation__num"><span>1</span></a>
	                    <strong class="page-navigation__active"><span>2</span></strong>
	                    <a href="#" class="page-navigation__num"><span>3</span></a>
	                    <a href="#" class="page-navigation__num"><span>4</span></a>
	                    <a href="#" class="page-navigation__num"><span>5</span></a>
	                </div>
	                <a href="#" class="page-navigation__next"><span class="hide">다음 페이지</span></a>
	                <a href="#" class="page-navigation__last"><span class="hide">마지막 페이지</span></a>
	            </div> -->
	        </div>
	    </div>
	    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
	</div>
</body>
</html>
