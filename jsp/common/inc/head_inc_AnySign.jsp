<%@ page import = "xecure.crypto.VidVerifier" %>
<%@ page import = "xecure.servlet.XecureConfig" %>
<%
	String browser = "";
	String ua = request.getHeader("User-Agent");
	if (ua.indexOf("rv:11") > 0) {
		browser = "IE11";
	} else if (ua.indexOf("MSIE") > 0) {
		browser = "IE";
	} else if (ua.indexOf("Opera") > 0 || ua.indexOf("OPR") > 0) {
		browser = "Opera";
	} else if (ua.indexOf("Firefox") > 0) {
		browser = "Firefox";
	} else if (ua.indexOf("Chrome") > 0) {
		browser = "Chrome";
	} else if (ua.indexOf("Safari") > 0) {
		browser = "Safari";
	}
	final boolean isLowIE = browser.equals("IE");	
%>
<c:choose>
    <c:when test="${mobileYn eq 'N'}">
    	<% if (isLowIE) { %>
        <script type="text/javascript" src='/webPlugins/nlogin/AnySign4PC/anySign4PCInterface.js?time=${toDate}'></script>
        <%}else{ %>
        	<script type="text/javascript" src='/webPlugins/AnySign4PC_LITE/anySign4PCInterface.js?time=${toDate}'></script>
	        <script type="text/javascript" src='/webPlugins/AnySign4PC_LITE/xecurekeypad/js/xkeypad_config.js'></script>        
	        <script type="text/javascript" src='/webPlugins/AnySign4PC_LITE/xecurekeypad/js/xkeypad_html5.js'></script> 
		<%} %>
    </c:when>
    <c:otherwise>
        <c:if test="${appYn eq 'Y'}">
        <script type="text/javascript" src="/2017/lib/js/xecureweb_smart.js"></script>
        </c:if>
        <script type="text/javascript" src="/2017/js/mobile/Security.js"></script>
    </c:otherwise>
</c:choose>
<script type='text/javascript'>
	<c:if test="${param.where ne 'login' or mobileYn eq 'Y'}">
	//<![CDATA[
	 PrintObjectTag();
	//]]> 
	 </c:if> 
	<%
	VidVerifier vid = new VidVerifier(new XecureConfig());
    out.println(vid.ServerCertWriteScript("svr_cert"));
    %>
</script>
