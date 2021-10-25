/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.dao;

import kr.co.opensns.hanta.common.genericmvc.GenericDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnCpttrAgremanageVo;

/**
 * @author jjh
 * 2020. 10. 13. 오전 9:49:00
 * mospa.sd1.rcvfvrSvcGuidance.dao.TnCpttrAgremanageDao
 * Desc :
 */
public interface TnCpttrAgremanageDao extends GenericDao<TnCpttrAgremanageVo> {

	//민원인 가족 일련번호 생성 조회
	String selectCpttrFamilySeqPrdtVw();
}
