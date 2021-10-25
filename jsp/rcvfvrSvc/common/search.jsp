<script type="text/javascript" src="/rcvfvrSvc/js/search/search.js?time=${toDate}" ></script><!-- 검색관련 js -->
<script type="text/javascript" src="/rcvfvrSvc/js/search/arkHeader.js?time=${toDate}" ></script><!-- 자동완성관련 js -->

<script>
$(document).ready(function(){
	getPopkeywordHeader(); //인기검색어 헤더부분
	getRecommendkeyword('rcvrcmdkwd');
	
	var today = new Date();
	var month = today.getMonth()+1;
	var date = today.getDate();
	if(month < 10){
		month = "0" + month;
	}
	if(date < 10){
		date = "0" + date;
	}
	
	var txt = today.getFullYear() + "." + month + "." + date + ". 기준";
	$(".total-search__title > em").text(txt);
	
	var keyword = "";
	var cnt = "";
	if("${query}" != null && "${totalCount}" != null){
		keyword = "${query}";
		cnt = "${totalCount}"
	}
	
	//getMyKeywordDate(keyword, cnt, "header");
	getMyKeyword("${query}", "${totalCount}");	//내가찾은검색어
	
});
</script>
<div class="total-search">
    <div class="total-search__inner">
        <div class="m_fiexd">
            <div class="mobile total-search__title">혜택 검색</div>
            <div class="total-search__input-area">
            	<form name="searchHeader" id="searchHeader" action="/portal/rcvfvrSvc/search" method="GET">
            	<input type="hidden" name="startCount" value="${startCount }"/>
               	<input type="hidden" name="sort" value="${sort }"/>
               	<input type="hidden" name="searchField"value="${searchField }"/>
                <input type="text" id="queryHeader" name="query" title="통합 검색어 입력" class="total-search__input" placeholder="어떤 혜택이 궁금하신가요? " autocomplete="off" onkeypress="javascript:pressCheckHeader((event),this);">
                <button class="total-search__button" type="button" onClick="javascript:doSearchHeader();"><span>검색</span></button>
            	</form>
            </div>
            <!-- 자동완성 -->
            	<div id="total-search__wrap_header" class="total-search__wrap"></div>
            <!-- //자동완성 end -->
            <hr class="mobile mobile--full">
        </div>
        <div class="total-search__list">
            <div class="total-search__item total-search__item--col2">
				<div class="total-search__item--col2-inner">
				    <div class="total-search__item--sub">
				        <div class="total-search__title">
				            <span>최근검색어</span>
				            <button class="btn_del" onclick="javascript:removeAllSearch();">전체삭제</button>    
				        </div>
				        <ul class="total-search__rank" id="mykeywordHeaer">
				            
				        </ul>
				    </div>
				</div>
			</div>
            <div class="total-search__item total-search__item--col2">
                <div class="total-search__item--col2-inner">
                	<div class="total-search__item--sub">
                        <div class="total-search__title">
                            <span>인기검색어</span>
                            <em>2020.12.20. 기준</em>
                        </div>
                        <ul class="total-search__rank popWord" id="popwordHeader"></ul>
                    </div>                    
                </div>
            </div>
            <div class="total-search__item total-search__item--col2">
                <div class="total-search__item--col2-inner">
                    <div class="total-search__item--sub">
                        <div class="total-search__title">추천검색어</div>
                        <ul class="total-search__rank" id="rcmdKwd">
                            <li><a href="/portal/rcvfvrSvc/search?query=가정양육수단지원"><span>#</span>가정양육수단지원</a></li>
                            <li><a href="/portal/rcvfvrSvc/search?query=행복출산"><span>#</span>행복출산</a></li>
                            <li><a href="/portal/rcvfvrSvc/search?query=장애아동"><span>#</span>장애아동</a></li>
                            <li><a href="/portal/rcvfvrSvc/search?query=의료급여"><span>#</span>의료급여</a></li>
                            <li><a href="/portal/rcvfvrSvc/search?query=맘편한임신"><span>#</span>맘편한임신</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <button class="total-search__close" type="button" title="통합 검색 닫기"></button>
</div>