<!DOCTYPE html>
<html lang="ko">
<%@page import="java.util.*" %>
<head>
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp">
	<jsp:param name="gnb" value="simpleFind" />
</jsp:include>
<title>개인특성 | 간편찾기 | 혜택 찾기 | 보조금24</title>

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
	                <li class="step__item is-current">
	                    <span class="step__num">02</span>
	                    <span class="step__text">소득구간</span>
	                </li>
	                <li class="step__item is-active">
	                    <span class="step__num">03</span>
	                    <span class="step__text">개인특성</span>
	                </li>
	                <li class="step__item">
	                    <span class="step__num">04</span>
	                    <span class="step__text">가구특성</span>
	                </li>
	            </ul>
	        </div>
			<form:form commandName="simpleFindVo" method="post" action="/portal/rcvfvrSvc/svcFind/simpleFindStepFour">
				<input type="hidden" id="step" value="three"/>
				
				<input type="hidden" name="gender" value="${simpleFindVo.gender }" id="genderCd" />
				<input type="hidden" name="age" value="${simpleFindVo.age }" id="ageCd" />
				<input type="hidden" name="hshldChartr" value="${simpleFindVo.hshldChartr }" id="hshldChartrCd" />
				<input type="hidden" value="" name="cdNm" id="cdNm" />
				<input type="hidden" id="areaNm" />
				
		        <div class="container">
		            <div class="simple-find">
                		<div class="simple-find__title simple-find__title--environment">개인특성 정보가 필요합니다. (중복선택가능) </div>
		                <div class="simple-find__select">
		                    <!-- simple-find__item 갯수는 4의 배수여야 함 - 조건 갯수가 부족할 시 하단 영역 추가 -->
		                    <!-- <div class="simple-find__item"></div> -->
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp01" class="simple-find__input" name="job" value="JA0301,JA0302,JA0303" />
		                        <label for="inp01">임신/출산</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp02" class="simple-find__input" name="job" value="JA0304,JA0305" />
		                        <label for="inp02">장애인</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp03" class="simple-find__input" name="job" value="JA0306,JA0307" />
		                        <label for="inp03">보훈대상자</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp04" class="simple-find__input" name="job" value="JA0308,JA0309,JA0310,JA0311,JA0312,JA0313" />
		                        <label for="inp04">농업인</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp05" class="simple-find__input" name="job" value="JA0314,JA0315,JA0316,JA0317" />
		                        <label for="inp05">어업인</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp06" class="simple-find__input" name="job" value="JA0318" />
		                        <label for="inp06">축산업인</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp07" class="simple-find__input" name="job" value="JA0319" />
		                        <label for="inp07">임업인</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp08" class="simple-find__input" name="job" value="JA0320" />
		                        <label for="inp08">초중고학생</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp09" class="simple-find__input" name="job" value="JA0321" />
		                        <label for="inp09">대학/<br class="mobile">대학원생</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp10" class="simple-find__input" name="job" value="JA0322" />
		                        <label for="inp10">해당사항<br class="mobile">없음</label>
		                    </div>
		                    <div class="simple-find__item mobile"></div>
		                    <div class="simple-find__item mobile"></div>
		                </div>
		            </div>
		        </div>
	            <div class="container">
	                <div class="search-box tag-box">
	                    <div class="search-box__form" id="search-box__form">
	                    </div>
	                </div>
	                <div class="button-wrap">
	                    <a href="#" class="button button-board button--prev" value="/portal/rcvfvrSvc/svcFind/simpleFindStepTwo"><span>이전</span></a>
	                    <a href="#" class="button button-board button--next"><span>다음</span></a>
	                </div>
	            </div>
	        </form:form>
	    </div>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />
	</div>
</body>
<script>
$(document).ready(function() {
	
	disable();	

	$('.simple-find__input').change(function(){
		
		//다른 항목 선택 시 해당사항없음 선택 불가
		var chk = 0;
		for(var a = 0; a<$(".simple-find__input").length-1; a++){
			var gbn = $(".simple-find__input").eq(a).is(":checked");
			if(gbn){
				chk += 1;
			}
		}
		if(chk > 0){
			$("input[value='JA0322']").removeAttr("checked");
			$("input[value='JA0322']").attr("disabled","disabled");
		}else{
			$("input[value='JA0322']").removeAttr("disabled");
		}
		
		var chkArr = new Array();
		for(var a=0; a<$(".simple-find__input").length; a++){
			chkArr.push($(".simple-find__input").eq(a).is(":checked"));
		}	

		var txt = "";
		
		//해당사항없음 선택 시 다른 항목 선택 불가
		var inp10 = $("#inp10").is(":checked");
		if(inp10){
			for(var a=0; a<$(".simple-find__input").length-1; a++){
				$(".simple-find__input").eq(a).removeAttr("checked");
				$(".simple-find__input").eq(a).attr("disabled","disabled");
			}
		}else{
			for(var a=0; a<$(".simple-find__input").length-1; a++){
				$(".simple-find__input").eq(a).removeAttr("disabled");
			}
			
			//초중고등학생 불가
			removeChk("inp08", (chkArr[0] || chkArr[3]|| chkArr[4]|| chkArr[5]|| chkArr[6]|| chkArr[8]));
			
			//임신/출산, 농업인, 어업인, 축산업인, 임업인 불가
			txt = (chkArr[7]);
			removeChk("inp01", txt);
			txt = (chkArr[7] || chkArr[8]);
			removeChk("inp04", txt);
			removeChk("inp05", txt);
			removeChk("inp06", txt);
			removeChk("inp07", txt);
			
			//대학원생 불가
			removeChk("inp09", (chkArr[3]|| chkArr[4]|| chkArr[5]|| chkArr[6]|| chkArr[7]));
		}	
		
		tag();
		disable();
	
	});
	
});

function disable(){

	//선택 불가 사항 추가
	var cdList = $("#cdNm").val();
		
	//임신출산 선택 불가
	if(cdList.indexOf("JA0101") > -1 || cdList.indexOf("JA0103") > -1 || cdList.indexOf("JA0104") > -1 || 
			cdList.indexOf("JA0105") > -1 || cdList.indexOf("JA0108") > -1 || cdList.indexOf("JA0109") > -1){
		$("#inp01").attr("disabled", "disabled");
	}
	
	//농업인, 어업인, 축산업인,임업인 선택 불가
	if(cdList.indexOf("JA0103") > -1 || cdList.indexOf("JA0104") > -1 || cdList.indexOf("JA0105") > -1 ){
		$("#inp04").attr("disabled", "disabled");
		$("#inp05").attr("disabled", "disabled");
		$("#inp06").attr("disabled", "disabled");
		$("#inp07").attr("disabled", "disabled");
	}
	
	//초중고학생 선택 불가
	if(cdList.indexOf("JA0103") > -1 || cdList.indexOf("JA0106") > -1
			|| cdList.indexOf("JA0107") > -1|| cdList.indexOf("JA0108") > -1|| cdList.indexOf("JA0109") > -1){
		$("#inp08").attr("disabled", "disabled");
	}
	
	//대학/대학원생 선택 불가
	if(cdList.indexOf("JA0103") > -1 || cdList.indexOf("JA0104") > -1 || cdList.indexOf("JA0105") > -1
			|| cdList.indexOf("JA0108") > -1|| cdList.indexOf("JA0109") > -1){
		$("#inp09").attr("disabled", "disabled");
	}
}

function removeChk(id, val){
	if(val){
		$("#" + id).attr("disabled","disabled");
		$("#" + id).removeAttr("checked");
	}else{
		$("#" + id).removeAttr("disabled");
	}
}
</script>
</html>
