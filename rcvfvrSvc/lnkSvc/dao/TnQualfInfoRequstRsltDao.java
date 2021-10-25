/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.dao;

import kr.co.opensns.hanta.common.genericmvc.GenericDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnQualfInfoRequstRsltVo;

/**
 * @author jjh
 * 2020. 9. 15. 오후 1:07:39
 * mospa.sd1.rcvfvrSvcGuidance.dao.TnQualfInfoRequstRsltDao
 * Desc : 자격 정보 요청 결과
 */
public interface TnQualfInfoRequstRsltDao extends GenericDao<TnQualfInfoRequstRsltVo> {

	//연계 요청후 처리되는 건수
	int selectTnQualfReciptInfoRequstRsltCnt(TnQualfInfoRequstRsltVo vo);

	//연계 요청후 처리되는 건수 합계
	int selectTnQualfReciptInfoRequstRsltSumCnt(TnQualfInfoRequstRsltVo vo);

	// 보훈처 연계 요청후 처리되는 건수
	int selectTnQualfReciptInfoRequstRsltBhCnt(TnQualfInfoRequstRsltVo vo);

	// 보훈처 연계 요청후 처리되는 건수 합계
	int selectTnQualfReciptInfoRequstRsltBhSumCnt(TnQualfInfoRequstRsltVo vo);

}
