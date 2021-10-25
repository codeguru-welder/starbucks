package kr.go.portal.rcvfvrSvc.mySvc.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDaoSupport;
import kr.go.portal.rcvfvrSvc.mySvc.dao.MySvcOracleDao;
import kr.go.portal.rcvfvrSvc.mySvc.vo.MySvcVo;

@Repository
public class MySvcOracleDaoImpl extends GenericPageDaoSupport<MySvcVo> implements MySvcOracleDao {

	@Autowired
	@Qualifier("oracleSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public MySvcVo selectAgreYn(MySvcVo vo) {
		return getSqlSession().selectOne("mySvc.selectAgreYn", vo);
	}

	public List<MySvcVo> selectReqstSttus(MySvcVo vo) {
		return getSqlSession().selectList("mySvc.selectReqstSttus", vo);
	}

	public List<MySvcVo> selectReqstDtls(MySvcVo vo) {
		return getSqlSession().selectList("mySvc.selectReqstDtls", vo);
	}

	public int updateFixessvcAgreCancl(String userId) {
		return getSqlSession().update("mySvc.updateFixessvcAgreCancl", userId);
	}

	public int selectFixessvcAgre(String userId) {
		return getSqlSession().selectOne("mySvc.selectFixessvcAgre", userId);
	}

	public int updateFixessvcAgre(HashMap hMap) {
		return getSqlSession().update("mySvc.updateFixessvcAgre", hMap);
	}

	public int insertFixessvcAgre(HashMap hMap) {
		return getSqlSession().insert("mySvc.insertFixessvcAgre", hMap);
	}

	public String selectDataDec(String data) {
		return getSqlSession().selectOne("mySvc.selectDataDec", data);
	}

}
