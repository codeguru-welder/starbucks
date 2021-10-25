/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericDaoSupport;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.TnCpttrAgremanageDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnCpttrAgremanageVo;

/**
 * @author jjh
 * 2020. 10. 13. 오전 9:49:38
 * mospa.sd1.rcvfvrSvcGuidance.dao.impl.TnCpttrAgremanageDaoImpl
 * Desc :
 */
@Repository
public class TnCpttrAgremanageDaoImpl extends GenericDaoSupport<TnCpttrAgremanageVo> implements TnCpttrAgremanageDao {

	@Autowired
	@Qualifier("newSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	/*
	 * 민원인 가족 일련번호 생성 조회
	 */
	@Override
	public String selectCpttrFamilySeqPrdtVw() {
		return getSqlSession().selectOne("tnCpttrAgremanage.selectCpttrFamilySeqPrdtVw");
	}


}
