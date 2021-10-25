<%@ page import = "kr.go.login.usr.vo.UsrVo" %>
<%@ page import = "java.net.URLDecoder" %>
<%@ page import = "com.lg.g4c.capp.lib.entity.Entity" %>

    <form name='xecure' id="xecure">
	    <input type="hidden" name="p" />
	    <input type="hidden" name="a" value=""/>
    </form>
    
    <!-- 로그인 폼 -->    
    <form id="form_login"  name="form_login" action="/nlogin/loginByIdPwd" method="POST">
    	<input type="hidden" id="a" name="a" value ="/nlogin/loginByIdPwd"/>
        <input type="hidden" id="loginType" name="loginType" value="generalLogin"/>
        <input type="hidden" id="currUrl" name="currUrl" value="${currUrl}">
        <input type="hidden" id="appYn" name="appYn" value="${appYn}">
        <input type="hidden" id="loginGb" name="loginGb" value="">
        <input type="hidden" id="loginFlag" name="loginFlag" value="">                
        <input type="hidden" id="cdFlag" name="cdFlag" value="">      
        <input type="hidden" id="regYn" name="regYn" value="">
        <input type="hidden" id="isTouchYn" name="isTouchYn" />
        <input type="hidden" name="userId" />
        <input type="hidden" name="pwd" />
        <input type="hidden" id="kbdenc_pwd" name="kbdenc_pwd"  />
    </form>
        
    <!-- 인증서 로그인 폼 -->
    <form id="frm_cert" name="frm_cert" action="/nlogin/loginByIdPwd" method="POST">
       <input type="hidden" name="a"  value ="/nlogin/loginByIdPwd"/>
       <input type="hidden" name="currUrl" value="${currUrl}" />
       <input type="hidden" id="vidMsg" name="vidMsg" value="" />
       <input type="hidden" id="xml" name="xml" value="" />
       <input type='hidden' id="pkcs1Msg" name="pkcs1Msg" value="" />
       <input type="hidden" name="randomnum" value="" />
       <input type="hidden" name="loginType" value="certiLogin" />
       <input type="hidden" name="certiType" id="certiType" />
       <input type="hidden" name="certiType2" id="certiType2" />
       <input type="hidden" id="regYn" name="regYn" value="">
       <input type="hidden" id="isTouchYn" name="isTouchYn" />       
       <input type="hidden" id="loginGb" name="loginGb" value="">
       <input type="hidden" id="loginFlag" name="loginFlag" value="">       
       <input type="hidden" id="cdFlag" name="cdFlag" value="">    
    </form>
    
    <!-- 생체인증 로그인 폼 -->
    <form id="frm_authLogin" name="frm_authLogin" action="/nlogin/loginByAuth" method="POST">
       	<input type="hidden" id="a" name="a" value ="/nlogin/loginByAuth"/>
        <input type="hidden" id="loginType" name="loginType" value="authIdLogin" />
        <input type="hidden" id="currUrl" name="currUrl" value="${currUrl}">
        <input type="hidden" id="vidMsg3" name="vidMsg" value="" />
		<input type="hidden" id="xml3" name="xml" value="" />
		<input type='hidden' id="pkcs1Msg3" name="pkcs1Msg" value="" />
		<input type="hidden" name="randomnum" value="" />
		<input type="hidden" name="certiType" id="certiType4" />
		<input type="hidden" name="certiType2" id="certiType24" />
		<input type="hidden" name="sessionId" value=""/>
		<input type="hidden" name="svcTrId" value=""/>
		<input type="hidden" name="userId" value="" />
		<input type="hidden" id="isTouchYn" name="isTouchYn" />
	</form>
	
    <!-- QR인증 인증서 검증 폼 2018-04-20 -->
    <form id="frm_qrcert" name="frm_qrcert" action="/nlogin/qrByIdPwd" method="POST">
       <input type="hidden" name="a"  value ="/nlogin/qrByIdPwd"/>
       <input type="hidden" name="currUrl" value="/" />
       <input type="hidden" id="vidMsg" name="vidMsg" value="" />
       <input type="hidden" id="xml" name="xml" value="" />
       <input type='hidden' id="pkcs1Msg" name="pkcs1Msg" value="" />
       <input type="hidden" name="randomnum" value="" />
       <input type="hidden" name="loginType" value="certiLogin" />
       <input type="hidden" name="certiType" id="certiType" />
       <input type="hidden" name="certiType2" id="certiType2" />
       <input type="hidden" name="sessionId" value=""/>
       <input type="hidden" name="userId" value="" />
       <input type="hidden" id="isTouchYn" name="isTouchYn" />
    </form>
    
