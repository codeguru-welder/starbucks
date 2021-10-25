/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.vo;

import java.io.Serializable;

import kr.go.portal.onlnreqst.vo.Cpttr;
import lombok.Data;
import lombok.EqualsAndHashCode;
import mospa.common.entity.CpttrEntity;

/**
 * @author jjh
 * 2020. 10. 13. 오전 9:47:18
 * mospa.sd1.rcvfvrSvcGuidance.vo.TnCpttrAgremanageVo
 * Desc : 민원인 동의관리 TN_CPTTR_AGREMANAGE
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class TnCpttrAgremanageVo extends CpttrEntity implements Serializable, Cpttr {

	/**
	 *
	 */
	private static final long serialVersionUID = -4559646195014282265L;

	/**
	 * 동의자 일련번호 AGREUSR_SEQ
	 */
	private int agreusrSeq ;

	/**
	 * 민원인 일련번호 CPTTR_SEQ
	 */
	private int cpttrSeq ;

	/**
	 * 동의 여부 USE_YN
	 */
	private String useYn ;

	/**
	 * 동의자 명 AGREUSR_NM
	 */
	private String agreusrNm ;

	/**
	 * 동의자 주민번호 단방향 AGREUSR_IHIDNUM_SIMPLX
	 */
	private String agreusrIhidnumSimplx ;

	/**
	 * 동의자 주민번호 양방향 AGREUSR_IHIDNUM_BDRCL
	 */
	private String agreusrIhidnumBdrcl ;

	/**
	 * 동의자 생년월일 AGREUSR_BRTHDY
	 */
	private String agreusrBrthdy ;

	/**
	 * 동의자 성별 AGREUSR_SEX_CD
	 */
	private String agreusrSexCd ;

	/**
     * 주민번호
     */
    private String ihidnum = "";




}
