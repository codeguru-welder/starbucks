package kr.go.portal.rcvfvrSvc.search.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lg.g4c.capp.lib.entity.Entity;

import kr.co.opensns.search.common.CommonLogFactory;
import kr.go.common.log.CommonLoggerFactory;
import kr.go.portal.rcvfvrSvc.search.service.RcvfvrSvcSearchService;
import kr.go.portal.rcvfvrSvc.search.service.common.WNCollection;
import kr.go.portal.rcvfvrSvc.search.service.common.WNSearch;
import kr.go.portal.rcvfvrSvc.search.service.common.WNUtils;
import kr.go.portal.search.vo.Sf1Vo;

@Controller
@RequestMapping("/portal/rcvfvrSvc")
public class RcvfvrSvcSearchController {
	
    /**
     * 검색엔진 서버IP
     */
    @Value("#{resourceProperties['wisenut.sf1.search.server.ip']}")
    private String searchIp ;//= "10.47.68.53";

    /**
     * 검색엔진 PORT번호
     */
    //@Value("#{resourceProperties['wisenut.sf1.search.server.port']}")
    //private int searchPort ;
    private int searchPort = 7002;
    
    /**
     * 유저 파라미터 명
     */
    @Value("#{globalsProperties['com.lg.g4c.capp.lib.servlet.param.user']}")
    private String paramUser;
    
