<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>

	body{font-family:"Open Sans", sans-serif;background-size:cover;}
		#waitBackground{position:absolute;background-color:rgba(0,0,0,0.4);width:100%;height:100%;}
		@media (max-width :420px) {
			body{
				background-position:50%;
				
			}
			.login-containerT{width:100%!important;
			
			}
			.mobile-size {
				width:90%!important;
				margin: 0 auto;
				
			}
			.text-center h3 {
				margin-top: 50px!important;
				font-size: 20px!important;
			}
			.hpanel {
				margin-top: 20px!important;
				padding: 16px 0 16px 0!important;	

			}
			.sub_text {
				font-size:0.8em!important;			
			}
			#loading3 {
				width:70%!important;
			}
			.main_logo {
				left:60%!important;
			}
			.main_logo img {
				width: 110px!important;
				height: auto!important;
			}
			



		}
		.login-containerT{max-width:none;width:560px;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);z-index:99;}

		.login-containerT, .row, .col-md-12, .hpanel{margin:0;padding:0;}
		.panel-bodyT{text-align:center;padding:0px 2it_default.jsp0px 10px!important;border-radius:0;}
		
		#boxHeadLine{background:#4486d4;width:100%;height:4px;}
		#wait_value{
			color:#1e1e1e;
			font-weight:bold;
			font-size:14px;
			margin: 0 -1px 0 0;
			
		}
		#wait_time{
			color:#1e1e1e;
			font-weight:bold;
			font-size: 14px;
			margin: 0 0 0 0;
			
		}
		#stop_button{
			float: right;
			color:#1e1e1e;
			font-size:15px;
			padding: 0 0 0 45%;
		}

		.container{
			width : auto;
		}




progress:not(value) {
}


progress[value] {
    appearance: none;
    
    border: none;
    
    width: 100%; height: 20px;
    
      background-color: whiteSmoke;
      border-radius: 3px;
      box-shadow: 0 2px 3px rgba(0,0,0,.5) inset;
    
    color: royalblue;
    
    position: relative;
    margin: 0 0 1.5em; 
}


progress[value]::-webkit-progress-bar {
    background-color: whiteSmoke;
    border-radius: 3px;
    box-shadow: 0 2px 3px rgba(0,0,0,.5) inset;
}

progress[value]::-webkit-progress-value {
    position: relative;
    
    background-size: 35px 20px, 100% 100%, 100% 100%;
    border-radius:3px;
    background-color: #2457BD; 
    animation: animate-stripes 5s linear infinite;
}


progress[value]::-webkit-progress-value:after {
    content: '';
    position: absolute;
    
    width:5px; height:5px;
    top:7px; right:7px;
    
    background-color: white;
    border-radius: 100%;
}


