    <div class="full relative-org">
        <div class="rel-slide">
            <div class="owl-carousel banSlide">
                <div class="item"><a href="http://www.epeople.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_01.gif" alt="국민신문고"/></a></div>
                <div class="item"><a href="http://www.iros.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_03.gif" alt="대한민국 법원 인터넷등기소"/></a></div>
                <div class="item"><a href="http://www.data.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_24.png" alt="공공데이터포털 DATA.GO.KR"/></a></div>
                <div class="item"><a href="http://www.hometax.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_07.gif" alt="인터넷 납세서비스 Hometax"/></a></div>               
                <div class="item"><a href="http://www.wetax.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_02.gif" alt="Wetax 위택스"/></a></div>
                <div class="item"><a href="http://kras.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_16.jpg" alt="국토교통부 부동산종합증명서 일사편리"/></a></div>
                <div class="item"><a href="https://open.gdoc.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_23.jpg" alt="문서24 온라인 공문제출"/></a></div>                      
                <div class="item"><a href="http://www.president.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_09.gif" alt="청와대"/></a></div>
                <div class="item"><a href="http://www.mma.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_05.gif" alt="병무청"/></a></div>
                <div class="item"><a href="http://www.work.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_10.gif" alt="WORKNET"/></a></div>
                <div class="item"><a href="http://www.hikorea.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_11.gif" alt="HiKorea 외국인을 위한 전자정부"/></a></div>
                <div class="item"><a href="http://www.neis.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_13.gif" alt="나이스"/></a></div>
                <div class="item"><a href="http://www.mfds.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_12.gif" alt="식품의약품안전처"/></a></div>
                <div class="item"><a href="http://www.eais.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_14.gif" alt="건축행정시스템 세움터"/></a></div>
                <div class="item"><a href="http://www.g2b.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_06.gif" alt="나라장터 국가종합전자조달"/></a></div>
                <div class="item"><a href="http://www.estudy.or.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_17.gif" alt="배움나라"/></a></div>
                <div class="item"><a href="http://www.giro.or.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_18.gif" alt="금융결제원 지로"/></a></div>
                <div class="item"><a href="http://www.pisc.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_19.png" alt="행정정보공동이용센터"/></a></div>
                <div class="item"><a href="http://www.open.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_20.gif" alt="정보공개"/></a></div>
                <div class="item"><a href="http://www.safepeople.go.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_21.png" alt="안전신문고"/></a></div>
                <div class="item"><a href="http://www.korea.kr" title="새창" target="_blank"><img src="/2017/img/submain/banner_04.gif" alt="정책브리핑"/></a></div>
            </div>
            <div class="customNavigation">
                <a href="#" class="prev"><span class="sr-only">이전</span></a>
                <a href="#" class="next"><span class="sr-only">다음</span></a>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="/2017/lib/js/owl.carousel2.min.js"></script>
    <script type="text/javascript">
        $(window).load(function(){
            /* 외부링크 배너 */
            var banSlide = $('.banSlide');
            banSlide.owlCarousel({
                margin: 10,
                loop: false,
                dots: false,
                navElement: 'a href="#"',
                responsiveRefreshRate: 0,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 3
                    },
                    1000: {
                        items: 5
                    }
                }
            });
            $('.rel-slide .next').click(function(e) {
                banSlide.trigger('next.owl.carousel');
                e.preventDefault();
            })
            $('.rel-slide .prev').click(function(e) {
                banSlide.trigger('prev.owl.carousel');
                e.preventDefault();
            });

<c:if test="${mobileYn eq 'N'}"><%-- PC web에서만 슬라이드 적용 --%>
            /* 나의 생활 정보 */
            var myInfoSlide = $('.myLifeInfo');
            myInfoSlide.owlCarousel({
                items:1,
                loop: false,
                dots: false,
                callbacks: true,
				/* 스와이프 금지 */
				touchDrag: false,
				mouseDrag  : false,
				/* 스와이프 금지 */
                onInitialized: moveNav,
                navContainer: '#customNav',
                navElement: 'a href=#'
            });
            myInfoSlide.on('initialized.owl.carousel changed.owl.carousel', function(e) {
                if (!e.namespace) return;
                var carousel = e.relatedTarget;
                $('#info').text(carousel.relative(carousel.current()) + 1 + '/' + carousel.items().length)
            });
            function moveNav(e) {
                if (!e.namespace) return;
                var carousel = e.relatedTarget;
                $('#info').text(carousel.relative(carousel.current()) + 1 + '/' + carousel.items().length)
            };
            $(".my-life-info .next").click(function(e){
                myInfoSlide.trigger('next.owl.carousel');
                e.preventDefault();
            });
            $(".my-life-info .prev").click(function(e){
                myInfoSlide.trigger('prev.owl.carousel');
                e.preventDefault();
            });
</c:if>

            /* 이달의 서비스 */
            var serviceSlide = $('.banService');
            serviceSlide.owlCarousel({
                items:1,
                loop: true,
                dots: true,
                dotsContainer: '#customDots',
                responsiveRefreshRate: 0,
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayHoverPause: false,
            });
            $(".banner-service .next").click(function(e){
                serviceSlide.trigger('next.owl.carousel');
                e.preventDefault();
            });
            $(".banner-service .prev").click(function(e){
                serviceSlide.trigger('prev.owl.carousel');
                e.preventDefault();
            });
            $('.playBtn').on('click', function() {
                $(this).toggleClass('play');
                if( $( this ).is(".play" ) ) {
                    serviceSlide.trigger('play.owl.autoplay',[5000]);
                    $(this).children('.sr-only').html('멈춤');
                    return false;
                } else {
                    serviceSlide.trigger('stop.owl.autoplay');
                    $(this).children('.sr-only').html('재생');
                    return false;
                }
            });

            /* 공지사항 */
            var notiSlide = $('.notiSlide');
            notiSlide.owlCarousel({
                items:1,
                loop: true,
                dots: false
            });
            $(".slide-notice .next").click(function(e){
                notiSlide.trigger('next.owl.carousel');
                e.preventDefault();
            });
            $(".slide-notice .prev").click(function(e){
                notiSlide.trigger('prev.owl.carousel');
                e.preventDefault();
            });

        });
        $(document).ready(function($) {
            $('.col3').matchHeight();
            $('.playBtn').children('.sr-only').html('멈춤');
        });
    </script>
