/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.vo;

import java.io.Serializable;

import lombok.Data;

/**
 * @author jjh
 * 2020. 9. 15. 오전 10:03:31
 * mospa.sd1.rcvfvrSvcGuidance.vo.TnQualfInfoLnkInfoVo
 * Desc : 자격 정보 연계 정보 TN_QUALF_INFO_LNK_INFO
 */
@Data
public class TnQualfInfoLnkInfoVo implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 7027773338109895824L;

	/**
	 * 요청URL REQUSTURL
	 */
	private String requsturl ;

	/**
	 * 사용 불가 사유 USE_IMPRTY_RESN
	 */
	private String useImprtyResn ;

	/**
	 * 사용 여부 USE_YN
	 */
	private String useYn ;

	/**
	 * 등록자 일련번호 REGR_SEQ
	 */
	private int regrSeq ;

	/**
	 * 등록 일시 REG_DH
	 */
	private String regDh ;

	/**
	 * 수정자 일련번호 MODR_SEQ
	 */
	private int modrSeq ;

	/**
	 * 수정 일시 MOD_DH
	 */
	private String modDh ;

	/**
	 * 연계 아이디 LNK_ID
	 */
	private String lnkId ;

	/**
	 * 연계 서비스 명 LNK_SVC_NM
	 */
	private String lnkSvcNm ;

	/**
	 * 연계 서비스 설명 LNK_SVC_EPL
	 */
	private String lnkSvcEpl ;

	/**
	 * 보유 기관 코드 HOLD_ORG_CD
	 */
	private String holdOrgCd ;

	/**
	 * 보유 기관 부서 명 HOLD_ORG_DPT_NM
	 */
	private String holdOrgDptNm ;

	/**
	 * 보유 기관 담당자 명 HOLD_ORG_CHARGER_NM
	 */
	private String holdOrgChargerNm ;

	/**
	 * 보유 기관 전화 번호 HOLD_ORG_TEL_NO
	 */
	private String holdOrgTelNo ;

	/**
	 * 보유 기관 이메일 HOLD_ORG_EMAIL
	 */
	private String holdOrgEmail ;

	//성별코드
	private String usrSexCd;
	//생년월일
	private String cpttrBrthdy;

}