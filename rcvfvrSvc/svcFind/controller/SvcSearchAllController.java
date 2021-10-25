package kr.go.portal.rcvfvrSvc.svcFind.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.opensns.search.common.CommonLogFactory;
import kr.go.common.log.CommonLoggerFactory;
import kr.go.common.stereotype.PortalController;
import kr.go.portal.rcvfvrSvc.common.util.SessionInfoUtil;
import kr.go.portal.rcvfvrSvc.search.service.RcvfvrSvcSearchService;
import kr.go.portal.rcvfvrSvc.search.service.common.WNCollection;
import kr.go.portal.rcvfvrSvc.search.service.common.WNSearch;
import kr.go.portal.rcvfvrSvc.search.service.common.WNUtils;
import kr.go.portal.search.vo.Sf1Vo;

/** 맞춤형수혜서비스 서비스 전체보기
 * @author NS-SG-03
 * @since 2020. 10. 19.
 * @version 1.0
 */


@PortalController
@RequestMapping("/portal/rcvfvrSvc/svcFind")
public class SvcSearchAllController {

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
    private int searchPort = 7002 ;

    @Autowired
	private RcvfvrSvcSearchService rcvfvrSvcSearchService;

	@Autowired
	private SessionInfoUtil sessionInfoUtil;

	/**
     * 서비스 전체보기
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return jsp
     */
    @RequestMapping(value = {"/svcSearchAll"})
    public ModelAndView selectSvcSearchAll(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, Model model) throws Exception {

    	//실시간 검색어 화면 출력 여부 체크
        boolean isRealTimeKeyword = false;
        //오타 후 추천 검색어 화면 출력 여부 체크
        boolean useSuggestedQuery = true;
        //디버깅 보기 설정
        boolean isDebug = false;
        boolean isTextAnaly = true;

    	int listCount = WNUtils.parseInt(WNUtils.getCheckReqXSS(request, "listCount", "20"), 20);	//시작 번호
        int startCount = WNUtils.parseInt(WNUtils.getCheckReqXSS(request, "startCount", "0"), 0);	//시작 번호
        String query = WNUtils.getCheckReqXSS(request, "query", "");						//검색어
        String collection = WNUtils.getCheckReqXSS(request, "collection", "ALL");	//컬렉션이름
        String rt = WNUtils.getCheckReqXSS(request, "rt", "");								//결과내 재검색 체크필드
        String rt2 = WNUtils.getCheckReqXSS(request, "rt2", "");							//결과내 재검색 체크필드
    	String reQuery = WNUtils.getCheckReqXSS(request, "reQuery", "");					//결과내 재검색 체크필드
    	String reChk = WNUtils.getCheckReqXSS(request, "reChk", "");						//결과내 재검색 내용
        String realQuery = WNUtils.getCheckReqXSS(request, "realQuery", "");				//실제 검색엔진에 들어가는 쿼리
        String sort = WNUtils.getCheckReqXSS(request, "sort", "RANK");						//정렬필드
        String sortOrder = WNUtils.getCheckReqXSS(request, "sortOrder", "DESC");						//정렬필드
        String range = WNUtils.getCheckReqXSS(request, "range", "A");						//기간관련필드
        String startDate = WNUtils.getCheckReqXSS(request, "startDate", "1970.01.01");		//시작날짜
        String endDate = WNUtils.getCheckReqXSS(request, "endDate", WNUtils.getCurrentDate());		//끝날짜
    	String tccd = WNUtils.getCheckReqXSS(request, "tccd", "ALL");							//현금/현물/서비스 구분
    	String searchField = WNUtils.getCheckReqXSS(request, "searchField", "ALL");			//검색필드
    	String showView = WNUtils.getCheckReqXSS(request, "showView", "tab1");				//리스트형으로 보기, 카드형으로 보기
    	String collectionQuery  = "" ;												//collecion query 필드
    	String strOperation  = "" ;												//operation 조건 필드
        String exquery = "" ;													//exquery 조건 필드
        int totalCount = 0;
        
        //서비스분야별
        String[] checkFinc = (request.getParameterValues("checkFinc") != null ? request.getParameterValues("checkFinc") : new String[] {}) ;
        //생애주기별 연령
        String[] checkAge = (request.getParameterValues("checkAge") != null ? request.getParameterValues("checkAge") : new String[] {}) ;
        //소득기준별
        String[] checkIncomeInfo = (request.getParameterValues("checkIncomeInfo") != null ? request.getParameterValues("checkIncomeInfo") : new String[] {}) ;
        //서비스 대상
        String[] checkTarget = (request.getParameterValues("checkTarget") != null ? request.getParameterValues("checkTarget") : new String[] {}) ;

        String[] searchFields = null;
        String[] collections = new String[] {"RCV_FVR_SVC"};

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
        		textAnalyEntity = rcvfvrSvcSearchService.getTextAnalyzerEntity(reChk );
        		CommonLoggerFactory.APP_LOGGER.debug("[textAnalyzer-v2.0] [의미기반검색 분석된 엔티티 결과] ----> "+textAnalyEntity);
        	}catch(NullPointerException e){
        		CommonLogFactory.ERR_LOGGER.debug("[error] 질의형 검색엔진 동작안함 :: "+e);
        	}
        	
