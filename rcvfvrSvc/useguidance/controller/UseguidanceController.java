package kr.go.portal.rcvfvrSvc.useguidance.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.page.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.go.common.stereotype.PortalController;
import kr.go.portal.rcvfvrSvc.mySvc.service.MySvcService;
import kr.go.portal.rcvfvrSvc.mySvc.vo.MySvcVo;
import mospa.common.bbs.service.BbsService;
import mospa.common.bbs.vo.BbsVo;
import mospa.common.ntt.service.NttService;
import mospa.common.ntt.vo.NttVo;

@PortalController
@RequestMapping("/portal/rcvfvrSvc/useguidance")
public class UseguidanceController {

	static final Logger Logger = LoggerFactory.getLogger(UseguidanceController.class);

    /**
     * {@link BbsService} 게시판 Service
     */
    @Autowired
    private BbsService bbsService;

    /**
     * {@link NttService} 게시물 Service
     */
    @Autowired
    private NttService nttService;
    
    /**
     * 나의혜택 Service
     */
    @Autowired
    private MySvcService mySvcService;

    /**
     * 이용가이드
     *
     * @param model {@link Model}
     * @return 이용가이드 jsp
     */
    @RequestMapping("")
    public String selectUseGuidance(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
        return "portal/rcvfvrSvc/useguidance/useGuidance";
    }

    @RequestMapping("/tab2")
    public String selectUseGuidanceTab2(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return "portal/rcvfvrSvc/useguidance/useGuidanceTab2";
    }

    /**
     * 게시물 목록조회 화면
     *
     * @param nttVo {@link NttVo} 게시물 VO
     * @param model {@link Model}
     * @return 게시물 목록조회 jsp
     */
    @RequestMapping("/ntcitm")
    public String selectNtcitm(NttVo nttVo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 게시판 번호 변경시 변경
    	
    	nttVo.setBbsSeq(539);		//운영
        //nttVo.setBbsSeq(1140);	//개발
        // 공개여부 Y인 것만 출력
        nttVo.setSrchOpYn("Y");
        nttVo.setPageUnit(5);

        model.addAttribute("bbsVo", bbsService.selectBbs(new BbsVo(nttVo.getBbsSeq())));
        model.addAttribute("pageData", nttService.selectNttPage(nttVo));
        model.addAttribute("searchVo", nttVo);

        return "portal/rcvfvrSvc/useguidance/ntcitm";
    }

    /**
     * 게시물 상세조회 화면
     *
     * @param model {@link Model}
     * @return 게시물 상세조회 jsp
     */
    @RequestMapping("/ntcitmDtl/{nttSeq}")
    public String selectNtcitmDtl(@PathVariable int nttSeq, Model model, NttVo nttVo, HttpServletRequest request, HttpServletResponse response) throws Exception {

        // 게시판 번호 변경
    	nttVo.setBbsSeq(539);		//운영
        //nttVo.setBbsSeq(1140);	//개발
    	nttVo.setNttSeq(nttSeq);

        model.addAttribute("bbsVo", bbsService.selectBbs(new BbsVo(nttVo.getBbsSeq())));
        model.addAttribute("nttVo", nttService.selectNttView(nttVo));

        return "portal/rcvfvrSvc/useguidance/ntcitmDtl";
    }
    
    /**
     * 보조금24 소개
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/intrcnRcvfvr")
    public String selectRcvfvr(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return "portal/rcvfvrSvc/useguidance/intrcnRcvfvr";
    }
    
    /**
     * 자주묻는 질문
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/faq")
    public String selectFaq(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	String accordionYn = request.getParameter("accordionYn");
    	Logger.debug("*********accordionYn:" + accordionYn);
    	
    	model.addAttribute("accordionYn", accordionYn);
    	
    	return "portal/rcvfvrSvc/useguidance/rcvfvrSvcFaq";
    }
    
    /**
     * 보조금24 현황
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/rcvfvrSvcSttus")
    public String rcvfvrSvcSttus(Model model, HttpServletRequest request, HttpServletResponse response, MySvcVo mySvcVo) throws Exception{
    	
    	String tab = request.getParameter("tab");
    	model.addAttribute("tab", tab);
    			
		//페이징 설정
    	mySvcVo.setPageIndex(mySvcVo.getPageIndex() == 0 ? 1: mySvcVo.getPageIndex());
    	mySvcVo.setPageSize(36);
    	mySvcVo.setPageUnit(5);

    	if("".equals(tab) || "1".equals(tab) || tab == null){
    		//맞춤안내 서비스 305종
        	Page<MySvcVo> fixesSvc = null;
        	fixesSvc = mySvcService.selectFixesSvc(mySvcVo);
        	model.addAttribute("fixesSvc", fixesSvc);
    	}else if ("4".equals(tab)){

        	//온라인신청
        	Page<MySvcVo> reqstSvc = null;
        	reqstSvc = mySvcService.selectReqstSvc(mySvcVo);
        	model.addAttribute("reqstSvc", reqstSvc);
        	
    	}	
    	
    	return "portal/rcvfvrSvc/useguidance/rcvfvrSvcSttus";
    }

}
