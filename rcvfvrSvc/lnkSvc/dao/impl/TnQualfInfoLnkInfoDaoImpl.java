/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericDaoSupport;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.TnQualfInfoLnkInfoDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnQualfInfoLnkInfoVo;

/**
 * @author jjh
 * 2020. 9. 15. 오전 10:17:15
 * mospa.sd1.rcvfvrSvcGuidance.dao.impl.TnQualfInfoLnkInfoDaoImpl
 * Desc : 자격 정보 연계 정보
 */
@Repository
public class TnQualfInfoLnkInfoDaoImpl extends GenericDaoSupport<TnQualfInfoLnkInfoVo>  implements TnQualfInfoLnkInfoDao {

	@Autowired
	@Qualifier("newSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
}
