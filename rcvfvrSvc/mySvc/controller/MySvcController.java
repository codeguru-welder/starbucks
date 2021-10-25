package kr.go.portal.rcvfvrSvc.mySvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lg.g4c.capp.lib.entity.Entity;

import kr.go.common.stereotype.PortalController;
import kr.go.portal.common.util.RequestUtil;
import kr.go.portal.rcvfvrSvc.lnkSvc.service.RcvfvrGuidanceMainService;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.RcvfvrGuidanceCvplRequstVo;
import kr.go.portal.rcvfvrSvc.mySvc.service.MySvcService;
import kr.go.portal.rcvfvrSvc.mySvc.vo.MySvcVo;

@PortalController
@RequestMapping("/portal/rcvfvrSvc/mySvc")
public class MySvcController {

	static final Logger Logger = LoggerFactory.getLogger(MySvcController.class);

	/**
	 * 유저 파라미터 명
	 */
	@Value("#{globalsProperties['com.lg.g4c.capp.lib.servlet.param.user']}")
	private String paramUser;

	@Autowired
	private MySvcService mySvcService;

	@Autowired
	private RcvfvrGuidanceMainService lnkSvc;
	
	/**
     * 나의 수혜서비스
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return jsp
     */
    @RequestMapping(value = {"/myRcvfvrsvc"}, method = RequestMethod.GET)
    public String getInfouseagreSttus(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

    	MySvcVo iVo = new MySvcVo();
    	MySvcVo aVo = new MySvcVo();
    	MySvcVo uVo = new MySvcVo();

    	HttpSession session = request.getSession();
    	String usrId = "";
    	String loginType = "";
    	//로그인시 이벤트 화면으로 이동
    	if (session.getAttribute(paramUser) != null) {

    		//세션에 있는 유저 정보 가져오기
    		Entity userInfo = (Entity)session.getAttribute(paramUser);
    		usrId = userInfo.get("USER_ID").toString();
    		loginType = userInfo.get("LOGIN_TYPE").toString();
    		iVo.setUserId(usrId);
    		
    		session.setAttribute("paramUser", userInfo);

    	}else{ // 로그인 안했으면 로그인화면으로
			model.addAttribute("redirect", "loginMyReqststtus");
    		return "portal/rcvfvrSvc/redirect";
    	}

    	// 사용자 동의정보 조회
    	aVo = mySvcService.getAgreYn(iVo);
    	
    	//미동의시 동의 필요 alert
    	if("01".equals(aVo.getAgreeSttusCd())){
    		model.addAttribute("redirect", "agreeSttusCdErr");
    		return "portal/rcvfvrSvc/redirect";
    	}

    	// 사용자 정보 조회
		uVo = mySvcService.getUserInfo(usrId);
		
		List<MySvcVo> rData = null;
    	MySvcVo rViewVo = new MySvcVo(); 

        String svcYn = "N";
        
		if(uVo != null){
			uVo.setAgreeConfmDt(aVo.getAgreeConfmDt());
			if(!"".equals(uVo.getCvplRequstGuidanceNo()) && uVo.getCvplRequstGuidanceNo() != null){
				rData = mySvcService.getRcvfvrSvcRsltVw2(uVo);
				rViewVo = mySvcService.getRcvfvrSvcRsltVw1(uVo);
				//장애 안내
	    		model.addAttribute("errList", mySvcService.selectErrList(uVo.getCvplRequstGuidanceNo()));    				
				svcYn = "Y";
			}

			if(uVo.getCvplRequstDh() != null && aVo.getAgreeConfmDt() != null){
				Long agreConfrmDt = Long.parseLong(aVo.getAgreeConfmDt());
				Long cvplRequstDh = Long.parseLong(uVo.getCvplRequstDh());      
				if (agreConfrmDt > cvplRequstDh) {
					uVo.setUpdatePsbYn("Y");
				}
			}
		}
		model.addAttribute("svcYn", svcYn);
		
    	model.addAttribute("iVo", uVo);
    	model.addAttribute("rView", rViewVo);
    	model.addAttribute("rData", rData);
    	
    	String remoteIp = RequestUtil.getUserIp(request);
    	
    	MySvcVo mySvcVo = new MySvcVo();
        mySvcVo.setUserId(usrId);
        mySvcVo.setPgUrl("/portal/rcvfvrSvc/mySvc/myRcvfvrsvc");
        mySvcVo.setRemoteIp(remoteIp);
        mySvcVo.setLoginClsNm(loginType);
        mySvcService.insertUrl(mySvcVo); //보조금24 화면 접속 이력 등록
        
        model.addAttribute("remote", mySvcService.selectRemoteMaxCnt(mySvcVo)); //접속제어 최대 건수 조회        
    	    	
        return "portal/rcvfvrSvc/mySvc/myRcvfvrsvc";
    }

	/**
	 * 수혜서비스 조회
     * @return HashMap
     */
	@ResponseBody
	@RequestMapping("/getRrcvfvrsvcVw.do")
    public String getRrcvfvrsvcVw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String result = "";

