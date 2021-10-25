
<%--<link type="text/css" rel="stylesheet" href="/2017/lib/css/_tmain_notice.css?dt=20170520.3"/>--%>
<script type="text/javascript" src="/2017/lib/js/owl.carousel2.min.js"></script>
<script type="text/javascript">

/* 응원합시다 팝업 */
var openPopupWin =  {
    init : function(){
        var windowWidth = $(window).innerWidth();
        var windowHeight = $(window).innerHeight();     
        var popupWinWidth;
        var popupWinHeight;
        var popupWinLeft;   
        var popupWinTop;
        if (windowWidth <= 960) {
            popupWinWidth = windowWidth;
            popupWinLeft = 0;
        } else {
            popupWinWidth = 900;
            popupWinLeft = Math.max(0, ((windowWidth - popupWinWidth) / 2)) ;           
        }

        if (windowHeight <= 896) {
            popupWinHeight = windowHeight;          
            popupWinTop = 0;
        } else {
            popupWinHeight = 896;
            popupWinTop = Math.max(0, ((windowHeight - popupWinHeight) / 2));   
        }           

        var popupWinOpts = "width=" + popupWinWidth + ", height=" + popupWinHeight + ", left=0, top=0 scrollbars=yes, resizable=yes, location=no, modal=yes, true";  
        window.open("http://gov.nosuch.xyz:8080/etc/msgPop.ds", "popupWindow", popupWinOpts,"_blank");      
    }
}

$(window).load(function() {
    
  // main-notice slide
  /* 공지사항 */
  var noticeSlide = $('.noticeSlide');
      noticeSlide.owlCarousel({
        items:1,
        loop: true,
        //rewindNav : false,
        autoplay:true,
        autoplayHoverPause:true,
        autoplaySpeed:2000,
        fluidSpeed:2000,
        dots: false,
        onInitialize:hiddenBtn
        //onTranslated:callBack
      });
   /*function callBack(){      
       if($('.noticeSlide .owl-item').last().hasClass('active')){
            $('.customNavigation .next').addClass('disabled');
            $('.customNavigation .prev').removeClass('disabled');
         }
         else if($('.noticeSlide .owl-item').first().hasClass('active')){
            $('.customNavigation .prev').addClass('disabled');
            $('.customNavigation .next').removeClass('disabled');
         }else {
            $('.customNavigation .next').removeClass('disabled');
            $('.customNavigation .prev').removeClass('disabled');
         }

    }*/
    function hiddenBtn(){
        var idx = $('.item').size();
        if(idx == 1){  
          $('.customNavigation').hide();
        }
    }
      $(".next").click(function(e){
        noticeSlide.trigger('next.owl.carousel');
        e.preventDefault();
      });
      $(".prev").click(function(e){
        noticeSlide.trigger('prev.owl.carousel');
        e.preventDefault();
      });
      
      $('.intro-main-notice .play').on('click',function(){
        noticeSlide.trigger('play.owl.autoplay',[4000])
        $(this).addClass("disabled");
        $('.intro-main-notice .stop').addClass("active");
      });
      $('.intro-main-notice .stop').on('click',function(){
        noticeSlide.trigger('stop.owl.autoplay')
        $(this).addClass("disabled");
        $('.intro-main-notice .play').addClass("active");
      });

});


</script>
<!-- intro-main-notice -->
 <div class="intro-main-notice">
  <dl>
    <dt><img src="/2017/img/tmain/notice_icon.png" alt=""><span class="txt1">공지</span><span class="txt2">사항</span></dt>
    <dd>
      <div class="slide-notice">
        <div class="owl-carousel noticeSlide">
          <c:if test="${toDate lt 2017121708}">
          	 <div class="item"><a href="/portal/ntcItm/44257">정부24 시스템 점검 공지</a></div>
          </c:if>        
          <c:if test="${toDate lt 2018012120}">
          	<div class="item"><a href="/portal/ntcItm/44837">행정정보공동이용 실시간 유통서비스 일시 중단 안내</a></div>
          </c:if>
          <!-- <div class="item"><a href="/portal/ntcItm/48317">5월 가정의 달 감사이벤트 당첨자 발표</a></div> -->
          <div class="item"><a href="/portal/ntcItm/47797">전입신고에 따른 선거일 투표소 안내</a></div>	  
          <div class="item"><a href="/portal/ntcItm/45597">국립대학 제증명 발급수수료 무료 전환</a></div>
          <div class="item"><a href="/portal/faq/1251">모바일 인증서(공동, 금융) 안내</a></div>
          <!-- <div class="item"><a href="/portal/ntcItm/44579">정부24 회원 300만명 감사 이벤트 당첨자발표</a></div> -->
          <!-- <div class="item"><a href="/portal/ntcItm/44457">행복ㆍ출산 원스톱 서비스 이벤트 당첨자 발표</a></div>  -->
          <!-- <div class="item"><a href="/portal/ntcItm/42283">앱 업데이트 안내</a></div> -->
          <!--<div class="item"><a href="/portal/ntcItm/42777">지방세 세목별 과세증명 온라인 수수료 변경 안내</a></div> -->
          <div class="item"><a href="/portal/ntcItm/41378">정부24 이용 안내</a></div>
        </div>
      </div>
    </dd>
  </dl>
  <div class="customNavigation">
    <a href="#" class="prev"><span class="sr-only">이전</span></a>
    <a href="#" class="next"><span class="sr-only">다음</span></a>
  </div>
</div>
<!-- //intro-main-notice -->