<c:choose>
    <c:when test="${mobileYn eq 'N'}">
        <%@ include file="/WEB-INF/jsp/common/inc/head_inc_nprotech.jsp" %>
        <%@ include file="/WEB-INF/jsp/common/inc/head_inc_gpki.jsp" %>
    </c:when>
    <c:otherwise>
        <%@ include file="/WEB-INF/jsp/common/inc/head_inc_mkboard.jsp" %>
    </c:otherwise>
</c:choose>
    
<%
	Entity loginEntity = (Entity)request.getSession(true).getAttribute("user");
	Object isTouchYn = null;


%>

<script type="text/javascript">
    
//<![CDATA[
	
	function nofingerShow() {
// 		var popLayer = $("#nonfingerGuide");
// 		var windowWidth = $(window).width();
// 		var windowHeight = $(window).height();
// 		var popWidth = popLayer.outerWidth();
// 		var popHeight = popLayer.outerHeight();
// 		popLayer.css({
// 			'left':Math.max(0,(windowWidth/2)-(popWidth/2)),
// 			'top':Math.max(0,(windowHeight/2)-(popHeight/2))
// 		});
	};
	
	
	function nofingerDo(){
		//$("#nonfinger").show();
// 		$("#nonfingerGuide").show();
		nofingerShow()
		return false;
	}


	$(window).on('load resize', function() {
		//if ($("#nonfinger").is(":visible")) {
		if ($("#nonfingerGuide").is(":visible")) {
			nofingerShow();
		}
	});

//]]>
</script>


<script type="text/javascript">
var appYn = "${appYn}";
var submitChk  = false;
var pageFlag = "";
<%-- var loginFp = '<%=loginFlag%>'; --%>
var isTouchChk = '<%=isTouchYn%>';
var loginGb = "";
var fngChk = "";
var loginUsrId = "";
var spGb  = "pki";
var fngGb = "pki";
var regType = "${regType}";
var user = "${not empty user}";
var nonLoginViewflag = "${nonLoginBtnView eq 'Y' and LIFECALL ne 'Y'}";
var isIosApp = true; // 아이폰 앱스토어에 배포가 되면  true 로 변경하기
var submitChk = false;
var boolIdSp = false;
var boolIdFng = false;
var boolPkiSp = false;
var boolPkiFng = false;
var boolRegFngPrt = false;  //해당 단말기에 등록된 지문이 있는지의 여부

function submitCheck() {
	if (submitChk) {
		return submitChk;
	} else {
		submitChk = true;
		return false;
	}
}

