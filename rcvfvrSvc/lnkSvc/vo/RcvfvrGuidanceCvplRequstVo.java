/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.vo;

import java.io.Serializable;
import java.util.List;

import kr.co.opensns.utils.StringUtils;
import kr.go.portal.onlnreqst.vo.Cpttr;
import kr.go.portal.onlnreqst.vo.ItmLnkSvcMgrVo;
import kr.go.portal.onlnreqst.vo.SvcGuidanceReqstVo;
import lombok.Data;
import lombok.EqualsAndHashCode;
import mospa.common.entity.CvplRequstEntity;
import mospa.sd1.common.SvcGuidance;

/**
 * @author jjh
 * 2020. 8. 3. 오후 2:04:26
 * mospa.sd1.rcvfvrSvcGuidance.vo.RcvfvrGuidanceCvplRequstVo
 * Desc :
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class RcvfvrGuidanceCvplRequstVo extends CvplRequstEntity implements Serializable, Cpttr, SvcGuidance {

	/**
	 *
	 */
	private static final long serialVersionUID = -5741103786208299471L;

	/**
     * Constructor of CvplRequstVo.java class
     */
    public RcvfvrGuidanceCvplRequstVo() {

    }

    /**
     * Constructor of CvplRequstVo.java class
     *
     * @param cpttrSeq 민원인 일련번호
     */
    public RcvfvrGuidanceCvplRequstVo(int cpttrSeq) {
        setCpttrSeq(cpttrSeq);
    }

    /**
     * Constructor of CvplRequstVo.java class
     *
     * @param cvplRequstGuidanceNo 민원 요청 안내 번호
     */
    public RcvfvrGuidanceCvplRequstVo(String cvplRequstGuidanceNo) {
        setCvplRequstGuidanceNo(cvplRequstGuidanceNo);
    }

    /**
     * 수혜자 유형
     */
    private String[] rcvfvrTrgterClses;

    /**
     * 주민번호
     */
    private String ihidnum1 = "";

    /**
     * 주민번호
     */
    private String ihidnum2 = "";

    /**
     * 사업자번호
     */
    private String bizrno1 = "";

    /**
     * 사업자번호
     */
    private String bizrno2 = "";

    /**
     * 사업자번호
     */
    private String bizrno3 = "";

    /**
     * 민원요청안내번호
     */
    private String selectMaxGuidanceNo = "";

    /**
     * 프로시저 msg
     */
    private String psMsg = "";

    /**
     * 관할소재지 명
     */
    private String cmptncLocplcCdNm;

    /**
     * 민원인 명
     */
    private String cpttrNm = "";

    /**
     * 민원인 Id
     */
    private String cpttrId = "";

    /**
     * 민원인 생년월일
     */
    private String cpttrBrthdy = "";

    /**
     * 민원인 성별 코드
     */
    private String cpttrSexCd = "";

    /**
     * 주민번호
     */
    private String ihidnum = "";

    /**
     * 주민번호 단방향
     */
    private String ihidnumSimplx = "";

    /**
     * 열람방법
     */
    private String readngMth;

    /**
     * 주민번호 양방향
     */
    private String ihidnumBdrcl = "";

    /**
     * 사업자번호
     */
    private String bizrno = "";

    /**
     * 민원인 상세 주소
     */
    private String cpttrDtlAddr = "";

    /**
     * 전화 번호
     */
    private String telNo = "";

    /**
     * 휴대폰 번호
     */
    private String mobileNo = "";

    /**
     * 휴대폰 번호
     */
    private String mobileNo1 = "";

    /**
     * 휴대폰 번호
     */
    private String mobileNo2 = "";

    /**
     * 휴대폰 번호
     */
    private String mobileNo3 = "";

    /**
     * 연락처 번호
     */
    private String telNo1 = "";

    /**
     * 연락처 번호
     */
    private String telNo2 = "";

    /**
     * 연락처 번호
     */
    private String telNo3 = "";

    /**
     * 열람방법 이메일
     */
    private String readngMthEmail = "";

    /**
     * 열람방법 이메일1
     */
    private String readngMthEmail1 = "";

    /**
     * 열람방법 이메일2
     */
    private String readngMthEmail2 = "";

    /**
     * 열람방법 이메일3
     */
    private String readngMthEmail3 = "";
    /**
     * 이메일
     */
    private String email = "";

    /**
     * 이메일1
     */
    private String email1 = "";

    /**
     * 이메일2
     */
    private String email2 = "";

    /**
     * 이메일3
     */
    private String email3 = "";

    /**
     * 조회 기관 코드
     */
    private String vwOrgCd = "";

    /**
     * 담당자 명
     */
    private String usrNm = "";

    /**
     * 담당자 소관 부서 전체 명
     */
    private String asndAllDptNm = "";

    /**
     * 소속 기관 코드
     */
    private String asndOrgCd = "";

    /**
     * 교육청
     */
    private String educationOffice = "";

    /**
     * 학교명
     */
    private String schoolNm = "";

    /**
     * 서비스 안내 건수
     */
    private int svcGuidanceCnt;

    /**
     * 서비스 신청 건수
     */
    private int svcReqstCnt;

    /**
     * 서비스 목록 구분(서비스 안내 목록/서비스 신청 목록)
     */
    private String svcListCls = "";

    /**
     * 검색 조건의 안내/신청 번호
     */
    private String srhNo = "";

    /**
     * 검색 조건의 안내/신청 담당자 명
     */
    private String srhNm = "";

    /**
     * 검색 조건의 안내/신청 시작일자
     */
    private String stSrhDh = "";

    /**
     * 검색 조건의 안내/신청 종료일자
     */
    private String edSrhDh = "";

    /**
     * 목록열람신청항목별 연계서비스 관리 Vo
     */
    private ItmLnkSvcMgrVo itmLnkSvcMgrVo;

    /**
     * 이용약관 동의
     */
    private String useStplatYn;

    /**
     * 가구 유형
     */
    private String[] hshldCls;

    /**
     * 자격 정보 코드 리스트
     */
    private String[] listReadngReqstItmSeqs;

    /**
     * 관심분야 서비스 리스트
     */
    private String[] rcvfvrTrgterClsCds;

    /**
     * 민원 요청 안내 번호 리스트
     */
    private String[] cvplRequstGuidanceNos;

    /**
     * 관심분야 서비스
     */
    private String rcvfvrTrgterClsCd;

    /**
     * 민원 요청 상태 코드명
     */
    private String cvplRequstSttusNm = "";

    /**
     * fileList
     */
    private List<CvplRequstFlVo> fileList;

    /**
     * 검색 조건의 안내/신청 시작일자 Data Format
     */
    @SuppressWarnings("unused")
    private String stSrhDhFmt;

    /**
     * 검색 조건의 안내/신청 종료일자 Data Format
     */
    @SuppressWarnings("unused")
    private String edSrhDhFmt;

    /**
     * 서비스 안내 신청 리스트
     */
    private List<SvcGuidanceReqstVo> svcGuidanceReqstList;

    /**
     * 수신된 데이터
     */
    private String lnkData;

    /**
     * 신청인 유형명(회원/비회원)
     */
    private String cpttrClsNm;

    /**
     * Xecure Cert 파라미터
     */
    private String a;

    /**
     * Xecure Cert 파라미터
     */
    private String p;

    /**
     * Xecure Cert 파라미터
     */
    private String q;

    /**
     * Xecure Cert 파라미터
     */
    private String vidMsg;

    /**
     * Xecure Cert 파라미터
     */
    private String signedMsg;

    /**
     * Xecure Cert 파라미터
     */
    private String xml;

    /**
     * Xecure Cert 파라미터
     */
    private String pkcs1Msg;

    /**
     * 모바일 키보드 보안 주민등록번호 뒷자리
     */
    private String kbdencIhidnum2 = "";
    /**
     * @return cmptncLocplcCd
     */
    @Override
    public String getCpttrAddrSignguCd() {
        return this.getCmptncLocplcCd();
    }

    /**
     * @param cpttrAddrSignguCd cpttrAddrSignguCd
     */
    @Override
    public void setCpttrAddrSignguCd(String cpttrAddrSignguCd) {
        this.setCmptncLocplcCd(cpttrAddrSignguCd);
    }

    /**
     * @return the cvplRequstDhFmt to get
     */
    public String getCvplRequstDhFmt() {
        return StringUtils.formatDateExt(getCvplRequstDh(), "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * @return the StSrhDhFmt to get
     */
    public String getStSrhDhFmt() {
        return StringUtils.formatDateExt(getStSrhDh(), "yyyyMMdd", "yyyy-MM-dd");
    }

    /**
     * @param stSrhDhFmt the StSrhDhFmt to set
     */
    public void setStSrhDhFmt(String stSrhDhFmt) {
        this.setStSrhDh(StringUtils.formatDateExt(stSrhDhFmt, "yyyy-MM-dd", "yyyyMMdd"));
    }

    /**
     * @return the EdSrhDhFmt to get
     */
    public String getEdSrhDhFmt() {
        return StringUtils.formatDateExt(getEdSrhDh(), "yyyyMMdd", "yyyy-MM-dd");
    }

    /**
     * @param edSrhDhFmt the EdSrhDhFmt to set
     */
    public void setEdSrhDhFmt(String edSrhDhFmt) {
        this.setEdSrhDh(StringUtils.formatDateExt(edSrhDhFmt, "yyyy-MM-dd", "yyyyMMdd"));
    }

    //위임신청여부
    private String mndtRequstYn;

    //사용여부
    private String useYn;
    //link_id
    private String[] linkId;



    private String Header_IF_ID;
    private String Header_ResponseType;
    private String Header_TestYN;
    private String Header_ShareYN;
    private String link2020SvrUrl;

    // 세대구성원 체크
    private String[] child_chk;
    
    /* selectSendPersonsList */
    private String sendTxid;
    private String agreeSttusCd;
    
    private String cvplRequstGuidanceNo;
    private String personName;
    private String juminNo;
    private String hangkikcd;
    private String boninGubun;
    private String errType;
    
    private String rsltCd;
}
