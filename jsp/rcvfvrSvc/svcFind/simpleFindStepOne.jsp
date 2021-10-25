<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Cache-control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp">
	<jsp:param name="gnb" value="simpleFind" />
</jsp:include>
<title>성별 / 연령대 | 간편찾기 | 혜택 찾기 | 보조금24</title>

<!-- 개별 script -->
<script src="/rcvfvrSvc/js/svcFind/simpleFindStepOne.js?time=${toDate}"></script>
</head>
<body>
	<div class="skip-nav">
		<a href="#content" class="skip-nav__item">본문바로가기</a>
		<a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
	</div>

	<div id="wrap">
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp">
			<jsp:param name="gnb" value="svcFind" />
		</jsp:include>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" />
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
			<jsp:param name="gnb" value="svcFind" />
			<jsp:param name="mnb" value="simpleFind" />
		</jsp:include>

		<div id="content" class="web-content">
        	<div class="container container--full background-skyblue">
				<div class="container">
                	<div class="common-background visual-box visual-box--simple">
	                    <div class="visual-box__inner">
	                        <div class="visual-box__title"><strong>간편</strong>하게 <strong>혜택</strong>을 <strong>찾아</strong>보세요.</div>
	                        <div class="visual-box__text">
	                            질문에 답하시고 신청가능한 혜택을 확인하세요.
	                        </div>
	                    </div>
	                </div>
				</div>
			</div>
			<div class="container">
	            <ul class="step">
	                <li class="step__item is-active">
	                    <span class="step__num">01</span>
	                    <span class="step__text">성별 / 연령대</span>
	                </li>
	                <li class="step__item">
	                    <span class="step__num">02</span>
	                    <span class="step__text">소득구간</span>
	                </li>
	                <li class="step__item">
	                    <span class="step__num">03</span>
	                    <span class="step__text">개인특성</span>
	                </li>
	                <li class="step__item">
	                    <span class="step__num">04</span>
	                    <span class="step__text">가구특성</span>
	                </li>
	            </ul>
	        </div>
			<form:form commandName="simpleFindVo" method="post" action="/portal/rcvfvrSvc/svcFind/simpleFindStepTwo">
				<input type="hidden" id="step" value="one"/>
				<div class="container">
					<div class="select-complete">
		                <strong class="select-complete__title">성별선택 완료</strong>
		                <select title="성별선택" class="select-re">
		                    <option value="">다시선택</option>
		                    <option value="JA0101">남성</option>
		                    <option value="JA0102">여성</option>
		                </select>
		            </div>
		            
					<div class="simple-find">
                		<div class="simple-find__title simple-find__title--age">성별을 선택하세요. (중복선택불가)</div>
                		<div class="simple-find__select simple-find__select--two">
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp11" class="simple-find__input" name="gender" data-radio-target="radio-section-1" value="JA0101" />
		                        <label for="inp11">남성</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp22" class="simple-find__input" name="gender" data-radio-target="radio-section-1" value="JA0102" />
		                        <label for="inp22">여성</label>
		                    </div>
		                </div>
                		<div class="simple-find__select simple-find__select--list" data-radio-section="radio-section-1">
		                    <!-- simple-find__item 갯수는 4의 배수여야 함 - 조건 갯수가 부족할 시 하단 영역 추가 -->
		                    <!-- <div class="simple-find__item"></div> -->
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp01" class="simple-find__input" name="age" value="JA0103" />
		                        <label for="inp01">영유아<br> <span>(0세~5세)</span></label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp02" class="simple-find__input" name="age" value="JA0104" />
		                        <label for="inp02">아동<br> <span>(6세~12세)</span></label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp03" class="simple-find__input" name="age" value="JA0105" />
		                        <label for="inp03">청소년<br> <span>(13세~18세)</span></label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp04" class="simple-find__input" name="age" value="JA0106" />
		                        <label for="inp04">청년<br> <span>(19세~29세)</span></label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp05" class="simple-find__input" name="age" value="JA0107" />
		                        <label for="inp05">중년<br> <span>(30세~49세)</span></label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp06" class="simple-find__input" name="age" value="JA0108" />
		                        <label for="inp06">장년<br> <span>(50세~64세)</span></label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp07" class="simple-find__input" name="age" value="JA0109" />
		                        <label for="inp07">노년<br> <span>(65세 이상)</span></label>
		                    </div>
		                    <div class="simple-find__item mobile">
		                    </div>
		                </div>
					</div>
				</div>
					<div class="container">
						<div class="search-box tag-box">
							<div class="search-box__form" id="search-box__form">
								<!-- <span class='hash-tag'>#서울특별시</span> <span class='hash-tag'>#경상남도</span> -->
							</div>
						</div>
						<div class="button-wrap button-wrap--one">
							<!-- <input type="submit" class="button button--big button--possible button--next" value="다음" /> -->
							<a href="#" class="button button-board button--next"><span>다음</span></a>
						</div>
					</div>
				</div>
			</form:form>
		</div>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
</body>
</html>
