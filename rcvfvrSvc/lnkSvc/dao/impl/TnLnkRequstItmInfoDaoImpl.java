/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericDaoSupport;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.TnLnkRequstItmInfoDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnLnkRequstItmInfoVo;

/**
 * @author jjh
 * 2020. 10. 7. 오후 1:22:26
 * mospa.sd1.rcvfvrSvcGuidance.dao.impl.TnLnkRequstItmInfoDaoImpl
 * Desc :
 */
@Repository
public class TnLnkRequstItmInfoDaoImpl extends GenericDaoSupport<TnLnkRequstItmInfoVo> implements TnLnkRequstItmInfoDao {

	@Autowired
	@Qualifier("newSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
}
