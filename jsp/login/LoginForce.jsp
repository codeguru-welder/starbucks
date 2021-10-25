<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/jsp/common/common.jsp"/>
<title>우회 로그인</title>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/jsp/common/header.jsp"/>
    </header>
    <div class="contentsWrap">
        <div class="contents" id="pageCont">
            <h2>우회 로그인</h2>
            <c:out value="${FIXESINFO}"/>
            <div class="cont-inner login-inner">
                <form id="form_login"  name="form_login" action="/portal/loginByIdForce" method="POST">
                    <input type="hidden" name="a"  value ="/portal/loginByIdForce"/>
                    <input type="hidden" name="loginType" value="generalLogin" />
                    <input type="hidden" name ="currUrl" value ="${currUrl}">
                    <div class="login-box type1">
                        <input type="text" class="inbox" id="userId" name="userId" placeholder="아이디를 입력하세요." title="아이디를 입력하세요." value="jerido">
                        <span class="ibtn large navy" id="genLogin"><a href="#noaction">로그인</a></span>
                    </div>
                 </form>
            </div>
        </div>
    </div>
    <form id="frm_cert" name="frm_cert" action="/portal/loginByIdPwd" method="POST">
       <input type="hidden" name="a"  value ="/portal/loginByIdPwd"/>
       <input type="hidden" name="curr_url" value="${currUrl}" />
       <input type="hidden" id="vidMsg" name="vidMsg" value="" />
       <input type="hidden" id="xml" name="xml" value="" />
       <input type='hidden' id="pkcs1Msg" name="pkcs1Msg" value="" />
       <input type="hidden" name="randomnum" value="" />
       <input type="hidden" name="loginType" value="certiLogin" />
       <input type="hidden" name="certiType" id="certiType" />
       <input type="hidden" name="certiType2" id="certiType2" />
    </form>
    <footer>
        <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    </footer>
    
<script src="/2017/lib/js/login/common/commonutil.js"></script> 
<script type="text/javascript">
//<![CDATA[
$(document).ready(function() {
    $('#genLogin').click(function() {
        var form = document.form_login;
        var genLogin = new generalLogin(form,"/portal/loginByIdForce","generalLogin");
        genLogin.fncBeforeSubmit();
    });
    
   
});


$(window).load(function() {
    //에러메세지 표시 로그인
    var msg = "${msg}";
    if (msg) {
        alert(msg);
    }

});


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
            return false;
        }

        if(!xssChk($("#userId"), "아이디"))
            return false;
        

        this.formObj.submit();

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
//}
}

//XSS 대처 경고창 띄우기(ajax 이용)
function xssChkUsingAjaxNew(form, target, altTxt, successCallback) {
        
    /* 키보드보안 적용으로 인해 validation check를 AJAX로 구현 - 2015 생활정보구축사업단 */
    $.ajax({
        url : '/portal/xssCheck.json',
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

//]]>
</script>
</body>
</html>