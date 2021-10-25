/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericDaoSupport;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.TnQualfReciptInfoRequstDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnQualfReciptInfoRequstVo;

/**
 * @author jjh
 * 2020. 9. 8. 오전 11:23:30
 * mospa.sd1.rcvfvrSvcGuidance.dao.impl.TnQualfReciptInfoRequstListDaoImpl
 * Desc :
 */
@Repository
public class TnQualfReciptInfoRequstDaoImpl extends GenericDaoSupport<TnQualfReciptInfoRequstVo> implements TnQualfReciptInfoRequstDao {

	@Autowired
	@Qualifier("newSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public int insertTnQualfReciptInfoRequstSelect(TnQualfReciptInfoRequstVo vo) {
		return getSqlSession().insert("tnQualfReciptInfoRequst.insertTnQualfReciptInfoRequstSelect",vo);
	}

}
