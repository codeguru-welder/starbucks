<!DOCTYPE html>
<html lang="ko">
	<head>
		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/common.jsp" />
		<title>연계 검증</title>
	</head>
	<body>
		<div class="skip-nav">
		    <a href="#content" class="skip-nav__item">본문바로가기</a>
		    <a href="#gnb" class="skip-nav__item">주메뉴바로가기</a>
		</div>
		<div id="wrap">
		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/header.jsp" />

		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/headerM.jsp" />

		    <jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/search.jsp" />

		   	<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/location.jsp">
				<jsp:param name="gnb" value="mySvc" />
				<jsp:param name="mnb" value="mySvc" />
			</jsp:include>

		    <div id="content" class="web-content" style="padding-bottom:20px; margin-bottom : 0px">
		        <div class="container" style="padding-top: 0px !important;">
		        	<input type="hidden" id="showView" />
		            <div class="search-list mgt30">
		                <div class="search-list__form input-wrap">
		                    <div class="select-wrap">
		                        <input type="text" class="button-table" style="width:160px; text-align: center;" id="guidanceNo">
		                    </div>
		                </div>
		                <ul class="tab__list js-tab-list tab-card" role="tablist">
		                    <li id="tab2" class="tab__item tab-card__item js-tab is-active" role="tab" aria-controls="tab-panel2" aria-selected="true" tabindex="0">
		                        <i class="icon-card" aria-hidden="true"></i>카드보기
		                    </li>
		                    <li id="tab1" class="tab__item tab-card__item js-tab" role="tab" aria-controls="tab-panel1">
		                        <i class="icon-list" aria-hidden="true"></i>목록보기
		                    </li>
		                </ul>
		            </div>
		            <div class="container container--full">
		                <div id="tab-panel1" class="tabpanel" role="tabpanel" aria-labelledby="tab1">
		                    <div class="accordion accordion-card" data-element="accordion" data-options='{ "isInitActive": true }'>
		                        <button type="button" title="더보기" class="accordion-card__title" data-element="accordion__anchor">
		                            <span class="title-name">받고있는 혜택</span>
		                                <span class="accordion__button">
		                                <i class="icon-arrow" aria-hidden="true"></i>
		                            </span>
		                        </button>
		                        <!-- accordion__inner  -->
		                        <div class="accordion__panel" data-element="accordion__panel">
		                            <!-- 컨텐츠 영역-->
		                            <div class="accordion-card__inner"></div>
		                            <!--// 컨텐츠 영역 -->
		                        </div>
		                        <!--// accordion__inner -->
		                    </div>
		                    <div class="accordion accordion-card" data-element="accordion" data-options='{ "isInitActive": true }'>
		                        <button type="button" title="더보기" class="accordion-card__title" data-element="accordion__anchor">
		                            <span class="title-name">신청 시 바로받을 수 있는 혜택</span>
		                            <span class="accordion__button">
		                                <i class="icon-arrow" aria-hidden="true"></i>
		                            </span>
		                        </button>
		                        <!-- accordion__inner  -->
		                        <div class="accordion__panel" data-element="accordion__panel">
		                            <!-- 컨텐츠 영역-->
		                            <div class="accordion-card__inner">
		                                <div class="kategorie-box pc">
		                                    <div class="kategorie-box__item">
		                                        <span class="kategorie-box__tag kategorie-box__tag--yellow">바로신청</span>
		                                        <span class="kategorie-box__info">정부24에서 신청 가능한 서비스</span>
		                                    </div>
		                                    <div class="kategorie-box__item">
		                                        <span class="kategorie-box__tag kategorie-box__tag--blue">타기관신청</span>
		                                        <span class="kategorie-box__info">타기관 사이트에서 신청 가능한 서비스</span>
		                                    </div>
		                                    <div class="kategorie-box__item">
		                                        <span class="kategorie-box__tag kategorie-box__tag--purple">방문신청</span>
		                                        <span class="kategorie-box__info">접수기관 방문하여 신청 가능한 서비스</span>
		                                    </div>
		                                </div>
		                            </div>
		                            <!--// 컨텐츠 영역 -->
		                        </div>
		                        <!--// accordion__inner -->
		                    </div>
		                    <div class="accordion accordion-card" data-element="accordion" data-options='{ "isInitActive": true }'>
		                        <button type="button" title="더보기" class="accordion-card__title" data-element="accordion__anchor">
		                            <span class="title-name">자격요건 충족 시 받을 수 있는 혜택</span>
		                            <span class="accordion__button">
		                                <i class="icon-arrow" aria-hidden="true"></i>
		                            </span>
		                        </button>
		                        <!-- accordion__inner  -->
		                        <div class="accordion__panel" data-element="accordion__panel">
		                            <!-- 컨텐츠 영역-->
		                            <div class="accordion-card__inner">
		                                <div class="info-wrap">
		                                    <div class="info-wrap__item">※ 신청 시 추가 제출서류 또는 심사를 요청할 수 있습니다.</div>
		                                    <div class="info-wrap__item">※ 자세한 내용은 접수기관 홈페이지 또는 문의처를 통해 확인하시기 바랍니다.</div>
		                                </div>
		                            </div>
		                            <!--// 컨텐츠 영역 -->
		                        </div>
		                        <!--// accordion__inner -->
		                    </div>
		                </div>
		                <div id="tab-panel2" class="tabpanel tabpanel-first" role="tabpanel" aria-labelledby="tab2">
		                    <div class="accordion accordion-card" data-element="accordion" data-options='{ "isInitActive": true }'>
		                        <button type="button" title="더보기" class="accordion-card__title" data-element="accordion__anchor">
		                            <span class="title-name">받고있는 혜택</span>
		                                <span class="accordion__button">
		                                <i class="icon-arrow" aria-hidden="true"></i>
		                            </span>
		                        </button>
		                        <!-- accordion__inner  -->
		                        <div class="accordion__panel" data-element="accordion__panel">
		                            <!-- 컨텐츠 영역-->
		                            <div class="accordion-card__inner"></div>
		                            <!--// 컨텐츠 영역 -->
		                        </div>
		                        <!--// accordion__inner -->
		                    </div>
		                    <div class="accordion accordion-card" data-element="accordion" data-options='{ "isInitActive": true }'>
		                        <button type="button" title="더보기" class="accordion-card__title" data-element="accordion__anchor">
		                            <span class="title-name">신청 시 바로받을 수 있는 혜택</span>
		                            <span class="accordion__button">
		                                <i class="icon-arrow" aria-hidden="true"></i>
		                            </span>
		                        </button>
		                        <!-- accordion__inner  -->
		                        <div class="accordion__panel" data-element="accordion__panel">
		                            <!-- 컨텐츠 영역-->
		                            <div class="accordion-card__inner"></div>
		                            <!--// 컨텐츠 영역 -->
		                        </div>
		                        <!--// accordion__inner -->
		                    </div>
		                    <div class="accordion accordion-card" data-element="accordion" data-options='{ "isInitActive": true }'>
		                        <button type="button" title="더보기" class="accordion-card__title" data-element="accordion__anchor">
		                            <span class="title-name">자격요건 충족 시 받을 수 있는 혜택</span>
		                            <span class="accordion__button">
		                                <i class="icon-arrow" aria-hidden="true"></i>
		                            </span>
		                        </button>
		                        <!-- accordion__inner  -->
		                        <div class="accordion__panel" data-element="accordion__panel">
		                            <!-- 컨텐츠 영역-->
		                            <div class="accordion-card__inner"></div>
		                            <!--// 컨텐츠 영역 -->
		                        </div>
		                        <!--// accordion__inner -->
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>

		<jsp:include page="/WEB-INF/jsp/portal/rcvfvrSvc/common/footer.jsp" />

		<div id="lypop01" class="modal modal--round" data-element="modal__element">
		    <div class="modal__container" data-element="modal__element-container">
		        <div class="modal__header hide">
		            <h1 class="modal__header--title">정보 업데이트</h1>
		        </div>
		        <div class="modal__contents">
		            <div class="update">
		                 <div class="update__info">최신정보로 업데이트 합니다. <br>잠시만 기다려주세요.</div>
		            </div>
		        </div>
		    </div>
		</div>
		<script>
			var svcLnkVrifyVo = ${svcLnkVrifyVo};

			$("#guidanceNo").val(svcLnkVrifyVo.guidanceNo);

			$(document).ready(function(){
				// 검증 데이터 조회
				$('body').data('plugin_modal').open('#lypop01');

				var lnkList = [];
				for(var i = 0; i < svcLnkVrifyVo.voList.length; i++){
					var lnkId = svcLnkVrifyVo.voList[i].lnkId;
					if($.inArray(lnkId, lnkList)=== -1) lnkList.push(lnkId);
				}

				// 정보업데이트
				$.ajax({
					  type: "post"
					, url: "/portal/rcvfvrSvc/getSvcLnkVrifyProgmResultVw.do"
					, dataType: 'json'
					, data: {
						cpttrNm : svcLnkVrifyVo.name,
						cvplRequstGuidanceNo : svcLnkVrifyVo.guidanceNo,
						linkId : lnkList
					}
					, success:function(result) {
						if(result.psMsg == "SUCC"){
							afterData(result);
						}else{

						}

						$('body').data('plugin_modal').close('#lypop01');
					}
					, error:function(e) { alert(e); }
				});
			});

			// 수혜서비스 화면 생성
			function afterData(data){
				// 화면 초기화
				$("#tab-panel1 .accordion-card__inner .list-wrap").html("");
				$("#tab-panel2 .accordion-card__inner .card").html("");

				// 타이틀 생성
				for(var i = 0; i < data.deptCnt.length; i++ ){

					var nm = data.deptCnt[i].nm;
					var cnt = data.deptCnt[i].cnt;
					var seq = data.deptCnt[i].seq;

					switch (data.deptCnt[i].guidanceClsCd) {
					case "ZZ2501": // 받고있는 나의 서비스
								$("#tab-panel1 .accordion-card__inner").eq(0).append(makeListTitle("tab-panel1-01-list", nm, cnt, seq));
								$("#tab-panel2 .accordion-card__inner").eq(0).append(makeCartTitle("tab-panel2-01-card", nm, cnt, seq));
						break;
					case "ZZ2502": // 신청 시 바로 수혜가능한 서비스
								$("#tab-panel1 .accordion-card__inner").eq(1).append(makeListTitle("tab-panel1-02-list", nm, cnt, seq));
								$("#tab-panel2 .accordion-card__inner").eq(1).append(makeCartTitle("tab-panel2-02-card", nm, cnt, seq));
						break;
					case "ZZ2503": // 자격요건 충족 시 수혜가능한 서비스
								$("#tab-panel1 .accordion-card__inner").eq(2).append(makeListTitle("tab-panel1-03-list", nm, cnt, seq));
								$("#tab-panel2 .accordion-card__inner").eq(2).append(makeCartTitle("tab-panel2-03-card", nm, cnt, seq));
						break;
					}

				}

				// 받고있는 나의 서비스 항목 추가
				for(var i = 0; i < data.rList01.length; i++ ){
					$("#tab-panel1-01-list-"+data.rList01[i].seq).append(makeListDetail(data.rList01[i]));
					$("#tab-panel2-01-card-"+data.rList01[i].seq).append(makeCardDetail(data.rList01[i]));
				}

				// 신청 시 바로 수혜가능한 서비스 항목 추가
				for(var i = 0; i < data.rList02.length; i++ ){
					$("#tab-panel1-02-list-"+data.rList02[i].seq).append(makeListDetail(data.rList02[i]));
					$("#tab-panel2-02-card-"+data.rList02[i].seq).append(makeCardDetail(data.rList02[i]));
				}

				// 자격요건 충족 시 수혜가능한 서비스 항목 추가
				for(var i = 0; i < data.rList03.length; i++ ){
					$("#tab-panel1-03-list-"+data.rList03[i].seq).append(makeListDetail(data.rList03[i]));
					$("#tab-panel2-03-card-"+data.rList03[i].seq).append(makeCardDetail(data.rList03[i]));
				}

			}

			// 목록보기 타이틀 생성
			function makeListTitle(id,nm,cnt,seq){
				var temp = "";

				if(cnt > 0){
					temp += '<div class="list-wrap">';
				    temp += '    <div class="list-wrap__name"><strong>'+ nm +'</strong>님 : <span>' + cnt +'건</span></div>';
				    temp += '    <div class="list-wrap__list" id="'+id+"-"+seq+'"></div>';
				    temp += '</div>';
				}else{
					temp += '<div class="list-wrap list-nodata">';
					temp += '    <div class="list-wrap__name">';
					temp += '        <strong>'+ nm +'</strong>님 : <span>0건</span>';
					temp += '        <div class="list__nodata">맞춤혜택이 없습니다.</div>';
					temp += '    </div>';
					temp += '</div>';
				}

			    return temp;
			}

			// 목록보기 타이틀별 항목생성
			function makeListDetail(data){
				var temp = "";
				var sportFrCdArr = data.sportFrCdArr == null ? "" : data.sportFrCdArr.split(",");
				var reqstMeanCdArr = data.reqstMeanCdArr == null ? "" : data.reqstMeanCdArr.split(",");

				temp += '<div class="list-wrap__item">';
				temp += '    <div class="list-wrap__contents">';
				temp += '        <span class="tag-text">';
				if(sportFrCdArr.length > 0){
					for(var i = 0; i < sportFrCdArr.length; i++){
						var sportFrCd = sportFrCdArr[i];

						if(sportFrCd == 'BA0601'){
							temp += '            <span class="tag-text--cash">현금</span>';
						}else if(sportFrCd == 'BA0606'){
							temp += '            <span class="tag-text--stuff">현물</span>';
						}else if(sportFrCd == 'BA0608'){
							temp += '            <span class="tag-text--service">서비스</span>';
						}else if(sportFrCd == 'BA0607'){
							temp += '            <span class="tag-text--ticket">이용권</span>';
						}else if(sportFrCd == 'BA0614'){
							temp += '            <span class="tag-text--etc">기타</span>';
						}
					}
				}
				temp += '        </span>';
				temp += '        <a href="/portal/rcvfvrSvc/dtlEx/'+data.svcId+'" class="list-wrap__title">'+data.svcNm+'</a>';
				temp += '        <div class="list-wrap__sub-text"><span>'+data.reqstTmlmtEtc+'</span></div>';
				temp += '        <div class="list-wrap__text">'+data.svcPpo+'</div>';
				temp += '         <span class="tag-line">';
				if(reqstMeanCdArr.length > 0){
					for(var i = 0; i < reqstMeanCdArr.length; i++){
						var reqstMeanCd = reqstMeanCdArr[i];

						if(reqstMeanCd == 'BF0101'){
							temp += '         	  <span class="tag-line__yellow">바로신청</span>';
						}else if(reqstMeanCd == 'BF0102'){
							temp += '             <span class="tag-line__blue">타기관신청</span>';
						}else if(reqstMeanCd == 'BF0103'){
							temp += '             <span class="tag-line__purple">방문신청</span>';
						}
					}
				}
				temp += '         </span>';
				temp += '    </div>';
				temp += '    <a href="#" class="list-wrap__share" data-element="modal__open" data-target="#sp'+data.svcId+'"><span class="hide">공유하기</span></a>';
				temp += '</div>';

				return temp;
			}

			// 카드보기 타이틀 생성
			function makeCartTitle(id,nm,cnt,seq){
				var temp = "";

				if(cnt > 0){
					temp += '<div class="card">';
					temp += '    <div class="card__name"><strong>'+ nm +'</strong>님 : <span>' + cnt +'건</span></div>';
					temp += '    <div class="card__list" id="'+id+"-"+seq+'">';
					temp += '    </div>';
					temp += '</div>';

				}else{
					temp += '<div class="card card-nodata">';
					temp += '    <div class="card__name">';
					temp += '        <strong>'+ nm +'</strong>님 : <span>0건</span>';
					temp += '        <div class="list__nodata">맞춤혜택이 없습니다.</div>';
					temp += '    </div>';
					temp += '</div>';
				}

			    return temp;
			}

			// 카드보기 타이틀별 항목생성
			function makeCardDetail(data){
				var temp = "";
				var sportFrCdArr = data.sportFrCdArr == null ? "" : data.sportFrCdArr.split(",");
				var reqstMeanCdArr = data.reqstMeanCdArr == null ? "" : data.reqstMeanCdArr.split(",");

				temp += '<div class="card__item">';
				temp += '    <div class="card__contents">';
				temp += '        <span class="tag-text">';
				if(sportFrCdArr.length > 0){
					for(var i = 0; i < sportFrCdArr.length; i++){
						var sportFrCd = sportFrCdArr[i];

						if(sportFrCd == 'BA0601'){
							temp += '            <span class="tag-text--cash">현금</span>';
						}else if(sportFrCd == 'BA0606'){
							temp += '            <span class="tag-text--stuff">현물</span>';
						}else if(sportFrCd == 'BA0608'){
							temp += '            <span class="tag-text--service">서비스</span>';
						}else if(sportFrCd == 'BA0607'){
							temp += '            <span class="tag-text--ticket">이용권</span>';
						}else if(sportFrCd == 'BA0614'){
							temp += '            <span class="tag-text--etc">기타</span>';
						}
					}
				}
				temp += '        </span>';
				temp += '        <a href="/portal/rcvfvrSvc/dtlEx/'+data.svcId+'" class="card__title">'+data.svcNm+'</a>';
				temp += '        <div class="card__sub-text"><span>'+data.reqstTmlmtEtc+'</span></div>';
				temp += '        <div class="card__text">'+data.svcPpo+'</div>';
				temp += '        <span class="tag-line">';
				if(reqstMeanCdArr.length > 0){
					for(var i = 0; i < reqstMeanCdArr.length; i++){
						var reqstMeanCd = reqstMeanCdArr[i];

						if(reqstMeanCd == 'BF0101'){
							temp += '         	  <span class="tag-line__yellow">바로신청</span>';
						}else if(reqstMeanCd == 'BF0102'){
							temp += '             <span class="tag-line__blue">타기관신청</span>';
						}else if(reqstMeanCd == 'BF0103'){
							temp += '             <span class="tag-line__purple">방문신청</span>';
						}
					}
				}
				temp += '        </span>';
				temp += '    </div>';
				temp += '    <a href="#" class="card__share" data-element="modal__open" data-target="#sp'+data.svcId+'"><span class="hide">공유하기</span></a>';
				temp += '</div>';

				return temp;
			}
		</script>
	</body>
</html>

