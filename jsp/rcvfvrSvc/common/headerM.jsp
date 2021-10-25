<input type="hidden" value="${fn:substring(paramUser.RRN,0,7)}" id="age" />
<div class="m-header">
    <a href="/portal/rcvfvrSvc/main" class="m-header__logo"><span class="hide">정부24 보조금24</span></a>
    <c:if test="${not empty user && user.USER_ID != null}">
       	<button class="m-header__log logout" onclick="location.href='/portal/myPublicPlner?Mcode=11009'"><span class="hide">로그아웃</span></button>
	</c:if>
	<c:if test="${not empty user && user.USER_ID == null}">
		<button class="m-header__log login" onclick="location.href='/nlogin/?curr_url=/portal/rcvfvrSvc/main'"><span class="hide">로그인</span></button>
	</c:if>

	<c:if test="${empty user}">
		<c:if test="${not empty user_imsi}">
    		<button class="m-header__log logout" onclick="location.href='/portal/myPublicPlner?Mcode=11009'"><span class="hide">로그아웃</span></button>
		</c:if>
		<c:if test="${empty user_imsi}">
			<button class="m-header__log login" onclick="location.href='/nlogin/?curr_url=/portal/rcvfvrSvc/main'"><span class="hide">로그인</span></button>
		</c:if>
	</c:if>
    <button class="m-header__search"><span class="hide">통합 검색</span></button>
    <button class="m-all-menu"><span class="hide">전체 메뉴</span></button>
    <div class="m-menu">
    	<div class="m-menu__top">
   			<c:if test="${not empty user && user.USER_ID != null}">
	        	<button type="button" class="m-menu__button" onclick="location.href='/nlogin/logout?Mcode=10011'">로그아웃</button>
	        	<c:if test="${not empty user.connDtime }">
	        		<span class="login-history">최근접속 : <c:out value="${util:formatDateExt(user.connDtime, 'yyyyMMddHHmmss', 'yyyy.MM.dd')}"/> </span>
	        	</c:if>
			</c:if>
			<c:if test="${not empty user && user.USER_ID == null}">
				<button type="button" class="m-menu__button" onclick="location.href='/nlogin/?Mcode=10003'">로그인</button>
				<button type="button" class="m-menu__button" onclick="location.href='/nlogin/usr?Mcode=10004'">회원가입</button>
			</c:if>

			<c:if test="${empty user}">
				<c:if test="${not empty user_imsi}">
        			<button type="button" class="m-menu__button" onclick="location.href='/nlogin/logout?Mcode=10011'">로그아웃</button>
				</c:if>
				<c:if test="${empty user_imsi}">
					<button type="button" class="m-menu__button" onclick="location.href='/nlogin/?Mcode=10003'">로그인</button>
					<button type="button" class="m-menu__button" onclick="location.href='/nlogin/usr?Mcode=10004'">회원가입</button>
				</c:if>
			</c:if>
		</div>
        <a href="#" class="m-top-banner">
        	<c:if test="${not empty user && user.USER_ID != null}">
	        	<div class="m-top-banner__content m-top-banner__content--login">
	        		 <div class="main__profile mobile">
                        <img src="/rcvfvrSvc/images/main/img_prof-round_1_01.png" id="mobileProfile" alt="여자 노년" />
                    </div>
	                <div class="m-top-banner__title"><span>${user.USER_NM}</span>님 반갑습니다.</div>
	                <div class="m-top-banner__text">보조금24에 오신 것을 환영합니다.</div>
	            </div>
			</c:if>
			<c:if test="${not empty user && user.USER_ID == null}">
				<div class="m-top-banner__content m-top-banner__content--login">
                    <div class="main__profile mobile">
                        <img src="/rcvfvrSvc/images/main/icon_people.png" alt="비로그인 사진">
                    </div>
                    <div class="m-top-banner__title">보조금24에<br>오신 것을 환영합니다.</div>
                </div>
			</c:if>

			<c:if test="${empty user}">
				<c:if test="${not empty user_imsi}">
        			<div class="m-top-banner__content m-top-banner__content--login">
		        		 <div class="main__profile mobile">
	                        <img src="/rcvfvrSvc/images/main/icon_people.png" alt="비로그인 사진">
	                    </div>
		                <div class="m-top-banner__title"><span>${user_imsi.USER_NM}</span>님 반갑습니다.</div>
		                <div class="m-top-banner__text">보조금24에 오신 것을 환영합니다.</div>
		            </div>
				</c:if>
				<c:if test="${empty user_imsi}">
					<div class="m-top-banner__content m-top-banner__content--login">
	                    <div class="main__profile mobile">
	                        <img src="/rcvfvrSvc/images/main/icon_people.png" alt="비로그인 사진">
	                    </div>
	                    <div class="m-top-banner__title">보조금24에<br>오신 것을 환영합니다.</div>
	                </div>
				</c:if>
			</c:if>
        </a>

        <div class="m-menu-nav">
            <ul>
                <li class="m-menu-nav__list">	
					<c:choose>
						<c:when test="${not empty user_imsi}">
                    		<a href="javascript:redirect();" class="m-menu-nav__anchor">나의 혜택</a>
							<script>
								function redirect(){
									$('.event-apply__desc.login').empty();
									$('.event-apply__desc.login').append("개인회원만 이용가능한 서비스입니다. <br/>로그인 하시겠습니까?");
	     							$('body').data('plugin_modal').open('#loginPop');
								}
							</script>
	            		</c:when>
						<c:when test="${paramUser eq null}">
							<a href="javascript:redirectMyRcvfvrsvc();" class="m-menu-nav__anchor">나의 혜택</a>
							<script>
	         					function redirectMyRcvfvrsvc(){
	         						$('.event-apply__desc.login').empty();
									$('.event-apply__desc.login').append("회원만 이용가능한 서비스입니다. <br/>로그인 하시겠습니까?");
	     							$('body').data('plugin_modal').open('#loginPop');
							 	}
							</script>
					    </c:when>
						<c:when test="${paramUser.USER_DTL_SECT_CD ne '101' && paramUser.USER_DTL_SECT_CD ne '102'}">
							<a href="javascript:redirect();" class="m-menu-nav__anchor">나의 혜택</a>
							<script>
								function redirect(){
									$('.event-apply__desc.login').empty();
									$('.event-apply__desc.login').append("개인회원만 이용가능한 서비스입니다. <br/>로그인 하시겠습니까?");
	     							$('body').data('plugin_modal').open('#loginPop');
								}
							</script>
						</c:when>
						<c:when test="${paramUser.AGREE_STTUS_CD ne '02' && paramUser.AGREE_STTUS_CD ne '03'}">
							<a href="javascript:openMainPop01();" class="m-menu-nav__anchor">나의 혜택</a>
						</c:when>
						<c:otherwise>
							<a href="/portal/rcvfvrSvc/mySvc/myRcvfvrsvc" class="m-menu-nav__anchor">나의 혜택</a>
						</c:otherwise>
					</c:choose>
                </li>
                <li class="m-menu-nav__list">
                    <a href="#" class="m-menu-nav__anchor">혜택 찾기</a>
                    <ul class="m-menu-nav__list-sub">
                        <li><a href="/portal/rcvfvrSvc/svcFind/simpleFindStepOne">간편찾기</a></li>
                        <li><a href="/portal/rcvfvrSvc/svcFind/svcSearchAll">전체보기</a></li>
                    </ul>
                </li>
                <li class="m-menu-nav__list">
                    <a href="#" class="m-menu-nav__anchor">보조금24란</a>
                    <ul class="m-menu-nav__list-sub">
                    	<li><a href="/portal/rcvfvrSvc/useguidance/intrcnRcvfvr">보조금24 소개</a></li>
                    	<li><a href="/portal/rcvfvrSvc/useguidance/rcvfvrSvcSttus">보조금24 현황</a></li>
                    	<li><a href="/portal/rcvfvrSvc/recomendBnef">일상속 보조금24 이야기</a></li>
                    </ul>
                </li>
                <li class="m-menu-nav__list">
				    <a href="#" class="m-menu-nav__anchor">이용안내</a>
				    <ul class="m-menu-nav__list-sub">
						<li><a href="/portal/rcvfvrSvc/useguidance/faq?accordionYn=N">자주 묻는 질문</a></li>
						<li><a href="/portal/rcvfvrSvc/useguidance">나의혜택 이용하기</a></li>
						<li><a href="/portal/rcvfvrSvc/useguidance/tab2">간편찾기 이용하기</a></li>
				    </ul>
				</li>
            </ul>
        </div>
		<%-- <c:if test="${(not empty user && user.USER_ID == null) || empty user}">
            <a href="/nlogin/?Mcode=10003" class="m-bottom-banner">
                <div class="m-bottom-banner__content">
                    <span class="underline">로그인</span> 후 이용하시면 보다 더 정확한 <br>정보를 안내 받을 수 있습니다.
                </div>
            </a>
		</c:if> --%>

		<button type="button" class="m-menu__close"><div class="hide">닫기</div></button>
	</div>
