<!DOCTYPE html>
<%@page import="kr.go.portal.rcvfvrSvc.svcFind.vo.SimpleFindVo"%>
<html lang="ko">
<%@page import="java.util.*" %>
<head>
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp">
	<jsp:param name="gnb" value="simpleFind" />
</jsp:include>
<title>소득구간 | 간편찾기 | 혜택 찾기 | 보조금24</title>
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
	                <li class="step__item is-current">
	                    <span class="step__num">01</span>
	                    <span class="step__text">성별 / 연령대</span>
	                </li>
	                <li class="step__item is-active">
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
			<form:form commandName="simpleFindVo" method="post" action="/portal/rcvfvrSvc/svcFind/simpleFindStepThree">
				<input type="hidden" id="step" value="two"/>
				<input type="hidden" name="gender" value="${simpleFindVo.gender }" id="genderCd" />
				<input type="hidden" name="age" value="${simpleFindVo.age }" id="ageCd" />
				<input type="hidden" id="areaNm" />
				<input type="hidden" value="" name="cdNm" id="cdNm" />
		        <div class="container">
		            <div class="simple-find">
			            <div class="simple-find__title simple-find__title--place">소득구간을 선택하세요. (중복선택불가)     
		                	<button type="button" class="simple-find__button" data-element="modal__open" data-target="#lypop10">소득 구간표 보기</button>
		                </div>
		                <div class="simple-find__select">
		                    <!-- simple-find__item 갯수는 4의 배수여야 함 - 조건 갯수가 부족할 시 하단 영역 추가 -->
		                    <!-- <div class="simple-find__item"></div> -->
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp01" class="simple-find__input" name="hshldChartr" value="JA0201">
                        		<label for="inp01">0~50%</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp02" class="simple-find__input" name="hshldChartr" value="JA0202">
								<label for="inp02">51~75%</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp03" class="simple-find__input" name="hshldChartr" value="JA0203">
		                        <label for="inp03">76~100%</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp04" class="simple-find__input" name="hshldChartr" value="JA0204">
		                        <label for="inp04">101~200%</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="radio" id="inp05" class="simple-find__input" name="hshldChartr" value="JA0205">
		                        <label for="inp05">200% 이상</label>
		                    </div>
		                    <div class="simple-find__item mobile"></div>
		                    <div class="simple-find__item mobile"></div>
		                    <div class="simple-find__item mobile"></div>
		                </div>
		            </div>
		        </div>
	            <div class="container">
	                <div class="search-box tag-box">
	                    <div class="search-box__form" id="search-box__form">
							<!-- <span class='hash-tag'>#서울특별시</span> <span class='hash-tag'>#경상남도</span> -->
						</div>
	                </div>
	                <div class="button-wrap">
	                    <a href="#" class="button button-board button--prev" value="/portal/rcvfvrSvc/svcFind/simpleFindStepOne"><span>이전</span></a>
	                    <a href="#" class="button button-board button--next"><span>다음</span></a>
	                </div>
	            </div>	            
			</form:form>
		</div>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
		<div id="lypop10" class="modal modal--large2" data-element="modal__element">
		    <div class="modal__container" data-element="modal__element-container">
		        <div class="modal__header">
		            <h1 class="modal__header--title">소득 구간 안내</h1>
		        </div>
		        <div class="modal__contents">
		            <div class="modal__inner">
		                <div class="service-wrap__sub-title">기준 중위소득이란?</div>
		                <div class="service-wrap__sub-content scroll">
		                   전국민을 소득순으로 정렬하여 정중앙에 위치한 사람의 소득을 '중위소득' 이라고 하며, 다양한 정부 기관에서 복지나 각종 서비스를 지원할 때 기준으로 사용합니다. 예를들어, 기준 중위소득 100%라고 하면 전국민을 100명이라고 가정할 때, 소득규모가 50번째에 해당하는 사람(중간값)의 소득을 말하며, 기준중위소득 75%는 기준중위소득 100% 금액에서 75%를 곱한 금액 입니다.(1인 가구 기준중위소득 75% 금액 = 1인 가구 기준중위소득 100% 금액 X 75% = 1,827,831 X 0.75 = 1,370,873) 아래표에서 4인가구의 기준중위소득 50%는 2,438,145원이 됩니다.
		                </div>
		                <div class="service-wrap__sub-title">[2021년 가구 규모별 기준중위소득 표]</div>
		                
		                <div class="service-wrap__sub-content">
		                    <div class="table-vertical service">
		                        <table>
		                            <colgroup>
		                                <col width="19%">
		                                <col>
		                                <col>
		                                <col>
		                                <col>
		                                <col>
		                                <col>
		                            </colgroup>
		                            <thead>
		                                <tr>
		                                    <th class="table-vertical__th" rowspan="2">구분</th>
		                                    <th class="table-vertical__th table-vertical__th--mobile-left" colspan="6">가구규모</th>
		                                </tr>
		                                <tr>
		                                    <th class="table-vertical__th">1인가구</th>
		                                    <th class="table-vertical__th">2인가구</th>
		                                    <th class="table-vertical__th">3인가구</th>
		                                    <th class="table-vertical__th">4인가구</th>
		                                    <th class="table-vertical__th">5인가구</th>
		                                    <th class="table-vertical__th">6인가구</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                                <tr>
		                                    <th class="table-vertical__th">기준중위소득 30%</th>
		                                    <td>548,349</td>
		                                    <td>926,423</td>
											<td>1,195,185</td>
											<td>1,462,887</td>
											<td>1,727,211</td>
											<td>1,988,580</td>
		                                </tr>
		                                <tr>
		                                    <th class="table-vertical__th">기준중위소득 40%</th>
											<td>731,132</td>
											<td>1,235,231</td>
											<td>1,593,580</td>
											<td>1,950,516</td>
											<td>2,302,949</td>
											<td>2,651,441</td>
		                                </tr>
		                                <tr>
		                                    <th class="table-vertical__th">기준중위소득 45%</th>
											<td>822,523</td>
											<td>1,389,635</td>
											<td>1,792,777</td>
											<td>2,194,330</td>
											<td>2,590,817</td>
											<td>2,982,871</td>
		                                </tr>
		                                <tr class="highlight">
		                                    <th class="table-vertical__th">기준중위소득 50%</th>
		                                    <td>913,915</td>
											<td>1,544,039</td>
											<td>1,991,975</td>
											<td>2,438,145</td>
											<td>2,878,686</td>
											<td>3,314,301</td>
		                                </tr>
		                                <tr>
		                                    <th class="table-vertical__th">기준중위소득 75%</th>
		                                    <td>1,370,873</td> 
											<td>2,316,059</td> 
											<td>2,987,962</td> 
											<td>3,657,217</td> 
											<td>4,318,029</td> 
											<td>4,971,452</td> 

		                                </tr>
		                                <tr>
		                                    <th class="table-vertical__th">기준중위소득 100%</th>
		                                    <td>1,827,831</td> 
											<td>3,088,079</td> 
											<td>3,983,950</td> 
											<td>4,876,290</td> 
											<td>5,757,373</td> 
											<td>6,628,603</td> 

		                                </tr>
		                                <tr>
		                                    <th class="table-vertical__th">기준중위소득 120%</th>
		                                    <td>2,193,397</td> 
											<td>3,705,694</td> 
											<td>4,780,740</td> 
											<td>5,851,548</td> 
											<td>6,908,847</td> 
											<td>7,954,323</td> 
		                                </tr>
		                                <tr>
		                                    <th class="table-vertical__th">기준중위소득 200%</th>
		                                    <td>3,655,662</td> 
											<td>6,176,158</td> 
											<td>7,967,900</td> 
											<td>9,752,580</td> 
											<td>11,514,746</td> 
											<td>13,257,206</td> 
		                                </tr>
		                            </tbody>
		                        </table>
		                    </div>
		                </div>
		                <p class="service-wrap__sub-text">보건복지부(기초생활보장과), 보건복지상담센터(☎ 129)</p>
		            </div>
		        </div>
		        <button class="modal__btn--close" type="button" data-element="modal__close" title="닫기">닫기</button>
		    </div>
		</div>
	</div>
</body>
</html>
