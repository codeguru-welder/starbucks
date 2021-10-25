/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.RcvfvrGuidanceCvplRequstVo;

/**
 * @author jjh
 * 2020. 8. 3. 오후 1:29:40
 * mospa.sd1.rcvfvrSvcGuidance.dao.RcvfvrGuidanceCvplRequstDao
 * Desc :
 */
public interface RcvfvrGuidanceCvplRequstDao extends GenericPageDao<RcvfvrGuidanceCvplRequstVo> {

	String selectMaxGuidanceNo();

	HashMap callSpQualfReciptMapng(HashMap vo);

	HashMap callSpQualfReciptMapngVrify(HashMap vo);

	/**
     * 진행 중인 민원 요청 건수 조회
     *
     * @param cvplRequstVo {@link RcvfvrGuidanceCvplRequstVo}
     * @return 진행 중인 민원 요청 건수
     */
    int selectOpenCvplRequstCnt(RcvfvrGuidanceCvplRequstVo vo);

    /**
     * 민원 요청 상태 변경
     *
     * @param cvplRequstVo {@link RcvfvrGuidanceCvplRequstVo}
     */
    void updateCvplRequstSttusCd(RcvfvrGuidanceCvplRequstVo vo);
    
    public List<RcvfvrGuidanceCvplRequstVo> selectSendPersonsList(RcvfvrGuidanceCvplRequstVo cvplRequstVo);
    
    String selectCntLnkId(RcvfvrGuidanceCvplRequstVo cvplRequstVo);
    
    List<RcvfvrGuidanceCvplRequstVo> selectSendPersonsListMois(RcvfvrGuidanceCvplRequstVo cvplRequstVo);
    
    /**
     * 가족정보, 세대정보 연계 오류 시 연계결과코드 update
     * @param vo
     */
    void updateCvplRequstClsCd(RcvfvrGuidanceCvplRequstVo vo);
    
    /**
     * 가족정보, 세대정보 연계 오류 시 주민번호 삭제
     * @param vo
     */
    void updateCvplIhidnum(RcvfvrGuidanceCvplRequstVo vo);
    
    void deleteReciptInfoRequstRslt(RcvfvrGuidanceCvplRequstVo vo);
    void updateReciptInfoRequst(RcvfvrGuidanceCvplRequstVo vo);
}
