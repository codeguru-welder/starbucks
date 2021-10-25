/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.vo;

import java.io.Serializable;
import java.util.ArrayList;

import lombok.Data;

/**
 * @author jjh
 * 2020. 9. 15. 오후 1:08:12
 * mospa.sd1.rcvfvrSvcGuidance.vo.TnQualfInfoRequstRsltVo
 * Desc : 자격 정보 요청 결과 TN_QUALF_INFO_REQUST_RSLT
 */
@Data
public class TnQualfInfoRequstRsltVo implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1337302046936070622L;

	/**
	 * 연계 요청 번호 LNK_REQUST_NO
	 */
	private String lnkRequstNo ;

	/**
	 * 연계 아이디 LNK_ID
	 */
	private String lnkId ;

	/**
	 * 연계 목록 상세 일련번호 LNK_LIST_DTL_SEQ
	 */
	private int lnkListDtlSeq ;

	/**
	 * 연계 목록 일련번호 LNK_LIST_SEQ
	 */
	private int lnkListSeq ;

	/**
	 * 연계 항목 명 LNK_ITM_NM
	 */
	private String lnkItmNm ;

	/**
	 * 자격 항목 연계 결과 QUALF_ITM_LNK_RSLT
	 */
	private String qualfItmLnkRslt ;

	/**
	 * 요청 성공 여부 REQUST_SUCC_YN
	 */
	private String requstSuccYn ;

	/**
	 * 요청 오류 코드 내용 REQUST_ERR_CD_CTS
	 */
	private String requstErrCdCts ;

	/**
	 * 연계 처리 일시 LNK_PROCESS_DH
	 */
	private String lnkProcessDh ;

	//I-IF-MPVA-005 연계용
	private String resIvNunber ;
	private String subjKbnCd ;

	// 연계 보내는 사람 이름
	private String sendPersonName;

	/**
	 * 연계 요청 번호들 LNK_REQUST_NO
	 */
	private ArrayList<String> lnkRequstNos ;

	// requst 의 민원 요청 안내 번호
	private String cvplRequstGuidanceNo = "";
}

