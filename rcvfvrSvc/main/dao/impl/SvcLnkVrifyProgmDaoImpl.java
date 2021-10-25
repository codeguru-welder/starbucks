package kr.go.portal.rcvfvrSvc.main.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDaoSupport;
import kr.go.portal.rcvfvrSvc.main.dao.SvcLnkVrifyProgmDao;
import kr.go.portal.rcvfvrSvc.main.vo.SvcLnkVrifyProgmVo;

/**
 * @author NS-SG-03
 * @since 2020. 10. 13.
 * @version 1.0
 */

@Repository
public class SvcLnkVrifyProgmDaoImpl extends GenericPageDaoSupport<SvcLnkVrifyProgmVo> implements SvcLnkVrifyProgmDao {

	@Autowired
	@Qualifier("newSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	/**
	 * 서비스 연계 리스트
	 * @param svcLnkVrifyProgmVo
	 * @return
	 */
	public List<SvcLnkVrifyProgmVo> selectSvcLnkVrifyProgmList(SvcLnkVrifyProgmVo svcLnkVrifyProgmVo) {
		return getSqlSession().selectList("svcLnkVrifyProgm.selectSvcLnkVrifyProgmList", svcLnkVrifyProgmVo);
	}
}