        	if(!reChk.equals("")){
        		if (reQuery.equals("1")) { //결과내재검색 포함
        			realQuery = "("+realQuery +") " +" (("+reChk+") "+textAnalyEntity+")";
        		} else if (reQuery.equals("3")) { //결과내재검색 제외키워드
        			realQuery = "("+realQuery +") " +" !(("+reChk+") "+textAnalyEntity+")";
        		} else{ //그냥검색
        			realQuery = "("+query+")"+" ("+reChk+") "+textAnalyEntity;
        		}
        	}
        	
        	//수치관련 자격정보(정규식)
        	HashMap<String,String> queryAge = new HashMap<>(); 
        	queryAge = rcvfvrSvcSearchService.queryCheckAgeRegExr(realQuery); 
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
        	if(!reChk.equals("")){
        		if (reQuery.equals("1")) { //결과내재검색 포함
        			realQuery = "("+realQuery +") " +" (("+reChk+"))";
        		} else if (reQuery.equals("3")) { //결과내재검색 제외키워드
        			realQuery = "("+realQuery +") " +" !(("+reChk+"))";
        		} else{ //그냥검색
        			realQuery = "("+query+")"+" ("+reChk+") ";
        		}
        	}
        }

        if("RANK".equals(sort)){
        	if(!realQuery.equals("") && !realQuery.equals(null)){
        		sort = "RANK/DESC,VW_CNT";
        	} else {
        		sort = "EPRSS_RNK/ASC,RANK/DESC,VW_CNT";
        	}
        }
        for (int i = 0; i < collections.length; i++) {
        	String pageInfo = "";
        	pageInfo = startCount+","+listCount;

        	if(collections[i].equals("RCV_FVR_SVC")){
        		exquery += wnsearch.getRcvfvrSvcExqueryStr(exquery, checkFinc, checkAge, checkIncomeInfo, checkTarget, tccd);
        	}
        	wnsearch.setBasicWNSearch(query, collections[i], pageInfo, sort, sortOrder, searchField, startDate, endDate, strOperation, exquery, collectionQuery);
        };

        wnsearch.search(realQuery, isRealTimeKeyword, WNCollection.CONNECTION_CLOSE, useSuggestedQuery);

        for(String col : collections){
        	totalCount += wnsearch.getResultTotalCount(col);
        }

        mav.addObject("showView",showView);
        mav.addObject("tccd",tccd);
        mav.addObject("sort",sort);
        mav.addObject("sortOrder",sortOrder);
        mav.addObject("checkFinc",new ArrayList<String>(Arrays.asList(checkFinc)));
        mav.addObject("checkAge",new ArrayList<String>(Arrays.asList(checkAge)));
        mav.addObject("checkIncomeInfo",new ArrayList<String>(Arrays.asList(checkIncomeInfo)));
        mav.addObject("checkTarget",new ArrayList<String>(Arrays.asList(checkTarget)));

    	mav.addObject("query",query);
    	mav.addObject("realQuery",realQuery.replaceAll("\"", "&quot;"));
    	mav.addObject("startCount", startCount);
    	mav.addObject("totalCount", totalCount);
    	mav.addObject("result", wnsearch.getSearchResult("ALL"));
    	mav.addObject("pageLinks", wnsearch.getPageLinks(startCount, totalCount, listCount, 5));
    	mav.addObject("isDebugMsg", wnsearch.printDebug());

    	mav.setViewName("portal/rcvfvrSvc/svcFind/svcSearchAll");
    	model.addAttribute("searchWord", reChk);
    	
        return mav;
	}
}