$(document).ready(function() {
// 	$("#useSpPwd").hide();
// 	$("#nonSpPwd").show();
// 	$("#useFinger").hide();
// 	$("#nonFinger").show();

	//키보드보안 프로그램 디폴트 값 셋팅
	if(appYn == "Y"){
		$("input[name=isTouchChkBox]:checkbox").prop("checked", true);
		document.form_login.isTouchYn.value = "N";
		document.frm_cert.isTouchYn.value = "N";
	    document.frm_authLogin.isTouchYn.value = "N";

		isSupportDevice();
	}
	else{
		$("input[name=isTouchChkBox]:checkbox").prop("checked", true);
		document.form_login.isTouchYn.value = "Y";
		document.frm_cert.isTouchYn.value = "Y";
	    document.frm_authLogin.isTouchYn.value = "Y";	    
	}
	
    $('#genLogin').click(function() {

    	if (submitCheck()) {
    		return false;
    	}
        var form = document.form_login;
        form.loginGb.value = loginGb;

        if(appYn =='N'){
            var genLogin = new generalLogin(form,"/nlogin/loginByIdPwd","generalLogin");
            genLogin.fncBeforeSubmit();
        }else{        	
            mobilelLogin();
            //location.href = '/nlogin/replEnt?pFlag=R&loginFp=' + loginFp + '&userId=srkim&rCdFlag=C';
        }
    });
    
    $('#certiLogin').click(function() {
    	//alert("111");
        if (submitCheck()) {
            return false;
        }
        var form = document.frm_cert;

        if(appYn =='N'){
            var certLogin = new CertiLogin(form,"/nlogin/loginByIdPwd","certiLogin");
            certLogin.fncCertiLogin();
        }else{
	       	if (typeof(window.NativeBridge) === 'undefined') {
	       		mobileCertlLoginIos();
	       	}
	       	else {
	           	mobileCertlLogin();
	       	} 

        }
    });
    
    $("#pwd").keyup(function(event){
        if( event.keyCode == 13 ) {
            $("#genLogin").click();
        }
    });

    $("#spAuthBtn").click(function() {
    	if( boolPkiSp || boolIdSp ) {
    
	    	if(spGb == "pki"){
	    		authCertPin('login');
	    	}
	    	else{
	    		authIdPin('login')
	    	}
    	}
    	else{
    		alert("간편비밀번호가 등록되어 있지 않습니다. 간편비밀번호 (재)등록 후 이용하시기 바랍니다.");
    	}        
    });
    
    $("#spRegiBtn").click(function() {

    	confirm_msg = "이미 간편비밀번호 로그인 정보가 등록되어 있습니다.\n계속 진행하시겠습니까?";
    	chkIOSUrl = "/nlogin/loginForBioReg?fpFlag=P&pCdFlag=C";
    	
    	if( boolIdSp || boolPkiSp ) {
			if(iosYn == "Y"){
			        // confirmIOS 호출
		        confirmResult = confirm(confirm_msg+"native");
		    }else{
		        confirmResult = confirm(confirm_msg);
		        if(confirmResult){
		            location.href = chkIOSUrl;
		            return;
		        } else {
		            return;
		        }
		    }    		
    	}
    	else {
    		location.href = chkIOSUrl;
    	}

    });

    $("#spRlseBtn").click(function() {
    	if(spGb == "id"){
    	//authIdPin("release");
    		location.href = "/nlogin/smpPwd?pFlag=C&releaseType=id";
    	}
    	else if(spGb == "pki"){
    		//authCertPin("release");
    		location.href = "/nlogin/smpPwd?pFlag=C&releaseType=cert";
    	}
    	else{
    		alert("간편비밀번호가 등록되어 있지 않습니다. 간편비밀번호 (재)등록 후 이용하시기 바랍니다.");
    	}
    });

    $("#fngAuthBtn").click(function() {
    	//alert("fngGb=["+fngGb+"]");
    	if(fngChk == "Y") {
    		if( boolPkiFng || boolIdFng ) {   /* GOV2-2 추가 */
   	
				if(fngGb == "pki"){
					//alert("fngAuthBtn pki");
			    	authCertFp('login');
			    }
			    else{
			    	//alert("authIdFp Call");
			    	authIdFp('login');
			    }
            }
	    	else{
	    		alert("지문이 등록되어 있지 않습니다. 지문 (재)등록 후 이용하시기 바랍니다.");
	    	}
            
	    }
    });

    $("#fngRegiBtn").click(function() {

    	goRegiFinger();

    });

    $("#fngRlseBtn").click(function() {
    	if(fngChk == "Y") {
	    	if(fngGb == "pki"){
	    		//authCertFp("release");
	    		location.href = "/nlogin/fingRegi?pFlag=C&releaseType=cert";
		    }
		    else if(fngGb == "id"){
		    	//authIdFp("release");
		    	location.href = "/nlogin/fingRegi?pFlag=C&releaseType=id";
		    }
	    	else{
	    		alert("지문이 등록되어 있지 않습니다. 지문 (재)등록 후 이용하시기 바랍니다.");
	    	}
    	}
    });
    
    if(appYn =='N'){
    	if(regType.toLowerCase() == "ftab"){    
    		$('.tab-element li a:eq(2)').click();
    	}
    }	    
});

