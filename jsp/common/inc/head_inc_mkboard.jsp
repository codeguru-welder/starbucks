<%@ page import = "java.util.Random, java.util.Date" %>
    <div class="pop-wrap pop-app pop-layer" style="max-width: 294px;  width: 294px;  min-height: 30px;  position: absolute;  top: 50%;  left: 50%;  margin-left: -147px;  margin-top: -68px; display:none" >
    <div class="pop-app-con">
        �� ����� <br>����24 ���ø����̼ǿ����� <br>��� �����մϴ�.
        <ul class="pop-app-lst">
        <c:choose>
            <c:when test="${androidYn eq 'Y'}">
                <li class="android">�ȵ���̵�</li>
            </c:when>
            <c:otherwise>
                <li class="ios">IOS</li>
            </c:otherwise>
        </c:choose>
    </div>
    <p class="pop-app-btn"><span class="ibtn medium sky"><a id="applink_tag" href="#none">����24 ���ø����̼� ����</a></span></p>
    </div>
<%
    /* ����� Ű���� ���� - ���� */
    Random random = new Random();
    byte[] key = {'M','I','N','w','o','n','2','4','M','o','b','i','l','e','v','2'};
    byte[] mkey = new byte[16];
    for(int i=0; i<15; i++){
        mkey[i] = key[random.nextInt(16)];
    }
    String skey = new String(mkey);
    session.setAttribute("mkey",mkey);
    StringBuffer sb = new StringBuffer(mkey.length * 2);
    String hexNumber;
    for (int x = 0; x < mkey.length; x++) {
        hexNumber = "0" + Integer.toHexString(0xff & mkey[x]);
        sb.append(hexNumber.substring(hexNumber.length() - 2));
    }
    skey = sb.toString();
    /* ����� Ű���� ���� - �� */
%>
<c:set var="skey" value="<%=skey%>"/>

<script type="text/javascript">
    function showLayer(url){  
       $('body').append("<div class='overlay'></div>");
       $("#applink_tag").attr("href",url);
       $('.pop-layer').show();
       $('.overlay').show();
    }
    
    function closeLayer(){
       $('.pop-layer').hide();
       $('.overlay').hide();
    }
   
   
    function appCall(url){
        var domain = window.location.hostname;
        var url = window.location.protocol + '//'+domain+'/'+url;
        //var iosUrl = 'govportal://?url!=!'+url;
        var iosAppStoreName = '';
        var androidUrl = 'Intent://minwon24.mobile.app?url=' + url + '#Intent;scheme=minwon24apk;package=kr.go.minwon.m;end';
        
        if ('Y' == '${androidYn}') {
           //���̾��˾����� a �±׷� �̺�Ʈ �߻�(Ư����� ������ ���� ����)
           showLayer(androidUrl);
        } else {
           //���̾��˾����� a �±׷� �̺�Ʈ �߻�(Ư����� ������ ���� ����)
           showLayer('https://itunes.apple.com/app/id586454505?mt=8');
        }
        
        return true;
    }
    
    /* ����� Ű���� ���� - ���� */
    var inputObject = "";

    function inputValue(plain, cipher, cnt) {
        var cnt = cnt;
        var cipher = cipher;
        var hiddenname = "kbdenc_" + inputObject.id;
        document.getElementById(hiddenname).setAttribute("value", cipher);
        inputObject.setAttribute("value", InputDummy(cnt));
    }

    function InputDummy(cnt) {
        var dummyValue = "";
        for ( var i = 0; i < cnt; i++ ) {
            dummyValue += "0";
        }
        return dummyValue;
    }

    function mTransKey(tkoption, ob) {    
        inputObject = ob;
        var key = '${skey}';
        var data = "keydata=" + key + ';' + tkoption;
        var agent = navigator.userAgent.toLowerCase();
        if ( agent.indexOf('iphone') != -1 || agent.indexOf('ipad') != -1 ) {
            window.location = 'iTransKey:' + data;
        } else if ( agent.indexOf('android') != -1 ) {
            window.MTranskey.setKey(data);
        } else {
            window.location = 'http://iTransKey.exec/setKey/' + data;
        }
    }
    /* ����� Ű���� ���� - �� */
</script>