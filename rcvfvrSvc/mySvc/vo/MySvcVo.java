package kr.go.portal.rcvfvrSvc.mySvc.vo;

import java.io.Serializable;

import org.apache.ibatis.page.PageParameter;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)

public class MySvcVo extends PageParameter implements Serializable {

	/**
     * serialVersionUID
     */
    private static final long serialVersionUID = 6563301194300083696L;

    /* selectAgreYn */
    private String agreeSttusCd;
    private String agreeConfmDt;
    private String userId;

    /* selectReqstDtls */
    private String reqDt;
    private String cappReqNo;
    private String acptSeq;
    private String cappBizNm;
    private String cdNm;
//    private String rrn;
//    private String searchType;
//    private String fromDate;
//    private String toDate;

    /* updateAgreeInfoCancel */
//    private String userId;

    /* selectUserInfo */
    private String cpttrId;
    private String cpttrNm;
    private String cpttrSexCd;
    private String cvplRequstGuidanceNo;
    private String updateTime;
    private String updatePsbYn;
    private String qualfAstValArr;
//    private String userId;

    /* insertRcvfvrGuidanceCvplRequst */
//    private String cpttrId;
//    private String cvplRequstGuidanceNo;

    /* insertRcvfvrGuidanceCvplVrifyRequst */
    private String cpttrSeq;
//    private String cvplRequstGuidanceNo;
    private String email;

    /* selectRcvfvrSvcRsltVw1 */
    private String guidanceClsCd;
    private String rsltCnt;
    private String rsltCnt1;
    private String rsltCnt2;
    private String rsltCnt3;
    private String rsltCnt4;
//    private String cvplRequstGuidanceNo;

    /* selectRcvfvrSvcRsltVw2 */
    private String svcId;
    private String svcSeq;
    private String svcNm;
    private String jrsdOrgNm;
    private String jrsdDptNm;
    private String jrsdFsOrgNm;
    private String jrsdOrgCd;
    private String jrsdOrgClsCd;
    private String svcPpo;
    private String reqstTmlmtEtc;
//    private String seq;
    private String sportFrCdArr;
    private String reqstMeanCdArr;
    private String provdSvcVwCnt;
//    private String cvplRequstGuidanceNo;
//    private String guidanceClsCd;
    private String orderByType;
    private String sportFrCd;
    private String rsltNm;
    private String rsltOrder;

    /* selectCpttrSeqVw */
//    private String cpttrSeq;
    private String ihidnumSimplx;

    /* insertCpttrInfoSav */
//    private String cpttrSeq;
//    private String cpttrNm;
    private String cpttrBrthdy;
//    private String cpttrSexCd;
//    private String ihidnumSimplx;
    private String ihidnumBdrcl;
    private String bizrno;
    private String cpttrDtlAddr;
    private String mobileNo;
//    private String email;
    private String telNo;
//    private String userId;
    private String rcvOrgNm;
    private String refrncTelNo;
    private String refrncNm;
    private String lnkSvcNm;
    private String refrncNmArr;
    private String refrncArr;
    
    private String troblGuidanceCts;
    private String eprssStDh;
    private String eprssEdDh;
    
    private String pgUrl;
    private String remoteIp;
    private String loginClsNm;
    private String cvplRequstDh;
    private String remoteMaxCnt;
    
    private String svcNmInitial;
}
