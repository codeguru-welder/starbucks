<!DOCTYPE html>
<html lang="ko">
<%@page import="java.util.*" %>
<head>
<meta http-equiv="Cache-control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp">
	<jsp:param name="gnb" value="simpleFind" />
</jsp:include>
<title>가구특성 | 간편찾기 | 혜택 찾기 | 보조금24</title>

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
	                <li class="step__item is-current">
	                    <span class="step__num">03</span>
	                    <span class="step__text">개인특성</span>
	                </li>
	                <li class="step__item is-active">
	                    <span class="step__num">04</span>
	                    <span class="step__text">가구특성</span>
	                </li>
	            </ul>
        	</div>
			<form:form commandName="simpleFindVo" method="get" action="/portal/rcvfvrSvc/svcFind/simpleFindResult">
				<input type="hidden" id="step" value="four"/>
				<input type="hidden" name="gender" value="${simpleFindVo.gender }" id="genderCd" />
				<input type="hidden" name="age" value="${simpleFindVo.age }" id="ageCd" />
				<input type="hidden" name="hshldChartr" value="${simpleFindVo.hshldChartr }" id="hshldChartrCd" />
				<input type="hidden" name="job" value="${simpleFindVo.job }" id="jobCd" />
				<input type="hidden" value="" name="cdNm" id="cdNm" />
				<input type="hidden" id="areaNm" />

		        <div class="container">
		            <div class="simple-find">
                		<div class="simple-find__title simple-find__title--salary">가구특성을 선택하시고 결과를 확인해주세요. (중복선택가능)</div>
                		<div class="simple-find__select">
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp01" class="simple-find__input" name="incomeInfo" value="JA0401" />
		                        <label for="inp01">다문화가족</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp02" class="simple-find__input" name="incomeInfo" value="JA0402" />
                        		<label for="inp02">북한이탈주민</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp03" class="simple-find__input" name="incomeInfo" value="JA0403" />
                        		<label for="inp03">한부모가정/<br>조손가정</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp04" class="simple-find__input" name="incomeInfo" value="JA0404" />
                        		<label for="inp04">1인가구</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp05" class="simple-find__input" name="incomeInfo" value="JA0405,JA0406,JA0407" />
                        		<label for="inp05">환자</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp06" class="simple-find__input" name="incomeInfo" value="JA0408" />
                        		<label for="inp06">근로자/<br>직장인</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp07" class="simple-find__input" name="incomeInfo" value="JA0409" />
                        		<label for="inp07">구직자/<br>실업자</label>
		                    </div>
		                    <div class="simple-find__item">
		                        <input type="checkbox" id="inp08" class="simple-find__input" name="incomeInfo" value="JA0410" />
                        		<label for="inp08">해당사항<br class="mobile">없음</label>
		                    </div>		                    
		                </div>
		            </div>
		        </div>
	            <div class="container">
	                <div class="search-box tag-box">
	                    <div class="search-box__form" id="search-box__form">

	                    </div>
	                </div>
	                <div class="button-wrap">
	                    <a href="#" class="button button-board button--prev" value="/portal/rcvfvrSvc/svcFind/simpleFindStepThree"><span>이전</span></a>
	                    <a href="#" class="button button-board button--next"><span>결과확인</span></a>
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
			$("input[value='JA0410']").removeAttr("checked");
			$("input[value='JA0410']").attr("disabled","disabled");
		}else{
			$("input[value='JA0410']").removeAttr("disabled");
		}
		
		var chkArr = new Array();
		for(var a=0; a<$(".simple-find__input").length; a++){
			chkArr.push($(".simple-find__input").eq(a).is(":checked"));
		}		
				
		var txt = "";
		
		//해당사항없음 선택 시 다른 항목 선택 불가
		var inp08 = $("#inp08").is(":checked");
		if(inp08){
			for(var a=0; a<$(".simple-find__input").length-1; a++){
				$(".simple-find__input").eq(a).removeAttr("checked");
				$(".simple-find__input").eq(a).attr("disabled","disabled");
			}
		}else{
			for(var a=0; a<$(".simple-find__input").length-1; a++){
				$(".simple-find__input").eq(a).removeAttr("disabled");
			}

			//다문화가족 불가
			removeChk("inp01", (chkArr[3]));

			//한부모가정 불가
			removeChk("inp03", (chkArr[3] || chkArr[5] || chkArr[6]));
			
			//1인가구 불가
			removeChk("inp04", (chkArr[0] || chkArr[2]));

			//근로자 불가
			removeChk("inp06", (chkArr[2] || chkArr[6]));
			
			//구직자 불가
			removeChk("inp07", (chkArr[2] || chkArr[5]));			
		}
		
		tag();
		disable();
	});		
});

function disable(){

	//선택 불가 사항 추가
	var cdList = $("#cdNm").val();
	if(cdList.indexOf("JA0301") > -1 ){ //0414 중년 장년 노년 선택 시 한부모/조손가정 선택 가능하도록
		$("#inp03").attr("disabled", "disabled");
	}
	if(cdList.indexOf("JA0103") > -1 ||cdList.indexOf("JA0104") > -1||cdList.indexOf("JA0105") > -1 || cdList.indexOf("JA0320") > -1){
		$("#inp04").attr("disabled", "disabled");
	}
	if(cdList.indexOf("JA0103") > -1 ||cdList.indexOf("JA0104") > -1||cdList.indexOf("JA0308") > -1 || cdList.indexOf("JA0314") > -1 || cdList.indexOf("JA0318") > -1
			 || cdList.indexOf("JA0319") > -1 || cdList.indexOf("JA0321") > -1){
		$("#inp06").attr("disabled", "disabled");
	}
	if(cdList.indexOf("JA0103") > -1 ||cdList.indexOf("JA0104") > -1||cdList.indexOf("JA0105") > -1 || cdList.indexOf("JA0308") > -1 || cdList.indexOf("JA0314") > -1 || cdList.indexOf("JA0318") > -1
			 || cdList.indexOf("JA0319") > -1 || cdList.indexOf("JA0320") > -1){
		$("#inp07").attr("disabled", "disabled");
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