    @Autowired
	private RcvfvrSvcSearchService rcvfvrSvcSearchService;
    /**
     * 수혜서비스 포탈 서비스 찾기
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return 메인화면 jsp
     */
    @RequestMapping(value = "/search")
    public ModelAndView rcvfvrSvcSearch(HttpServletRequest request, HttpServletResponse response, ModelAndView mav){

    	//실시간 검색어 화면 출력 여부 체크
        boolean isRealTimeKeyword = false;
        //오타 후 추천 검색어 화면 출력 여부 체크
        boolean useSuggestedQuery = true;
        String suggestQuery = "";

        //디버깅 보기 설정
        boolean isDebug = false;
        boolean isTextAnaly = true;

    	String START_DATE = "1970.01.01";	// 기본 시작일

    	// 결과 시작 넘버
        int listCount = WNUtils.parseInt(WNUtils.getCheckReqXSS(request, "listCount", "24"), 24);	//디폴드 출력 검색결과건수
        int startCount = WNUtils.parseInt(WNUtils.getCheckReqXSS(request, "startCount", "0"), 0);	//시작 번호
        String query = WNUtils.getCheckReqXSS(request, "query", "");						//검색어
        String collection = WNUtils.getCheckReqXSS(request, "collection", "ALL");	//컬렉션이름
        String rt = WNUtils.getCheckReqXSS(request, "rt", "");								//결과내 재검색 체크필드
        String rt2 = WNUtils.getCheckReqXSS(request, "rt2", "");							//결과내 재검색 체크필드
    	String reQuery = WNUtils.getCheckReqXSS(request, "reQuery", "");					//결과내 재검색 체크필드
    	String stQuery = WNUtils.getCheckReqXSS(request, "stQuery", "");					//sort, tccd 체크
    	String reChk = WNUtils.getCheckReqXSS(request, "reChk", "");						//결과내 재검색 내용
        String realQuery = WNUtils.getCheckReqXSS(request, "realQuery", "");				//실제 검색엔진에 들어가는 쿼리
        String sort = WNUtils.getCheckReqXSS(request, "sort", "RANK/DESC,VW_CNT");						//정렬필드
        String sortOrder = WNUtils.getCheckReqXSS(request, "sortOrder", "DESC");						//정렬필드
        String range = WNUtils.getCheckReqXSS(request, "range", "A");						//기간관련필드
        String startDate = WNUtils.getCheckReqXSS(request, "startDate", START_DATE);		//시작날짜
        String endDate = WNUtils.getCheckReqXSS(request, "endDate", WNUtils.getCurrentDate());		//끝날짜
    	String tccd = WNUtils.getCheckReqXSS(request, "tccd", "ALL");							//현금/현물/서비스 구분
    	String showView = WNUtils.getCheckReqXSS(request, "showView", "tab1");				//리스트형으로 보기, 카드형으로 보기
    	String searchField = WNUtils.getCheckReqXSS(request, "searchField", "ALL");			//검색필드
    	String collectionQuery  = "" ;												//collecion query 필드
    	String strOperation  = "" ;												//operation 조건 필드
        String exquery = "" ;													//exquery 조건 필드
        int totalCount = 0;

        String[] searchFields = null;

        String[] collections = null;
        if(collection.equals("ALL")) { //통합검색인 경우
            collections = new String[] {"RCV_FVR_SVC"};
        } else {                        //개별검색인 경우
            collections = new String[] { collection };
        }

        WNSearch wnsearch = new WNSearch(isDebug, false, collections, searchFields);
        Sf1Vo sf1Vo = new Sf1Vo();
        sf1Vo.setSearchIp(searchIp);
        sf1Vo.setSearchPort(searchPort);
        wnsearch.setSf1Vo(sf1Vo);
        
        //if(query.contains(" ")){ isTextAnaly = true; }else{ isTextAnaly = false; }
        if(isTextAnaly){
        	//의미기반 분석 entity추출
        	String textAnalyEntity = "";
        	try{
        		textAnalyEntity = rcvfvrSvcSearchService.getTextAnalyzerEntity(query );
        		CommonLoggerFactory.APP_LOGGER.debug("[textAnalyzer-v2.0] [의미기반검색 분석된 엔티티 결과] ----> "+textAnalyEntity);
        	}catch(NullPointerException e){
        		CommonLogFactory.ERR_LOGGER.debug("[error] 질의형 검색엔진 동작안함 :: "+e);
        	}
        	
        	exit : if (reQuery.equals("1")&&!reChk.equals("")) { //결과내재검색 포함
        		realQuery = "("+realQuery + ")" +" ("+reChk+")";
        	} else if (reQuery.equals("3")&&!reChk.equals("")) { //결과내재검색 제외키워드
        		realQuery = "("+realQuery + ")" +" !("+reChk+")";
        	} else if (stQuery.equals("1")){ //sort, tccd 체크 후 realQuery 유지
        		break exit;
        	} else { //그냥검색
        		realQuery = "("+query+")"+textAnalyEntity;
        	}
        	
        	HashMap<String,String> queryAge = new HashMap<>(); 
        	queryAge = rcvfvrSvcSearchService.queryCheckAgeRegExr(query); //수치관련 자격정보(정규식)
        	if(queryAge.size() > 0){
        		CommonLoggerFactory.APP_LOGGER.debug("[info] 범위관련 자격정보(나이 등) >>> "+queryAge.toString());
        		String[] startFields = {"RANGE1_START","RANGE2_START","RANGE3_START"};
        		String[] endFields = {"RANGE1_END","RANGE2_END","RANGE3_END"};
        		String[] cdFields = {"RANGE1_QUALF_ATT_CLS_CD","RANGE2_QUALF_ATT_CLS_CD","RANGE3_QUALF_ATT_CLS_CD"};
        		for(int j =0; j < startFields.length; j++){
        			collectionQuery +=  "("
        					+ wnsearch.getExqueryStr(startFields[j], "lte", queryAge.get("ageNum"))
        					+ wnsearch.getExqueryStr(endFields[j], "gte", queryAge.get("ageNum"))
        					+ wnsearch.getExqueryStr(cdFields[j], "contains", queryAge.get("attClsCd"))
        					+ ")"+(j<startFields.length-1?"|":"");
        		}
        		collectionQuery += "|"+wnsearch.getExqueryStr("QUALF_UNIT", "contains", "isNull");
        	}
        }else{
        	if (reQuery.equals("1")&&!reChk.equals("")) { //결과내재검색 포함
        		realQuery = "("+realQuery + ") " +" ("+reChk+")";
        	} else if (reQuery.equals("3")&&!reChk.equals("")) { //결과내재검색 제외키워드
        		realQuery = "("+realQuery + ") " +" !("+reChk+")";
        	} else { //그냥검색
        		realQuery = query;
        	}
        }
        
//        if("RANK".equals(sort)){
//        	if(collections.equals("RCV_FVR_SVC_POP")){
//        		sort = "RANK/DESC,VW_CNT";
//        	} else {
//        		sort = "EPRSS_RNK/ASC,RANK/DESC,VW_CNT";
//        	}
//        }
        
        if("RANK".equals(sort)){
        	sort = "RANK/DESC,VW_CNT";
        }
        
        for (int i = 0; i < collections.length; i++) {
        	String pageInfo = "";
        	pageInfo = startCount+","+listCount;
        	
        	if(collections[i].equals("RCV_FVR_SVC")){
        		exquery += wnsearch.getRcvfvrSvcExqueryStr(exquery, null, null, null, null, tccd);
        	}
        	wnsearch.setBasicWNSearch(query, collections[i], pageInfo, sort, sortOrder, searchField, startDate, endDate, strOperation, exquery, collectionQuery);
        };
        
        wnsearch.search(realQuery.replaceAll("&quot;", "\""), isRealTimeKeyword, WNCollection.CONNECTION_CLOSE, useSuggestedQuery);
        
        /**
         * 인기검색어 통계를 위한 엔티티 분석이 안된 쿼리 입력
         */
        WNSearch wnsearchPopword = new WNSearch(isDebug, false, new String[] {"RCV_FVR_SVC_POP"}, searchFields);
        wnsearchPopword.setSf1Vo(sf1Vo);
        wnsearchPopword.setBasicWNSearch(query, "RCV_FVR_SVC_POP", "", "RANK/DESC,VW_CNT", sortOrder, searchField, startDate, endDate, strOperation, exquery, collectionQuery);
        wnsearchPopword.search(query, isRealTimeKeyword, WNCollection.CONNECTION_CLOSE, useSuggestedQuery);
        
    	HttpSession session = request.getSession();
    	String usrNm = ""; //로그인한 유저이름
    	if (session.getAttribute(paramUser) != null) {
    		//세션에 있는 유저 정보 가져오기
    		Entity userInfo = (Entity)session.getAttribute(paramUser);
    		CommonLoggerFactory.APP_LOGGER.debug("[rcvfvrSvcSearch] session Info >>>> "+ userInfo.toString()+" >>>> "+userInfo.get("USER_NM").toString());
            usrNm = userInfo.get("USER_NM").toString();
    	}
        
        for(String col : collections){
        	totalCount += wnsearch.getResultTotalCount(col);
        }
        
        mav.addObject("showView",showView);
        mav.addObject("tccd",tccd);
        mav.addObject("sort",sort);
        mav.addObject("sortOrder",sortOrder);
        mav.addObject("usrNm",usrNm);
        
    	mav.addObject("query",query);
    	mav.addObject("realQuery",realQuery.replaceAll("\"", "&quot;"));
    	mav.addObject("startCount", startCount);
    	mav.addObject("totalCount", totalCount);
    	mav.addObject("result", wnsearch.getSearchResult(collection));
    	mav.addObject("pageLinks", wnsearch.getPageLinks(startCount, totalCount, listCount, 5));
    	mav.addObject("isDebugMsg", wnsearch.printDebug());
    	
    	mav.setViewName("portal/rcvfvrSvc/search/RcvfvrSvcTotalSearch");
        return mav;
    }
    
