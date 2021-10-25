
<script language="javascript">
/* GOV-2단계-2 START */
function chatBotCall(loginYn,userId) {
	
	//alert(window.location.hostname);
    var hName = window.location.hostname;    
    var url = "http://10.47.68.52:8180/sgva/chat.do?";
    
    if(hName == "dev.gov.kr" || hName == "dev2.gov.kr") {
        
        url = "http://dev.gov.kr/sgva/chat.do?";
    
    } else if(hName == "test.gov.kr") {
        
        url = "http://test.gov.kr/sgva/chat.do?";
        
    } else {
        
        url = "http://www.gov.kr/sgva/chat.do?";
    }
    
    if(userId == "") loginYn = "N";
	
	url += "loginYn=" + loginYn;
	url += "&userId=" + userId;
	url += "&deviceType=DV20000";
	
	var popupW = 520; 									// 팝업창 가로 길이
	var popupH = 670; 									// 팝업창 세로 길이
	var Horigental = Math.floor(screen.width/2); 		// 해상도 가로 길이의 반
	var Vertical = Math.floor(screen.height/2); 		// 해상도 세로 길이의 반
	var Hpoint = 0;
	var Vpoint = 20;		
	
	var option = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=" + popupW + ",height=" + popupH + ",left=" + Hpoint + ",top=" + Vpoint;
	
<!-- 202004 상단메뉴영역변경작업(검색포함) -->
<c:choose>
    <c:when test="${param.gnb eq 'newMain'}">	
		window.open(url + "&Mcode=11263", "chatbot", option); 	//newMain
	</c:when>
	<c:otherwise>
		window.open(url + "&Mcode=11165", "chatbot", option);	//newMain이외페이지
	</c:otherwise>
</c:choose>
<!--// 202004 상단메뉴영역변경작업(검색포함) -->	
}
/* GOV-2단계-2 END */

//개선의견수렴 메뉴 클릭 시, 로그인하지 않았거나 비회원일 경우 로그인 페이지로 이동
function checkUserImp() {
    var loginType = '<c:out value="${user.LOGIN_TYPE}" />';
    var userImsi = "${not empty user_imsi}";
    
    if(loginType == "generalLogin" || loginType == "multipleAuthLogin" || loginType == "certiLogin") {
    	location.href ="/portal/mrfnOpinionClct/imprvm?Mcode=11190";
    } else if(userImsi == "true"){
    	if(confirm("개선의견수렴은 회원로그인을 해야 이용하실 수 있습니다.\n로그인 페이지로 이동하시겠습니까?")){
           	location.href = "/nlogin?curr_url=/portal/mrfnOpinionClct/imprvm";
    	}
	} else{
		if(confirm("개선의견수렴은 회원로그인을 해야 이용하실 수 있습니다.\n로그인 페이지로 이동하시겠습니까?")){
			location.href = "/nlogin?curr_url=/portal/mrfnOpinionClct/imprvm";
		}
	}
}

</script>
<c:choose>
<c:when test="${param.gnb eq 'newMain'}">
	<!-- 202004 상단메뉴영역변경작업(검색포함) -->
	<footer class="footer-element">
		<div class="top-element">
			<div class="top-inner">
				<ul class="footer-menu">
					<li><a href="/portal/useStplat?Mcode=11229">이용약관</a></li>
					<li><a href="/portal/privacy?Mcode=11230"><strong>개인정보처리방침</strong></a></li>
					<li><a href="/portal/ntcItm?Mcode=11006">고객센터</a></li>
					<li><a href="#" onclick="checkUserImp(); return false;">개선의견수렴</a></li>
					<li><a href="/openapi?Mcode=11232" target="_blank" title="새창열림">open API</a></li>
				</ul>
				<ul class="footer-sns">
					<li class="blog"><a href="http://blog.naver.com/korea_gov" class="blog" target="_blank" title="정부24 네이버 블로그-새창" role="button"><span class="hd-element">블로그</span></a></li>
					<li class="tw"><a href="https://twitter.com/govkorea" class="twitter" target="_blank" title="정부24 트위터-새창" role="button"><span class="hd-element">트위터</span></a></li>
					<li class="fb"><a href="https://www.facebook.com/govkorea" class="facebook" target="_blank" title="정부24 페이스북-새창" role="button"><span class="hd-element">페이스북</span></a></li>
					<li class="ks"><a href="https://story.kakao.com/ch/governmentkorea" target="_blank" title="정부24 카카오스토리-새창" role="button"><span class="hd-element">카카오스토리</span></a></li>
					<li class="yt"><a href="https://www.youtube.com/channel/UCZZRA8-V4ugw4lnECStrswQ?view_as=subscriber" target="_blank" title="정부24 유투브-새창" role="button"><span class="hd-element">유투브</span></a></li>
					<li class="cb"><a href="javascript:chatBotCall('Y','${user.USER_ID}');" title="정부24 챗봇-새창" role="button"><span class="hd-element">챗봇</span></a></li>
				</ul>
			</div>
		</div>
		<div class="body-element">
			<div class="body-inner">
				<p class="footer-logo"><a href="/portal/main"><img src="/2019/lib/image/img-footer-logo.png" alt="정부24"></a></p>
				<p class="footer-infor">
					정부24 콜센터 1588-2188 (09:00 ~ 18:00 평일) 정부민원안내콜센터 국번없이 110 (365일 24시간)<br> 
					Copyright &copy; Ministry of the Interior and Safety. All Rights reserved.
				</p>
				<p class="logo_wa">
					<a href="http://www.wa.or.kr/board/list.asp?BoardID=0006" target="_blank" title="한국웹접근성평가센터 인증사이트 현황 새창열림">
						<img src="/2019/lib/image/main/logo_wa.png" alt="(사)한국장애인단체총연합회 한국웹접근성인증평가원 웹 접근성 우수사이트 인증마크(WA인증마크)">
					</a>
				</p>
			</div>
		</div>
	</footer>
	<!--// 202004 상단메뉴영역변경작업(검색포함) -->
