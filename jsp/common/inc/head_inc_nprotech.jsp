<%@ page import="com.raonsecure.touchenkey.*"%>
<%
String tnk_srnd = E2ECrypto.CreateSessionRandom(session, true);
//

%>
<%-- 키보드 보안 스크립트 - 2015 생활정보구축사업단 --%>
<script type="text/javascript" src="/2017/lib/js/common/kbdSecurity.js?time=${toDate}" ></script>
<script type="text/javascript">
var TNK_SR = '<%= tnk_srnd %>';
</script>

<script type="text/javascript" src="/webPlugins/portal/TouchEn/nxKey/js/TouchEn.js?time=${toDate}"></script>
<script type="text/javascript">
if (window.addEventListener) { // W3C 이벤트 모델 
    window.addEventListener("load", tonuchEnKeyInit, false);
} else if (window.attachEvent) { // IE
    window.attachEvent("onload", tonuchEnKeyInit);
} else {
    window.onload = tonuchEnKeyInit;
}

function tonuchEnKeyInit() {
    //prototype.js(v1.7 이하 충돌방지) 
    if(typeof Prototype !== "undefined") {
        var _json_stringify = JSON.stringify;
        JSON.stringify = function(value) {
            var _array_tojson = Array.prototype.toJSON;
            delete Array.prototype.toJSON;
            var r = _json_stringify(value);
            Array.prototype.toJSON = _array_tojson;
            return r;
        }
    }

    
    setBlockDec_callback( TKinit );
}

</script>

