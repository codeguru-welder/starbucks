<c:choose>                         
  <c:when test="${not empty user and user.LOGIN_TYPE eq 'certiLogin'}">               
    <c:set var="varMbCertChkYn" value="Y"/>
  </c:when>
  <c:otherwise>
    <c:set var="varMbCertChkYn" value="N"/>
  </c:otherwise>
</c:choose>
<c:choose>
  <c:when test="${not empty user}">
    <c:set var="varLoginYn" value="Y"/>
  </c:when>
  <c:otherwise>
    <c:set var="varLoginYn" value="N"/>
  </c:otherwise>
</c:choose>

<form id="newForm" name="newForm" method="post">
<c:if test="${mobileYn eq 'Y' }">
	<input type="hidden" id="mbCertChkYn" name="mbCertChkYn" value="${varMbCertChkYn}" />
	<input type="hidden" id="loginYn" name="loginYn" value="${varLoginYn}" />                
	<input type="hidden" id="policeGubun" name="policeGubun" value="" />
	<input type="hidden" id="nhisGubun" name="nhisGubun" value="" />
	<input type="hidden" id="npsGubun" name="npsGubun" value="" />
	<input type="hidden" id="kcomwelGubun" name="kcomwelGubun" value="" />
	<input type="hidden" id="CAPP_BIZ_CD" name="CAPP_BIZ_CD" value="">
</c:if>
	<input type="hidden" id="a" name="a" value="">
	<input type="hidden" id="TP_SEQ" name="TP_SEQ" value="">
	<input type="hidden" id="RCV_MTHD_CD" name="RCV_MTHD_CD" value="">
	<input type="hidden" id="RCV_MAN" name="RCV_MAN" value="">
	<input type="hidden" id="UNIVERSITY" name="UNIVERSITY" value="">
	<input type="hidden" id="newFormMcode" name="Mcode" value="">
</form>

<script>

//화면 사이즈에 따라서 팝업 좌표 조정 
$(document).ready(function(){
	$(window).on('load resize', function() {
		if ($("#memberLoginPopup").is(":visible")) {
			showPopup();
		}
	});	
});

function fn_Mess(){
  alert("서비스 준비중 입니다.");
};

function formSubmit(){
	$("#newForm").submit();
}


//해당 신청서비스 이용가능유형 조회
function memberSvcConfirm_DIR(applyId){
	var memberCls = "";
	var jsonData = {
			applySvcId : applyId,
			svcSectCd : "DIR"
	};
	
	$.ajax({
		type: "POST",
		url: "/portal/usepossapplysvc/result",
		data: jsonData,
		async: false,
		dataType: 'json',
		success: function(data) {
			memberCls = data.usePossTpCd;
		},
		error : function(e){
			alert('서비스 조회 중 오류가 발생하였습니다.');
		 	return false;
		}
	})
	
	return memberCls;
}

//이용가능 유형 분기에 따른 로그인 팝업 표출
function renderingMemberPopup_DIR(memberCls, url){
	$('#memberLoginPopup').hide();  //팝업 초기화
	var sumbitUrl = 'javascript:formSubmit()';
	
	var nonMmberApplyCd =''; 
	var cappbizcdOfUrlIndex = url.indexOf('capp_biz_cd=')+12;
	
	//url에서 cappBizCd 추출
	if(url.indexOf('capp_biz_cd=') > -1){
		if(url.indexOf('&',cappbizcdOfUrlIndex)>-1){
			nonMmberApplyCd =url.slice(cappbizcdOfUrlIndex,url.indexOf('&',cappbizcdOfUrlIndex))
		} else {
			nonMmberApplyCd = url.slice(cappbizcdOfUrlIndex)
		}
	}	
	
	//비회원 로그인시 이동할 URL
	var nonMemberApplyUrl = '/nlogin/loginNonMember?cappBizCd='+nonMmberApplyCd;
	var nonLoginUrl = '';
		nonLoginUrl = url;
		
		nonLoginUrl= nonLoginUrl.replace(/[/]/gi,"%2F");
		nonLoginUrl= nonLoginUrl.replace(/[?]/gi,"%3F");
		nonLoginUrl= nonLoginUrl.replace(/[=]/gi,"%3D");
		nonLoginUrl= nonLoginUrl.replace(/[&]/gi,"%26amp%3B");
		
		nonMemberApplyUrl += '&nonLoginUrl='+nonLoginUrl;
	
	if(memberCls == "101"){
		//회원전용 서비스인 경우
		$('#onlyMemberApplyBtn').attr("href",sumbitUrl); //회원신청하기 버튼(회원전용)
		$('.renewLogin-pop .pop-content .type01').hide();
		$('.renewLogin-pop .pop-content .type02').show();
	}
	if(memberCls =="102"){
		//즉시조회 및 본인인증 서비스인 경우
		location.href = url;
		return;
	}
	if(memberCls ==""){
    	//회원 및 비회원 신청이 가능한 서비스인 경우
    	$('#memberApplyBtn').attr("href",sumbitUrl); //회원신청하기 버튼 (회원/비회원)
		$('#nonMemberApplyBtn').attr("href",nonMemberApplyUrl); //비회원신청하기 버튼
		$('.renewLogin-pop .pop-content .type01').show();
		$('.renewLogin-pop .pop-content .type02').hide();
	}
	if(memberCls =="err"){
		alert("서비스 조회 중 오류가 발생하였습니다.");
		return;
	}
	showPopup();
}