	/**
	 * 인기검색어 return
	 *
	 * @param request
	 * @param response
	 * @param searchVo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = { "/popword" }, produces = { MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8" })
	public String getPopword(@RequestParam(required = false) String collection,@RequestParam(required = false) String range ) throws Exception {
		String popwordJson = "";
		if(collection != null && range != null){
			popwordJson = rcvfvrSvcSearchService.getPopwordJsonString(collection, range);
		}else{
			popwordJson = rcvfvrSvcSearchService.getPopwordJsonString();
		}

		CommonLoggerFactory.APP_LOGGER.debug("[POPWORD](인기검색어) --> " + popwordJson);

		return popwordJson;
	}
    
    /**
     * 수혜서비스 포탈 서비스 찾기
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return 메인화면 jsp
     */
    @ResponseBody
	@RequestMapping(value = { "/relationKeyword" }, produces = { MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8" })
    public String rcvfvrSvcRelationKeyword(
    		@RequestParam(required = false, defaultValue = "_ALL_") String label,
    		@RequestParam(required = false) String datatype,
    		@RequestParam(required = false) String query
    		) throws Exception {
    	
    	String jsonStr = "";
    	jsonStr = rcvfvrSvcSearchService.getRecomendKeyword(label, datatype, query);
    	
    	//CommonLoggerFactory.APP_LOGGER.debug("[relationKeyword](연관검색어) --> " + jsonStr);
    	
    	return jsonStr;
    }
    
    
    /**
     * 수혜서비스 자동완성 (색인)
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return 메인화면 jsp
     */
    @ResponseBody
	@RequestMapping(value = { "/ark" }, produces = { MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8" })
    public String getArk(
    		@RequestParam(required = false) String query, 
    		@RequestParam(required = false) String convert,
    		@RequestParam(required = false) String target,
    		@RequestParam(required = false) String charset,
    		@RequestParam(required = false) String dataType
    		) throws Exception {
    	
    	String jsonStr = "";
    	jsonStr = rcvfvrSvcSearchService.getArkJsonString(query, convert, target, charset, dataType);
    	
    	CommonLoggerFactory.APP_LOGGER.debug("[Ark](자동완성) --> " + jsonStr);
    	
    	return jsonStr;
    }
    
    /**
     * 수혜서비스 자동완성 (DB)
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return 메인화면 jsp
     */
    @ResponseBody
	@RequestMapping(value = { "/arkSrv" }, produces = { MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8" })
    public String getArkSrv(
    		@RequestParam(required = false) String query, 
    		@RequestParam(required = false) String convert,
    		@RequestParam(required = false) String target,
    		@RequestParam(required = false) String charset,
    		@RequestParam(required = false) String dataType
    		) throws Exception {
    	
    	String jsonStr = "";
    	jsonStr = rcvfvrSvcSearchService.getArkSrvJsonString(query, convert, target, charset, dataType);
    	
    	CommonLoggerFactory.APP_LOGGER.debug("[Ark](자동완성) --> " + jsonStr);
    	
    	return jsonStr;
    }
    
}
