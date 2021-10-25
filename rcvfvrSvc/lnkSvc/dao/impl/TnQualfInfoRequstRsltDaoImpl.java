/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericDaoSupport;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.TnQualfInfoRequstRsltDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnQualfInfoRequstRsltVo;

/**
 * @author jjh
 * 2020. 9. 15. 오후 1:26:22
 * mospa.sd1.rcvfvrSvcGuidance.dao.impl.TnQualfInfoRequstRsltDaoImpl
 * Desc : 자격 정보 요청 결과
 */
@Repository
public class TnQualfInfoRequstRsltDaoImpl extends GenericDaoSupport<TnQualfInfoRequstRsltVo> implements TnQualfInfoRequstRsltDao {

	@Autowired
	@Qualifier("newSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	//연계 요청후 처리되는 건수
	@Override
	public int selectTnQualfReciptInfoRequstRsltCnt(TnQualfInfoRequstRsltVo vo) {
		return getSqlSession().selectOne("tnQualfInfoRequstRslt.selectTnQualfReciptInfoRequstRsltCnt",vo);
	}

	//연계 요청후 처리되는 건수 합계
	@Override
	public int selectTnQualfReciptInfoRequstRsltSumCnt(TnQualfInfoRequstRsltVo vo) {
		return getSqlSession().selectOne("tnQualfInfoRequstRslt.selectTnQualfReciptInfoRequstRsltSumCnt",vo);
	}

	//보훈처 연계 요청후 처리되는 건수
	@Override
	public int selectTnQualfReciptInfoRequstRsltBhCnt(TnQualfInfoRequstRsltVo vo) {
		return getSqlSession().selectOne("tnQualfInfoRequstRslt.selectTnQualfReciptInfoRequstRsltBhCnt",vo);
	}

	//보훈처 연계 요청후 처리되는 건수 합계
	@Override
	public int selectTnQualfReciptInfoRequstRsltBhSumCnt(TnQualfInfoRequstRsltVo vo) {
		return getSqlSession().selectOne("tnQualfInfoRequstRslt.selectTnQualfReciptInfoRequstRsltBhSumCnt",vo);
	}
}