progress[value]::-moz-progress-bar {
    background-image:
    -moz-linear-gradient( 135deg,
                                                     transparent,
                                                     transparent 33%,
                                                     rgba(0,0,0,.1) 33%,
                                                     rgba(0,0,0,.1) 66%,
                                                     transparent 66%),
    -moz-linear-gradient( top,
                                                        rgba(255, 255, 255, .25),
                                                        rgba(0,0,0,.2)),
     -moz-linear-gradient( left, #09c, #f44);
    
    background-size: 35px 20px, 100% 100%, 100% 100%;
    border-radius:3px;
    
}
.progress-bar {
    background-color: whiteSmoke;
    border-radius: 3px;
    box-shadow: 0 2px 3px rgba(0,0,0,.5) inset;

    width: 100%; height:20px;
}

.progress-bar span {
    background-color: royalblue;
    border-radius: 3px;
    
    display: block;
    text-indent: -9999px;
}

p[data-value] { 
  
  position: relative; 
}


p[data-value]:after {
    content: attr(data-value) '%';
    position: absolute; right:0;
    background-color: #2457BD;
    font-weight: bolder;
    margin: 0 auto;
    color: white;
    border-radius: 4px 4px 4px 4px;
    padding: 5px 5px 5px 5px;
	margin-top:60px;
}

/*end*/



 /*
		#loading3{display:flex;width:50%;justify-content:space-between;margin:10px auto 49px;}
	    #loading3>div{width:8px;height:40px;margin-right:7px;background-color:#033074;border-radius: 3px;
	        -webkit-animation:strechdelay 1.5s ease-in-out infinite;
	        animation:strechdelay 1.5s ease-in-out infinite;
	    }
	    #loading3 .line2{
	      -webkit-animation-delay:-1.4s;
	      animation-delay:-1.4s;
	  } #loading3 .line3{
	      -webkit-animation-delay:-1.3s;
	      animation-delay:-1.3s;
	  }#loading3 .line4{
	      -webkit-animation-delay:-1.2s;
	      animation-delay:-1.2s;
	  }#loading3 .line5{
	      -webkit-animation-delay:-1.1s;
	      animation-delay:-1.1s;
	  }#loading3 .line6{
	      -webkit-animation-delay:-1.0s;
	      animation-delay:-1.0s;
	  }#loading3 .line7{
	      -webkit-animation-delay:-0.9s;
	      animation-delay:-0.9s;
	  }#loading3 .line8{
	      -webkit-animation-delay:-0.8s;
	      animation-delay:-0.8s;
	  }#loading3 .line9{
	      -webkit-animation-delay:-0.7s;
	      animation-delay:-0.7s;
	  }#loading3 .line10{
	      -webkit-animation-delay:-0.6s;
	      animation-delay:-0.6s;
	  }#loading3 .line11{
	      -webkit-animation-delay:-0.5s;
	      animation-delay:-0.5s;
	  }#loading3 .line12{
	      -webkit-animation-delay:-0.4s;
	      animation-delay:-0.4s;
	  }#loading3 .line13{
	      -webkit-animation-delay:-0.3s;
	      animation-delay:-0.3s;
	  }#loading3 .line14{
	      -webkit-animation-delay:-0.2s;
	      animation-delay:-0.2s;
	  }#loading3 .line15{
	      -webkit-animation-delay:-0.1s;
	      animation-delay:-0.1s;
	  }#loading3 .line16{
	      -webkit-animation-delay:-0.0s;
	      animation-delay:-0.0s;
	  } */
	    
	    @keyframes strechdelay{
	        0%,50%,100%{
	            transform:scaleY(.7);
	        }
	        20%{
	            transform:scaleY(1);
	            background-color:#2d69c2;
	        }
	    }
	
	    @-webkit-keyframes strechdelay{
	        0%,50%,100%{
	            -webkit-transform:scaleY(.7);
	        }
	        20%{
	            -webkit-transform:scaleY(1);
	            background-color:#72a5f5;
	        }
	    }
	</style>

<script type="text/javascript">

playAlert = setInterval(function() {
    if ( this_isWait == "T" && Number(this_waitCnt) <= Number(checkCnt)) {
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

</head>
<body class="blank">

<form id="listForm" method="POST" class="mt-repeater form-horizontal" action="">
</form>
<div class="login-containerT" style="">
    <div class="row" id="isWaitPage" style="display:block">
	<div class="mobile-size" style="width:100%;height:auto;overflow:hidden;">
        <div class="col-md-12" style="width:100%;height:auto;background:#fff;">
			<div class="main_logo"style="position:absolute;left:5%;top:12px; height: 50px;"> 
				<img src="/rcvfvrSvc/js/tracer/logo.png" style="width:110px;height:auto;margin-top: 5px;"></div>
        	<div class="text-center" style="padding-top:20px; border-bottom: 0px;"></div>
            <div class="text-center m-b-md" style="border-bottom: 0px;">
                
		<h3 style="font-weight:bold;font-size:26px;color:#1245AB;letter-spacing: -0.04em;text-align: center;margin-top:50px"><span style="color:#000;">서비스 </span> 접속 대기 <span style="color:#000;">중입니다.</span> </h3>
            </div>
            <h5 style="font-weight:bold; font-size:13px;color:#454545;margin: 20px 0 20px 0;letter-spacing: -0.04em;text-align: center;">현재 보조금24 이용자 증가로 행정기관의 자격정보 확인이 지연되고 있습니다. <br/>이용에 불편을 드려 죄송합니다.</h5>
            
			<!-- 
			            <div class="container">
			  <div class="progress">
			 			   <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
			 			   </div>
			  </div>
			</div>
			 -->
			
			<!-- HTML5 -->
			<div style="width: 88%; margin:0 auto;margin-top:-30px;">
		    <p style=" width:0%" data-value="0" id="progressbarData"><span style="">&nbsp</span></p>
		        <progress max="100" value="0" class="html5" id="progressbar">
		        </progress>
			</div>
		
            <div class="hpanel" style="width:88%;margin: 0 auto;padding: 14px 0 14px 0;margin-top:20px;">
                <div class="panel-bodyT" style="border:none; display: flex;">
					<div id="wait_value" style="border:1px solid gray; width: 60%; height: 80px;">
					<div style="margin: 12px 0 0 12px;">
						<img src="/rcvfvrSvc/js/tracer/people.png" style="float: left;width:23px;height:23px;margin-right: 3px;">
						<p style="float: left; margin-top:0px;">대기자 수</p> </br></div>
						<span style="font-size:25px;color:#1245AB;font-weight:bold; line-height: 45px;" id="waitCnt">-</span> 명</div>
					<div id="wait_time" style="border:1px solid gray; width: 60%; height: 80px; "><div style="margin: 12px 0 0 12px;">
					<img src="/rcvfvrSvc/js/tracer/watch.png" style="margin-right: 3px;width:23px;height:23px;float: left;">
					<p style="float: left;  margin-top:0px;">예상대기시간</p></br></div>
					<span style="font-size:25px;color:#1245AB;font-weight:bold;line-height: 45px;float: right;margin-right: 10px;" id="wait_time_value">--:--:--</span></div>

                </div>
            </div>

            <hr>
            <!-- <div style="display: flex; height: 40px;"> -->
				<div class="sub_text"style="height: 30px; letter-spacing: -0.04em;font-size:0.8em;color:#1e1e1e;padding: 0 0 0 3%;">※ 재접속하시면 대기 시간이 길어질 수 있습니다.</div>
             <!--   <div id="stop_button" onclick="self.close();"><img src="./xbox.png" style="margin-right: 3px; width:18px;height:18px;margin-bottom: 3px;">중지하기</div>
                            </div> -->
                   
        </div>
	</div>
    </div>


	<div class="row" id="isRejectPage" style="display:none">
	<div class="mobile-size" style="border: 4px solid #033074;width:100%;height:auto;overflow:hidden;">
        <div class="col-md-12" style="width:100%;background:#fff;">
		<div class="main_logo" style="position:absolute;right:2%;top:12px;"> <img src="/rcvfvrSvc/js/tracer/logo2.png" style="width:90px;height:auto;margin-top: 10px;"> </div>
        	<div class="text-center" style="padding-top:20px;"></div>
            <div class="text-center m-b-md">
                <h3 style="font-weight:bold;font-size:22px;color:#033074;margin-top:5px;letter-spacing: -0.04em;text-align: center;">서비스 접속이 차단 되었습니다. </h3>
            </div>
            <div class="hpanel" style="width:88%;margin: 0 auto;padding: 16px 0 16px 0;margin-top:0px;">
                <div class="panel-bodyT" style="border:none;">
			<div id="wait_value2"></div>
                   <div class="sub_text"style="letter-spacing: -0.04em;font-weight:600;font-size:1.0em;color:#1e1e1e;">현재 접속하신 아이피에서는<br> 접속이 불가능합니다.</div>
                </div>
            </div>
        </div>
	</div>
    </div>

	<div class="row" id="isNotUse" style="display:none">
	<div class="mobile-size" style="border: 4px solid #033074;width:100%;height:auto;overflow:hidden;">
        <div class="col-md-12" style="width:100%;background:#fff;">
		<div class="main_logo" style="position:absolute;right:2%;top:12px;"> <img src="/rcvfvrSvc/js/tracer/logo2.png" style="width:90px;height:auto;margin-top: 10px;"> </div>
        	<div class="text-center" style="padding-top:20px;"></div>
            <div class="text-center m-b-md">
                <h3 style="font-weight:bold;font-size:22px;color:#033074;margin-top:5px;letter-spacing: -0.04em;text-align: center;">서비스 접속이 불가합니다. </h3>
            </div>
            <div class="hpanel" style="width:88%;margin: 0 auto;padding: 16px 0 16px 0;margin-top:0px;">
                <div class="panel-bodyT" style="border:none;">
			<div id="wait_value2"></div>
                   <div class="sub_text"style="letter-spacing: -0.04em;font-weight:600;font-size:1.0em;color:#1e1e1e;">접속량이 많아 접속이 불가능합니다.<br> 잠시 후 다시 접속해주세요</div>
                </div>
            </div>
        </div>
	</div>
    </div>


</div>
<div id="waitBackground"></div>
</body>
</html>