//$(window).load(function() {
$(document).ready(function(){

    //앱 전용 화면일경우 호출
    var appflag = "${mobileYn}";
    if(appflag == 'Y'){
        if(appYn=="N"){
            appCall("nlogin?currUrl=${currUrl}");
        }
    }
    
    //에러메세지 표시 로그인
    var msg = "${msg}";
    if (msg) {
        alert(msg);
    }

});

//키보드보안 프로그램 적용 여부 체크
function touchYnChk() {
	if ( $('input:checkbox[id="isTouchChkBox"]').is(":checked") == true ) {
		document.form_login.isTouchYn.value = "Y";
		document.frm_cert.isTouchYn.value = "Y";
		alert("키보드보안 프로그램이 적용 되었습니다.");
	} else {
		document.form_login.isTouchYn.value = "N";
		document.frm_cert.isTouchYn.value = "N";
		alert("정부24 서비스 이용시 키보드보안 프로그램 적용이 해제 됩니다.\n\n※ 안전한 정부24 서비스 이용을 위해 키보드보안 프로그램 적용을 권장합니다.");
	}
}

/**
 * @desc : Submit 전에 값들을 Checking 합니다
 */
function mobilelLogin() {

    if ($("#userId").val()=="") {
        alert("아이디를 입력하세요.");
        $("#userId").focus();
        submitChk = false;
        return false;
    }

    if ($("#pwd").val()=="") {
        alert("비밀번호를 입력하세요.");
        $("#pwd").focus();
        submitChk = false;
        return false;
    }

    if(!xssChk($("#userId"), "아이디")) {
    	submitChk = false;    	
        return false;
    }

    //쿠키 저장
    //saveUserId();

    var thisObj = this;
    
    if(!document.xecure) return false;
    document.xecure.a.value = document.form_login.a.value ;
    
    //XecureSubmit(document.form_login);
    $("#form_login").submit();
}

//모바일앱으로 사용자ID 전달
function setUserId(userId){      // userId: 웹에서 로그인 성공한 사용자의 ID
	if (typeof(window.NativeBridge) === 'undefined') {
		setTimeout(function () {
		  	location.href = 'ios://setUserId?userId='+userId;    // call iOS
		}, 500);	
	} else {
	  	window.NativeBridge.setUserId(userId);    // call Android
	}
}

function mobileCertlLoginIos() {
	var argvStr = "";

	argvStr += "acceptCert=" + accept_cert;
	argvStr += "&aData=공인인증서로그인" ;
	argvStr += "&aPEM=" + svr_cert;
	argvStr += "&aOption=" + (16 + 2097152);

	location.href = 'ios://mobileCertlLoginIos?' + argvStr + '&fpFlag=F'; 
}

function mobileCertlLoginIosResult(aSignedMsg) {
	fncSignSSnCallBack(aSignedMsg);
}

 /**
  * 모바일 인증서 로그인
  */
function mobileCertlLogin() {
       
	// alert("mobileCertlLogin");
     Sign_with_vid_user(16 + 2097152, "공인인증서로그인", svr_cert, "fncSignSSnCallBack");

     //submitChk = false;
     $("#certiLogin").attr('disabled', 'disabled');

 } 

function fncSignSSnCallBack(aSignedMsg){	// aSignedMsg: 전자서명문
    var form = document.frm_cert;

    if (aSignedMsg != "" && aSignedMsg != null)
    {
        form.xml.value = aSignedMsg ;
        send_vid_info("mobile_send_vid_info" );
        
    }else{
        ClearCacheData("mobile_ClearCacheData2");
    }
}


