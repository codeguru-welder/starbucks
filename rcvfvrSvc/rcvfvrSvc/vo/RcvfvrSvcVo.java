package kr.go.portal.rcvfvrSvc.rcvfvrSvc.vo;

import java.io.Serializable;

import org.apache.ibatis.page.PageParameter;

import kr.co.opensns.utils.StringUtils;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)

public class RcvfvrSvcVo extends PageParameter implements Serializable {

	/**
     * serialVersionUID
     */
    private static final long serialVersionUID = 6563301194300083696L;


    /* selectRcvfvrSvc */
	private String sportFrCdArr;
	private String svcNm;
	private String svcPpo;
	private String reqstTmlmtEtc;
	private String reqstMeanCdArr;
	private String sportTg;
	private String dupImprtySvc;
	private String slctnStdr;
	private String svcCts;
	private String reqstProcss;
	private String posesPapers;
	private String rcvOrgNm;
	private String refrncTelNo;
	private String onlnReqstSiteUrl;
	private String directRecptReqstUrl;
	private String directRecptMobileUrl;
	private String svcId;
	private String svcSeq;

	/* selectFrmeSet */
    private String frmeCls;
    private String svcAstCls;
    private String upendBgColorCls;
    private String upendBgImgTyCls;
    private String sportFrIconCls;
    //private String svcId;

	/* selectRelateLs */
	private String admrulKnd;
	//private String svcId;
	
	/**
	 * 수정일
	 */
	private String modDh;
	
	/**
	 * 등록일
	 */
	private String svcRegDh;
	
	/**
	 * 소관기관
	 */
	private String orgNm;
	private String refrncNm;
	private String reqstTmlmtDate;
	
	
	private String clus;
	private String etc;
	private String atclOne;
	private String atclTwo;
	
	/**
	 * 수기 등록 법령 정보
	 */
	private String memorRegNo;
	private String lsKndCd;
	private String lsKndCdNm;
	private String lsNmKo;
	
	/**
	 * 행정규칙 정보
	 */
	private String admrulSeq;
	private String admrulNm;
	private String prmlDt;
	private String prmlNo;
	private String svcAdmrulNo;
	
	/**
	 * 자치 법규 정보
	 */
	private String amllSeq;
	private String amllNm;
	private String ancDt;
	private String ancNo;
	private String svcAmllNo;
	
	/**
	 * 법령 정보
	 */
	private String lsiSeq;
	private String lsKndNm;
	private String svcLsInfoNo;
	
	public RcvfvrSvcVo() {

    }
	
	/**
     * 수기 등록 법령 정보
     */
	public String getMemorRegInfo() {
		String memorRegLsBusiBaseInfo = "";

        if (getLsKndCdNm() != null && !"".equals(getLsKndCdNm())) {
            memorRegLsBusiBaseInfo = "[" + getLsKndCdNm() + "] ";
        }
        if (!"".equals(getLsNmKo()) && !"0".equals(getLsNmKo()) && getLsNmKo() != null) {
        	memorRegLsBusiBaseInfo += getLsNmKo();
        }
        if (!"".equals(getAtclOne()) && !"0".equals(getAtclOne()) && getAtclOne() != null) {
            memorRegLsBusiBaseInfo += "(제" + getAtclOne() + "조";
            if (!"".equals(getAtclTwo()) && !"0".equals(getAtclTwo()) && getAtclTwo() != null) {
                memorRegLsBusiBaseInfo += "의" + getAtclTwo();
            }
            if (!"".equals(getClus()) && !"0".equals(getClus()) && getClus() != null) {
                memorRegLsBusiBaseInfo += ", 제" + getClus() + "항";
            }
            memorRegLsBusiBaseInfo += ")";
        }

        return memorRegLsBusiBaseInfo;
    }
    /**
     * 행정규칙
     */
	public String getAdmrulUrl() {
		return "http://www.law.go.kr/행정규칙/" + StringUtils.removeHtml(getAdmrulNm()).replace(" ", "") + "/("
				+ getPrmlNo() + "," + getPrmlDt() + ")";
    }
	public String getAdmrulInfo() {
    	String lsBusiBaseInfo = "";

        lsBusiBaseInfo = "[행정규칙] " + getAdmrulNm();
        if (!"".equals(getAtclOne()) && !"0".equals(getAtclOne()) && getAtclOne() != null) {
            lsBusiBaseInfo += "(제" + getAtclOne() + "조";
            if (!"".equals(getAtclTwo()) && !"0".equals(getAtclTwo()) && getAtclTwo() != null) {
                lsBusiBaseInfo += "의" + getAtclTwo();
            }
            if (!"".equals(getClus()) && !"0".equals(getClus()) && getClus() != null) {
                lsBusiBaseInfo += ", 제" + getClus() + "항";
            }
            lsBusiBaseInfo += ")";
        }

        return lsBusiBaseInfo;
    }

    /**
     * 자치법규
     */
	public String getAmllUrl() {
		return "http://www.law.go.kr/자치법규/" + StringUtils.removeHtml(getAmllNm()).replace(" ", "") + "/(" + getAncNo()
        + "," + getAncDt() + ")";
    }
	public String getAmllInfo() {
    	String lsBusiBaseInfo = "";

        lsBusiBaseInfo = "[자치법규] " + getAmllNm();
        if (!"".equals(getAtclOne()) && !"0".equals(getAtclOne()) && getAtclOne() != null) {
            lsBusiBaseInfo += "(제" + getAtclOne() + "조";
            if (!"".equals(getAtclTwo()) && !"0".equals(getAtclTwo()) && getAtclTwo() != null) {
                lsBusiBaseInfo += "의" + getAtclTwo();
            }
            if (!"".equals(getClus()) && !"0".equals(getClus()) && getClus() != null) {
                lsBusiBaseInfo += ", 제" + getClus() + "항";
            }
            lsBusiBaseInfo += ")";
        }

        return lsBusiBaseInfo;
    }
    
    /**
     * 법령
     */
	public String getLsUrl() {
        return "http://www.law.go.kr/법령/" + StringUtils.removeHtml(getLsNmKo()).replace(" ", "") + "/(" + getAncNo()
                + "," + getAncDt() + ")";
    }
	public String getLsInfo() {
        String lsBusiBaseInfo = "";

        lsBusiBaseInfo = "[법령] " + getLsNmKo();
        if (!"".equals(getAtclOne()) && !"0".equals(getAtclOne()) && getAtclOne() != null) {
            lsBusiBaseInfo += "(제" + getAtclOne() + "조";
            if (!"".equals(getAtclTwo()) && !"0".equals(getAtclTwo()) && getAtclTwo() != null) {
                lsBusiBaseInfo += "의" + getAtclTwo();
            }
            if (!"".equals(getClus()) && !"0".equals(getClus()) && getClus() != null) {
                lsBusiBaseInfo += ", 제" + getClus() + "항";
            }
            lsBusiBaseInfo += ")";
        }

        return lsBusiBaseInfo;
    }
	
	/**
	 * 사용자 id
	 */
	private String cpttrId;
	
	/**
	 * 메일주소
	 */
	private String email;
	
	/**
	 * 개선의견 
	 */
	private String impOpinion;
	
	/**
	 * 화면 이름
	 */
	private String mnNm;

	/**
	 * 시스템 구분 코드
	 */
    private String sysClsCd;
    
    private String mobileNo;
    private String mnCd;
    private int stsfdgSeq;

}
