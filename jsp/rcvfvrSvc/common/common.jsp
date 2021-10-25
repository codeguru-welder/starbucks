<!-- 공통 meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="description" content="국가보조금 맞춤형서비스(보조금24) - 이제 찾아다니지 말고 정부24에 로그인하세요"> 
<meta property="og:title" content="국가보조금 맞춤형서비스(보조금24)"> 
<meta property="og:url" content="https://www.gov.kr"> 
<meta property="og:image" content="http://www.gov.kr/images/etc/og-image.png"> 
<meta property="og:description" content="보조금24에서 만나는 나만의 혜택"> 
<link rel="apple-touch-icon" href="/rcvfvrSvc/images/C/icon.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/rcvfvrSvc/images/C/icon72.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/rcvfvrSvc/images/C/icon144.png">
<link rel="shortcut icon" type="image/x-icon" href="/rcvfvrSvc/images/C/favicon.png">

<!-- 공통 css -->
<link rel="stylesheet" href="/rcvfvrSvc/css/common.css?time=${toDate}" type="text/css">
<!-- <link rel="stylesheet" href="/rcvfvrSvc/css/component.css" type="text/css"> -->
<c:if test="${param.gnb eq 'main' }">
	<link rel="stylesheet" href="/rcvfvrSvc/css/main.css?time=${toDate}" type="text/css">
</c:if>
<c:if test="${param.gnb ne 'main' }">
	<link rel="stylesheet" href="/rcvfvrSvc/css/subpage.css?time=${toDate}" type="text/css">
</c:if>

<!-- 공통 script -->
<script src="/rcvfvrSvc/library/jquery/jquery.min.js?time=${toDate}"></script>
<script src="/rcvfvrSvc/library/jquery/jquery-ui.js?time=${toDate}"></script>
<script src="/rcvfvrSvc/library/slick/slick.js?time=${toDate}"></script>
<script src="/rcvfvrSvc/js/ui/pualugin.js?time=${toDate}"></script>
<script src="/rcvfvrSvc/js/ui/common.js?time=${toDate}"></script>
<script src="/rcvfvrSvc/js/common/util.js?time=${toDate}"></script>
<script src="/rcvfvrSvc/library/drawsvg/jquery.drawsvg.min.js"></script>
<script type="text/javascript">
(function(w, d, a){
    w.__beusablerumclient__ = {
        load : function(src){
            var b = d.createElement("script");
            b.src = src; b.async=true; b.type = "text/javascript";
            d.getElementsByTagName("head")[0].appendChild(b);
        }
    };w.__beusablerumclient__.load(a);
})(window, document, "//rum.beusable.net/script/b201201e110113u450/f41fc5f0a9");
</script>

<script type="text/javascript">
(function(w, d, a){
    w.__baclient__ = {
        load : function(src){
            var b = d.createElement("script");
            b.src = src; b.async=true; b.type = "text/javascript";
            d.getElementsByTagName("head")[0].appendChild(b);
        }
    };w.__baclient__.load(a);
})(window, document, "//ba.beusable.net/script/ba/d49af19d5f");
</script>
<!-- 개별 script -->
<script src="/rcvfvrSvc/js/main/mainPop01.js?time=${toDate}"></script>

<!-- 공통 Layer -->
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/mainPop01.jsp" />
<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/loginPop.jsp" />
