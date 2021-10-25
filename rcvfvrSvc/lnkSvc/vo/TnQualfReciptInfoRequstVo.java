/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.vo;

import java.io.Serializable;

import lombok.Data;

/**
 * @author jjh
 * 2020. 9. 8. 오전 10:57:54
 * mospa.sd1.rcvfvrSvcGuidance.vo.TnQualfReciptInfoRequstVo
 * Desc : 자격 수급 정보 요청 TN_QUALF_RECIPT_INFO_REQUST
 */
@Data
public class TnQualfReciptInfoRequstVo implements Serializable  {

	/**
	 *
	 */
	private static final long serialVersionUID = -5337056157014682920L;

	/**
	 * 연계 요청 번호 LNK_REQUST_NO
	 */
	private String lnkRequstNo ;

	/**
	 * 민원 요청 안내 번호 CVPL_REQUST_GUIDANCE_NO
	 */
	private String cvplRequstGuidanceNo ;

	/**
	 * 민원인 일련번호 CPTTR_SEQ
	 */
	private String cpttrSeq ;

	/**
	 * 동의자 일련번호 AGREUSR_SEQ
	 */
	private String agreusrSeq ;

	/**
	 * 요청 성공 여부 REQUST_SUCC_YN
	 */
	private String requstSuccYn ;

	/**
	 * 요청 오류 코드 내용 REQUST_ERR_CD_CTS
	 */
	private String requstErrCdCts ;

	/**
	 * 연계 아이디 LNK_ID
	 */
	private String lnkId ;

	//선택한 연게 아이디
	private String[] linkId;
	//성별코드
	private String usrSexCd;
	//생년월일
	private String cpttrBrthdy;

}