//팝업 최종 표출
function showPopup(){
	//팝업 표출 위치 설정
	var popLayer = $("#memberLoginPopup");
	var windowWidth = $(window).width();
	var windowHeight = $(window).height();
	var popWidth = popLayer.outerWidth();
	var popHeight = popLayer.outerHeight();
	popLayer.css({
		'left':Math.max(0,(windowWidth/2)-(popWidth/2)),
		'top':Math.max(0,(windowHeight/2)-(popHeight/2))
	});
	popLayer.show();  //팝업 표출
	popLayer.attr('tabindex', -1).focus(); //웹접근성
}

//원클릭 유형조회, 팝업표출
function oneClickSvcConfirmPopup_DIR(applyId, url){
	var memberClsCd = memberSvcConfirm_DIR(applyId);
	renderingMemberPopup_DIR(memberClsCd, url);
}

//로그인 후 회원전용 서비스 구분 (공통)
function commonSvcConfirmProcess_DIR(applyId){
		var memberCls = memberSvcConfirm_DIR(applyId);
   		var memberSvcFlag =false;
    	var memberSvc_msg = "회원전용 서비스입니다.\n비회원 접속을 종료 후 회원으로 로그인하시겠습니까?";
		
    	
    	if(memberCls == "101"){
	        //비회원 접속 && 회원전용 서비스인 경우
    		if(iosYn == "Y"){
	            // confirmIOS 호출
	            memberSvcFlag = confirm(memberSvc_msg+"native");
	        }else{
	        	memberSvcFlag = confirm(memberSvc_msg);
	        }
            if(memberSvcFlag){
                window.location.href = "/nlogin/logout";
                return false;
            } else {
            	return false;
            }				        
    	}
    	return true;
}

<c:choose>
<c:when test="${mobileYn eq 'N'}">
 function fn_move(url,pgubun){
   	
	//신청서비스(정부서비스) 아이디 추출
   	var applyId = event.target.attributes.getNamedItem('data-applyid').value;
   	
   	var busiFlag = true; //사업장 서비스 구분
   	var busi_msg = "본 서비스는 사업장에서만 사용가능한 서비스 입니다.\n 계속 진행 하시겠습니까?";
   	
   	//사업장 서비스 구분
   	if(pgubun == '1'){
   		if(iosYn == "Y"){
   			busiFlag = confirm(busi_msg+"native");
   		} else{
   			busiFlag = confirm(busi_msg);
   		}
   	}
 	   document.newForm.action=url;
       document.newForm.target="_self";
   	
   	if(busiFlag){
       <c:if test="${empty user && empty user_imsi}">
	       oneClickSvcConfirmPopup_DIR(applyId,url);
       </c:if>
       <c:if test="${not empty user || not empty user_imsi}">
       	if('true' == '${not empty user_imsi}'){
	    	if( !commonSvcConfirmProcess_DIR(applyId) ){
	    		return;	
	    	}
       	}
	    document.newForm.submit();
       </c:if>
	   return;   		
   	}
 };
  
 function callFunction(gubun, action, bizno, tqseq, mtdhcd, university) {
	 var applyId = event.target.attributes.getNamedItem('data-applyid').value;
	 
	 var mobileNonMemberUrl = "/mobileService?"+"CAPP_BIZ_CD="+bizno+"&TP_SEQ="+tqseq+"&RCV_MTHD_CD="+mtdhcd+"&UNIVERSITY="+university+"&a="+action;  
		 
	 if ( gubun == '1' ) {
		document.newForm.a.value=action;
	    document.newForm.CAPP_BIZ_CD.value=bizno;
	    document.newForm.TP_SEQ.value=tqseq;
	    document.newForm.RCV_MTHD_CD.value=mtdhcd;
	    document.newForm.UNIVERSITY.value=university;
	    document.newForm.method="get";
	    document.newForm.action="/mobileService";
	  
	   <c:if test="${empty user && empty user_imsi}">
	       oneClickSvcConfirmPopup_DIR(applyId, mobileNonMemberUrl);
       </c:if>
       <c:if test="${not empty user || not empty user_imsi}">
       	if('true' == '${not empty user_imsi}'){
	    	if( !commonSvcConfirmProcess_DIR(applyId) ){
	    		return;	
	    	}
       	}
	   document.newForm.submit();
       </c:if>	 	    
	} else {
	   <c:if test="${empty user && empty user_imsi}">
	       oneClickSvcConfirmPopup_DIR(applyId, mobileNonMemberUrl);
       </c:if>  
       <c:if test="${not empty user || not empty user_imsi}">
	       	if('true' == '${not empty user_imsi}'){
		    	if( !commonSvcConfirmProcess_DIR(applyId) ){
		    		return;	
		    	}
	       	}
			document.newForm.submit();
       </c:if>		
	   location.href = action;
	}
 };