</div>
<script>

$(document).ready(function(){
	var usrRrn = $("#age").val();
	if(usrRrn != null && usrRrn != ""){
		var gender = "";
		var year = new Date().getFullYear();
		var ageYear = "";

		// 9 : 1800 ~ 1899년에 태어난 남성
        // 0 : 1800 ~ 1899년에 태어난 여성
        // 1 : 1900 ~ 1999년에 태어난 남성
        // 2 : 1900 ~ 1999년에 태어난 여성
        // 3 : 2000 ~ 2099년에 태어난 남성
        // 4 : 2000 ~ 2099년에 태어난 여성
        // 5 : 1900 ~ 1999년에 태어난 외국인 남성
        // 6 : 1900 ~ 1999년에 태어난 외국인 여성
        // 7 : 2000 ~ 2099년에 태어난 외국인 남성
        // 8 : 2000 ~ 2099년에 태어난 외국인 여성

		if ($("#age").val().substr(6,1) == "9" || $("#age").val().substr(6,1) == "0"){
			ageYear = "18";
		}else if($("#age").val().substr(6,1) == "1" || $("#age").val().substr(6,1) == "2"
			|| $("#age").val().substr(6,1) == "5" || $("#age").val().substr(6,1) == "6"){
			ageYear = "19";
		}else if ($("#age").val().substr(6,1) == "3" || $("#age").val().substr(6,1) == "4"
			|| $("#age").val().substr(6,1) == "7" || $("#age").val().substr(6,1) == "8"){
			ageYear = "20";
		}
		//성별
		if($("#age").val().substr(6,1) % 2 == 1){
			gender = "ZZ0401"
		}else{
			gender = "ZZ0402"
		}
		
		ageYear = (ageYear + $("#age").val().substr(0,2)) *1;
		var age = year - ageYear;
		var img = $('#mobileProfile');

		var imgSrc = "";
		var imgAlt = "";
		
		//남자 노년 65~
		if(gender == "ZZ0401" && age > 64){
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_2_01.png";
			imgAlt = "남자 노년";
		}else if(gender == "ZZ0401" && age >= 30 && age < 65){ //남자 중장년 30~64
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_2_02.png";
			imgAlt = "남자 중장년";
		}else if(gender == "ZZ0401" && age >= 19 && age < 30){ //남자 청년 19~29
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_2_03.png";
			imgAlt = "남자 청년";
		}else if(gender == "ZZ0401" && age >= 13 && age < 19){ //남자 청소년 13~18
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_2_04.png";
			imgAlt = "남자 청소년";
		}else if(gender == "ZZ0401" && age >= 6 && age < 13){ //남자 아동 6~12
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_2_05.png";
			imgAlt = "남자 아동";
		}else if(gender == "ZZ0401" && age < 6){ //남자 유아 
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_2_06.png";
			imgAlt = "남자 유아";
		}else if(gender == "ZZ0402" && age > 64){ //여자 노년
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_1_01.png";
			imgAlt = "여자 노년";
		}else if(gender == "ZZ0402" && age >= 30 && age < 65){ //여자 중장년 30~64
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_1_02.png";
			imgAlt = "여자 중장년";
		}else if(gender == "ZZ0402" && age >= 19 && age < 30){ //여자 청년 19~29
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_1_03.png";
			imgAlt = "여자 청년";
		}else if(gender == "ZZ0402" && age >= 13 && age < 19){ //여자 청소년 13~18
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_1_04.png";
			imgAlt = "여자 청소년";
		}else if(gender == "ZZ0402" && age >= 6 && age < 13){ //여자 아동 6~12
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_1_05.png";
			imgAlt = "여자 아동";
		}else if(gender == "ZZ0402" && age < 6){ //여자 유아 
			imgSrc = "/rcvfvrSvc/images/main/img_prof-round_1_06.png";
			imgAlt = "여자 유아";
		}

		img.attr("src", imgSrc);
		img.attr("alt", imgAlt);
	}
});
</script>