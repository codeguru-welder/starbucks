<div class="location">
    <div class="location__inner">
    	<h2 class="location__title mobile">
	    	<button type="button" class="location__back" onclick="javascript:history.back();"><span class="hide">뒤로가기</span></button>
	        <c:choose>
	        	<c:when test="${param.mnb eq 'mySvc' }">
	        		나의 혜택
	        	</c:when>
				<c:when test="${param.mnb eq 'mySttus' }">
					나의 신청현황
				</c:when>
	        	<c:when test="${param.mnb eq 'svcDtl' }">
	        		혜택 상세
	        	</c:when>
	        	<c:when test="${param.mnb eq 'simpleFind' }">
	        		간편찾기
	        	</c:when>
	        	<c:when test="${param.mnb eq 'ntcitm' }">
	        		공지사항
	        	</c:when>
	        	<c:when test="${param.mnb eq 'svcSearchAll' }">
	        		전체보기
	        	</c:when>
	        	<c:when test="${param.mnb eq 'useGuidance1' }">
	        		나의 혜택 이용하기
	        	</c:when>	        	
	        	<c:when test="${param.mnb eq 'useGuidance2' }">
	        		간편찾기 이용하기
	        	</c:when>
	        	<c:when test="${param.mnb eq 'search' }">
	        		검색결과
	        	</c:when>
	        	<c:when test="${param.mnb eq 'recomendBnef' }">
	        		일상속 보조금24 이야기
	        	</c:when>
	        	<c:when test="${param.mnb eq 'rcvfvr' }">
	        		보조금24 소개
	        	</c:when>
	        	<c:when test="${param.mnb eq 'rcvfvrSvcfaq' }">
	        		자주 묻는 질문
	        	</c:when>
	        	<c:when test="${param.mnb eq 'rcvfvrSvcSttus' }">
	        		보조금24 현황
	        	</c:when>
	        </c:choose>
        </h2>

		<div class="location__list">
			<span class="location__item"><a href="/portal/rcvfvrSvc/main" class="location__anchor location__anchor--home">Home</a></span>
	        <c:choose>
		        <c:when test="${param.gnb eq 'svcFind' }">
		        	<span class="location__item">
		        		<a href="/portal/rcvfvrSvc/svcFind/svcSearchAll" class="location__anchor">혜택 찾기</a>
		        	</span>
		     	</c:when>
	     		<c:when test="${param.gnb eq 'useguidance' }">
	     			<span class="location__item">
		        		<a href="/portal/rcvfvrSvc/useguidance/faq" class="location__anchor">이용안내</a>
	        		</span>
	        	</c:when>
	        	<c:when test="${param.gnb eq 'intrcn' }">
	     			<span class="location__item">
		        		<a href="/portal/rcvfvrSvc/useguidance/intrcnRcvfvr" class="location__anchor">보조금24란</a>
	        		</span>
	        	</c:when>
	     	</c:choose>
			<span class="location__item">
	        	<c:choose>
	        		<c:when test="${param.mnb eq 'mySvc' }">
		        		나의 혜택
	        		</c:when>
					<c:when test="${param.mnb eq 'mySttus' }">
		        		나의 신청현황
	        		</c:when>
	        		<c:when test="${param.mnb eq 'svcDtl' }">
		        		${param.snb}
	        		</c:when>
	        		<c:when test="${param.mnb eq 'simpleFind' }">
		        		간편찾기
	        		</c:when>
	        		<c:when test="${param.mnb eq 'ntcitm' }">
	        			공지사항
	        		</c:when>
	        		<c:when test="${param.mnb eq 'svcSearchAll' }">
	        			전체보기
	        		</c:when>
	        		<c:when test="${param.mnb eq 'useGuidance1' }">
	        			나의 혜택 이용하기
		        	</c:when>	        	
		        	<c:when test="${param.mnb eq 'useGuidance2' }">
		        		간편찾기 이용하기
		        	</c:when>
	        		<c:when test="${param.mnb eq 'search' }">
	        			검색결과
	        		</c:when>
	        		<c:when test="${param.mnb eq 'recomendBnef' }">
	        			일상속 보조금24 이야기
	        		</c:when>
	        		<c:when test="${param.mnb eq 'rcvfvr' }">
	        			보조금24 소개
	        		</c:when>
	        		<c:when test="${param.mnb eq 'rcvfvrSvcfaq' }">
	        			자주 묻는 질문
	        		</c:when>
	        		<c:when test="${param.mnb eq 'rcvfvrSvcSttus' }">
	        			보조금24 현황
	        		</c:when>
	        	</c:choose>
        	</span>
        </div>
   		<c:if test="${param.mnb eq 'svcDtl'}">			
			<div class="utill">
                <ul class="utill__list">
			        <li class="utill__item"><button type="button" class="print" onclick="javascript:click2Pdf('printArea');"><span class="hide">프린트하기</span></button></li>
                    <li class="utill__item"><button type="button" class="share"><span class="hide">공유하기</span></button></li>
                </ul>
                <div class="card__sns">
				    <ul class="card__sns--list" id="/portal/rcvfvrSvc/dtlEx/${param.svcId}">
				        <li><a href="#none" class="facebook" title="새창열림" onclick="javascript:snsPopup('facebook', this)">facebook</a></li>
				        <li><a href="#none" class="twitter" title="새창열림" onclick="javascript:snsPopup('twitter', this)">twitter</a></li>
				        <li><a href="#none" class="etc" title="새창열림">connect</a></li>
				    </ul>
				    <button class="sns-close"><span class="hide">닫기</span></button>
				</div>
            </div>
   		</c:if>
   		<c:if test="${param.mnb eq 'recomendBnef' && param.svcId ne null}">
            <div class="utill utill--type04">
                <ul class="utill__list">
			        <li class="utill__item"><button type="button" class="print" onclick="javascript:window.print();"><span class="hide">프린트하기</span></button></li>
                    <li class="utill__item"><button type="button" class="share"><span class="hide">공유하기</span></button></li>
                </ul>
                <div class="card__sns">
				    <ul class="card__sns--list" id="/portal/rcvfvrSvc/recomendBnef/${param.svcId}">
				        <li><a href="#none" class="facebook" title="새창열림" onclick="javascript:snsPopup('facebook', this)">facebook</a></li>
				        <li><a href="#none" class="twitter" title="새창열림" onclick="javascript:snsPopup('twitter', this)">twitter</a></li>
				        <li><a href="#none" class="etc" title="새창열림">connect</a></li>
				    </ul>
				    <button class="sns-close"><span class="hide">닫기</span></button>
				</div>
            </div>
   		</c:if>
    </div>
</div>