package kr.go.portal.rcvfvrSvc.svcFind.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.page.Page;
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
import kr.go.portal.rcvfvrSvc.common.util.SessionInfoUtil;
import kr.go.portal.rcvfvrSvc.svcFind.service.SimpleFindService;
import kr.go.portal.rcvfvrSvc.svcFind.vo.SimpleFindVo;

/**
 * @author NS-SG-03
 * @since 2020. 9. 2.
 * @version 1.0
 */

@PortalController
@RequestMapping("/portal/rcvfvrSvc/svcFind")
public class SimpleFindController {

	static final Logger Logger = LoggerFactory.getLogger(SimpleFindController.class);

	@Autowired
	private SimpleFindService simpleFindService;

	@Autowired
	private SessionInfoUtil sessionInfoUtil;

	/**
	 * 유저 파라미터 명
	 */
	@Value("#{globalsProperties['com.lg.g4c.capp.lib.servlet.param.user']}")
	private String paramUser;
	
	
	/**
     * 간편찾기
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return jsp
     */
    @RequestMapping(value = {"/simpleFindStepOne"})
    public String selectSimpleFindStepOne(SimpleFindVo simpleFindVo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

    	model.addAttribute("simpleFindVo", simpleFindVo);
        return "portal/rcvfvrSvc/svcFind/simpleFindStepOne";
    }

    /**
     * 간편찾기 2단계
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return jsp
     */
    @RequestMapping(value = {"/simpleFindStepTwo"})
    public String selectSimpleFindStepTwo(SimpleFindVo simpleFindVo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	String returnTxt = "";
    	
    	if((simpleFindVo.getGender() != null && simpleFindVo.getGender() != "") && (simpleFindVo.getAge() != null && simpleFindVo.getAge() != "")){
    		simpleFindVo.setGender(simpleFindVo.getGender().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
    		simpleFindVo.setAge(simpleFindVo.getAge().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
    		
	    	model.addAttribute("simpleFindVo", simpleFindVo);	
	    	returnTxt = "portal/rcvfvrSvc/svcFind/simpleFindStepTwo";
	    	
    	}else{
    		model.addAttribute("redirect", "simpleFindResult");
    		returnTxt = "portal/rcvfvrSvc/redirect";
    	}
    	return returnTxt;
    }

    /**
     * 간편찾기 3단계
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return jsp
     */
    @RequestMapping(value = {"/simpleFindStepThree"})
    public String selectSimpleFindStepThree(SimpleFindVo simpleFindVo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

    	String returnTxt = "";
    	
    	if(simpleFindVo.getHshldChartr() != null && simpleFindVo.getHshldChartr() != ""){
    		simpleFindVo.setGender(simpleFindVo.getGender().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
    		simpleFindVo.setAge(simpleFindVo.getAge().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
    		simpleFindVo.setHshldChartr(simpleFindVo.getHshldChartr().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
    		
	    	model.addAttribute("simpleFindVo", simpleFindVo);	    	
    		returnTxt = "portal/rcvfvrSvc/svcFind/simpleFindStepThree";
    		
    	}else{
    		model.addAttribute("redirect", "simpleFindResult");
    		returnTxt = "portal/rcvfvrSvc/redirect";
    	}
    	
    	return returnTxt;
    }

    /**
     * 간편찾기 4단계
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return jsp
     */
    @RequestMapping(value = {"/simpleFindStepFour"})
    public String selectSimpleFindStepFour(SimpleFindVo simpleFindVo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

    	String returnTxt = "";
    	if(simpleFindVo.getJob() != null && simpleFindVo.getJob() != ""){
    		simpleFindVo.setGender(simpleFindVo.getGender().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
    		simpleFindVo.setAge(simpleFindVo.getAge().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
    		simpleFindVo.setHshldChartr(simpleFindVo.getHshldChartr().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
    		simpleFindVo.setJob(simpleFindVo.getJob().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
    		
	    	model.addAttribute("simpleFindVo", simpleFindVo);	    	
    		returnTxt = "portal/rcvfvrSvc/svcFind/simpleFindStepFour";
    		
    	}else{
    		model.addAttribute("redirect", "simpleFindResult");
    		returnTxt = "portal/rcvfvrSvc/redirect";
    	}
    	
    	return returnTxt;
    }

    /**
     * 간편찾기 결과
     *
     * @param model {@link Model}
     * @param request {@link HttpServletRequest}
     * @return jsp
     */
    @RequestMapping(value = {"/simpleFindResult"} , method = RequestMethod.GET)
    public String selectSimpleFindResult(SimpleFindVo simpleFindVo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

    	if(simpleFindVo.getAge() == null || simpleFindVo.getGender() == null || simpleFindVo.getHshldChartr() == null || simpleFindVo.getJob() == null || simpleFindVo.getIncomeInfo() == null){
    		model.addAttribute("redirect", "simpleFindResult");
    		return "portal/rcvfvrSvc/redirect";
    	}
    	
    	Page<SimpleFindVo> pageData = null;

    	if(simpleFindVo.getHshldChartr() != null && !"".equals(simpleFindVo.getHshldChartr())){
    		simpleFindVo.setHshldChartrArray(simpleFindVo.getHshldChartr().split(","));
    	}
    	if(simpleFindVo.getJob() != null && !"".equals(simpleFindVo.getJob())){
    		simpleFindVo.setJobArray(simpleFindVo.getJob().split(","));
    	}
    	if(simpleFindVo.getIncomeInfo() != null && !"".equals(simpleFindVo.getIncomeInfo())){
    		simpleFindVo.setIncomeInfoArray(simpleFindVo.getIncomeInfo().split(","));
    	}
    	
    	//페이징 설정
    	simpleFindVo.setPageIndex(simpleFindVo.getPageIndex() == 0 ? 1: simpleFindVo.getPageIndex());
    	simpleFindVo.setPageSize(20);
		simpleFindVo.setPageUnit(5);

		pageData = simpleFindService.selectSimpleFindList(simpleFindVo);
		
    	model.addAttribute("simpleFindList", pageData);
    	model.addAttribute("simpleFindVo", simpleFindVo);

        return "portal/rcvfvrSvc/svcFind/simpleFindResult";
    }
    
    /**
     * 간편찾기 결과 이력 추가
     * @param simpleFindVo
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/insertBnerVwChoiceLog")
    @ResponseBody
    public String insertBnerVwChoiceLog(SimpleFindVo simpleFindVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	simpleFindVo.setUserId("");
		
		HttpSession session = request.getSession();
		if (session.getAttribute(paramUser) != null) {
    		Entity userInfo = (Entity)session.getAttribute(paramUser);
			simpleFindVo.setUserId(userInfo.get("USER_ID").toString());
		}
		String result = simpleFindService.insertSimpleFindResult(simpleFindVo);
		
		return result;
    }
}