</c:when>
<c:otherwise>
  function fn_move(url,pgubun,serviceGb){
	  var applyId = event.target.attributes.getNamedItem('data-applyid').value;
	  
	  if(url.indexOf('PoliceResultInfo.do') > -1){
      if(serviceGb != "" && serviceGb != undefined){
        document.newForm.policeGubun.value = serviceGb;
      }	 
    }
    else if(url.indexOf('NhisResultInfo.do') > -1){
      if(serviceGb != "" && serviceGb != undefined){
        document.newForm.nhisGubun.value = serviceGb;
      }
    }
    else if(url.indexOf('NpsResultInfo.do') > -1){
      if(serviceGb != "" && serviceGb != undefined){
        document.newForm.npsGubun.value = serviceGb;
      }	 
    }
    else if(url.indexOf('KcomwelResultListInfo.do') > -1){
      if(serviceGb != "" && serviceGb != undefined){
        document.newForm.npsGubun.value = serviceGb;
      }	 
    }
    else if(url.indexOf('NewServiceLogin.do') > -1){
       	$('#CAPP_BIZ_CD').remove();
      }
	if(pgubun == '1'){
		if(navigator.userAgent.indexOf('iOS') > 1 || navigator.userAgent.indexOf('iPhone') > 1 || 
			navigator.userAgent.indexOf('iPod') > 1 || navigator.userAgent.indexOf('iPad') > 1) {
			alert("본 서비스는 사업장에서만 사용가능한 서비스 입니다.");
		    setTimeout(function(){
		    	document.newForm.action=url;
		        document.newForm.target="_self";
		       <c:if test="${empty user && empty user_imsi}">
			       oneClickSvcConfirmPopup_DIR(applyId,url);
		       </c:if>
		       <c:if test="${not empty user || not empty user_imsi}">
		       	if('true' == '${not empty user_imsi}'){
			    	if( !commonSvcConfirmProcess_DIR(applyId) ){
			    		return;	
			    	}
		       	}
			    document.newForm.submit();
		       </c:if>		        
			},3000);
		}else{
			if(confirm("본 서비스는 사업장에서만 사용가능한 서비스 입니다.\n 계속 진행 하시겠습니까?")){
				document.newForm.action=url;
		        document.newForm.target="_self";
		       <c:if test="${empty user && empty user_imsi}">
			       oneClickSvcConfirmPopup_DIR(applyId,url);
		       </c:if>
		       <c:if test="${not empty user || not empty user_imsi}">
		       	if('true' == '${not empty user_imsi}'){
			    	if( !commonSvcConfirmProcess_DIR(applyId) ){
			    		return;	
			    	}
		       	}
			    document.newForm.submit();
		       </c:if>		        
			}
		}
    }else{
	      document.newForm.action=url;
	      document.newForm.target="_self";
	   <c:if test="${empty user && empty user_imsi}">
	       oneClickSvcConfirmPopup_DIR(applyId,url);
       </c:if>
       <c:if test="${not empty user || not empty user_imsi}">
	       	if('true' == '${not empty user_imsi}'){
		    	if( !commonSvcConfirmProcess_DIR(applyId) ){
		    		return;	
		    	}
	       	}
		   document.newForm.submit();
       </c:if>	      
	   }
  };
  
  function callFunction(gubun, action, bizno, mcode, tqseq, mtdhcd, university) {
	  var applyId = event.target.attributes.getNamedItem('data-applyid').value;
	  var mobileNonMemberUrl = "/mobileService?"+"CAPP_BIZ_CD="+bizno+"&TP_SEQ="+tqseq+"&RCV_MTHD_CD="+mtdhcd+"&UNIVERSITY="+university+"&a="+action;
	  if ( gubun == '1' ) {
	      document.newForm.a.value=action;
	      document.newForm.CAPP_BIZ_CD.value=bizno;
	      document.newForm.TP_SEQ.value=tqseq;
	      document.newForm.RCV_MTHD_CD.value=mtdhcd;
	      document.newForm.UNIVERSITY.value=university;
	      document.newForm.method="get";
	      document.newForm.Mcode=mcode;
	      document.newForm.action="/mobileService";
	      
	   <c:if test="${empty user && empty user_imsi}">
	       oneClickSvcConfirmPopup_DIR(applyId,mobileNonMemberUrl);
       </c:if>
       <c:if test="${not empty user || not empty user_imsi}">
	       	if('true' == '${not empty user_imsi}'){
		    	if( !commonSvcConfirmProcess_DIR(applyId) ){
		    		return;	
		    	}
	       	}
		   document.newForm.submit();
       </c:if>	      
	  } 
	};
</c:otherwise>
</c:choose>
</script>