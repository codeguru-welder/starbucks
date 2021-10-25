/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.dao;

import java.sql.SQLException;

import kr.co.opensns.hanta.common.genericmvc.GenericDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnQualfReciptInfoRequstVo;

/**
 * @author jjh
 * 2020. 9. 8. 오전 11:19:40
 * mospa.sd1.rcvfvrSvcGuidance.dao.TnQualfReciptInfoRequstListDao
 * Desc :
 */
public interface TnQualfReciptInfoRequstDao extends GenericDao<TnQualfReciptInfoRequstVo> {
	//select insert
	int insertTnQualfReciptInfoRequstSelect(TnQualfReciptInfoRequstVo vo) throws SQLException;

}