function mobile_send_vid_info( aResult ) {
    document.frm_cert.vidMsg.value = aResult;
    document.frm_cert.submit() ;
}
//CALLBACK3
function mobile_ClearCacheData2() {
	submitChk = false;
    alert("인증확인을 취소하였습니다.");
}


/*
 * 사용자 ID,PW 로그인
 */
function generalLogin(form,command,loginType){
    this.formObj = form;
    this.command = command;
    this.loginType = loginType; 
}
generalLogin.prototype = {
    /**
     * @desc : Submit 전에 값들을 Checking 합니다
     */
    fncBeforeSubmit: function() {
        
        if ($("#userId").val()=="") {
            alert("아이디를 입력하세요.");
            $("#userId").focus();
            submitChk = false;
            return false;
        }

        if ($("#pwd").val()=="") {
            alert("비밀번호를 입력하세요.");
            $("#pwd").focus();
            submitChk = false;
            return false;
        }

        if(!xssChk($("#userId"), "아이디")) {
            submitChk = false;          
            return false;
        }
        
        //쿠키 저장
        //saveUserId();
        
        //키보드보안 validation적용
        //xssChkUsingAjax 안에서 this를 사용하여 AA040LoginSubmit에 접근할수 없어 thisObj변수 사용함
        //var thisObj = this;
        var thisObj = this;

        if(makeEncData(this.formObj)){
            xssChkUsingAjaxNew(thisObj.formObj, "pwd", '비밀번호', function () {
                if(thisObj.formObj.loginType) {
                    thisObj.formObj.loginType.value = thisObj.loginType;
                }
                return thisObj.fncXecureSubmit();
            });
            
            return false;
        } else {
            return false;
        }

    },
    fncXecureSubmit: function(){

         var makeEncResult;
         if(appYn == 'Y'){
             makeEncResult = true;
         }else{
             makeEncResult = makeEncData(this.formObj);
         }
        //키보드보안적용
        if(!makeEncResult){
            return false;
        }

        if(!document.xecure) return false;
        document.xecure.a.value = this.command ;
        XecureSubmit(this.formObj);
        return false;
    }           
};

/*
 * 인증서 로그인
 */
function CertiLogin(form,command,loginType){
    this.formObj = form;
    this.command = command;
    this.loginType = loginType; 
}


CertiLogin.prototype = {

    /**
    * @desc : 공인인증서 Submit 전에 값들을 Checking 합니다
    */
    fncCertiLogin: function() { 
        var aTHIS = this;
        aTHIS.formObj.loginType.value = 'certiLogin' ;
        
        //CALLBACK5
        function _CB_SignDataCMSWithCacheCert( aResult ) {
            document.frm_cert.pkcs1Msg.value = aResult;
            aTHIS.fncXecureCertSubmit();
        }
        
        //CALLBACK4
        function _CB_send_vid_info( aResult ) {
            document.frm_cert.vidMsg.value = aResult;
            SignDataCMSWithCacheCert( "전자서명원문", _CB_SignDataCMSWithCacheCert );
        }
        //CALLBACK3
        function _CB_ClearCacheData2() {
        	submitChk = false;        
            alert("인증확인을 취소하였습니다.");
        }
        
        //  신규 추가
        function getPkcs1Elem() {
            //<![CDATA[ 
            return "<input type='hidden' name='pkcs1Msg' id='pkcs1Msg' value=''/>";
            //]]>
        }
        
        //CALLBACK2
        function _CB_Sign_with_vid_user( aResult ) {
        	if(arguments[1] == undefined && arguments[2] == undefined){
            aTHIS.formObj.xml.value = aResult;
            
            if (aTHIS.formObj.xml.value != "") {
                // 추가
                //jQuery("#xml").after(getPkcs1Elem());
                // Sign_with_pkcs1 --> SignDataCMSWithCacheCert
                send_vid_info( _CB_send_vid_info );
            } else{
                ClearCacheData( _CB_ClearCacheData2 );
            }
        }
        	 else {
        		 CB_gpki_set_data(arguments, aTHIS.formObj.xml, aTHIS.formObj.vidMsg, aTHIS.fncXecureCertSubmit);
             }
        }
        
        //CALLBACK1
        function _CB_ClearCacheData() {
            Sign_with_vid_user(16 + 2097152, "공인인증서로그인", svr_cert, _CB_Sign_with_vid_user);
            submitChk = false;
        }
        
        ClearCacheData( _CB_ClearCacheData );

        return false;
    },
    /**
     * @desc : 공인인증서 구분 체크
     */
     fncCertiType: function() {

        if($("certiType").checked== true) {
            // 개인
            $("divCertType1").style.display = 'block';
            $("divCertType2").style.display = 'none';
        }else {
            // 법인
            $("divCertType1").style.display = 'none';
            $("divCertType2").style.display = 'block';
        }

    },
    fncXecureCertSubmit: function(){
        if(!document.xecure) return false;
        document.xecure.a.value = this.command ;
        XecureSubmit(document.frm_cert);

        return false;
    }
};



