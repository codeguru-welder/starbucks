<script src="/rcvfvrSvc/js/tracer/tracerapi.js"></script>
        
<%
	String ip =  request.getRemoteAddr();
%>

<style>
      #waitPage{
              position:fixed;
              width:100%;
              height:100%;
              z-index:9999;
      }
</style>
      
<script>
	var checkCnt = '${remote.remoteMaxCnt}';

	function showRealPage() {
    	$("#waitPage").css("display","none");
	}

    function showWaitPage(type) {
		if ( Number(this_waitCnt) > Number(checkCnt) ) {
			showRealPage();
			$('body').data('plugin_modal').open('#tracerCnt');
			checkOutAPI();
		}else{
	    	$("#waitPage").css("display","block");
	        $("#isWaitPage").css("display","none");
	        $("#isRejectPage").css("display","none");
	        $("isNotUse").css("display","none");
	
	        if ( type == 'W' ) {
	        	$("#isWaitPage").css("display","block");
			} else if ( type == 'NE' ) {
	        	$("#isNotUse").css("display","block");
			} else if ( type == 'R' ) {
	        	$("#isRejectPage").css("display","block");
			}
		}
	}

	function checkInAPI() {
        var host="rcvfurSvc";
        var port="80";
        var pageUrl="myRcvfvrsvc.do";
        var ip = "<%=ip%>";

        callTracerApiInput(host, ip, ip, port, pageUrl, this);
	}

	function checkOutAPI() {
		var host="rcvfurSvc";
		var port="80";
		var pageUrl="myRcvfvrsvc.do";
        var ip = "<%=ip%>";

        callTracerApiOutput(host, ip, ip, port, pageUrl, this);
	}

	function callBackTracer() {
		getRcvfvrDataSucc();
	}
</script>