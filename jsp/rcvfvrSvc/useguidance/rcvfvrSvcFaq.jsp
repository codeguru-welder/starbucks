<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
<title>자주 묻는 질문 | 이용안내 | 보조금24</title>

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
			<jsp:param name="mnb" value="rcvfvrSvcfaq" />
		</jsp:include>
		
		<div id="content" class="web-content">
	        <div class="container container--full background-skyblue">
	            <div class="container">
	                <div class="common-background visual-box visual-box--faq">
	                    <div class="visual-box__inner">
	                        <div class="visual-box__title"><strong>자주묻는질문(FAQ)에</strong> 답해드립니다.</div>
	                        <div class="visual-box__text">
	                            무엇을 도와드릴까요? 궁금하신 점을 알려드립니다.
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	        <div class="container">
	            <div class="faq__wrap">
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>보조금24란 무엇인가요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>정부에서 개인·가구에게 제공하는 각종 혜택(보조금)을 확인하기 위해 행정기관이나 부처별 누리집을 방문하여 서비스 내용을 확인하지 않고도 정부24를 통해 내가 받을 수 있는 혜택을 쉽고 편리하게 확인할 수 있는 맞춤안내 서비스입니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>보조금24 이용 방법은요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>PC에서 정부24(www.gov.kr)에 접속하거나 모바일로 정부24 앱을 이용하여 보조금24 서비스를 확인할 수 있습니다.</li>
	                            <li>보조금24는 정부24회원을 대상으로 서비스를 제공하며, 정부24회원 로그인 후 보조금24 이용에 대한 동의 후에 이용할 수 있습니다.</li>
	                            <li>서비스 이용 동의한 경우, 보조금24 메뉴 클릭 시 신청하면 받을 수 있는 혜택, 일부 자격조건만 확인되어 접수창구 담당자 확인이 필요한 혜택, 이미 받고 있는 혜택 목록을 확인할 수 있습니다.("신청하세요, 확인하세요, 받고 있어요"로 구분하여 안내)</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>보조금24에서 맞춤 안내하는 혜택(보조금)은 무엇인가요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>보조금24는 현금, 현물, 이용권 등 중앙부처 수혜서비스 305종에 대해 개인의 연령, 소득, 자격기준 정보를 행정기관에서 보유하고 있는 정보와 연계하여 맞춤 안내 서비스를 제공합니다.</li>
	                            <li>분야별로는 복지, 고용, 농‧수산분야 서비스가 많고, 수혜대상자 유형별로 보면 기초수급자, 차상위 등 저소득층, 노인, 장애인, 임산부 및 영유아 대상 서비스가 많습니다.</li>
	                            <li>지원 형태별로 보면 현금지원(92종), 이용권(27종), 현물지원(23종) 지원이 많고 의료지원, 일자리, 돌봄 서비스도 있습니다.</li>
	                        </ul>
	                        <div class="example__wrap">
	                            <p>※ 지원형태별 서비스 예시(일부)</p>
	                            <div class="example__box">
	                                <div class="example__table">
	                                    <div class="example__table--thead">
	                                        <span>No.</span>
	                                        <span>현금</span>
	                                    </div>
	                                    <div class="example__table--tbody">
	                                        <div class="table--tr">
	                                            <span>1</span>
	                                            <span>가정양육수단</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>2</span>
	                                            <span>누리과정(유아학비)지원</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>3</span>
	                                            <span>방과후보육료지원</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>4</span>
	                                            <span>출산전후휴가급여</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>5</span>
	                                            <span>긴급복지생계지원</span>
	                                         </div>
	                                    </div>   
	                                </div>
	                                <div class="example__table">
	                                    <div class="example__table--thead">
	                                        <span>No.</span>
	                                        <span>현금(보험/융자)</span>
	                                    </div>
	                                    <div class="example__table--tbody">
	                                        <div class="table--tr">
	                                            <span>1</span>
	                                            <span>장애인 자립자금 대여</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>2</span>
	                                            <span>일반 상환 학자금대출</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>3</span>
	                                            <span>기술창업자금 지원</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>4</span>
	                                            <span>노후긴급자금 대부지원</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>5</span>
	                                            <span>수산장비 구입 지원</span>
	                                        </div>
	                                    </div>   
	                                </div>
	                                <div class="example__table">
	                                    <div class="example__table--thead">
	                                        <span>No.</span>
	                                        <span>서비스(돌봄)</span>
	                                    </div>
	                                    <div class="example__table--tbody">
	                                        <div class="table--tr">
	                                            <span>1</span>
	                                            <span>노인맞춤 돌봄서비스</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>2</span>
	                                            <span>다함께 돌봄</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>3</span>
	                                            <span>아이 돌봄서비스</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>4</span>
	                                            <span>초등돌봄교실</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>5</span>
	                                            <span>치매관리 서비스</span>
	                                        </div>
	                                    </div>   
	                                </div> 
	                            </div>
	                            <div class="example__box">
	                                <div class="example__table">
	                                    <div class="example__table--thead">
	                                        <span>No.</span>
	                                        <span>서비스(의료)</span>
	                                    </div>
	                                    <div class="example__table--tbody">
	                                        <div class="table--tr">
	                                            <span>1</span>
	                                            <span>의료급여</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>2</span>
	                                            <span>치매 치료관리비 지원</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>3</span>
	                                            <span>노인 안검진 및 개안수술</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>4</span>
	                                            <span>어린이 국가예방접종</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>5</span>
	                                            <span>희귀질환자 의료비</span>
	                                        </div>
	                                    </div>   
	                                </div>
	                                <div class="example__table">
	                                    <div class="example__table--thead">
	                                        <span>No.</span>
	                                        <span>서비스(일자리)</span>
	                                    </div>
	                                    <div class="example__table--tbody">
	                                        <div class="table--tr">
	                                            <span>1</span>
	                                            <span>국민내일배움카드</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>2</span>
	                                            <span>장애인 일자리 지원</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>3</span>
	                                            <span>노인일자리 및 사회활동지원</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>4</span>
	                                            <span>구직자 취업지원서비스</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>5</span>
	                                            <span>지역주도형 청년일자리</span>
	                                        </div>
	                                    </div>   
	                                </div>
	                                <div class="example__table">
	                                    <div class="example__table--thead">
	                                        <span>No.</span>
	                                        <span>이용권</span>
	                                    </div>
	                                    <div class="example__table--tbody">
	                                        <div class="table--tr">
	                                            <span>1</span>
	                                            <span>통합문화이용권</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>2</span>
	                                            <span>에너지바우처</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>3</span>
	                                            <span>장애인활동지원</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>4</span>
	                                            <span>스포츠강좌이용권</span>
	                                        </div>
	                                        <div class="table--tr">
	                                            <span>5</span>
	                                            <span>산림복지서비스이용권</span>
	                                        </div>
	                                    </div>   
	                                </div>
	                            </div> 
	                        </div>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>자신이 받을 수 있는 혜택 외에 부모나 자녀와 같이 함께 살고 있는 가족이 받을 수 있는 혜택(보조금)도 안내 받을 수 있나요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>보조금24는 본인과 14세 미만 자녀에 한해서 받을 수 있는 혜택을 안내하고 있습니다. (단, 부모는 법정대리인으로서, 14세 미만 자녀 정보이용 동의 시 안내 가능)</li>
	                            <li>’21년 말에는 주민등록상 같은 세대에 거주하는 가족이 이용 동의를 한 경우 가족이 받을 수 있는 혜택까지 확대 제공할 예정입니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title active" title="내용 열기" id="accordionA"><span>보조금24 맞춤 안내 결과는 어떻게 나오는 건가요?</span></a>
	                    </div>
	                    <div class="accordion__body" id="accordionDiv">
	                        <ul class="list__dash">
	                            <li>개인의 회원정보(식별정보)를 토대로 여러 행정기관이 보유하고 있는 주민등록, 소득정보, 기초수급자·차상위 등 가구특성, 장애인·농업인·유공자 등 개인 자격정보와 서비스 수급 여부를 확인하여 서비스별 연령·소득·가구 특성 및 자격정보를 매칭하여 서비스 대상자 조건이 모두 일치하는 경우에는 '신청하세요'로, 일부 조건만 확인되는 경우에는 '확인하세요'로 안내하고 있습니다.</li>
	                            <li>현재는 50여종의 자격정보로 '신청하세요'와 '확인하세요'로. 서비스 수급여부 64종으로 '받고 있어요' 정보를 제공하고 있습니다.</li>
	                            <li>소득과 자격정보 중 일부 정보는 올해 연계 예정이거나 시스템으로 관리하고 있지 않을 경우 맞춤 안내 결과가 실제와 다를 수 있습니다.<br>예를 들어, 아동수당을 받고 있는데 정보 미연계로 '신청하세요'에 보이고 있습니다.</li>
	                            <li>보조금24는 여러 서비스별 대상자 자격조건을 시스템간 정보연계를 통해 확인 가능한 정보로 혜택받을 수 있는지를 안내하고 있으며, 일부 서비스의 경우 당해 연도 예산, 신청 기기, 기관의 사정 등에 따라 다를 수 있으므로 서비스 안내 정보의 문의처나 접수기관에 추가 확인해 보시기 바랍니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>맞춤 안내를 받은 서비스를 보조금24에서 신청할 수 있나요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>맞춤 안내 대상 305종의 서비스 중 정부24에서 온라인 신청이 가능한 서비스는 25종입니다. 서비스별 안내 정보 중 상단에 신청방법이 '온라인 신청'으로 안내되는 서비스가 바로 신청 가능한 서비스입니다.</li>
	                            <li>정부24가 아닌 복지로 등 타 사이트에서 신청 가능 한 서비스는 94종이며, 서비스별 안내 정보 상단에 '타 사이트 신청'으로 안내되는 서비스이며 클릭 시 해당 사이트 메인화면으로 이동하게 됩니다. 보조금24에서는 이러한 링크 서비스를 관계 기관과 협의하여 해당 신청 화면으로 이동할 수 있도록 개선할 예정입니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>정부가 지원하는 모든 보조금 사업을 안내하나요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>정부의 보조금 사업정보는 기획재정부의 e나라도움(www.gosims.go.kr)에서 확인하시면 됩니다.</li>
	                            <li>보조금24에서는 개인·가구를 대상으로 현금·현물·이용권 등을 제공하는 보조금 사업 또는 정부 지원 사업을 통해 제공되는 서비스를 대상으로 안내하고 있습니다.</li>
	                            <li>협회‧단체·법인·시설 등을 대상으로 지원하는 사업, 시설 운영 및 R&D 등 개인이 신청해야 받는 서비스와 관련 없는 보조금 사업은 보조금24 서비스 대상이 아닙니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>보조금24 맞춤 안내 결과 '신청하세요' 또는 '확인하세요'로 안내되는 서비스에 대해 묻고 싶습니다. 어디로 연락하면 될까요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>보조금24에서 안내되는 305종에 대해 서비스별 지원 대상자, 선정 기준, 지원내용, 신청방법 등 세부사항은 서비스 안내 정보 하단의 문의처 또는 접수기관에 연락하거나 방문하여 문의하시기 바랍니다.</li>
	                            <li>그 외 맞춤 안내 결과, 대상 서비스 목록, 시스템 오류 관련 사항은 정부24 헬프데스크(1588-2188)로 문의하시기 바랍니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>지난해 코로나로 인해 지난해 소득이 적은데, 보조금24에서 받을 수 있는 혜택이 없다고 나옵니다.</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>보조금24의 305종 서비스 중 약 100여종의 서비스는 중위소득구간(재산·소득정보)이 필수 자격조건이라 현재 소득구간이 확인되는 공적급여 대상자(기초수급자, 차상위계층, 기초연금수급자 등)에 한해서 서비스를 제공하고 있습니다.</li>
	                            <li>공적급여대상자가 아닌 국민의 경우에는 소득기준과 상관없는 200여 종의 서비스를 대상으로 맞춤 안내 제공 중이며, 향후 행정기관간 정보 연계를 통해 소득정보 확인이 되는 대상자가 늘게되면 이에 대한 서비스도 안내될 것입니다.</li>
	                            <li>코로나19 정부지원 혜택과 같이 추경 예산 등을 통해 지원하는 신규 혜택들도 정부부처 담당자가 서비스 정보를 통합관리시스템에 등록하면 보조금24를 통해 안내될 예정입니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>현재 보여주고 있는 서비스가 전부인가요? 다음 번에 접속하여도 동일하게 보여지는지요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>현재는 21년도 중앙부처 사업기준으로 개인이 현금, 현물, 바우처 등 정부가 지원하는 혜택 305종을 대상으로 안내하고 있으며,</li>
	                            <li>올해 연말에는 광역, 기초지자체별로 제공하는 혜택까지 추가되고, 개인에서 동의를 받아 동일세대에 거주하는 가족이 받을 수 있는 혜택까지 안내될 수 있도록 서비스가 확대될 예정입니다.</li>
	                            <li>또한 연령, 소득, 가구특성 등 50여 개의 자격정보를 시스템간 정보확인을 통해 안내하고 있으나, 연말에는 연계되는 자격정보가 확대되어 맞춤 안내되는 서비스도 일부 늘어날 수 있습니다.</li>
	                            <li>다만, 보조금24의 개인의 자격조건 변동이 없을 경우 맞춤 안내되는 서비스 내역이 바뀌지 않을 것입니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>받을 수 있는 혜택이 많을 거라 생각했는데 그렇지 않네요. 맞춤안내 결과를 신뢰할 수 있나요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>보조금24는 소득기준, 개인 특성, 가구 특성, 연령 조건별 여러자격을 행정기관에서 보유하고 있는 정보 연계를 통해 확인되는 자격정보로 서비스별 자격조건과 매칭하여 맞춤 안내 결과를 제공하고 있습니다.</li>
	                            <li>소득기준, 개인 특성, 가구 특성, 연령 조건 등에 따라 개개인이 받을 수 있는 정부 지원 혜택은 많을 수도 있고, 없을 수도 있습니다.</li>
	                            <li>공적급여 대상인 기초수급자, 차상위, 한 부모가정 등 저소득가구 대상으로 지원하는 혜택이 다양합니다.</li>
	                            <li>장애인, 임산부, 보훈대상자와 같이 개인 특성에 따라 여러 혜택이 있으며, 영유아, 어린이, 대학생, 노인을 연령 조건에 따라 지원 혜택이 많습니다.</li>
	                            <li>서비스별 소득기준, 가구 특성에 관련된 자격에 대한 정보연계를 확대하고 있어 추후 맞춤 안내 결과에 대한 신뢰도도 향상될 것입니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>일부 정보는 사실과 다른 거 같아요, 이미 받고 있는 서비스가 '확인하세요'로 안내되네요.</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>보조금24에서 안내되고 있는 서비스 중 일부 서비스는 수급 여부를 시스템 간 정보연계가 되어 있지 않아 받고 있지만 받을 수 있는 혜택으로 안내되고 있습니다.</li>
	                            <li>올해 수급 여부에 대해 정보연계를 확대하고 있어, ’21년 말에는 이미 받고 있는 대상자에게는 받고 있는 혜택으로, 대상은 되지만 신청하지 않은 국민에게는 받을 수 있는 혜택으로 안내되도록 보완될 예정입니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>인터넷 사용이 어려운 부모님은 어떻게 정보를 안내받을 수 있을까요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>인터넷 사용이 취약한 어르신의 경우에는 가까운 주민센터를 방문하여 보조금24 창구 당담자의 안내를 받아, 본인확인 후 서비스 목록 열람 신청서를 작성하여 제출하시면 온라인과 동일하게 내가 받을 수 있는 정부 지원 혜택들을 안내받을 수 있습니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <!-- 210421 추가 -->
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>17세 자녀도 같이 살고 있는데 부모가 보조금24에서 확인할 수 없나요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>보조금24는 개인별 맞춤 안내 서비스를 제공하고 있으며, 개인정보보호법 제22조에 의거 만 14세 미만 아동에 대해서는 부모의 동의를 받아 서비스를 제공 중이며,</li>
	                            <li>만 15세 이상의 경우에는 대리인이 아닌 본인이 보조금24를 이용하거나 가까운 주민센터를 방문하여 안내받아야 합니다.</li>
	                            <li>22년부터는 주민등록상 같은 세대에 거주하고 있는 가족에 한해 동의를 받아 우리 가족 맞춤 서비스를 제공하도록 준비 중에 있습니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>'신청하세요'로 안내된 서비스를 신청하려고 안내된 문의처에 확인해 보니 올해는 신청기한이 지났다고 합니다. 좀 더 정확하게 안내되었으면 더 좋을 거 같아요.</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>서비스별 소관 부서에서 등록한 안내 정보로 보조금24에서는 표출되고 있습니다. 일부 지자체마다 사업 기간이 다르고, 신청 시기 등이 상이한 경우가 있는데 접수·확인된 내용에 대해서는 안내 정보를 보완할 예정입니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>보조금24가 보건복지부 복지로 또는 복지멤버십 서비스와는 어떻게 다른가요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>복지분야의 서비스를 온라인에서 안내하고 신청하는 누리집이 복지로(복지멤버십)이라면, 보조금24는 복지분야뿐 아니라 고용, 농림, 수산, 보훈 등 전 분야에 걸쳐 개인이 받을 수 있는 모든 서비스(보조금)를 한 곳에서 한 번에 확인할 수 있는 맞춤 안내 서비스입니다.</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="accordion__wrap">
	                    <div class="accordion__head">
	                        <a href="#" class="accordion__title" title="내용 열기"><span>구글플레이에 등록된 보조금24 이용안내 앱(보조금24 활용안내서, 보조금24 이용안내 등)은 어떤 앱인가요?</span></a>
	                    </div>
	                    <div class="accordion__body">
	                        <ul class="list__dash">
	                            <li>현재 구글플레이에 등록되어 있는 보조금24 이용안내 관련 앱은 행정안전부에서 제공하는 「보조금24」 이용안내 정보를 활용하여개인이 제작, 배포한 앱임을 알려드립니다.</li>
	                            <li>「보조금24」 서비스는 정부24 회원을 대상으로 맞춤안내 서비스를 제공합니다. 따라서 「보조금24」 관련 이용안내 및 서비스 이용은 정부24 홈페이지(www.gov.kr) 또는 정부24 앱에서 확인해 주시기 바랍니다.</li>
	                        </ul>
	                    </div>
                </div>
	            </div>
	        </div>
	    </div>
	    
<script type="text/javascript">
	var accordionYn = "${accordionYn}";
	//alert("accordionYn:"+accordionYn);
	
	if(accordionYn == "N") {
		$('#accordionA').removeClass('active')
	 	$("#accordionDiv").hide();
	}
</script>

   	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
</div>

</body>
</html>