//숫자만 입력
function IsCheckNum(el) {
    if(el.value != "" && isNaN(el.value)) {
        alert("숫자만 입력가능합니다.");
        el.value="";
        el.focus();
        return false;
    }
}

//XSS 대처 경고창 띄우기(ajax 이용)
function xssChkUsingAjaxNew(form, target, altTxt, successCallback) {
        
    /* 키보드보안 적용으로 인해 validation check를 AJAX로 구현 - 2015 생활정보구축사업단 */
    $.ajax({
        url : '/nlogin/xssCheck.json',
        cache : false,
        type : 'post',
        data : $(form).serialize()+ "&target=" + target,
        success : function (data) {
            var code = data.result.trim();
            // validation 정상적으로 완료
            if (code === "false") {
                alert(altTxt + "에는 < > ' \" 등과 같은 문자는 입력하실 수 없습니다.");
                return false;
            }
            if (typeof successCallback === 'function') {
                successCallback();
                return true;
            }
        },
        error : function (xhr) {
            alert('시스템에 장애가 발생하였습니다.');
            alert(xhr.status);
            var console = window.console || { error : function() { } };
            console.error(xhr.status);
        }
    });
}


//XSS 대처 경고창 띄우기
function xssChk(obj, altTxt) {
    
    var searchString = obj.val();
    var len = searchString.length;
    var searchChar;
    for(i=0; i<len; i++)
    {
        searchChar = searchString.charAt(i);
        if(searchChar == ">" || searchChar == "<" || searchChar == "'" || searchChar == "\""){
            alert(altTxt + "에는 < > ' \" 등과 같은 문자는 입력하실 수 없습니다.");
            obj.focus();
            return false;
        }
    }
    return true;
}



function popup(url, width, height){
    var left = (screen.width) ? (screen.width-width)/2 : 0;
    var top = (screen.height) ? (screen.height-height)/2 : 0;
    var popup=window.open(url,"","resizable=yes,toolbar=no,scrollbars=yes,locatioon=no,top="+top+"px,left="+left+"px,width="+width+"px,height="+height+"px");
}


function goRegiFinger() {
	 
	if( fngChk != "Y") {
		//alert("현재 사용하시는 단말기는 [지문] 인증 기능을 지원하지 않습니다.");
		nofingerDo();
	}
	else {
		
/* GOV-2단계-2 START */ 		
		//아이폰 앱스토어 배포 후 해당 로직 주석처리 
		if(!isIosApp && typeof(window.NativeBridge) === 'undefined') {
			alert("아이폰은 서비스 준비중입니다.");
		}
		else {
/* GOV-2단계-2 END */ 			
	    	confirm_msg = "이미 지문 로그인 정보가 등록되어 있습니다.\n계속 진행하시겠습니까? ";
	    	chkIOSUrl = "/nlogin/loginForBioReg?fpFlag=F&pCdFlag=C";		
	
	    	if( !boolRegFngPrt ) { //단말기에 등록된 지문이 없다면
				alert("휴대폰에 지문정보가 없습니다. 먼저 지문정보를 생성하시기 바랍니다.");				
			}
	    	else if( boolIdFng || boolPkiFng ) {
				if(iosYn == "Y"){
				        // confirmIOS 호출
			        confirmResult = confirm(confirm_msg+"native");
			    }else{
			        confirmResult = confirm(confirm_msg);
			        if(confirmResult){
			            location.href = chkIOSUrl;
			            return;
			        } else {
			            return;
			        }
			    }  
	    	}
	    	else {
				//location.href = '/nlogin/fingRegi?pFlag=I';
	    		location.href = chkIOSUrl;  
	    	}
		}
	}
 	 
}


