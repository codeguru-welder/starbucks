<link type="text/css" rel="stylesheet" href="/renewMain/css/wait_default.css">
<script type="text/javascript">

playAlert = setInterval(function() {
    if ( this_isWait == "T" ) {
	 checkCntData();
    } 
}, 1000);

function getWaitTime(session_time_out, limitCnt, waitCnt) {

   if ( limitCnt == 0 ) return '알수없음';
   var aa = session_time_out/limitCnt * waitCnt;
   aa = Math.round(aa);

   var hour='00';
   var min='00'
   var sec='00';

   if ( aa >=3600 ) {
      hour=Math.floor(aa/3600); 
      if ( hour < 10 ) hour = '0'+hour;
      aa=aa-hour*3600;
   } 
   
   if ( aa >=60 ) {
      min=Math.floor(aa/60);
      if ( min < 10 ) min = '0'+min;
      aa=aa-min*60;
   } 
    
   if ( aa < 10 ) sec = '0'+aa;
   else  sec = aa;
  
   var result = hour + ":" + min + ":" + sec;
   return result;
}

function getWaitPer(limitCnt, waitCnt) {
   var result = 100-( waitCnt/limitCnt*100 );
   result = Math.floor(result);
   return result;
}

function getWaitPerNew(limitCnt, waitCnt, waitMyCnt) {
   var result = 100-( waitCnt/waitMyCnt*100 );
   result = Math.floor(result);
   return result;
}


function checkCntData() {
    var host = this_host;
    var ip =  this_ip;
    var loginId = this_loginId;
    var port = this_port;
    var pageUrl = this_pageUrl;
    var sendThis = this_sendThis

    callTracerApiInputData(host, ip, loginId, port, pageUrl, sendThis);

    var waitCnt = this_waitCnt;

    if ( waitCnt == "0" || waitCnt == "E") {
      showRealPage();
      callBackTracer();
    } else {
        var $el = $("#waitCnt");
	var $el1 = $("#wait_time_value");
        var $el2 = $("#progressbarData");
 	var $el3 = $("#progressbar"); 
	
	var waitCnt = this_waitCnt;
    	var limitCnt = this_limitCnt;
    	var session_time_out = this_session_time_out;
    	var waitQueueSize = this_waitQueueSize;
	var waitMyCnt = this_waitMyCnt;

    	//var wait_per = getWaitPer(waitQueueSize, waitCnt);
    	var wait_per = getWaitPerNew(waitQueueSize, waitCnt, waitMyCnt);
	var wait_time = getWaitTime(session_time_out, limitCnt, waitCnt);
 
	if ( $.isNumeric(waitCnt) ) {
	     $el.html(comma(Math.floor(waitCnt)));
	     $el1.html(wait_time);

	     $el2.width(wait_per+'%');	
	     $el2.attr("data-value", wait_per);

	     $el3.val(wait_per);


	} else {
	  // alert("AAA"+opener.this_waitCnt+"AAA");

	}
    }

}



function createCookie() {
	var now = new Date();
	  var time = now.getTime();
	  var expireTime = time + 1000*36000;
	  now.setTime(expireTime);
	  var tempExp = 'Wed, 31 Oct 2020 08:50:17 GMT';
	  document.cookie = 'SESSIONID=hjpark123;expires='+now.toGMTString()+';path=/';
	  //console.log(document.cookie);
}


/* setInterval(function() {
	window.location.href='login.do';
		}, 20000); */

function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
}

</script>

<form id="listForm" method="POST" class="mt-repeater form-horizontal">
</form>

