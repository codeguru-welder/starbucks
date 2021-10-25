/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.vo;

import lombok.Data;

/**
 * @author jjh
 * 2020. 10. 7. 오후 1:20:26
 * mospa.sd1.rcvfvrSvcGuidance.vo.TnLnkRequstItmInfoVo
 * Desc : 연계 요청 항목 정보 TN_LNK_REQUST_ITM_INFO
 */
@Data
public class TnLnkRequstItmInfoVo {
	/**
	 * 연계 아이디 LNK_ID
	 */
	private String lnkId ;

	/**
	 * 요청 구분 코드 REQUST_CLS_CD
	 */
	private String requstClsCd ;

	/**
	 * 요청 항목 명 REQUST_ITM_NM
	 */
	private String requstItmNm ;

	/**
	 * 요청 항목 값 REQUST_ITM_VAL
	 */
	private String requstItmVal ;

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
}
