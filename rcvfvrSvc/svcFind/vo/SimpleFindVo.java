package kr.go.portal.rcvfvrSvc.svcFind.vo;

import java.io.Serializable;

import org.apache.ibatis.page.PageParameter;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * @author NS-SG-03
 * @since 2020. 9. 2.
 * @version 1.0
 */

@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)

public class SimpleFindVo extends PageParameter implements Serializable {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -8003530433155753336L;	
	
	private String userId;
    private String userNm;
    private String addr;
    private String age;
    private String korAge;
    private String agreeSttusCd;

    /**
     * 1단계
     */
    private String gender;
    
    /**
     * 2단계
     */
    private String hshldChartr;
    private String[] hshldChartrArray;
    
    /**
     * 3단계
     */
    private String job;
    private String[] jobArray;
    
    /**
     * 4단계
     */
    private String incomeInfo;
    private String[] incomeInfoArray;
    
    /**
     * 기관
     */
    private String svcOrg;
    
    /**
     * 서비스 유형
     */
    private String svcCls;
    
    /**
     * 서비스 건수
     */
    private String svcCnt;
    
    /**
     * 보기 방식
     */
    private String showView;
    
    /**
     * 최종 접속
     */
    private String connDtime;
    
    /**
     * 상세 url
     */
    private String recomendSvcSiteUrl;
    
    /**
     * 서비스 ID
     */
    private String svcId;
    
    /**
	 * 서비스 명
	 */
    private String svcNm;
	
	/**
	 * 서비스 설명
	 */
    private String svcPpo;
	
	/**
	 * 지원유형
	 */
    private String sportFrCd;
	
	/**
	 * 지원유형
	 */
    private String sportFrCdNm;
	
    private String searchType;
    private String sportFrCdArr;
    private String reqstMeanCdArr;
    private String reqstTmlmtEtc;
	
    private String cdNm;
	
    private String rcvOrgNm;
	private String refrncTelNo;
	private String refrncNm;
	
	/**
	 * 문의처
	 */
	private String refrncNmArr;
	private String refrncArr;
	
	private String chartrCd;
	private int sqBnefVwSeq;
}