// 지문인증 지원단말기 여부확인
function isSupportDevice(){

    if (typeof(window.NativeBridge) === 'undefined') {
		setTimeout(function () {
		  	location.href = 'ios://isSupportDevice';    // call iOS
		}, 500);	
	} else {
	  	
        window.NativeBridge.isSupportDevice();    // call Android
	}
}

// 앱에서 웹 함수를 호출하는 경우 >> 지원/미지원 단말 여부 전달
function getSupportInfo(value){	// true or false
    //alert(value);
	if(value == true) {	// value가 true일 경우
		fngChk = "Y";
	}
	else {	// value가 false일 경우
		fngChk = "N";
	}
	//사용자의 ID or 인증서 사용여부에 따라 활성화한다.
	getUserId(); 
}

function fngUseChk(){
	if(appYn =='Y'){
		if(fngChk == "N") {	// value가 false일 경우 미지원 단말 안내 레이어 팝업 호출
			//nofingerDo();
			return false;
		}
	}
}

//웹에서 앱 호출 함수
function getUserId(){ // userId: 웹에서 로그인 성공한 사용자의 ID
	//alert("getUserId called");
	if (typeof(window.NativeBridge) === 'undefined') {
		setTimeout(function () {
			location.href = 'ios://getUserId'; // call iOS
		}, 500);	
	} else {
		window.NativeBridge.getUserId(); // call Android
	}
}
/*
 * regType 은 간편비밀번호 및 지문 등록 과정의 화면에서 [취소]/[완료]/완료 후 [간편비밀번호 로그인][지문 로그인] 버튼 클릭시 해당 tab 활성화를 위해서 추가한 파라메터    	 
 * pid : 간편비밀번호 + 아이디 등록완료 후 간편 탭 활성화 및 간편 아이디 비밀번호 화면 뛰우기
 * pcert : 간편비밀번호 + 공인인증서 등록완료 후 간편 탭 활성화 및 간편 아이디 비밀번호 화면 뛰우기
 * fid : 지문 + 아이디 등록완료 후 지문 탭 활성화 및 지문인증 화면 뛰우기
 * fcert : 지문 + 공인인증서 등록완료 후 지문 탭 활성화 및 지문인증 화면 뛰우기
 * ptab : 간편 탭 활성화
 * ftab : 지문 탭 활성화
*/
// 웹 리턴 함수
function userIdInfo(sUserid, idSp, idFng, pkiSp, pkiFng, isRegFngPrt) { // TODO // 내부DB에 저장된 ID가 없을 경우 null // 있을 경우 Id 리턴
	//alert("idSp=|"+idSp + "| idFng=|" + idFng + "| pkiSp|" + pkiSp + "| pkiFng|" + pkiFng +"| isRegFngPrt|" + isRegFngPrt +"|");
	
	boolPkiFng = pkiFng;
	boolPkiSp = pkiSp;
	boolIdFng = idFng;
	boolIdSp = idSp;	
	boolRegFngPrt = isRegFngPrt;			
	
	/* GOV2-2 START */
	if(!isIosApp && typeof(window.NativeBridge) === 'undefined') {
		return false;
	}
	/* GOV2-2 END */
	
	if(sUserid != null){
		loginUsrId = sUserid;
	}
	// 생체인증 관련 로그인시 사용할 사용자ID 설정
	document.frm_authLogin.userId.value = sUserid;

	if( !idSp && !pkiSp && !idFng && !pkiFng ) {
				
		if(regType.toLowerCase() == "ftab"){	
			
			$('.tab-element li a:eq(3)').click();
		}
		else if(regType.toLowerCase() == "ptab"){
			
			$('.tab-element li a:eq(2)').click();
		}	
		else {
			$('.tab-element li a:eq(0)').click();
		}
	}
	
} 

