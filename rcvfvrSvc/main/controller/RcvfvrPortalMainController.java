package kr.go.portal.rcvfvrSvc.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lg.g4c.capp.lib.entity.Entity;

import kr.go.common.stereotype.PortalController;
import kr.go.portal.common.util.RequestUtil;
import kr.go.portal.loginhst.service.LoginHstService;
import kr.go.portal.loginhst.vo.LoginHstVo;
import kr.go.portal.rcvfvrSvc.common.util.SessionInfoUtil;
import kr.go.portal.rcvfvrSvc.mySvc.service.MySvcService;
import kr.go.portal.rcvfvrSvc.mySvc.vo.MySvcVo;
import kr.go.portal.rcvfvrSvc.useguidance.controller.UseguidanceController;
/**
 * 보조금24포털 메인 Controller
 *
 * @since 2020. 08. 24. 오후 3:10:33
 * @version 1.0
 */
@PortalController
@RequestMapping("/portal/rcvfvrSvc")
public class RcvfvrPortalMainController {
	static final Logger Logger = LoggerFactory.getLogger(RcvfvrPortalMainController.class);
	
    /**
     * 유저 파라미터 명
     */
    @Value("#{globalsProperties['com.lg.g4c.capp.lib.servlet.param.user']}")
    private String paramUser;

    /**
     * 로그인 이력 Service
     */
    @Autowired
    private LoginHstService loginHstService;

    /**
     * 맞춤혜택 Service
     */
	@Autowired
	private MySvcService mySvcService;

	@Autowired
	private SessionInfoUtil sessionInfoUtil;

    /**
     * 보조금24 포탈 메인
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return 메인화면 jsp
     */
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

    	// 로그인 상태인 경우, 메인화면의 서비스 건수 조회
    	HttpSession session = request.getSession();
    	
    	String usrId = "";
    	String loginType = "";
    	
    	//로그인시 이벤트 화면으로 이동
    	if (session.getAttribute(paramUser) != null) {

    		//세션에 있는 유저 정보 가져오기
    		Entity userInfo = (Entity)session.getAttribute(paramUser);

            usrId = userInfo.get("USER_ID").toString();
            loginType = userInfo.get("LOGIN_TYPE").toString();

	    	LoginHstVo loginHst = null;
        	loginHst = loginHstService.selectLastLoginHst(new LoginHstVo(usrId));

        	if(loginHst != null){
        		userInfo.put("connDtime", loginHst.getConnDtime());
        	}
	        // 2020 개편메인 추가 - 최근접속일자 조회
	        model.addAttribute("loginHstVo", loginHst);

	        MySvcVo mySvcVo = new MySvcVo();
	        mySvcVo.setUserId(usrId);

	        MySvcVo rMySvcVo = mySvcService.getAgreYn(mySvcVo);

	        String agreeSttusCd = rMySvcVo != null ? rMySvcVo.getAgreeSttusCd() : "01";

	        userInfo.setValue("AGREE_STTUS_CD", agreeSttusCd);
	        session.setAttribute("paramUser", userInfo);

	    	MySvcVo uVo = new MySvcVo();
	    	String svcYn = "N";
	    	
	    	if("02".equals(agreeSttusCd) || "03".equals(agreeSttusCd)){
	    		// 사용자 정보 조회
				uVo = mySvcService.getUserInfo(usrId);
				if(uVo != null) {
					uVo.setAgreeConfmDt(rMySvcVo.getAgreeConfmDt());
			    	model.addAttribute("rView", mySvcService.getRcvfvrSvcRsltVw1(uVo));
			    	if(!"".equals(uVo.getCvplRequstGuidanceNo()) && uVo.getCvplRequstGuidanceNo() != null){
			    		svcYn = "Y";
			    	}
			    	
					if(uVo.getCvplRequstDh() != null ){
						Long agreConfrmDt = Long.parseLong(rMySvcVo.getAgreeConfmDt());
						Long cvplRequstDh = Long.parseLong(uVo.getCvplRequstDh());			        
						if (agreConfrmDt > cvplRequstDh) {
							uVo.setUpdatePsbYn("Y");
						}
					}
				}
				model.addAttribute("svcYn", svcYn);
	    	}else{
	    		uVo.setCpttrNm(userInfo.get("USER_NM").toString());

	    	}
	    	model.addAttribute("uVo", uVo);
    	}
    	
    	//장애 알림
    	String result = "";
    	result = mySvcService.selectLnkSttus("ZZ2901");
    	JSONParser jsonParser = new JSONParser();
    	Object obj = jsonParser.parse(result);
    	JSONObject jsonObj = (JSONObject) obj;
    	
    	String lnkResult = (String) jsonObj.get("result");
    	if("Y".equals(lnkResult)){
        	model.addAttribute("sysTroblManage", (String) jsonObj.get("troblGuidanceCts"));
    	}
    	
    	//**** 20210423 추가 시작*****
    	String remoteIp = RequestUtil.getUserIp(request);
    	Logger.debug("*********remoteIp:" + remoteIp);
    	
    	MySvcVo mySvcVo = new MySvcVo();
        mySvcVo.setUserId(usrId);
        mySvcVo.setPgUrl("/portal/rcvfvrSvc/main");
        mySvcVo.setRemoteIp(remoteIp);
        
        Logger.debug("*********loginType:" + loginType);        
        mySvcVo.setLoginClsNm(loginType);
        
        mySvcService.insertUrl(mySvcVo); //보조금24 화면 접속 이력 등록
        //**** 20210423 추가 끝*****
        
        return "portal/rcvfvrSvc/main";
    }

    /**
     * 보조금24 redirect
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return 메인화면 jsp
     */
    @RequestMapping(value = "/redirect", method = RequestMethod.GET)
    public String redirect(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "portal/rcvfvrSvc/redirect";
    }

}