</c:when>
<c:otherwise>
    <c:if test="${appYn eq 'N'}">  
	<footer class="footer-element">
		<div class="top-element">
			<div class="top-inner">
				<ul class="footer-menu">
					<li><a href="/portal/useStplat">이용약관</a></li>
					<li><a href="/portal/privacy"><strong>개인정보처리방침</strong></a></li>
					<li><a href="/portal/ntcItm?Mcode=11006">고객센터</a></li>
					<li><a href="#" onclick="checkUserImp(); return false;">개선의견수렴</a></li>
					<li><a href="/openapi">open API</a></li>
				</ul>
				<ul class="footer-sns">
                    <li class="blog"><a href="http://blog.naver.com/korea_gov" class="blog" target="_blank" title="정부24 네이버 블로그-새창" ><span class="hd-element">블로그</span></a></li>
                    <li class="tw"><a href="https://twitter.com/govkorea" class="twitter" target="_blank" title="정부24 트위터-새창" ><span class="hd-element">트위터</span></a></li>
                    <li class="fb"><a href="https://www.facebook.com/govkorea" class="facebook" target="_blank" title="정부24 페이스북-새창" ><span class="hd-element">페이스북</span></a></li>
                    <li class="ks"><a href="https://story.kakao.com/ch/governmentkorea" target="_blank" title="정부24 카카오스토리-새창"><span class="hd-element">카카오스토리</span></a></li>
                    <li class="yt"><a href="https://www.youtube.com/channel/UCZZRA8-V4ugw4lnECStrswQ?view_as=subscriber" target="_blank" title="정부24 유투브-새창"><span class="hd-element">유투브</span></a></li>
					<li class="cb"><a href="javascript:chatBotCall('Y','${user.USER_ID}');" title="정부24 챗봇-새창"><span class="hd-element">챗봇</span></a></li>
				</ul>
			</div>			
		</div>
		<div class="body-element">
			<div class="body-inner">
				<p class="footer-logo"><a href="/portal/main"><img src="/2019/lib/image/img-footer-logo.png" alt="정부24"></a></p>
				<p class="footer-infor">
					정부24 콜센터 1588-2188 (09:00 ~ 18:00 평일) 정부민원안내콜센터 국번없이 110 (365일 24시간)<br> 
					Copyright &copy; Ministry of the Interior and Safety. All Rights reserved.
				</p>
				<p class="logo_wa">
					<a href="http://www.wa.or.kr/board/list.asp?BoardID=0006" target="_blank" title="한국웹접근성평가센터 인증사이트 현황 새창열림">
						<img src="/2019/lib/image/main/logo_wa.png" alt="(사)한국장애인단체총연합회 한국웹접근성인증평가원 웹 접근성 우수사이트 인증마크(WA인증마크)">
					</a>
				</p>
				<p class="footer-top-btn">
					<a href="#">TOP</a>
				</p>	
			</div>
		</div> 
	</footer>
	</c:if>
	
	<!-- 202004 상단메뉴영역변경작업(검색포함) -->
	<script src="/renewSubGnb/js/renewSubGnbUi.js"></script>
	<!--// 202004 상단메뉴영역변경작업(검색포함) -->

</c:otherwise>
</c:choose>     

