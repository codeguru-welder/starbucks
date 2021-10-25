/**
 *
 */
package kr.go.portal.rcvfvrSvc.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lg.g4c.capp.lib.entity.Entity;

import kr.go.portal.loginhst.service.LoginHstService;
import kr.go.portal.loginhst.vo.LoginHstVo;
import kr.go.portal.rcvfvrSvc.mySvc.service.MySvcService;
import kr.go.portal.rcvfvrSvc.mySvc.vo.MySvcVo;


/**
 * @author jjh
 * 2020. 6. 26. 오후 1:51:54
 * mospa.sd1.common.util.ComUtil
 * Desc : null 여부 체크등.   StringUtil  과  Utility  에 없는것들 추가.
 */
@Service
public class SessionInfoUtil {

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

	public void setSession(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	// 로그인 상태인 경우 상태코드, 최근접속일 세션 추가
    	HttpSession session = request.getSession();

    	//로그인시 이벤트 화면으로 이동
    	if (session.getAttribute(paramUser) != null) {

    		//세션에 있는 유저 정보 가져오기
    		Entity userInfo = (Entity)session.getAttribute(paramUser);
    		
//    		int checkCnt = mySvcService.getUserCheck(userInfo);
    		
    		if("Y".equals(userInfo.get("PRSC_YN"))){
//    		if(checkCnt > 0) {
        		if(userInfo.get("connDtime") == null || userInfo.get("AGREE_STTUS_CD") == null ) {

                    String usrId = userInfo.get("USER_ID").toString();

        	    	LoginHstVo loginHst = loginHstService.selectLastLoginHst(new LoginHstVo(usrId));

        	        userInfo.setValue("connDtime", loginHst != null ? loginHst.getConnDtime() : "");

        	        MySvcVo mySvcVo = new MySvcVo();
        	        mySvcVo.setUserId(usrId);

        	        MySvcVo rMySvcVo = mySvcService.getAgreYn(mySvcVo);

        	        userInfo.setValue("AGREE_STTUS_CD", rMySvcVo != null ? rMySvcVo.getAgreeSttusCd() : "01");
        	        session.setAttribute("paramUser", userInfo);
        		}
    		}else {
        		response.sendRedirect("/portal/rcvfvrSvc/redirect");
    		}

    	}else {
    		response.sendRedirect("/portal/rcvfvrSvc/redirect");
    	}

	}
}
