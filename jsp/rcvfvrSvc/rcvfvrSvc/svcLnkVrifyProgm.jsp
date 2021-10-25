<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
	<link type="text/css" rel="stylesheet" href="/css/jquery-ui.min.css"/>
	<script type="text/javascript" src="/js/jquery-ui.custom.min.js"></script>
	<script type="text/javascript" src="/js/jquery.datepicker.js"></script>
	<title>서비스 안내 신청(검증 프로그램)</title>
</head>
<body>
<style>
	.chkeck-wrap__item + .chkeck-wrap__item{
		margin-left : 0px;
		width: 50%;
   		display: inline;
	}
	.chkeck-wrap__item{
		width: 50%;
		margin-bottom: 5px;
	}
	.table-text{
		padding: 1px 15px 0;
	    border: 1px solid #e1e1e1;
	    border-radius: 10px;
	    font-size: 13px;
	    color: #585858;
	    height: 30px;
	    width : 100px;
	    float: right;
	    margin-right: 120px;
	    text-align: right;
    }
    .selectMpva{
    	width: 30%;
    	margin-right: 5px;
    	font-size: 13px;
    }
</style>
<div class="skip-nav">
    <a href="#content" class="skip-nav__item">본문바로가기</a>
    <a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
</div>
<div id="wrap">
	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp" />
	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" />
	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />
    <div id="content" class="web-content">
        <div class="container">
            <div class="tit-page" style="font-size : 30px; white-space: nowrap;">맞춤 서비스 시뮬레이션</div>

			<form:form id="vrifyForm" name="vrifyForm" commandName="SvcLnkVrifyVo" method="POST" action="/portal/rcvfvrSvc/svcLnkVrifyProgmResult">
	            <div class="search-list mgt40 notice">
	                <div class="search-list__form input-wrap">
	                    <div class="select-wrap">
	                        <input type="text" class="input-text" name="name" value="홍길동" title="이름" placeholder="이름" style="width:150px;" maxlength="5" />
	                        <input type="text" class="input-text" name="jumin1" value="801015" title="검색어 입력" placeholder="주민등록번호 앞자리" maxlength="6"/>
	                        <span style="vertical-align: middle; font-size: 30px; text-align: center; margin-left: 4px;">-</span>
	                        <input type="password" class="input-text" name="jumin2" value="1234567" title="검색어 입력" placeholder="주민등록번호 뒷자리" maxlength="7"/>
	                        <button class="button-table" type="button" style="width:100px;" id="submitBtn" ><span class="relative"></span>서비스 안내</span></button>
	                    </div>
	                </div>
	            </div>
	            <div class="table-vertical notice">
	                <table id="lnkList">
	                    <colgroup>
	                        <col style="width:13%">
	                        <col style="width:22%">
	                        <col>
	                    </colgroup>
	                    <thead>
	                        <tr>
	                            <th class="table-vertical__th" scope="col">기관명</th>
	                            <th class="table-vertical__th" scope="col">연계 인터페이스명</th>
	                            <th class="table-vertical__th" scope="col">세부 연계 항목</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<tr>
                    			<td class="table-vertical__td" rowspan="5">고용노동부</td>
                    			<td class="table-vertical__td table-vertical__td--left">고용보험가입 사실여부</br>(I-IF-MOEI-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-001" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA030601001" />
		                            		<label for="QA030601001" class="chkeck-wrap__label">고용보험가입자여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA030601001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-001" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA030601002" />
		                            		<label for="QA030601002" class="chkeck-wrap__label">고용보험가입자여부(N)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA030601002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-001" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="TQA030602" />
		                            		<label for="TQA030602" class="chkeck-wrap__label">고용보험피보험기간
				                                <input type="checkbox" class="chkeck-wrap__input" id="TQA030602" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                        
			                                <input type="text" class="table-text" placeholder="개월" />
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left">실업급여수급 사실여부</br>(I-IF-MOEI-002)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-002" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA070301001" />
		                            		<label for="QA070301001" class="chkeck-wrap__label">실업급여수급여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070301001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-002" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA070301002" />
		                            		<label for="QA070301002" class="chkeck-wrap__label">실업급여수급여부(N)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070301002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                        </div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left">출산급여 및 모성보호 지원금</br>신청여부&nbsp;(I-IF-MOEI-003)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-003" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA070304002" />
		                            		<label for="QA070304002" class="chkeck-wrap__label">모성보호육아지원(출산전후휴가급여)수급여부(N)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070304002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-003" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA070303002" />
		                            		<label for="QA070303002" class="chkeck-wrap__label">모성보호육아지원(육아기근로시간단축급여)수급여부(N)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070303002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-003" />
			                    			<input type="hidden" name="svcId" value="WII000001460" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="WII000001460" class="chkeck-wrap__label">모성보호 육아 지원(출산전후휴가급여) 신청 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="WII000001460" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-003" />
			                    			<input type="hidden" name="svcId" value="149200000153" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="149200000153" class="chkeck-wrap__label">고용보험미적용자 출산급여 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="149200000153" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-003" />
			                    			<input type="hidden" name="svcId" value="999000000007" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="999000000007" class="chkeck-wrap__label">모성보호 육아 지원(육아기 근로시간 단축급여) 신청 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="999000000007" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                        </div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left">구직자 취업지원서비스 신청여부</br>(I-IF-MOEI-004)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-004" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA050201001" />
		                            		<label for="QA050201001" class="chkeck-wrap__label">구직신청자여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050201001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-001" />
			                    			<input type="hidden" name="svcId" value="149200000092" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="149200000092" class="chkeck-wrap__label">취업역량강화프로그램 신청 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="149200000092" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left">국민내일배움카드 수강 여부</br>(I-IF-MOEI-008)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOEI-008" />
			                    			<input type="hidden" name="svcId" value="149200000026" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="149200000026" class="chkeck-wrap__label">국민내일배움카드 직업훈련 수강 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="149200000026" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                        </div>
								</td>
                   			</tr>
                   			<tr>                   				
                    			<td class="table-vertical__td" rowspan="8">교육부</td>
                    			<td class="table-vertical__td table-vertical__td--left">대학생, 대학원생 여부</br>(I-IF-MOE-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-001" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040107001" />
		                            		<label for="QA040107001" class="chkeck-wrap__label">대학생여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040107001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-001" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040110001" />
		                            		<label for="QA040110001" class="chkeck-wrap__label">대학원생여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040110001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                        </div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left">학자금 수급여부</br>(I-IF-MOE-002)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA070601002" />
		                            		<label for="QA070601002" class="chkeck-wrap__label">예술체육비전장학금수급여부(N)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070601002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA070602002" />
		                            		<label for="QA070602002" class="chkeck-wrap__label">이공계우수학생국가장학금지원수급여부(N)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070602002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
										</div>
			                        	</br>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA070603002" />
		                            		<label for="QA070603002" class="chkeck-wrap__label">인문100년장학금수급여부(N)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070603002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                       		</div>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="134200000046" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="134200000046" class="chkeck-wrap__label">중소기업취업연계장학금(희망사다리Ⅰ유형) 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="134200000046" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
				                        </div>
				                        </br>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="134200005001" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="134200005001" class="chkeck-wrap__label">고졸후학습자장학금(희망사다리Ⅱ유형) 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="134200005001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                        	</div>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="B55252900005" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="B55252900005" class="chkeck-wrap__label">국가우수장학금(이공계) 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="B55252900005" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                        	</div>
			                        	</br>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="134200000011" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="134200000011" class="chkeck-wrap__label">인문100년장학금 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="134200000011" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                        	</div>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="B55252900010" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="B55252900010" class="chkeck-wrap__label">우수고등학생해외유학장학금(드림장학금) 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="B55252900010" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                        	</br>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="B55252900018" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="B55252900018" class="chkeck-wrap__label">예술체육비전장학금 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="B55252900018" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                        	</div>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="GES000000120" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="GES000000120" class="chkeck-wrap__label">국가근로장학금 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="GES000000120" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
										</br>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="SD0000004508" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="SD0000004508" class="chkeck-wrap__label">국가장학금1유형(학생직접지원형) 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SD0000004508" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="134200005002" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="134200005002" class="chkeck-wrap__label">국가장학금2유형(대학연계지원형) 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="134200005002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
				                        </br>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-002" />
			                    			<input type="hidden" name="svcId" value="999000000015" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="999000000015" class="chkeck-wrap__label">지역인재장학금(국가장학금2유형) 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="999000000015" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left">농어촌출신대학생학자금융자</br>(I-IF-MOE-003)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-003" />
			                    			<input type="hidden" name="svcId" value="SD0000010578" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="SD0000010578" class="chkeck-wrap__label">농어촌출신대학생학자금융자
				                                <input type="checkbox" class="chkeck-wrap__input" id="SD0000010578" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                        </div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left">일반상환학자금대출</br>(I-IF-MOE-004)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-004" />
			                    			<input type="hidden" name="svcId" value="GES000000100" />
			                    			<input type="hidden" name="qualfAstCd" value="" />
		                            		<label for="" class="chkeck-wrap__label">일반상환학자금대출
				                                <input type="checkbox" class="chkeck-wrap__input" id="GES000000100" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                        </div>
								</td>
                   			</tr>
                   			<tr>			
	                   			<td class="table-vertical__td table-vertical__td--left" rowspan="1">취업후상환학자금대출<br>(I-IF-MOE-005)</td>
	                   			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-005">
			                    			<input type="hidden" name="svcId" value="GES000000110">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="I-IF-MOE-0050" class="chkeck-wrap__label">취업후상환학자금대출
				                                <input type="checkbox" class="chkeck-wrap__input" id="I-IF-MOE-0050">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                  			</tr>
                  			<tr>
                    			<td class="table-vertical__td table-vertical__td--left">학적 정보 연계(초등학교)</br>(I-IF-MOE-007)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040101001" />
		                            		<label for="QA040101001" class="chkeck-wrap__label">초등학생여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040101001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040101002" />
		                            		<label for="QA040101002" class="chkeck-wrap__label">초등학생여부(N)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040101002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040102004" />
		                            		<label for="QA040102004" class="chkeck-wrap__label">초등4학년
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040102004" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040102006" />
		                            		<label for="QA040102006" class="chkeck-wrap__label">초등6학년
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040102006" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040102005" />
		                            		<label for="QA040102005" class="chkeck-wrap__label">초등5학년
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040102005" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            
			                        </div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left">중학교 재학 정보</br>(I-IF-MOE-008)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-008" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040103001" />
		                            		<label for="QA040103001" class="chkeck-wrap__label">중학생여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040103001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                        </div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left">고등학교 재학 정보</br>(I-IF-MOE-009)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-009" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040108001" />
		                            		<label for="QA040108001" class="chkeck-wrap__label">고등학생여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040108001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-009" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040106001" />
		                            		<label for="QA040106001" class="chkeck-wrap__label">고등학교졸업여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040106001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-009" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040109002" />
		                            		<label for="QA040109002" class="chkeck-wrap__label">고등2학년
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040109002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOE-009" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA040109003" />
		                            		<label for="QA040109003" class="chkeck-wrap__label">고등3학년
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA040109003" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                        </div>
								</td>
                   			</tr>
                  			<tr>
                    			<td class="table-vertical__td" rowspan="2">국가보훈처</td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">국가유공자 자격정보<br>(I-IF-MPVA-002)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap" value="I-IF-MPVA-002">
										<select class="selectMpva">
											<option value="">자격조건 선택 1</option>
		                   					<option value="QA020246001">4·19혁명공로자_가족여부(Y)</option>
											<option value="QA020247001">4·19혁명공로자_배우자여부(Y)</option>
											<option value="QA020245001">4·19혁명공로자_본인여부(Y)</option>
											<option value="QA020249001">4·19혁명공로자_부모여부(Y)</option>
											<option value="QA020248001">4·19혁명공로자_자녀여부(Y)</option>
											<option value="QA020241001">4·19혁명부상자_가족여부(Y)</option>
											<option value="QA020242001">4·19혁명부상자_배우자여부(Y)</option>
											<option value="QA020240001">4·19혁명부상자_본인여부(Y)</option>
											<option value="QA020244001">4·19혁명부상자_부모여부(Y)</option>
											<option value="QA020243001">4·19혁명부상자_자녀여부(Y)</option>
											<option value="QA020236001">4·19혁명사망자_가족여부(Y)</option>
											<option value="QA020237001">4·19혁명사망자_배우자여부(Y)</option>
											<option value="QA020239001">4·19혁명사망자_부모여부(Y)</option>
											<option value="QA020238001">4·19혁명사망자_자녀여부(Y)</option>
											<option value="QA020406001">5·18부상자_가족여부(Y)</option>
											<option value="QA020407001">5·18부상자_배우자여부(Y)</option>
											<option value="QA020405001">5·18부상자_본인여부(Y)</option>
											<option value="QA020409001">5·18부상자_부모여부(Y)</option>
											<option value="QA020408001">5·18부상자_자녀여부(Y)</option>
											<option value="QA020401001">5·18사망자·행불자_가족여부(Y)</option>
											<option value="QA020402001">5·18사망자·행불자_배우자여부(Y)</option>
											<option value="QA020404001">5·18사망자·행불자_부모여부(Y)</option>
											<option value="QA020403001">5·18사망자·행불자_자녀여부(Y)</option>
											<option value="QA020411001">5·18희생자_가족여부(Y)</option>
											<option value="QA020412001">5·18희생자_배우자여부(Y)</option>
											<option value="QA020410001">5·18희생자_본인여부(Y)</option>
											<option value="QA020414001">5·18희생자_부모여부(Y)</option>
											<option value="QA020413001">5·18희생자_자녀여부(Y)</option>
											<option value="QA020232001">6·25참전재일학도의용군인_가족여부(Y)</option>
											<option value="QA020233001">6·25참전재일학도의용군인_배우자여부(Y)</option>
											<option value="QA020231001">6·25참전재일학도의용군인_본인여부(Y)</option>
											<option value="QA020235001">6·25참전재일학도의용군인_부모여부(Y)</option>
											<option value="QA020234001">6·25참전재일학도의용군인_자녀여부(Y)</option>
											<option value="QA020307001">고엽제후유(의)증_가족여부(Y)</option>
											<option value="QA020308001">고엽제후유(의)증_배우자여부(Y)</option>
											<option value="QA020306001">고엽제후유(의)증_본인여부(Y)</option>
											<option value="QA020310001">고엽제후유(의)증_부모여부(Y)</option>
											<option value="QA020309001">고엽제후유(의)증_자녀여부(Y)</option>
											<option value="QA020255001">공상공무원_가족여부(Y)</option>
											<option value="QA020256001">공상공무원_배우자여부(Y)</option>
											<option value="QA020254001">공상공무원_본인여부(Y)</option>
											<option value="QA020258002">공상공무원_부모여부(Y)</option>
											<option value="QA020257002">공상공무원_자녀여부(Y)</option>
											<option value="QA020216001">공상군경_가족여부(Y)</option>
											<option value="QA020217001">공상군경_배우자여부(Y)</option>
											<option value="QA020215001">공상군경_본인여부(Y)</option>
											<option value="QA020219001">공상군경_부모여부(Y)</option>
											<option value="QA020220001">공상군경_상이급수 1급</option>
											<option value="QA020220002">공상군경_상이급수 2급</option>
											<option value="QA020220003">공상군경_상이급수 3급</option>
											<option value="QA020220004">공상군경_상이급수 4급</option>
											<option value="QA020220005">공상군경_상이급수 5급</option>
											<option value="QA020220006">공상군경_상이급수 6급</option>
											<option value="QA020220007">공상군경_상이급수 7급</option>
											<option value="QA020220008">공상군경_상이급수 8급</option>
											<option value="QA020218001">공상군경_자녀여부(Y)</option>
											<option value="QA020269001">국가사회발전특별공로공로자_가족여부(Y)</option>
											<option value="QA020270001">국가사회발전특별공로공로자_배우자여부(Y)</option>
											<option value="QA020268001">국가사회발전특별공로공로자_본인여부(Y)</option>
											<option value="QA020272001">국가사회발전특별공로공로자_부모여부(Y)</option>
											<option value="QA020271001">국가사회발전특별공로공로자_자녀여부(Y)</option>
											<option value="QA020264002">국가사회발전특별공로상이자_가족여부(Y)</option>
											<option value="QA020265002">국가사회발전특별공로상이자_배우자여부(Y)</option>
											<option value="QA020263002">국가사회발전특별공로상이자_본인여부(Y)</option>
											<option value="QA020267002">국가사회발전특별공로상이자_부모여부(Y)</option>
											<option value="QA020266002">국가사회발전특별공로상이자_자녀여부(Y)</option>
											<option value="QA020259002">국가사회발전특별공로순직자_가족여부(Y)</option>
											<option value="QA020260002">국가사회발전특별공로순직자_배우자여부(Y)</option>
											<option value="QA020262002">국가사회발전특별공로순직자_부모여부(Y)</option>
											<option value="QA020261002">국가사회발전특별공로순직자_자녀여부(Y)</option>
											<option value="QA020222001">무공수훈자_가족여부(Y)</option>
											<option value="QA020223001">무공수훈자_배우자여부(Y)</option>
											<option value="QA020221001">무공수훈자_본인여부(Y)</option>
											<option value="QA020225001">무공수훈자_부모여부(Y)</option>
											<option value="QA020224001">무공수훈자_자녀여부(Y)</option>
											<option value="QA020227001">보국수훈자_가족여부(Y)</option>
											<option value="QA020228001">보국수훈자_배우자여부(Y)</option>
											<option value="QA020226001">보국수훈자_본인여부(Y)</option>
											<option value="QA020230001">보국수훈자_부모여부(Y)</option>
											<option value="QA020229001">보국수훈자_자녀여부(Y)</option>
											<option value="QA020101001">순국선열_가족여부(Y)</option>
											<option value="QA020102001">순국선열_배우자여부(Y)</option>
											<option value="QA020104001">순국선열_손자녀여부(Y)</option>
											<option value="QA020103001">순국선열_자녀여부(Y)</option>
											<option value="QA020250001">순직공무원_가족여부(Y)</option>
											<option value="QA020251001">순직공무원_배우자여부(Y)</option>
											<option value="QA020253001">순직공무원_부모여부(Y)</option>
											<option value="QA020252001">순직공무원_자녀여부(Y)</option>
											<option value="QA020211001">순직군경_가족여부(Y)</option>
											<option value="QA020212001">순직군경_배우자여부(Y)</option>
											<option value="QA020214001">순직군경_부모여부(Y)</option>
											<option value="QA020213001">순직군경_자녀여부(Y)</option>
											<option value="QA020106001">애국지사_가족여부(Y)</option>
											<option value="QA020107001">애국지사_배우자여부(Y)</option>
											<option value="QA020105001">애국지사_본인여부(Y)</option>
											<option value="QA020109001">애국지사_손자녀여부(Y)</option>
											<option value="QA020108001">애국지사_자녀여부(Y)</option>
											<option value="QA020625001">재해부상공무원_가족여부(Y)</option>
											<option value="QA020626001">재해부상공무원_배우자여부(Y)</option>
											<option value="QA020624001">재해부상공무원_본인여부(Y)</option>
											<option value="QA020628001">재해부상공무원_부모여부(Y)</option>
											<option value="QA020627001">재해부상공무원_자녀여부(Y)</option>
											<option value="QA020619001">재해부상군경 상이급수 1급</option>
											<option value="QA020619002">재해부상군경 상이급수 2급</option>
											<option value="QA020619003">재해부상군경 상이급수 3급</option>
											<option value="QA020619004">재해부상군경 상이급수 4급</option>
											<option value="QA020619005">재해부상군경 상이급수 5급</option>
											<option value="QA020619006">재해부상군경 상이급수 6급</option>
											<option value="QA020619007">재해부상군경 상이급수 7급</option>
											<option value="QA020619008">재해부상군경 상이급수 8급</option>
											<option value="QA020615001">재해부상군경_가족여부(Y)</option>
											<option value="QA020616001">재해부상군경_배우자여부(Y)</option>
											<option value="QA020614001">재해부상군경_본인여부(Y)</option>
											<option value="QA020618001">재해부상군경_부모여부(Y)</option>
											<option value="QA020617001">재해부상군경_자녀여부(Y)</option>
											<option value="QA020620001">재해사망공무원_가족여부(Y)</option>
											<option value="QA020621001">재해사망공무원_배우자여부(Y)</option>
											<option value="QA020623001">재해사망공무원_부모여부(Y)</option>
											<option value="QA020622001">재해사망공무원_자녀여부(Y)</option>
											<option value="QA020610001">재해사망군경_가족여부(Y)</option>
											<option value="QA020611001">재해사망군경_배우자여부(Y)</option>
											<option value="QA020613001">재해사망군경_부모여부(Y)</option>
											<option value="QA020612001">재해사망군경_자녀여부(Y)</option>
											<option value="QA020201001">전몰군경_가족여부(Y)</option>
											<option value="QA020202001">전몰군경_배우자여부(Y)</option>
											<option value="QA020204001">전몰군경_부모여부(Y)</option>
											<option value="QA020203001">전몰군경_자녀여부(Y)</option>
											<option value="QA020206001">전상군경_가족여부(Y)</option>
											<option value="QA020207001">전상군경_배우자여부(Y)</option>
											<option value="QA020205001">전상군경_본인여부(Y)</option>
											<option value="QA020209001">전상군경_부모여부(Y)</option>
											<option value="QA020210001">전상군경_상이급수 1급</option>
											<option value="QA020210002">전상군경_상이급수 2급</option>
											<option value="QA020210003">전상군경_상이급수 3급</option>
											<option value="QA020210004">전상군경_상이급수 4급</option>
											<option value="QA020210005">전상군경_상이급수 5급</option>
											<option value="QA020210006">전상군경_상이급수 6급</option>
											<option value="QA020210007">전상군경_상이급수 7급</option>
											<option value="QA020210008">전상군경_상이급수 8급</option>
											<option value="QA020208001">전상군경_자녀여부(Y)</option>
											<option value="QA020302001">참전유공자_가족여부(Y)</option>
											<option value="QA020303001">참전유공자_배우자여부(Y)</option>
											<option value="QA020301001">참전유공자_본인여부(Y)</option>
											<option value="QA020305001">참전유공자_부모여부(Y)</option>
											<option value="QA020304001">참전유공자_자녀여부(Y)</option>
											<option value="QA020511001">특수임무공로자_가족여부(Y)</option>
											<option value="QA020512001">특수임무공로자_배우자여부(Y)</option>
											<option value="QA020510001">특수임무공로자_본인여부(Y)</option>
											<option value="QA020514001">특수임무공로자_부모여부(Y)</option>
											<option value="QA020513001">특수임무공로자_자녀여부(Y)</option>
											<option value="QA020506001">특수임무부상자_가족여부(Y)</option>
											<option value="QA020507001">특수임무부상자_배우자여부(Y)</option>
											<option value="QA020505001">특수임무부상자_본인여부(Y)</option>
											<option value="QA020509001">특수임무부상자_부모여부(Y)</option>
											<option value="QA020508001">특수임무부상자_자녀여부(Y)</option>
											<option value="QA020501001">특수임무사망자·행불자_가족여부(Y)</option>
											<option value="QA020502001">특수임무사망자·행불자_배우자여부(Y)</option>
											<option value="QA020504001">특수임무사망자·행불자_부모여부(Y)</option>
											<option value="QA020503001">특수임무사망자·행불자_자녀여부(Y)</option>
		                   				</select>
		                   				<select class="selectMpva">
		                   					<option value="">자격조건 선택 2</option>
		                   					<option value="QA020246001">4·19혁명공로자_가족여부(Y)</option>
											<option value="QA020247001">4·19혁명공로자_배우자여부(Y)</option>
											<option value="QA020245001">4·19혁명공로자_본인여부(Y)</option>
											<option value="QA020249001">4·19혁명공로자_부모여부(Y)</option>
											<option value="QA020248001">4·19혁명공로자_자녀여부(Y)</option>
											<option value="QA020241001">4·19혁명부상자_가족여부(Y)</option>
											<option value="QA020242001">4·19혁명부상자_배우자여부(Y)</option>
											<option value="QA020240001">4·19혁명부상자_본인여부(Y)</option>
											<option value="QA020244001">4·19혁명부상자_부모여부(Y)</option>
											<option value="QA020243001">4·19혁명부상자_자녀여부(Y)</option>
											<option value="QA020236001">4·19혁명사망자_가족여부(Y)</option>
											<option value="QA020237001">4·19혁명사망자_배우자여부(Y)</option>
											<option value="QA020239001">4·19혁명사망자_부모여부(Y)</option>
											<option value="QA020238001">4·19혁명사망자_자녀여부(Y)</option>
											<option value="QA020406001">5·18부상자_가족여부(Y)</option>
											<option value="QA020407001">5·18부상자_배우자여부(Y)</option>
											<option value="QA020405001">5·18부상자_본인여부(Y)</option>
											<option value="QA020409001">5·18부상자_부모여부(Y)</option>
											<option value="QA020408001">5·18부상자_자녀여부(Y)</option>
											<option value="QA020401001">5·18사망자·행불자_가족여부(Y)</option>
											<option value="QA020402001">5·18사망자·행불자_배우자여부(Y)</option>
											<option value="QA020404001">5·18사망자·행불자_부모여부(Y)</option>
											<option value="QA020403001">5·18사망자·행불자_자녀여부(Y)</option>
											<option value="QA020411001">5·18희생자_가족여부(Y)</option>
											<option value="QA020412001">5·18희생자_배우자여부(Y)</option>
											<option value="QA020410001">5·18희생자_본인여부(Y)</option>
											<option value="QA020414001">5·18희생자_부모여부(Y)</option>
											<option value="QA020413001">5·18희생자_자녀여부(Y)</option>
											<option value="QA020232001">6·25참전재일학도의용군인_가족여부(Y)</option>
											<option value="QA020233001">6·25참전재일학도의용군인_배우자여부(Y)</option>
											<option value="QA020231001">6·25참전재일학도의용군인_본인여부(Y)</option>
											<option value="QA020235001">6·25참전재일학도의용군인_부모여부(Y)</option>
											<option value="QA020234001">6·25참전재일학도의용군인_자녀여부(Y)</option>
											<option value="QA020307001">고엽제후유(의)증_가족여부(Y)</option>
											<option value="QA020308001">고엽제후유(의)증_배우자여부(Y)</option>
											<option value="QA020306001">고엽제후유(의)증_본인여부(Y)</option>
											<option value="QA020310001">고엽제후유(의)증_부모여부(Y)</option>
											<option value="QA020309001">고엽제후유(의)증_자녀여부(Y)</option>
											<option value="QA020255001">공상공무원_가족여부(Y)</option>
											<option value="QA020256001">공상공무원_배우자여부(Y)</option>
											<option value="QA020254001">공상공무원_본인여부(Y)</option>
											<option value="QA020258002">공상공무원_부모여부(Y)</option>
											<option value="QA020257002">공상공무원_자녀여부(Y)</option>
											<option value="QA020216001">공상군경_가족여부(Y)</option>
											<option value="QA020217001">공상군경_배우자여부(Y)</option>
											<option value="QA020215001">공상군경_본인여부(Y)</option>
											<option value="QA020219001">공상군경_부모여부(Y)</option>
											<option value="QA020220001">공상군경_상이급수 1급</option>
											<option value="QA020220002">공상군경_상이급수 2급</option>
											<option value="QA020220003">공상군경_상이급수 3급</option>
											<option value="QA020220004">공상군경_상이급수 4급</option>
											<option value="QA020220005">공상군경_상이급수 5급</option>
											<option value="QA020220006">공상군경_상이급수 6급</option>
											<option value="QA020220007">공상군경_상이급수 7급</option>
											<option value="QA020220008">공상군경_상이급수 8급</option>
											<option value="QA020218001">공상군경_자녀여부(Y)</option>
											<option value="QA020269001">국가사회발전특별공로공로자_가족여부(Y)</option>
											<option value="QA020270001">국가사회발전특별공로공로자_배우자여부(Y)</option>
											<option value="QA020268001">국가사회발전특별공로공로자_본인여부(Y)</option>
											<option value="QA020272001">국가사회발전특별공로공로자_부모여부(Y)</option>
											<option value="QA020271001">국가사회발전특별공로공로자_자녀여부(Y)</option>
											<option value="QA020264002">국가사회발전특별공로상이자_가족여부(Y)</option>
											<option value="QA020265002">국가사회발전특별공로상이자_배우자여부(Y)</option>
											<option value="QA020263002">국가사회발전특별공로상이자_본인여부(Y)</option>
											<option value="QA020267002">국가사회발전특별공로상이자_부모여부(Y)</option>
											<option value="QA020266002">국가사회발전특별공로상이자_자녀여부(Y)</option>
											<option value="QA020259002">국가사회발전특별공로순직자_가족여부(Y)</option>
											<option value="QA020260002">국가사회발전특별공로순직자_배우자여부(Y)</option>
											<option value="QA020262002">국가사회발전특별공로순직자_부모여부(Y)</option>
											<option value="QA020261002">국가사회발전특별공로순직자_자녀여부(Y)</option>
											<option value="QA020222001">무공수훈자_가족여부(Y)</option>
											<option value="QA020223001">무공수훈자_배우자여부(Y)</option>
											<option value="QA020221001">무공수훈자_본인여부(Y)</option>
											<option value="QA020225001">무공수훈자_부모여부(Y)</option>
											<option value="QA020224001">무공수훈자_자녀여부(Y)</option>
											<option value="QA020227001">보국수훈자_가족여부(Y)</option>
											<option value="QA020228001">보국수훈자_배우자여부(Y)</option>
											<option value="QA020226001">보국수훈자_본인여부(Y)</option>
											<option value="QA020230001">보국수훈자_부모여부(Y)</option>
											<option value="QA020229001">보국수훈자_자녀여부(Y)</option>
											<option value="QA020101001">순국선열_가족여부(Y)</option>
											<option value="QA020102001">순국선열_배우자여부(Y)</option>
											<option value="QA020104001">순국선열_손자녀여부(Y)</option>
											<option value="QA020103001">순국선열_자녀여부(Y)</option>
											<option value="QA020250001">순직공무원_가족여부(Y)</option>
											<option value="QA020251001">순직공무원_배우자여부(Y)</option>
											<option value="QA020253001">순직공무원_부모여부(Y)</option>
											<option value="QA020252001">순직공무원_자녀여부(Y)</option>
											<option value="QA020211001">순직군경_가족여부(Y)</option>
											<option value="QA020212001">순직군경_배우자여부(Y)</option>
											<option value="QA020214001">순직군경_부모여부(Y)</option>
											<option value="QA020213001">순직군경_자녀여부(Y)</option>
											<option value="QA020106001">애국지사_가족여부(Y)</option>
											<option value="QA020107001">애국지사_배우자여부(Y)</option>
											<option value="QA020105001">애국지사_본인여부(Y)</option>
											<option value="QA020109001">애국지사_손자녀여부(Y)</option>
											<option value="QA020108001">애국지사_자녀여부(Y)</option>
											<option value="QA020625001">재해부상공무원_가족여부(Y)</option>
											<option value="QA020626001">재해부상공무원_배우자여부(Y)</option>
											<option value="QA020624001">재해부상공무원_본인여부(Y)</option>
											<option value="QA020628001">재해부상공무원_부모여부(Y)</option>
											<option value="QA020627001">재해부상공무원_자녀여부(Y)</option>
											<option value="QA020619001">재해부상군경 상이급수 1급</option>
											<option value="QA020619002">재해부상군경 상이급수 2급</option>
											<option value="QA020619003">재해부상군경 상이급수 3급</option>
											<option value="QA020619004">재해부상군경 상이급수 4급</option>
											<option value="QA020619005">재해부상군경 상이급수 5급</option>
											<option value="QA020619006">재해부상군경 상이급수 6급</option>
											<option value="QA020619007">재해부상군경 상이급수 7급</option>
											<option value="QA020619008">재해부상군경 상이급수 8급</option>
											<option value="QA020615001">재해부상군경_가족여부(Y)</option>
											<option value="QA020616001">재해부상군경_배우자여부(Y)</option>
											<option value="QA020614001">재해부상군경_본인여부(Y)</option>
											<option value="QA020618001">재해부상군경_부모여부(Y)</option>
											<option value="QA020617001">재해부상군경_자녀여부(Y)</option>
											<option value="QA020620001">재해사망공무원_가족여부(Y)</option>
											<option value="QA020621001">재해사망공무원_배우자여부(Y)</option>
											<option value="QA020623001">재해사망공무원_부모여부(Y)</option>
											<option value="QA020622001">재해사망공무원_자녀여부(Y)</option>
											<option value="QA020610001">재해사망군경_가족여부(Y)</option>
											<option value="QA020611001">재해사망군경_배우자여부(Y)</option>
											<option value="QA020613001">재해사망군경_부모여부(Y)</option>
											<option value="QA020612001">재해사망군경_자녀여부(Y)</option>
											<option value="QA020201001">전몰군경_가족여부(Y)</option>
											<option value="QA020202001">전몰군경_배우자여부(Y)</option>
											<option value="QA020204001">전몰군경_부모여부(Y)</option>
											<option value="QA020203001">전몰군경_자녀여부(Y)</option>
											<option value="QA020206001">전상군경_가족여부(Y)</option>
											<option value="QA020207001">전상군경_배우자여부(Y)</option>
											<option value="QA020205001">전상군경_본인여부(Y)</option>
											<option value="QA020209001">전상군경_부모여부(Y)</option>
											<option value="QA020210001">전상군경_상이급수 1급</option>
											<option value="QA020210002">전상군경_상이급수 2급</option>
											<option value="QA020210003">전상군경_상이급수 3급</option>
											<option value="QA020210004">전상군경_상이급수 4급</option>
											<option value="QA020210005">전상군경_상이급수 5급</option>
											<option value="QA020210006">전상군경_상이급수 6급</option>
											<option value="QA020210007">전상군경_상이급수 7급</option>
											<option value="QA020210008">전상군경_상이급수 8급</option>
											<option value="QA020208001">전상군경_자녀여부(Y)</option>
											<option value="QA020302001">참전유공자_가족여부(Y)</option>
											<option value="QA020303001">참전유공자_배우자여부(Y)</option>
											<option value="QA020301001">참전유공자_본인여부(Y)</option>
											<option value="QA020305001">참전유공자_부모여부(Y)</option>
											<option value="QA020304001">참전유공자_자녀여부(Y)</option>
											<option value="QA020511001">특수임무공로자_가족여부(Y)</option>
											<option value="QA020512001">특수임무공로자_배우자여부(Y)</option>
											<option value="QA020510001">특수임무공로자_본인여부(Y)</option>
											<option value="QA020514001">특수임무공로자_부모여부(Y)</option>
											<option value="QA020513001">특수임무공로자_자녀여부(Y)</option>
											<option value="QA020506001">특수임무부상자_가족여부(Y)</option>
											<option value="QA020507001">특수임무부상자_배우자여부(Y)</option>
											<option value="QA020505001">특수임무부상자_본인여부(Y)</option>
											<option value="QA020509001">특수임무부상자_부모여부(Y)</option>
											<option value="QA020508001">특수임무부상자_자녀여부(Y)</option>
											<option value="QA020501001">특수임무사망자·행불자_가족여부(Y)</option>
											<option value="QA020502001">특수임무사망자·행불자_배우자여부(Y)</option>
											<option value="QA020504001">특수임무사망자·행불자_부모여부(Y)</option>
											<option value="QA020503001">특수임무사망자·행불자_자녀여부(Y)</option>
		                   				</select>
		                   				<select class="selectMpva">
		                   					<option value="">자격조건 선택 3</option>
		                   					<option value="QA020246001">4·19혁명공로자_가족여부(Y)</option>
											<option value="QA020247001">4·19혁명공로자_배우자여부(Y)</option>
											<option value="QA020245001">4·19혁명공로자_본인여부(Y)</option>
											<option value="QA020249001">4·19혁명공로자_부모여부(Y)</option>
											<option value="QA020248001">4·19혁명공로자_자녀여부(Y)</option>
											<option value="QA020241001">4·19혁명부상자_가족여부(Y)</option>
											<option value="QA020242001">4·19혁명부상자_배우자여부(Y)</option>
											<option value="QA020240001">4·19혁명부상자_본인여부(Y)</option>
											<option value="QA020244001">4·19혁명부상자_부모여부(Y)</option>
											<option value="QA020243001">4·19혁명부상자_자녀여부(Y)</option>
											<option value="QA020236001">4·19혁명사망자_가족여부(Y)</option>
											<option value="QA020237001">4·19혁명사망자_배우자여부(Y)</option>
											<option value="QA020239001">4·19혁명사망자_부모여부(Y)</option>
											<option value="QA020238001">4·19혁명사망자_자녀여부(Y)</option>
											<option value="QA020406001">5·18부상자_가족여부(Y)</option>
											<option value="QA020407001">5·18부상자_배우자여부(Y)</option>
											<option value="QA020405001">5·18부상자_본인여부(Y)</option>
											<option value="QA020409001">5·18부상자_부모여부(Y)</option>
											<option value="QA020408001">5·18부상자_자녀여부(Y)</option>
											<option value="QA020401001">5·18사망자·행불자_가족여부(Y)</option>
											<option value="QA020402001">5·18사망자·행불자_배우자여부(Y)</option>
											<option value="QA020404001">5·18사망자·행불자_부모여부(Y)</option>
											<option value="QA020403001">5·18사망자·행불자_자녀여부(Y)</option>
											<option value="QA020411001">5·18희생자_가족여부(Y)</option>
											<option value="QA020412001">5·18희생자_배우자여부(Y)</option>
											<option value="QA020410001">5·18희생자_본인여부(Y)</option>
											<option value="QA020414001">5·18희생자_부모여부(Y)</option>
											<option value="QA020413001">5·18희생자_자녀여부(Y)</option>
											<option value="QA020232001">6·25참전재일학도의용군인_가족여부(Y)</option>
											<option value="QA020233001">6·25참전재일학도의용군인_배우자여부(Y)</option>
											<option value="QA020231001">6·25참전재일학도의용군인_본인여부(Y)</option>
											<option value="QA020235001">6·25참전재일학도의용군인_부모여부(Y)</option>
											<option value="QA020234001">6·25참전재일학도의용군인_자녀여부(Y)</option>
											<option value="QA020307001">고엽제후유(의)증_가족여부(Y)</option>
											<option value="QA020308001">고엽제후유(의)증_배우자여부(Y)</option>
											<option value="QA020306001">고엽제후유(의)증_본인여부(Y)</option>
											<option value="QA020310001">고엽제후유(의)증_부모여부(Y)</option>
											<option value="QA020309001">고엽제후유(의)증_자녀여부(Y)</option>
											<option value="QA020255001">공상공무원_가족여부(Y)</option>
											<option value="QA020256001">공상공무원_배우자여부(Y)</option>
											<option value="QA020254001">공상공무원_본인여부(Y)</option>
											<option value="QA020258002">공상공무원_부모여부(Y)</option>
											<option value="QA020257002">공상공무원_자녀여부(Y)</option>
											<option value="QA020216001">공상군경_가족여부(Y)</option>
											<option value="QA020217001">공상군경_배우자여부(Y)</option>
											<option value="QA020215001">공상군경_본인여부(Y)</option>
											<option value="QA020219001">공상군경_부모여부(Y)</option>
											<option value="QA020220001">공상군경_상이급수 1급</option>
											<option value="QA020220002">공상군경_상이급수 2급</option>
											<option value="QA020220003">공상군경_상이급수 3급</option>
											<option value="QA020220004">공상군경_상이급수 4급</option>
											<option value="QA020220005">공상군경_상이급수 5급</option>
											<option value="QA020220006">공상군경_상이급수 6급</option>
											<option value="QA020220007">공상군경_상이급수 7급</option>
											<option value="QA020220008">공상군경_상이급수 8급</option>
											<option value="QA020218001">공상군경_자녀여부(Y)</option>
											<option value="QA020269001">국가사회발전특별공로공로자_가족여부(Y)</option>
											<option value="QA020270001">국가사회발전특별공로공로자_배우자여부(Y)</option>
											<option value="QA020268001">국가사회발전특별공로공로자_본인여부(Y)</option>
											<option value="QA020272001">국가사회발전특별공로공로자_부모여부(Y)</option>
											<option value="QA020271001">국가사회발전특별공로공로자_자녀여부(Y)</option>
											<option value="QA020264002">국가사회발전특별공로상이자_가족여부(Y)</option>
											<option value="QA020265002">국가사회발전특별공로상이자_배우자여부(Y)</option>
											<option value="QA020263002">국가사회발전특별공로상이자_본인여부(Y)</option>
											<option value="QA020267002">국가사회발전특별공로상이자_부모여부(Y)</option>
											<option value="QA020266002">국가사회발전특별공로상이자_자녀여부(Y)</option>
											<option value="QA020259002">국가사회발전특별공로순직자_가족여부(Y)</option>
											<option value="QA020260002">국가사회발전특별공로순직자_배우자여부(Y)</option>
											<option value="QA020262002">국가사회발전특별공로순직자_부모여부(Y)</option>
											<option value="QA020261002">국가사회발전특별공로순직자_자녀여부(Y)</option>
											<option value="QA020222001">무공수훈자_가족여부(Y)</option>
											<option value="QA020223001">무공수훈자_배우자여부(Y)</option>
											<option value="QA020221001">무공수훈자_본인여부(Y)</option>
											<option value="QA020225001">무공수훈자_부모여부(Y)</option>
											<option value="QA020224001">무공수훈자_자녀여부(Y)</option>
											<option value="QA020227001">보국수훈자_가족여부(Y)</option>
											<option value="QA020228001">보국수훈자_배우자여부(Y)</option>
											<option value="QA020226001">보국수훈자_본인여부(Y)</option>
											<option value="QA020230001">보국수훈자_부모여부(Y)</option>
											<option value="QA020229001">보국수훈자_자녀여부(Y)</option>
											<option value="QA020101001">순국선열_가족여부(Y)</option>
											<option value="QA020102001">순국선열_배우자여부(Y)</option>
											<option value="QA020104001">순국선열_손자녀여부(Y)</option>
											<option value="QA020103001">순국선열_자녀여부(Y)</option>
											<option value="QA020250001">순직공무원_가족여부(Y)</option>
											<option value="QA020251001">순직공무원_배우자여부(Y)</option>
											<option value="QA020253001">순직공무원_부모여부(Y)</option>
											<option value="QA020252001">순직공무원_자녀여부(Y)</option>
											<option value="QA020211001">순직군경_가족여부(Y)</option>
											<option value="QA020212001">순직군경_배우자여부(Y)</option>
											<option value="QA020214001">순직군경_부모여부(Y)</option>
											<option value="QA020213001">순직군경_자녀여부(Y)</option>
											<option value="QA020106001">애국지사_가족여부(Y)</option>
											<option value="QA020107001">애국지사_배우자여부(Y)</option>
											<option value="QA020105001">애국지사_본인여부(Y)</option>
											<option value="QA020109001">애국지사_손자녀여부(Y)</option>
											<option value="QA020108001">애국지사_자녀여부(Y)</option>
											<option value="QA020625001">재해부상공무원_가족여부(Y)</option>
											<option value="QA020626001">재해부상공무원_배우자여부(Y)</option>
											<option value="QA020624001">재해부상공무원_본인여부(Y)</option>
											<option value="QA020628001">재해부상공무원_부모여부(Y)</option>
											<option value="QA020627001">재해부상공무원_자녀여부(Y)</option>
											<option value="QA020619001">재해부상군경 상이급수 1급</option>
											<option value="QA020619002">재해부상군경 상이급수 2급</option>
											<option value="QA020619003">재해부상군경 상이급수 3급</option>
											<option value="QA020619004">재해부상군경 상이급수 4급</option>
											<option value="QA020619005">재해부상군경 상이급수 5급</option>
											<option value="QA020619006">재해부상군경 상이급수 6급</option>
											<option value="QA020619007">재해부상군경 상이급수 7급</option>
											<option value="QA020619008">재해부상군경 상이급수 8급</option>
											<option value="QA020615001">재해부상군경_가족여부(Y)</option>
											<option value="QA020616001">재해부상군경_배우자여부(Y)</option>
											<option value="QA020614001">재해부상군경_본인여부(Y)</option>
											<option value="QA020618001">재해부상군경_부모여부(Y)</option>
											<option value="QA020617001">재해부상군경_자녀여부(Y)</option>
											<option value="QA020620001">재해사망공무원_가족여부(Y)</option>
											<option value="QA020621001">재해사망공무원_배우자여부(Y)</option>
											<option value="QA020623001">재해사망공무원_부모여부(Y)</option>
											<option value="QA020622001">재해사망공무원_자녀여부(Y)</option>
											<option value="QA020610001">재해사망군경_가족여부(Y)</option>
											<option value="QA020611001">재해사망군경_배우자여부(Y)</option>
											<option value="QA020613001">재해사망군경_부모여부(Y)</option>
											<option value="QA020612001">재해사망군경_자녀여부(Y)</option>
											<option value="QA020201001">전몰군경_가족여부(Y)</option>
											<option value="QA020202001">전몰군경_배우자여부(Y)</option>
											<option value="QA020204001">전몰군경_부모여부(Y)</option>
											<option value="QA020203001">전몰군경_자녀여부(Y)</option>
											<option value="QA020206001">전상군경_가족여부(Y)</option>
											<option value="QA020207001">전상군경_배우자여부(Y)</option>
											<option value="QA020205001">전상군경_본인여부(Y)</option>
											<option value="QA020209001">전상군경_부모여부(Y)</option>
											<option value="QA020210001">전상군경_상이급수 1급</option>
											<option value="QA020210002">전상군경_상이급수 2급</option>
											<option value="QA020210003">전상군경_상이급수 3급</option>
											<option value="QA020210004">전상군경_상이급수 4급</option>
											<option value="QA020210005">전상군경_상이급수 5급</option>
											<option value="QA020210006">전상군경_상이급수 6급</option>
											<option value="QA020210007">전상군경_상이급수 7급</option>
											<option value="QA020210008">전상군경_상이급수 8급</option>
											<option value="QA020208001">전상군경_자녀여부(Y)</option>
											<option value="QA020302001">참전유공자_가족여부(Y)</option>
											<option value="QA020303001">참전유공자_배우자여부(Y)</option>
											<option value="QA020301001">참전유공자_본인여부(Y)</option>
											<option value="QA020305001">참전유공자_부모여부(Y)</option>
											<option value="QA020304001">참전유공자_자녀여부(Y)</option>
											<option value="QA020511001">특수임무공로자_가족여부(Y)</option>
											<option value="QA020512001">특수임무공로자_배우자여부(Y)</option>
											<option value="QA020510001">특수임무공로자_본인여부(Y)</option>
											<option value="QA020514001">특수임무공로자_부모여부(Y)</option>
											<option value="QA020513001">특수임무공로자_자녀여부(Y)</option>
											<option value="QA020506001">특수임무부상자_가족여부(Y)</option>
											<option value="QA020507001">특수임무부상자_배우자여부(Y)</option>
											<option value="QA020505001">특수임무부상자_본인여부(Y)</option>
											<option value="QA020509001">특수임무부상자_부모여부(Y)</option>
											<option value="QA020508001">특수임무부상자_자녀여부(Y)</option>
											<option value="QA020501001">특수임무사망자·행불자_가족여부(Y)</option>
											<option value="QA020502001">특수임무사망자·행불자_배우자여부(Y)</option>
											<option value="QA020504001">특수임무사망자·행불자_부모여부(Y)</option>
											<option value="QA020503001">특수임무사망자·행불자_자녀여부(Y)</option>
		                   				</select>
									</div>
								</td>
                   			</tr>
                   			<tr>		
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">보훈급여금 수급정보<br>(I-IF-MPVA-005)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
	                   					<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MPVA-005">
			                    			<input type="hidden" name="svcId" value="WII000001310">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="WII000001310" class="chkeck-wrap__label">국가보훈대상자 지급된 교육비 지원 여부       								
				                                <input type="checkbox" class="chkeck-wrap__input" id="WII000001310">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MPVA-005">
			                    			<input type="hidden" name="svcId" value="WII000001320">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="WII000001320" class="chkeck-wrap__label">국가보훈대상자 취업지원 여부							
				                                <input type="checkbox" class="chkeck-wrap__input" id="WII000001320">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MPVA-005">
			                    			<input type="hidden" name="svcId" value="PTR000051390">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="PTR000051390" class="chkeck-wrap__label">국가보훈대상자 대부지원 여부							
				                                <input type="checkbox" class="chkeck-wrap__input" id="PTR000051390">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MPVA-005">
			                    			<input type="hidden" name="svcId" value="WII000000040">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="WII000000040" class="chkeck-wrap__label">국가보훈대상자 의료지원 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="WII000000040">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MPVA-005">
			                    			<input type="hidden" name="svcId" value="999000000016">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="999000000016" class="chkeck-wrap__label">국가보훈대상자 양로지원 여부(요양지원)
				                                <input type="checkbox" class="chkeck-wrap__input" id="999000000016">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MPVA-005">
			                    			<input type="hidden" name="svcId" value="GPV000000010">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="GPV000000010" class="chkeck-wrap__label">국가보훈대상자 보철구 지급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="GPV000000010">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MPVA-005">
			                    			<input type="hidden" name="svcId" value="GPV000000070">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="GPV000000070" class="chkeck-wrap__label">제대군인 교육지원 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="GPV000000070">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MPVA-005">
			                    			<input type="hidden" name="svcId" value="GPV000000110">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="GPV000000110" class="chkeck-wrap__label">제대군인 전직지원금 여부(전직지원금(보훈급여))
				                                <input type="checkbox" class="chkeck-wrap__input" id="GPV000000110">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MPVA-005">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA070901001">
                   							<label for="QA070901001" class="chkeck-wrap__label">국가보훈대상자대부지원수급여부Y
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070901001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
		                            </div>
	                            </td>
                            </tr>			
							<tr>
                    			<td class="table-vertical__td" rowspan="9">국민건강보험공단</td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">산정특례 대상자 정보 조회<br>(I-IF-NHIS-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-NHIS-001">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA070104001">
		                            		<label for="QA070104001" class="chkeck-wrap__label">건강보험산정특례수급여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070104001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>			                    			
	                  			<td class="table-vertical__td table-vertical__td--left" rowspan="1">등급판정 결과 조회<br>(I-IF-NHIS-101)</td>
	                  			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
										<div class="chkeck-wrap__item">
		        							<input type="hidden" name="lnkId" value="I-IF-NHIS-101">
					            			<input type="hidden" name="svcId" value="">
					            			<input type="hidden" name="qualfAstCd" value="QA030703001">
	        								<label for="QA030703001" class="chkeck-wrap__label">장기요양인정등급1급
						                         <input type="checkbox" class="chkeck-wrap__input" id="QA030703001">
						                         <i class="chkeck-wrap__icon" aria-hidden="true"></i>
					                        </label>
										</div>
										<div class="chkeck-wrap__item">
		        							<input type="hidden" name="lnkId" value="I-IF-NHIS-101">
					            			<input type="hidden" name="svcId" value="">
					            			<input type="hidden" name="qualfAstCd" value="QA030703002">
	        								<label for="QA030703002" class="chkeck-wrap__label">장기요양인정등급2급
						                         <input type="checkbox" class="chkeck-wrap__input" id="QA030703002">
						                         <i class="chkeck-wrap__icon" aria-hidden="true"></i>
					                        </label>
										</div>
										</br>
										<div class="chkeck-wrap__item">
		        							<input type="hidden" name="lnkId" value="I-IF-NHIS-101">
					            			<input type="hidden" name="svcId" value="">
					            			<input type="hidden" name="qualfAstCd" value="QA030703003">
	        								<label for="QA030703003" class="chkeck-wrap__label">장기요양인정등급3급
						                         <input type="checkbox" class="chkeck-wrap__input" id="QA030703003">
						                         <i class="chkeck-wrap__icon" aria-hidden="true"></i>
					                        </label>
										</div>
										<div class="chkeck-wrap__item">
		        							<input type="hidden" name="lnkId" value="I-IF-NHIS-101">
					            			<input type="hidden" name="svcId" value="">
					            			<input type="hidden" name="qualfAstCd" value="QA030703004">
	        								<label for="QA030703004" class="chkeck-wrap__label">장기요양인정등급4급
						                         <input type="checkbox" class="chkeck-wrap__input" id="QA030703004">
						                         <i class="chkeck-wrap__icon" aria-hidden="true"></i>
					                        </label>
										</div>
										</br>
										<div class="chkeck-wrap__item">
		        							<input type="hidden" name="lnkId" value="I-IF-NHIS-101">
					            			<input type="hidden" name="svcId" value="">
					            			<input type="hidden" name="qualfAstCd" value="QA030703005">
	        								<label for="QA030703005" class="chkeck-wrap__label">장기요양인정등급5급
						                         <input type="checkbox" class="chkeck-wrap__input" id="QA030703005">
						                         <i class="chkeck-wrap__icon" aria-hidden="true"></i>
					                        </label>
										</div>
										<div class="chkeck-wrap__item">
		        							<input type="hidden" name="lnkId" value="I-IF-NHIS-101">
					            			<input type="hidden" name="svcId" value="">
					            			<input type="hidden" name="qualfAstCd" value="QA030702001">
	        								<label for="QA030702001" class="chkeck-wrap__label">장기요양등급판정여부Y
						                         <input type="checkbox" class="chkeck-wrap__input" id="QA030702001">
						                         <i class="chkeck-wrap__icon" aria-hidden="true"></i>
					                        </label>
										</div>
										</br>
										<div class="chkeck-wrap__item">
		        							<input type="hidden" name="lnkId" value="I-IF-NHIS-101">
					            			<input type="hidden" name="svcId" value="">
					            			<input type="hidden" name="qualfAstCd" value="QA030702002">
	        								<label for="QA030702002" class="chkeck-wrap__label">장기요양등급판정여부N
						                         <input type="checkbox" class="chkeck-wrap__input" id="QA030702002">
						                         <i class="chkeck-wrap__icon" aria-hidden="true"></i>
					                        </label>
										</div>
									</div>
								</td>
							</tr>
							<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">장기요양급여 재가급여 수급<br> 여부 조회 (I-IF-NHIS-102)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-NHIS-102">
			                    			<input type="hidden" name="svcId" value="SSE000000020">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="SSE000000020" class="chkeck-wrap__label">재가급여 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SSE000000020">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">장기요양급여 복지용구<br> 수급 여부 조회 (I-IF-NHIS-103)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-NHIS-103">
			                    			<input type="hidden" name="svcId" value="SSE000000030">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="SSE000000030" class="chkeck-wrap__label">복지용구 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SSE000000030">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>	
	                   			<td class="table-vertical__td table-vertical__td--left" rowspan="1">임산부정보<br>(I-IF-NHIS-104)</td>
	                   			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-NHIS-104">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA030103001">
		                            		<label for="QA030103001" class="chkeck-wrap__label">임산부여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA030103001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-NHIS-104">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="TQA030104">
		                            		<label for="TQA030104" class="chkeck-wrap__label">분만예정일
				                                <input type="checkbox" class="chkeck-wrap__input" id="TQA030104">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                                <input type="text" class="table-text" placeholder="전/후 일 수"/> 
			                            </div>
									</div>
								</td>
                  			</tr>
                  			<tr>
	                   			<td class="table-vertical__td table-vertical__td--left" rowspan="1">임신출산 진료비 지원대상여부<br> 확인 서비스 (I-IF-NHIS-105)</td>
	                   			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-NHIS-105">
			                    			<input type="hidden" name="svcId" value="SD0000007672">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="SD0000007672" class="chkeck-wrap__label">임신·출산 진료비 지원중 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SD0000007672">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                  			</tr>
                  			
                   			<tr>			                    			
	                   			<td class="table-vertical__td table-vertical__td--left" rowspan="1">장기요양급여 시설급여수급<br> 여부 조회 (I-IF-NHIS-106)</td>
	                   			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-NHIS-106">
			                    			<input type="hidden" name="svcId" value="135200005006">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="135200005006" class="chkeck-wrap__label">시설급여 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="135200005006">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
	                  		</tr>
                   			<tr>			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">장기요양급여 특별현금급여<br> 수급 여부 조회 (I-IF-NHIS-107)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-NHIS-107">
			                    			<input type="hidden" name="svcId" value="999000000048">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="999000000048" class="chkeck-wrap__label">특별현금급여 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="999000000048">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                            <tr>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">건강보험자격득실 및 보험료정보<br>(I-IF-NHIS-201)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
										<div class="chkeck-wrap__item">
											<input type="hidden" name="lnkId" value="I-IF-NHIS-201">
											<input type="hidden" name="svcId" value="">
											<input type="hidden" name="qualfAstCd" value="QA030102001">
											<label for="QA030102001" class="chkeck-wrap__label">직장가입자
									           <input type="checkbox" class="chkeck-wrap__input" id="QA030102001">
									           <i class="chkeck-wrap__icon" aria-hidden="true"></i>
									          </label>
										</div>	  
										<div class="chkeck-wrap__item">
											<input type="hidden" name="lnkId" value="I-IF-NHIS-201">
											<input type="hidden" name="svcId" value="">
											<input type="hidden" name="qualfAstCd" value="QA030102002">
											<label for="QA030102002" class="chkeck-wrap__label">지역가입자
									           <input type="checkbox" class="chkeck-wrap__input" id="QA030102002">
									           <i class="chkeck-wrap__icon" aria-hidden="true"></i>
									          </label>
										</div>	  
										</br>
										<div class="chkeck-wrap__item">
											<input type="hidden" name="lnkId" value="I-IF-NHIS-201">
											<input type="hidden" name="svcId" value="">
											<input type="hidden" name="qualfAstCd" value="QA030101001">
											<label for="QA030101001" class="chkeck-wrap__label">건강보험가입자여부(Y)
									           <input type="checkbox" class="chkeck-wrap__input" id="QA030101001">
									           <i class="chkeck-wrap__icon" aria-hidden="true"></i>
									          </label>
										</div>	                    							
										<div class="chkeck-wrap__item">
											<input type="hidden" name="lnkId" value="I-IF-NHIS-201">
											<input type="hidden" name="svcId" value="">
											<input type="hidden" name="qualfAstCd" value="QA030701001">
											<label for="QA030701001" class="chkeck-wrap__label">장기요양보험가입자여부Y
									           <input type="checkbox" class="chkeck-wrap__input" id="QA030701001">
									           <i class="chkeck-wrap__icon" aria-hidden="true"></i>
									          </label>
										</div>
									</div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td" rowspan="1">국민연금공단</td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">실업크레딧 지원 수급 여부<br>(I-IF-NPS-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-NPS-001">
			                    			<input type="hidden" name="svcId" value="B55201500004">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="B55201500004" class="chkeck-wrap__label">실업크레딧지원해당여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="B55201500004">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td" rowspan="6">농림축산식품부</td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">농업경영체증명 사실여부 <br>(I-IF-MAFRA-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MAFRA-001">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050101001">
		                            		<label for="QA0501010012" class="chkeck-wrap__label">농업인여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA0501010012">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">축산업등록 대상자 여부<br>(I-IF-MAFRA-002)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MAFRA-002">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050114001">
		                            		<label for="QA050114001" class="chkeck-wrap__label">축산인여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050114001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">농업경영체 자격정보<br>(I-IF-MAFRA-003)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MAFRA-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050104001">
		                            		<label for="QA050104001" class="chkeck-wrap__label">재배시설운영여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050104001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">후계농업인 여부<br>(I-IF-MAFRA-004)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MAFRA-004">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050105001">
		                            		<label for="QA050105001" class="chkeck-wrap__label">후계농업인여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050105001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MAFRA-004">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="TQA050106">
		                            		<label for="TQA050106" class="chkeck-wrap__label">후계농업인기간
				                                <input type="checkbox" class="chkeck-wrap__input" id="TQA050106">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                                <input type="text" class="table-text" placeholder="종사 년수"/>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">소유농지면적<br>(I-IF-MAFRA-005)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
           								<div class="chkeck-wrap__item">
	             							<input type="hidden" name="lnkId" value="I-IF-MAFRA-005">
				                 			<input type="hidden" name="svcId" value="">
				                 			<input type="hidden" name="qualfAstCd" value="QA050102001">
	             							<label for="QA050102001" class="chkeck-wrap__label">농지소유여부(Y)
				                              <input type="checkbox" class="chkeck-wrap__input" id="QA050102001">
				                              <i class="chkeck-wrap__icon" aria-hidden="true"></i>
				                             </label>
										</div>
									</div>
								</td>
							</tr>
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">공익직불 수급정보<br>(기본형,경영이양)<br> (I-IF-MAFRA-006)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
                 						<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MAFRA-006">
			                    			<input type="hidden" name="svcId" value="348000000233">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="348000000233" class="chkeck-wrap__label">농업에너지이용효율화시설지원 수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="348000000233">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MAFRA-006">
			                    			<input type="hidden" name="svcId" value="154300000396">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="154300000396" class="chkeck-wrap__label">청년 농업인 영농정착지원 수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="154300000396">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MAFRA-006">
			                    			<input type="hidden" name="svcId" value="SD0000001579">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="SD0000001579" class="chkeck-wrap__label">(공익직불 선택형) 친환경농업직불 수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SD0000001579">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MAFRA-006">
			                    			<input type="hidden" name="svcId" value="154300000306">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="154300000306" class="chkeck-wrap__label">(공익직불 선택형) 경관보전직불 수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="154300000306">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MAFRA-006">
			                    			<input type="hidden" name="svcId" value="SD0000010096">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="SD0000010096" class="chkeck-wrap__label">과수고품질시설현대화 수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SD0000010096">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MAFRA-006">
			                    			<input type="hidden" name="svcId" value="SD0000011823">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="SD0000011823" class="chkeck-wrap__label">유기질비료 지원 수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SD0000011823">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MAFRA-006">
			                    			<input type="hidden" name="svcId" value="154300000014">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="154300000014" class="chkeck-wrap__label">유기농업자재지원사업 수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="154300000014">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MAFRA-006">
			                    			<input type="hidden" name="svcId" value="154300000383">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="154300000383" class="chkeck-wrap__label">조사료생산기반확충사업 수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="154300000383">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MAFRA-006">
			                    			<input type="hidden" name="svcId" value="432000000094">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="432000000094" class="chkeck-wrap__label">토양개량제 지원 수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="432000000094">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>							
                   			<tr>
                    			<td class="table-vertical__td" rowspan="1">문화체육관광부</td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">스포츠강좌 이용권 대상자<br> 확인서비스 (I-IF-MCST-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MCST-001">
			                    			<input type="hidden" name="svcId" value="137100000006">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="137100000006" class="chkeck-wrap__label">이용권 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="137100000006">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td" rowspan="7">보건복지부</td>
                    			<!-- <td class="table-vertical__td table-vertical__td--left" rowspan="1">가정양육수당 수급 여부 정보 조회<br>(I-IF-MOHW-302)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
										<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-302">
			                    			<input type="hidden" name="svcId" value="SCH000000060">
			                    			<input type="hidden" name="qualfAstCd" value="QA070102001">
		                            		<label for="QA070102001" class="chkeck-wrap__label">가정양육수당수급여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070102001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-302">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA070102002">
		                            		<label for="QA070102002" class="chkeck-wrap__label">가정양육수당수급여부(N)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA070102002">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>			                    			 -->
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">국민기초생활수급자 정보 조회<br>(I-IF-MOHW-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
          								<div class="chkeck-wrap__item">
	            							<input type="hidden" name="lnkId" value="I-IF-MOHW-001">
				                			<input type="hidden" name="svcId" value="WII000001410">
				                			<input type="hidden" name="qualfAstCd" value="QA060201001">
	            							<label for="QA060201001" class="chkeck-wrap__label">생계급여자격여부(Y)
					                             <input type="checkbox" class="chkeck-wrap__input" id="QA060201001">
					                             <i class="chkeck-wrap__icon" aria-hidden="true"></i>
				                            </label>
										</div>
										<div class="chkeck-wrap__item">
	            							<input type="hidden" name="lnkId" value="I-IF-MOHW-001">
				                			<input type="hidden" name="svcId" value="">
				                			<input type="hidden" name="qualfAstCd" value="QA060201002">
	            							<label for="QA060201002" class="chkeck-wrap__label">생계급여자격여부(N)
					                             <input type="checkbox" class="chkeck-wrap__input" id="QA060201002">
					                             <i class="chkeck-wrap__icon" aria-hidden="true"></i>
				                            </label>
										</div>
										</br>
										<div class="chkeck-wrap__item">
	            							<input type="hidden" name="lnkId" value="I-IF-MOHW-001">
				                			<input type="hidden" name="svcId" value="999000000043">
				                			<input type="hidden" name="qualfAstCd" value="QA060202001">
	            							<label for="QA060202001" class="chkeck-wrap__label">의료급여자격여부(Y)
					                             <input type="checkbox" class="chkeck-wrap__input" id="QA060202001">
					                             <i class="chkeck-wrap__icon" aria-hidden="true"></i>
				                            </label>
										</div>
										<div class="chkeck-wrap__item">
	            							<input type="hidden" name="lnkId" value="I-IF-MOHW-001">
				                			<input type="hidden" name="svcId" value="">
				                			<input type="hidden" name="qualfAstCd" value="QA060202002">
	            							<label for="QA060202002" class="chkeck-wrap__label">의료급여자격여부(N)
					                             <input type="checkbox" class="chkeck-wrap__input" id="QA060202002">
					                             <i class="chkeck-wrap__icon" aria-hidden="true"></i>
				                            </label>
										</div>
										</br>
										<div class="chkeck-wrap__item">
	            							<input type="hidden" name="lnkId" value="I-IF-MOHW-001">
				                			<input type="hidden" name="svcId" value="336000000096">
				                			<input type="hidden" name="qualfAstCd" value="QA060203001">
	            							<label for="QA060203001" class="chkeck-wrap__label">주거급여자격여부(Y)
					                             <input type="checkbox" class="chkeck-wrap__input" id="QA060203001">
					                             <i class="chkeck-wrap__icon" aria-hidden="true"></i>
				                            </label>
										</div>
										<div class="chkeck-wrap__item">
	            							<input type="hidden" name="lnkId" value="I-IF-MOHW-001">
				                			<input type="hidden" name="svcId" value="">
				                			<input type="hidden" name="qualfAstCd" value="QA060203002">
	            							<label for="QA060203002" class="chkeck-wrap__label">주거급여자격여부(N)
					                             <input type="checkbox" class="chkeck-wrap__input" id="QA060203002">
					                             <i class="chkeck-wrap__icon" aria-hidden="true"></i>
				                            </label>
										</div>
										</br>
										<div class="chkeck-wrap__item">
	            							<input type="hidden" name="lnkId" value="I-IF-MOHW-001">
				                			<input type="hidden" name="svcId" value="134200000003">
				                			<input type="hidden" name="qualfAstCd" value="QA060204001">
	            							<label for="QA060204001" class="chkeck-wrap__label">교육급여자격여부(Y)
					                             <input type="checkbox" class="chkeck-wrap__input" id="QA060204001">
					                             <i class="chkeck-wrap__icon" aria-hidden="true"></i>
				                            </label>
										</div>
										<div class="chkeck-wrap__item">
	            							<input type="hidden" name="lnkId" value="I-IF-MOHW-001">
				                			<input type="hidden" name="svcId" value="">
				                			<input type="hidden" name="qualfAstCd" value="QA060204002">
	            							<label for="QA060204002" class="chkeck-wrap__label">교육급여자격여부(N)
					                             <input type="checkbox" class="chkeck-wrap__input" id="QA060204002">
					                             <i class="chkeck-wrap__icon" aria-hidden="true"></i>
				                            </label>
										</div>
									</div>
								</td>
							</tr>
                   			<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">차상위계층 정보 조회<br>(I-IF-MOHW-002)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
          								<div class="chkeck-wrap__item">
            								<input type="hidden" name="lnkId" value="I-IF-MOHW-002">
				                			<input type="hidden" name="svcId" value="">
				                			<input type="hidden" name="qualfAstCd" value="QA060205001">
            								<label for="QA060205001" class="chkeck-wrap__label">차상위계층자격여부(Y)
						                   		<input type="checkbox" class="chkeck-wrap__input" id="QA060205001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
            								<input type="hidden" name="lnkId" value="I-IF-MOHW-002">
				                			<input type="hidden" name="svcId" value="">
				                			<input type="hidden" name="qualfAstCd" value="QA060205002">
            								<label for="QA060205002" class="chkeck-wrap__label">차상위계층자격여부(N)
						                   		<input type="checkbox" class="chkeck-wrap__input" id="QA060205002">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div> 
			                            </br>
			                            <div class="chkeck-wrap__item">
            								<input type="hidden" name="lnkId" value="I-IF-MOHW-002">
				                			<input type="hidden" name="svcId" value="WLU000000020">
				                			<input type="hidden" name="qualfAstCd" value="QA060206001">
            								<label for="QA060206001" class="chkeck-wrap__label">차상위본인부담경감대상자격여부(Y)
						                   		<input type="checkbox" class="chkeck-wrap__input" id="QA060206001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
            								<input type="hidden" name="lnkId" value="I-IF-MOHW-002">
				                			<input type="hidden" name="svcId" value="">
				                			<input type="hidden" name="qualfAstCd" value="QA060213001">
            								<label for="QA060213001" class="chkeck-wrap__label">차상위장애인자격여부(Y)
						                   		<input type="checkbox" class="chkeck-wrap__input" id="QA060213001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
            								<input type="hidden" name="lnkId" value="I-IF-MOHW-002">
				                			<input type="hidden" name="svcId" value="">
				                			<input type="hidden" name="qualfAstCd" value="QA060208001">
            								<label for="QA060208001" class="chkeck-wrap__label">차상위자활근로자격여부(Y)
						                   		<input type="checkbox" class="chkeck-wrap__input" id="QA060208001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>	
                   			<tr>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">장애인 정보(장애인등급 정보)<br>(I-IF-MOHW-003)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">	                   					
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020802001">
                   							<label for="QA020802001" class="chkeck-wrap__label">뇌병변장애(주)     								
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020802001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020805001">
                   							<label for="QA020805001" class="chkeck-wrap__label">뇌병변장애(부)     								
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020805001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020802004">
                   							<label for="QA020802004" class="chkeck-wrap__label">시각장애(주)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020802004">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020805004">
                   							<label for="QA020805004" class="chkeck-wrap__label">시각장애(부)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020805004">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020802006">
                   							<label for="QA020802006" class="chkeck-wrap__label">심장장애(주)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020802006">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020805006">
                   							<label for="QA020805006" class="chkeck-wrap__label">심장장애(부)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020805006">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020802007">
                   							<label for="QA020802007" class="chkeck-wrap__label">언어장애(주)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020802007">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020805007">
                   							<label for="QA020805007" class="chkeck-wrap__label">언어장애(부)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020805007">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                          	</br>			                          	
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020802009">
                   							<label for="QA020802009" class="chkeck-wrap__label">자폐성장애(주)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020802009">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020805009">
                   							<label for="QA020805009" class="chkeck-wrap__label">자폐성장애(부)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020805009">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020802012">
                   							<label for="QA020802012" class="chkeck-wrap__label">지적장애(주)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020802012">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020805012">
                   							<label for="QA020805012" class="chkeck-wrap__label">지적장애(부)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020805012">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020802014">
                   							<label for="QA020802014" class="chkeck-wrap__label">지체장애(주)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020802014">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020805014">
                   							<label for="QA020805014" class="chkeck-wrap__label">지체장애(부)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020805014">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020802015">
                   							<label for="QA020802015" class="chkeck-wrap__label">척수장애(주)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020802015">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020805015">
                   							<label for="QA020805015" class="chkeck-wrap__label">척수장애(부)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020805015">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            </br>			                            
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020802016">
                   							<label for="QA020802016" class="chkeck-wrap__label">청각장애(주)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020802016">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020805016">
                   							<label for="QA020805016" class="chkeck-wrap__label">청각장애(부)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020805016">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020803001">
                   							<label for="QA020803001" class="chkeck-wrap__label">경증장애(주)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020803001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020803002">
                   							<label for="QA020803002" class="chkeck-wrap__label">중증장애(주)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020803002">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
			                            </br>			                            
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020801001">
                   							<label for="QA0208010011" class="chkeck-wrap__label">장애자격여부(Y)                   								
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA0208010011">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>		                                
			                            </div>
									</div>
								</td>
							</tr>
							<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">기초연금수급 대상자 정보 조회<br>(I-IF-MOHW-004)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-004">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA060210001">
		                            		<label for="QA060210001" class="chkeck-wrap__label">기초연금자격여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA060210001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-004">
			                    			<input type="hidden" name="svcId" value="SSE000000170">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="SSE000000170" class="chkeck-wrap__label">수급대상자 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SSE000000170">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
							<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">장애인연금 사실 여부 조회<br>(I-IF-MOHW-005)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-005">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA060211001">
		                            		<label for="QA060211001" class="chkeck-wrap__label">장애인연금자격여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA060211001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-005">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA060211002">
		                            		<label for="QA060211002" class="chkeck-wrap__label">장애인연금자격여부(N)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA060211002">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-005">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA060212001">
		                            		<label for="QA060212001" class="chkeck-wrap__label">장애인연금(기초주거교육차상위)자격여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA060212001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-005">
			                    			<input type="hidden" name="svcId" value="SD0000016119">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="SD0000016119" class="chkeck-wrap__label">장애인연금수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SD0000016119">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">한부모가족사실여부 조회<br>(I-IF-MOHW-006)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">	
	                   					<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOHW-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA060209001">
                   							<label for="QA060209001" class="chkeck-wrap__label">한부모가족자격여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA060209001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
									</div>
								</td>
							</tr>
                   			<!-- <tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">아동수당 수급 여부 정보 조회<br>(I-IF-MOHW-303)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-303">
			                    			<input type="hidden" name="svcId" value="135200000120">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="135200000120" class="chkeck-wrap__label">아동수당 지급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="135200000120">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr> -->
                   			<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">자활근로자 대상 여부<br>(I-IF-MOHW-010)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
										<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-010">
			                    			<input type="hidden" name="svcId" value="SBA000000100">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="SBA000000100" class="chkeck-wrap__label">자활근로자여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SBA000000100">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
		                            	<!-- <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-010">
			                    			<input type="hidden" name="svcId" value="SBA000000100">
			                    			<input type="hidden" name="qualfAstCd" value="QA060207001">
		                            		<label for="QA060207001" class="chkeck-wrap__label">자활근로자격여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA060207001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div> -->
		                            	<!-- <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-010">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA060208001">
		                            		<label for="QA060208001" class="chkeck-wrap__label">차상위자활근로자격여부Y
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA060208001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div> -->
									</div>
								</td>
                   			</tr>
                   			<!-- <tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">영유아보육료 수급 여부 정보 조회<br>(I-IF-MOHW-301)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOHW-301">
			                    			<input type="hidden" name="svcId" value="SCH000000010">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="SCH000000010" class="chkeck-wrap__label">영유아보육료 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SCH000000010">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr> -->
							<!-- <tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">장애인 차량여부 및 등급정보 조회<br>(I-IF-MOHW-008)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">	
	                   					
									</div>
								</td>
							</tr>	 -->
                   			<tr>
								<td class="table-vertical__td" rowspan="2">산림청</td>
								<td class="table-vertical__td table-vertical__td--left" rowspan="1">임업경영체등록정보<br>(I-IF-FOREST-001)</td>
								<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
				                   		<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-FOREST-001">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050113001">
                   							<label for="QA050113001" class="chkeck-wrap__label">임업인여부(Y)          								
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050113001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
										</div>
									</div>
								</td>
							</tr>  	
							<tr>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">산림복지바우처 수급 정보<br>(I-IF-FOREST-002)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<!-- <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-FOREST-002">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA021005001">
		                            		<label for="QA021005001" class="chkeck-wrap__label">산림복지서비스이용권대상자여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA021005001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div> -->
			                            <div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-FOREST-002">
			                    			<input type="hidden" name="svcId" value="140000000176">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="140000000176" class="chkeck-wrap__label">산림복지바우처 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="140000000176">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
							<tr>
                    			<td class="table-vertical__td" rowspan="2">질병관리본부</td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">희귀질환자 여부<br>(I-IF-KCDC-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-KCDC-001">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020901001">
		                            		<label for="QA020901001" class="chkeck-wrap__label">희귀질환자여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020901001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">희귀질환자 의료비 수급정보<br>(I-IF-KCDC-002)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-KCDC-002">
			                    			<input type="hidden" name="svcId" value="429000000646">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="429000000646" class="chkeck-wrap__label">희귀질환자 의료비 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="429000000646">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>
                    			<td class="table-vertical__td" rowspan="3">통일부</td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">북한이탈주민 여부<br>(I-IF-UNIKO-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-UNIKO-001">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020902001">
		                            		<label for="QA020902001" class="chkeck-wrap__label">북한이탈주민여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020902001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<tr>
			                    <td class="table-vertical__td table-vertical__td--left" rowspan="1">북한이탈주민지원금 수급여부<br>(I-IF-UNIKO-002)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
	                   					<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-UNIKO-002">
			                    			<input type="hidden" name="svcId" value="SD0000003311">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="SD0000003311" class="chkeck-wrap__label">북한이탈주민 지방거주장려금 지급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SD0000003311">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-UNIKO-002">
			                    			<input type="hidden" name="svcId" value="SD0000003310">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="SD0000003310" class="chkeck-wrap__label">북한이탈주민 주거지원금지급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SD0000003310">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-UNIKO-002">
			                    			<input type="hidden" name="svcId" value="WII000000080">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="WII000000080" class="chkeck-wrap__label">북한이탈주민 교육비 지원여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="WII000000080">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <!-- <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-UNIKO-002" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="TQA020905" />
                   							<label for="TQA020905" class="chkeck-wrap__label" >대한민국 입국일
				                                <input type="checkbox" class="chkeck-wrap__input" id="TQA020905" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                                <input id="srchStDateFmt1" name="srchStDateFmt1" class="table-text datePicker" style="width: 110px; font-size: 13px;" title="검색시작조회일자" readonly="readonly" type="text" maxlength="10">
			                            </div> -->
									</div>
								</td>
							</tr>
                   			<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">북한이탈주민 자격여부<br>(I-IF-UNIKO-003)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
	                   					<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-UNIKO-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020903001">
                   							<label for="QA020903001" class="chkeck-wrap__label">북한이탈주민_보호대상자여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020903001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-UNIKO-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020904001">
                   							<label for="QA020904001" class="chkeck-wrap__label">북한이탈주민_보호기간5년이내여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020904001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            </br>			                            
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-UNIKO-003">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA020906001">
                   							<label for="QA020906001" class="chkeck-wrap__label">북한이탈주민_거주배정지역지방여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA020906001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
									</div>
								</td>
							</tr>							
							<tr>
                    			<td class="table-vertical__td" rowspan="1">한국문화예술위원회</td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">문화누리카드 대상자 확인서비스<br>(I-IF-ARKO-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-ARKO-001">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA021006001">
		                            		<label for="QA021006001" class="chkeck-wrap__label">문화누리카드대상자여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA021006001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
                   			<!-- <tr>
                    			<td class="table-vertical__td" rowspan="1">해양수산부</td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">FTA 피해보상<br>(I-IF-MOF-003)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-MOF-003">
			                    			<input type="hidden" name="svcId" value="154300000126">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="I-IF-MOF-0030" class="chkeck-wrap__label">FTA 심사결과 확인여부
				                                
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr> -->
							<tr>			                    			
                    			<td class="table-vertical__td" rowspan="2">해양수산부</td>
                    			<!-- <td class="table-vertical__td table-vertical__td--left" rowspan="1">어업경영체증명정보<br>(I-IF-MOF-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
	                   					<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-001">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050107001">
                   							<label for="QA050107001" class="chkeck-wrap__label">어업인여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050107001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
									</div>
								</td>
							</tr>
							<tr>	 -->		                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">어선원부 사실여부<br>(I-IF-MOF-004)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
	                   					<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-004">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050108001">
                   							<label for="QA050108001" class="chkeck-wrap__label">어선소유여부(Y)                  								
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050108001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-004">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050109001">
                   							<label for="QA050109001" class="chkeck-wrap__label">연근해어선                  								
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050109001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-004">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="TQA050110">
                   							<label for="TQA050110" class="chkeck-wrap__label">소유어선규모(총톤수)                  								
				                                <input type="checkbox" class="chkeck-wrap__input" id="TQA050110">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                                <input type="text" class="table-text" placeholder="톤">
			                            </div>
									</div>
								</td>
							</tr>
                   			<tr>			                    			
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">양식면허(어업면허) 사실여부<br>(I-IF-MOF-006)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
	                   					<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050111001">
                   							<label for="QA050111001" class="chkeck-wrap__label">양식업여부(Y)
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050111001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112001">
                   							<label for="QA050112001" class="chkeck-wrap__label">구획어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112002">
                   							<label for="QA050112002" class="chkeck-wrap__label">근해획어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112002">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112003">
                   							<label for="QA050112003" class="chkeck-wrap__label">내수면양식업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112003">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112004">
                   							<label for="QA050112004" class="chkeck-wrap__label">복합양식어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112004">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112005">
                   							<label for="QA050112005" class="chkeck-wrap__label">어류등양식어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112005">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112006">
                   							<label for="QA050112006" class="chkeck-wrap__label">연안어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112006">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112007">
                   							<label for="QA050112007" class="chkeck-wrap__label">외해양식어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112007">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112008">
                   							<label for="QA050112008" class="chkeck-wrap__label">패류양식어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112008">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112009">
                   							<label for="QA050112009" class="chkeck-wrap__label">해조류양식어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112009">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112010">
                   							<label for="QA050112010" class="chkeck-wrap__label">협동양식어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112010">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112011">
                   							<label for="QA050112011" class="chkeck-wrap__label">육상해수양식어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112011">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOF-006">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA050112012">
                   							<label for="QA050112012" class="chkeck-wrap__label">종묘생산어업
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA050112012">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
									</div>
								</td>
							</tr>
							
							<tr>
                    			<td class="table-vertical__td" rowspan="1">행정안전부</td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">주민등록등본정보<br>(I-IF-MOIS-007)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">	
	                   					<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOIS-007">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="QA010301001">
                   							<label for="QA010301001" class="chkeck-wrap__label">세대주여부Y
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA010301001">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOIS-007">
			                    			<input type="hidden" name="svcId" value="">
			                    			<input type="hidden" name="qualfAstCd" value="TQA010303">
                   							<label for="TQA010303" class="chkeck-wrap__label">전체세대구성원수(범위)
				                                <input type="checkbox" class="chkeck-wrap__input" id="TQA010303">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			               
			                                <input type="text" class="table-text" placeholder="" style="width : 70px;"/>                 
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOIS-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA010304001" />
                   							<label for="QA010304001" class="chkeck-wrap__label" >다문화여부Y
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA010304001" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOIS-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="QA010304002" />
                   							<label for="QA010304002" class="chkeck-wrap__label" >다문화여부N
				                                <input type="checkbox" class="chkeck-wrap__input" id="QA010304002" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOIS-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="TQA010501" />
                   							<label for="TQA010501" class="chkeck-wrap__label" >전체 자녀수
				                                <input type="checkbox" class="chkeck-wrap__input" id="TQA010501" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                                <input type="text" class="table-text">
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOIS-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="TQA010502" />
                   							<label for="TQA010502" class="chkeck-wrap__label" >18세이하 자녀수
				                                <input type="checkbox" class="chkeck-wrap__input" id="TQA010502" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                                <input type="text" class="table-text">
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOIS-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="TQA010504" />
                   							<label for="TQA010504" class="chkeck-wrap__label" >자녀 나이/년수
				                                <input type="checkbox" class="chkeck-wrap__input" id="TQA010504" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                                <input type="text" class="table-text" placeholder="세" />
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-MOIS-007" />
			                    			<input type="hidden" name="svcId" value="" />
			                    			<input type="hidden" name="qualfAstCd" value="TTQA010504" />
                   							<label for="TTQA010504" class="chkeck-wrap__label" >자녀 나이/개월
				                                <input type="checkbox" class="chkeck-wrap__input" id="TTQA010504" />
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                                <input type="text" class="table-text" placeholder="개월" />
			                            </div>
									</div>
								</td>
							</tr>
							<tr>
	                   			<td class="table-vertical__td" rowspan="1"></td>
	                   			<td class="table-vertical__td table-vertical__td--left" rowspan="1">농어촌희망 장학금 수급 여부<br>(I-IF-RHOF-001)</td>
	                   			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
	                   					<div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-RHOF-001">
			                    			<input type="hidden" name="svcId" value="999000000031">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="999000000031" class="chkeck-wrap__label">농식품인재장학금 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="999000000031">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-RHOF-001">
			                    			<input type="hidden" name="svcId" value="999000000034">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="999000000034" class="chkeck-wrap__label">청년창업농육성장학금 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="999000000034">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
			                            </br>
			                            <div class="chkeck-wrap__item">
                   							<input type="hidden" name="lnkId" value="I-IF-RHOF-001">
			                    			<input type="hidden" name="svcId" value="999000000032">
			                    			<input type="hidden" name="qualfAstCd" value="">
                   							<label for="999000000032" class="chkeck-wrap__label">농업인자녀장학금 수급 여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="999000000032">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>			                                
			                            </div>
									</div>
								</td>
							</tr>
							<tr>
                    			<td class="table-vertical__td"></td>
                    			<td class="table-vertical__td table-vertical__td--left" rowspan="1">청년내일채움 수급 여부<br>(I-IF-KOSME-001)</td>
                    			<td class="table-vertical__td table-vertical__td--left">
									<div class="chkeck-wrap">
		                            	<div class="chkeck-wrap__item">
			                            	<input type="hidden" name="lnkId" value="I-IF-KOSME-001">
			                    			<input type="hidden" name="svcId" value="SD0000011848">
			                    			<input type="hidden" name="qualfAstCd" value="">
		                            		<label for="SD0000011848" class="chkeck-wrap__label">수급여부
				                                <input type="checkbox" class="chkeck-wrap__input" id="SD0000011848">
				                                <i class="chkeck-wrap__icon" aria-hidden="true"></i>
			                                </label>
			                            </div>
									</div>
								</td>
                   			</tr>
						</tbody>
	                </table>
	            </div>
            </form:form>
        </div>
    </div>
    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
</div>

<script>

	$(function(){
		var label = $(".chkeck-wrap__label");
		label.each(function(i){
			var svc = label[i].parentElement.children[1].value;
			var qualf = label[i].parentElement.children[2].value;
			
			label[i].setAttribute("title", svc + " / " + qualf)
		});
		
		//세부 연계 항목 insert
		$("#submitBtn").click(function(){
			var chk ="";

			var checkbox = $("input[type='checkbox']:checked");
			var select = $("option:selected");
			if(checkbox.length == 0 && select[0].value == ""){
				alert("선택된 세부 연계 항목이 없습니다. 선택 후 다시 시도해주세요.");
				return false;
			}

			var format = /^([0-9][0-9])(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])([0-9]{7})$/;
			if(!format.test($("input[name=jumin1]").val()+$("input[name=jumin2]").val())){
				alert("주민등록번호를 다시 입력해주세요.");
				return false;
			}

			var cnt = 0;
	 		checkbox.each(function(i){

				var parent = checkbox[i].parentElement.parentElement;
				var childInput = $(parent).children(type='input');

				var temp = "";
				var remark = "";
				if(childInput[3] != null && childInput[3] != ""){
					remark = childInput[3].value.replace(/-/gi, "");
				}
				
				temp += '<input type="hidden" id="voL'+i+'" name="voList['+i+'].lnkId" value="'+childInput[0].value+'" />';
				temp += '<input type="hidden" id="voS'+i+'" name="voList['+i+'].svcId" value="'+childInput[1].value+'" />';
				temp += '<input type="hidden" id="voQ'+i+'" name="voList['+i+'].qualfAstCd" value="'+childInput[2].value+'" />';
				temp += '<input type="hidden" id="voR'+i+'" name="voList['+i+'].remark" value="'+remark+'" />';

				$("#vrifyForm").append(temp);
				cnt += 1;
			});


	 		select.each(function(i){
	 			if(select[i].value != null && select[i].value != ""){
	 				var lnkId = select[i].parentElement.parentElement.getAttribute("value");
	 				var temp = "";

	 				temp += '<input type="hidden" id="voL'+i+'" name="voList['+(cnt+i)+'].lnkId" value="'+lnkId+'" />';
					temp += '<input type="hidden" id="voS'+i+'" name="voList['+(cnt+i)+'].svcId" value="" />';
					temp += '<input type="hidden" id="voQ'+i+'" name="voList['+(cnt+i)+'].qualfAstCd" value="'+select[i].value+'" />';
					temp += '<input type="hidden" id="voR'+i+'" name="voList['+(cnt+i)+'].remark" value="" />';

					$("#vrifyForm").append(temp);
	 			}
	 		});
	 		target=""

	 		// 팝업창
	 		//window.open("","vrifyResultForm","width="+screen.width/4*3+", height="+screen.height);

	 		// 새탭
	 		window.open("","vrifyResultForm");
	 		var frm = document.vrifyForm;
	 		frm.target = "vrifyResultForm";
	 		frm.submit();

	 		checkbox.each(function(i){
				var parent = checkbox[i].parentElement.parentElement;
				var childInput = $(parent).children(type='input');

				$("input").remove('#voL'+i);
				$("input").remove('#voS'+i);
				$("input").remove('#voQ'+i);
				$("input").remove('#voR'+i);
			});
	 		
	 		select.each(function(i){
	 			if(select[i].value != null && select[i].value != ""){
	 				var lnkId = select[i].parentElement.parentElement.getAttribute("value");

					$("input").remove('#voL'+i);
					$("input").remove('#voS'+i);
					$("input").remove('#voQ'+i);
					$("input").remove('#voR'+i);
	 			}
	 		});

		});
	});

	$(document).ready(function() {
		$("input.datePicker").datepicker({
			dateFormat : 'yy-mm-dd',
			showOtherMonths : true,
			showMonthAfterYeasr : true
		});
		$("input.datePicker").datepicker('setDate', 'today');
		//jquery date picker 적용
		$('input.datePicker').osDatepicker({
			stDt : '#srchStDateFmt',
			stDt : '#srchStDateFmt1'
		});

	});

</script>
</body>
</html>
