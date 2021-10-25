/*==============================================================================
 * 파일명 : $URL$
 * 파일용도 : 대한민국 정부포털 메인 Controller
 * 마지막변경일자 : $Date$
 * 마지막변경자 : $Author$
 * 최종버전 : $Revision$
 * 변경이력
 *------------------------------------------------------------------------------
 *   DATE       AUTHOR                      DESCRIPTION;
 * -----------  ------  --------------------------------------------------------
 * 2015.10.12   최오림       최초 생성
 * 2016.11.08   최오림       @PortalController 및 통합포털 주소 체계 적용
 *------------------------------------------------------------------------------
=================================================================================*/

package kr.go.portal.rcvfvrSvc.rcvfvrSvc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lg.g4c.capp.lib.entity.Entity;

import kr.go.common.stereotype.PortalController;
import kr.go.portal.rcvfvrSvc.common.util.SessionInfoUtil;
import kr.go.portal.rcvfvrSvc.rcvfvrSvc.service.RcvfvrSvcService;
import kr.go.portal.rcvfvrSvc.rcvfvrSvc.vo.RcvfvrSvcVo;
/**
 * 수혜서비스 Controller
 *
 * @since 2015. 10. 12. 오후 3:10:33
 * @version 1.0
 */
@PortalController
@RequestMapping("/portal/rcvfvrSvc")
public class RcvfvrSvcController {

    /**
     * 유저 파라미터 명
     */
    @Value("#{globalsProperties['com.lg.g4c.capp.lib.servlet.param.user']}")
    private String paramUser;

	@Autowired
	private RcvfvrSvcService service;

	@Autowired
	private SessionInfoUtil sessionInfoUtil;

    /**
     * 수혜서비스 상세 보기
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return 메인화면 jsp
     */
    @RequestMapping(value = {"/dtlEx/{index}"}, method = RequestMethod.GET)
    public String getRcvfvrSvc(@PathVariable String index, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

    	HttpSession session = request.getSession();

    	String frameType = "1";
    	RcvfvrSvcVo vo = new RcvfvrSvcVo();
    	vo.setSvcId(index);
    	
    	RcvfvrSvcVo sVo = service.getRcvfvrSvc(vo);

    	model.addAttribute("sVo", sVo);
    	//수기 등록 법령
    	model.addAttribute("memorRegLsInfo", service.selectMemorRegLsInfo(vo));
    	//행정규칙
    	model.addAttribute("admrulInfo", service.selectAdmrulInfo(vo));
    	//자치법규
    	model.addAttribute("amllInfo", service.selectAmllInfo(vo));
    	//법령
    	model.addAttribute("lsInfo", service.selectLsInfo(vo));

    	RcvfvrSvcVo fVo = service.getFrmeSet(vo);
    	if(fVo != null) {
    		model.addAttribute("fVo", fVo);
    		if("HA0102".equals(fVo.getFrmeCls())){
    			frameType = "2";
    		}else if("HA0103".equals(fVo.getFrmeCls())){
    			frameType = "3";
    		}
    	}
    	
    	//TN_SVC_VW_CNT 서비스 상세 조회수 인서트
    	service.selectVwCnt(index);
    	
    	if(sVo.getOnlnReqstSiteUrl() != null && !("").equals(sVo.getOnlnReqstSiteUrl())){
    		String url = sVo.getOnlnReqstSiteUrl();
    		url = url.replaceAll("(\r\n|\r|\n|\n\r)", ",nbsp;");
    		url = url.replaceAll(", ", ",nbsp;");
    		model.addAttribute("url", url);
    	}
    	
    	//문의처 리스트
    	model.addAttribute("refrncList", service.selectSvcRefrncList(vo));	
    	model.addAttribute("btnEprss", request.getParameter("btnEprss"));

    	return "portal/rcvfvrSvc/rcvfvrSvc/rcvfvrSvcType0"+frameType;
    }

    /**
     * 추천혜택 상세 보기
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return 추천혜택 상세 jsp
     */
    @RequestMapping(value = {"/recomendBnef/{index}"}, method = RequestMethod.GET)
    public String getRecomendBnefDtl(@PathVariable String index, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {    
    	   	
    	return "portal/rcvfvrSvc/rcvfvrSvc/recomendBnef0"+ index;    	
    }
    
    /**
     * 추천혜택 목록 보기
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return 추천혜택 목록 jsp
     */
    @RequestMapping(value = {"/recomendBnef"})
    public String getRecomendBnef(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	    	
    	return "portal/rcvfvrSvc/rcvfvrSvc/recomendBnefList";    	
    }
    
    /**
     * 만족도 평가 INSERT
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
	@ResponseBody
	@RequestMapping(value="/rcvfvrSvcStsfdgEvl", method = RequestMethod.POST)
    public Map<String, String> insertRcvfvrSvcStsfdgEvl(RcvfvrSvcVo rcvfvrSvcVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Map<String, String> result = new HashMap<String, String>();

		int cnt = service.selectRcvfvrSvcStsfdgEvl(rcvfvrSvcVo);
				
    	// 로그인 체크
    	if (session.getAttribute(paramUser) != null) {

    		if(cnt > 0){
    			result.put("result","CHKFALSE");
    		}else{
    			service.insertRcvfvrSvcStsfdgEvl(rcvfvrSvcVo);
    			result.put("result","SUCC");
    		}
    		
    	} else {
    		result.put("result","FAIL");
    	}
    	
		return result;
		
	}
	
	/**
     * 만족도 평가 update
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
	@ResponseBody
	@RequestMapping(value="/updateEventStsfdgEvl", method = RequestMethod.POST)
    public Map<String, String> updateEventStsfdgEvl(RcvfvrSvcVo rcvfvrSvcVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Map<String, String> result = new HashMap<String, String>();

		int cnt = service.selectRcvfvrSvcStsfdgEvl(rcvfvrSvcVo);
		
    	// 로그인 체크
    	if (session.getAttribute(paramUser) != null) {
    		
    		//참여 여부 check
    		if(cnt > 0){
    			service.updateEventStsfdgEvl(rcvfvrSvcVo);
    			result.put("result","SUCC");
    		}else{    			
    			result.put("result","CHKFALSE");
    		}
    		
    	} else {
    		result.put("result","FAIL");
    	}
    	
		return result;
	}
    
}