<div class="login-containerT" style="z-index: 10000;">
    <div class="row" id="isWaitPage" style="display:block">
		<div class="mobile-size" style="width:100%;height:auto;overflow:hidden;">
	        <div class="col-md-12" style="width:100%;height:auto;background:#fff;">
				<div class="main_logo" style="position:absolute;left:2%;top:12px; height: 50px;"> 
					<img src="/webPlugins/portal/tracer/logo.png" alt="정부24" style="width:110px;height:auto;margin-top: 5px;">
				</div>
	        	<div class="text-center" style="padding-top:20px;"></div>
	            <div class="text-center m-b-md">
	                <h5 id="title_id" style="font-weight:bold;font-size:17px;color:#000;margin: 40px 0 10px 0;letter-spacing: -0.04em;text-align: center;"></h5>
	                <h3 style="font-weight:bold;font-size:26px;color:#1245AB;letter-spacing: -0.04em;text-align: center;margin-top:0px">
	                	접속 대기 <span style="color:#000;">중입니다.</span> 
	                </h3>
	            </div>
	            <h5 style="font-weight:bold; font-size:13px;color:#454545;margin: 20px 0 20px 0;letter-spacing: -0.04em;text-align: center;">
	            	잠시만 기다리시면 해당 페이지로 자동 접속됩니다.
	            </h5>
	            
				<%-- 
				            <div class="container">
				  <div class="progress">
				 			   <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
				 			   </div>
				  </div>
				</div>
				 --%>
				
				<%-- HTML5 --%>
				<div style="width: 88%; margin:0 auto;margin-top:-30px;">
			    	<p style=" width:0%" data-value="0" id="progressbarData">
			    		<span style="">&nbsp;</span>
			    	</p>
			        <progress max="100" value="0" class="html5" id="progressbar">
			        </progress>
				</div>
			
	            <div class="hpanel" style="width:88%;margin: 0 auto;padding: 14px 0 14px 0;margin-top:20px;">
	                <div class="panel-bodyT" style="border:none; display: flex;">
						<div id="wait_value" style="border:1px solid gray; width: 60%; height: 80px;">
							<div style="margin: 12px 0 0 12px;">
								<img src="/webPlugins/portal/tracer/people.png" alt="대기자수" style="float: left;width:23px;height:23px;margin-right: 3px;">
								<p style="float: left; margin-top:0px;">대기자 수</p>
								<br>
							</div>
							<div style="text-align: right;margin-right:5%">
								<span style="font-size:25px;color:#1245AB;font-weight:bold; line-height: 45px;" id="waitCnt">-</span> 명
							</div>
						</div>
						<div id="wait_time" style="border:1px solid gray; width: 60%; height: 80px; ">
							<div style="margin: 12px 0 0 12px;">
								<img src="/webPlugins/portal/tracer/watch.png" alt="예상대기시간" style="margin-right: 3px;width:23px;height:23px;float: left;">
								<p style="float: left;  margin-top:0px;">예상대기시간</p><br>
							</div>
							<span style="font-size:25px;color:#1245AB;font-weight:bold;line-height: 45px;float: right;margin-right: 10px;" id="wait_time_value">--:--:--</span>
						</div>
	                </div>
	            </div>
	
	            <hr>
	            <%-- <div style="display: flex; height: 40px;"> --%>
					<div class="sub_text" style="height: 30px; letter-spacing: -0.04em;font-size:0.8em;color:#1e1e1e;padding: 0 0 0 3%;">※ 재접속하시면 대기 시간이 길어질 수 있습니다.</div>
	             <%--   <div id="stop_button" onclick="self.close();"><img src="./xbox.png" style="margin-right: 3px; width:18px;height:18px;margin-bottom: 3px;">중지하기</div>
	                            </div> --%>
	        </div>
		</div>
    </div>


	<div class="row" id="isRejectPage" style="display:none">
		<div class="mobile-size" style="border: 4px solid #033074;width:100%;height:auto;overflow:hidden;">
	        <div class="col-md-12" style="width:100%;background:#fff;">
				<div class="main_logo" style="position:absolute;right:2%;top:12px;">
					<img src="/webPlugins/portal/tracer/logo2.png" alt="정부24" style="width:90px;height:auto;margin-top: 10px;">
				</div>
	        	<div class="text-center" style="padding-top:20px;"></div>
	            <div class="text-center m-b-md">
	                <h3 style="font-weight:bold;font-size:22px;color:#033074;margin-top:5px;letter-spacing: -0.04em;text-align: center;">서비스 접속이 차단 되었습니다. </h3>
	            </div>
	            <div class="hpanel" style="width:88%;margin: 0 auto;padding: 16px 0 16px 0;margin-top:0px;">
	                <div class="panel-bodyT" style="border:none;">
						<%-- <div id="wait_value2"></div> --%>
						<div></div>
		                <div class="sub_text" style="letter-spacing: -0.04em;font-weight:600;font-size:1.0em;color:#1e1e1e;">현재 접속하신 아이피에서는<br> 접속이 불가능합니다.</div>
	                </div>
	            </div>
	        </div>
		</div>
    </div>

	<div class="row" id="isNotUse" style="display:none">
		<div class="mobile-size" style="border: 4px solid #033074;width:100%;height:auto;overflow:hidden;">
	        <div class="col-md-12" style="width:100%;background:#fff;">
				<div class="main_logo" style="position:absolute;right:2%;top:12px;">
					<img src="/webPlugins/portal/tracer/logo2.png" alt="정부24" style="width:90px;height:auto;margin-top: 10px;">
				</div>
	        	<div class="text-center" style="padding-top:20px;"></div>
	            <div class="text-center m-b-md">
	                <h3 style="font-weight:bold;font-size:22px;color:#033074;margin-top:5px;letter-spacing: -0.04em;text-align: center;">서비스 접속이 불가합니다. </h3>
	            </div>
	            <div class="hpanel" style="width:88%;margin: 0 auto;padding: 16px 0 16px 0;margin-top:0px;">
	                <div class="panel-bodyT" style="border:none;">
						<%-- <div id="wait_value2"></div> --%>
						<div></div>
	                   	<div class="sub_text" style="letter-spacing: -0.04em;font-weight:600;font-size:1.0em;color:#1e1e1e;">접속량이 많아 접속이 불가능합니다.<br> 잠시 후 다시 접속해주세요</div>
	                </div>
	            </div>
	        </div>
		</div>
    </div>
</div>
<div id="waitBackground"></div>