    	// 로그인 체크
    	if (session.getAttribute(paramUser) != null) {

    		//세션에 있는 유저 정보 가져오기
    		Entity userInfo = (Entity)session.getAttribute(paramUser);
    		
    		//모바일 여부 체크
    		String mobileYn = "";
    		if("mobile".equals(request.getParameter("deviceType"))){
    			mobileYn = "Y";
    		}
    		
    		MySvcVo svcVo = new MySvcVo();
    		svcVo = mySvcService.getUserInfo(userInfo.get("USER_ID").toString());
    		String chkDate = "Y";
    		
    		if(svcVo != null && svcVo.getCvplRequstDh() != null){
    			MySvcVo rMySvcVo = new MySvcVo();
    	        rMySvcVo.setUserId(userInfo.get("USER_ID").toString());
    	        rMySvcVo = mySvcService.getAgreYn(rMySvcVo);
    	        
    	        if(rMySvcVo.getAgreeConfmDt() != null){
    	        	Long agreConfrmDt = Long.parseLong(rMySvcVo.getAgreeConfmDt());
	    	        Long cvplRequstDh = Long.parseLong(svcVo.getCvplRequstDh());

	        		if(agreConfrmDt > cvplRequstDh){
	    	          chkDate = "N";
	    	        }
    	        }
    		}
    		
    		if(svcVo != null && "N".equals(svcVo.getUpdatePsbYn()) && "Y".equals(chkDate)){
    	        result = "cntErr";    	    
    		}else{
    			// 0. 사용자 정보 업데이트
    			mySvcService.setCpttrInfo(userInfo);

    			RcvfvrGuidanceCvplRequstVo rVo = new RcvfvrGuidanceCvplRequstVo();

    			// 1. 민원 요청 정보 등록
    			rVo.setCpttrId(userInfo.get("USER_ID").toString());
    			String cvplRequstGuidanceNo = mySvcService.setRcvfvrGuidanceCvplRequst(userInfo.get("USER_ID").toString(), mobileYn);
    			rVo.setCvplRequstGuidanceNo(cvplRequstGuidanceNo);

    			// 2. 연계 호출
    			result = lnkSvc.procLnk(rVo);
    		}    		
    		
    	} else {
    		result = "SESSION";
    	}

		return result;
	}

	/**
	 * 맞춤서비스 동의 취소
     * @return String
     */
	@ResponseBody
	@RequestMapping("/setFixessvcAgreCancl.do")
    public String setFixessvcAgreCancl(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String result = "FAIL";
		HttpSession session = request.getSession();
		//세션에 있는 유저 정보 가져오기
		Entity userInfo = (Entity)session.getAttribute(paramUser);
		
    	//로그인시 이벤트 화면으로 이동
    	if (session.getAttribute(paramUser) != null) {
    		result = mySvcService.setFixessvcAgreCancl(userInfo.get("USER_ID").toString());

    	}else{ // 로그인 안했으면 로그인화면으로
    		return "SESSION"; // 수혜서비스 -> 로그인
    	}
    	
    	// 2021.04.13 추가
    	// 1.정상적으로 동의 취소 처리시 세션값 맞춤혜택서비스이용동의 PRSC_YN = "N" 세팅
    	// 2.14세미만 자녀정보 활용 동의시 세션값 AGREE_STTUS_CD = "01" 세팅
    	if("SUCCESS".equals(result)){
    		userInfo.setValue("PRSC_YN", "N");
			userInfo.setValue("AGREE_STTUS_CD", "01");
        }

		return result;

	}

	/**
	 * 맞춤서비스 동의
     * @return String
     */
	@ResponseBody
	@RequestMapping("/setFixessvcAgre.do")
    public String setFixessvcAgre(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String result = "FAIL";
		HttpSession session = request.getSession();
		//세션에 있는 유저 정보 가져오기
		Entity userInfo = (Entity)session.getAttribute(paramUser);

    	//로그인시 이벤트 화면으로 이동
    	if (session.getAttribute(paramUser) != null) {

    		result = mySvcService.setFixessvcAgre(userInfo, request.getParameter("agreeSttusCd"));

    	}else{ // 로그인 안했으면 로그인화면으로
    		return "SESSION";
    	}
    	
    	// 2021.04.13 추가
    	// 1.정상적으로 동의 처리시 세션값 맞춤혜택서비스이용동의 PRSC_YN = "Y" 세팅
    	// 2.14세미만 자녀정보 활용 동의시 세션값 AGREE_STTUS_CD = "02","03" 세팅
    	if("SUCCESS".equals(result)){
    		userInfo.setValue("PRSC_YN", "Y");
    		
    		if("Y".equals(request.getParameter("agreeSttusCd"))){
    			userInfo.setValue("AGREE_STTUS_CD", "02");
        		
            }else if("N".equals(request.getParameter("agreeSttusCd"))){
            	userInfo.setValue("AGREE_STTUS_CD", "03");
            }
        }

		return result;
	}

	/**
	 * 세션체크
     * @return String
     */
	@ResponseBody
	@RequestMapping("/checkSession.do")
    public String checkSession(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

    	// 세션 체크
    	if (session.getAttribute(paramUser) != null) {
    		return "TRUE";
    	}else{
    		return "FALSE";
    	}
	}
	
	/**
	 * 연계상태조회 json
     * @return HashMap
     */
	@ResponseBody
	@RequestMapping(value="/selectLnkSttus.do", produces ="application/text; charset=UTF-8")
    public String selectLnkSttus(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		String result = "";
		
    	// 로그인 체크
    	if (session.getAttribute(paramUser) != null) {
    		result = mySvcService.selectLnkSttus("ZZ2902");
    		
    	} else {
    		result = "FAIL";
    	}

		return result;
	}

}