function doLogin(sUserid){
	if(sUserid != null){
		setUserId(sUserid);

		form = document.frm_authLogin;
		document.xecure.a.value = form.a.value ;

		if(loginGb == 'id'){
			form.loginType.value = "authIdLogin";
	   		$("#frm_authLogin").submit();
		}
		else{
			form.loginType.value = "authCertLogin";
	   		$("#frm_authLogin").submit();
		}
	}s
}

// 인증서 간편비밀번호 인증
function authCertPin(releaseType){
	if (typeof(window.NativeBridge) === 'undefined') {	// (login / release)
		setTimeout(function () {
			location.href = 'ios://authCertPin?releaseType='+releaseType;    // call iOS
		}, 500);
	} else {
	  window.NativeBridge.authCertPin(releaseType);    // call Android
	}
}

// ID 간편비밀번호 인증
function authIdPin(releaseType){	// (login / release)
	if (typeof(window.NativeBridge) === 'undefined') {
		setTimeout(function () {
	  		location.href = 'ios://authIdPin?releaseType='+releaseType;    // call iOS
	  	}, 500);
	} else {
	  window.NativeBridge.authIdPin(releaseType);    // call Android
	}
}

//인증서 지문 인증
function authCertFp(releaseType){	// (login / release)
	//alert("authCertFp");
	if (typeof(window.NativeBridge) === 'undefined') {
		setTimeout(function () {
			location.href = 'ios://authCertFp?releaseType='+releaseType;    // call iOS
		}, 500);
	} else {
        alert("releaseType: " + releaseType);
	  window.NativeBridge.authCertFp(releaseType);    // call Android
	}
}

//ID 지문 인증
function authIdFp(releaseType){	// (login / release)
	if (typeof(window.NativeBridge) === 'undefined') {
		setTimeout(function () {
			location.href = 'ios://authIdFp?releaseType='+releaseType;    // call iOS
		}, 500);
	} else {
	  window.NativeBridge.authIdFp(releaseType);    // call Android
	}
}


function mobile_auth_vid( aResult, sessionId ) {

    document.frm_qrcert.xml.value = aResult ;
    document.frm_qrcert.sessionId.value = sessionId ;

    $.ajax({
        type : 'post',
        url : '/nlogin/qrByIdPwd.json',
        cache : false,
        data : $('#frm_qrcert').serialize(),
        dataType : 'json',
        success : function(result) {
            var rtnMsg  = result.rtnMsg;
            var rUserId = result.rUserId;

            if (rtnMsg) {
                //검증오류
                alert(rtnMsg);
            }
            else {
            	//검증정상
            	setUserId(rUserId);
            }
        }
	});
}

function fpConfPwdPop(procType, userId, loginGb) {
	
//alert(procType + "===="+userId);
	if(userId == null || userId =="") {
		alert("사용자 정보가 없습니다.");
		return;
	}
	
	var url = "/nlogin/fpConfPwdPop?procType="+ procType + "&userId=" + userId + "&loginGb=" + loginGb;
	
	location.href = url;
	
}

function fpConfPwdPopForQr(procType, userId, loginGb, keyStr) {
	
//alert(procType + "===="+userId);
	if(userId == null || userId =="") {
		alert("사용자 정보가 없습니다.");
		return;
	}
	
	var url = "/nlogin/fpConfPwdPop?procType="+ procType + "&userId=" + userId + "&loginGb=" + loginGb + "&keyStr=" + keyStr;
	
	location.href = url;
	
}
 
//QR코드 cleck 시 아래 함수 호출
function callNativeQr(){      
	if (typeof(window.NativeBridge) === 'undefined') {
	  location.href = 'ios://callNativeQr';    // call iOS
	} else {
	  window.NativeBridge.callNativeQr();    // call Android
	}
}


//]]>
</script>

</body>
</html>