<%@ page import = "kr.go.minwon.capp.lib.util.SessionUtil" %>
<% if(SessionUtil.hasSession(request) && "N".equals(mobileYn)) { //세션이 존재한다면 세션타임아웃스크립트를 실행한다. %>
<link type="text/css" rel="stylesheet" href="/css/jquery-ui.min.css"/>
<style type="text/css">
.ui-dialog .ui-dialog-titlebar-close {display:none;}
.ui-dialog .ui-widget-header {border:0;background:white;}
</style>
<script type="text/javascript" src="/js/jquery-ui.custom.min.js"></script>
<script language="javascript">
    // Logout Timer 객체 정의
    var LogOutTimer = (function() {
        var s = {
            //clockObj : null,
            limit : 0,
            timeout : 0,
            interval : null,
            logoutUrl : "",
            dialLogObj : null,
            dialLog_limit : 0,
            dialLog_timeout : 0,
            dialLog_interval : null,
            dialLog_clockObj : null,
            
            callDialog : function(){
                $(s.dialLog_clockObj).html(s.dialLog_limit);
                $(s.dialLogObj).dialog({
                    modal:true,
                    position:({
                        my:"center",
                        at:"center",
                        of:window
                    })
                 });
                s.dialLog_start();
            },
            
            start : function() {
                s.timeout = s.limit;
                s.interval = setInterval(s.time_format, 1000);     
            },
            
            reset : function() {
                clearInterval(s.interval);
                clearInterval(s.dialLog_interval);
                s.start();
            },
            
            time_format : function(){
                var nMin=0;
                var nSec=0;
                if(s.timeout>0){
                    nMin = parseInt(s.timeout/60);
                    nSec = s.timeout%60;
                }
                if(nSec<10) nSec = "0" + nSec;
                if(nMin<10) nMin = "0" + nMin;
                
                if(s.timeout == 0){
                    clearInterval(s.interval);
                    $(document).off('mousemove');
                    s.callDialog();
                }
                s.timeout--;
            },
            
            dialLog_start : function() {
                s.dialLog_timeout = s.dialLog_limit;
                s.dialLog_interval = setInterval(s.dialLog_time_format, 1000);
            },
            
            dialLog_time_format : function(){
                var nMin=0;
                var nSec=0;
                if(s.dialLog_timeout>0){
                    nMin = parseInt(s.dialLog_timeout/60);
                    nSec = s.dialLog_timeout%60;
                }
            
                if(nSec<10) nSec = "0" + nSec;
                if(nMin<10) nMin = "0" + nMin;
                
                $(s.dialLog_clockObj).html(nSec);
                
                if(s.dialLog_timeout == 0){
                    clearInterval(s.dialLog_interval);
                    s.logOut();
                }
                s.dialLog_timeout--;
            },
            
            dialLog_close : function(){
//              location.reload();
                $.ajax({
	                	url: '/main',
	                	type: 'post',
	                	data: 'a=AA040DummyAjaxApp',
	                	success: function(data) {
	                	s.reset();
	                	$(s.dialLogObj).dialog('close');
                		}
                	});
            },
            
            logOut : function(){
                location.href = s.logoutUrl;
            },
            
            addMouseEventOn : function(){
                $(document).on('mousemove',function(){
                    s.reset();
                });
            }
        } 
        
        // s.addMouseEventOn();
        return s;
    })();
      
    $(document).ready(function(){
        //시간표시할obj명 설정
        LogOutTimer.dialLogObj = $("#timeoutDialog");
        LogOutTimer.dialLog_clockObj = $("#timeoutDialogClock");
        
        //로그아웃시 이동할url 설정
        LogOutTimer.logoutUrl = "/nlogin/logout"; 
        
        // 로그아웃 체크시간 설정(초단위)
        LogOutTimer.limit = 60*15;//10분
        
        //confirm창 유예시간
        LogOutTimer.dialLog_limit = 30;//30초
        
        // 로그아웃 타이머 실행
        LogOutTimer.start();
    });

</script>

<!-- 자동로그아웃안내팝업// -->
<div id="timeoutDialog" class="pop-wrap pop-logout pop-layer portal" style="display:none;">
    <div class="pop-logout-count">
        <dl>
            <dt>자동로그아웃안내</dt>
            <dd>자동 로그아웃 남은시간<br/><span id="timeoutDialogClock"></span>초</dd>
        </dl>
    </div>
    <ul class="pop-logout-guide">
        <li>개인정보 보호를 위해 로그인 후 약10분 동안 서비스 이용이 없어 자동 로그아웃 됩니다.</li>
        <li>로그인 시간을 연장 하시려면 로그인 연장하기 버튼을 클릭하여 주십시오.</li>
    </ul>
    <div class="pop-logout-btn btn-col2">
        <span><span class="ibtn medium sky"><a href="javascript:LogOutTimer.dialLog_close();" class="layer-close">로그인 연장하기</a></span></span>
        <span><span class="ibtn medium back line"><a href="javascript:LogOutTimer.logOut();" class="layer-close">지금 로그아웃</a></span></span>
    </div>
</div>
<% } %>
