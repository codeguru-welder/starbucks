package kr.go.portal.rcvfvrSvc.rcvfvrSvc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDaoSupport;
import kr.go.portal.rcvfvrSvc.rcvfvrSvc.dao.RcvfvrSvcDao;
import kr.go.portal.rcvfvrSvc.rcvfvrSvc.vo.RcvfvrSvcVo;

@Repository
public class RcvfvrSvcDaoImpl extends GenericPageDaoSupport<RcvfvrSvcVo> implements RcvfvrSvcDao {

	@Autowired
	@Qualifier("newSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public RcvfvrSvcVo selectRcvfvrSvc(RcvfvrSvcVo vo) {
		return getSqlSession().selectOne("rcvfvrSvc.selectRcvfvrSvc", vo);
	}

	public RcvfvrSvcVo selectFrmeSet(RcvfvrSvcVo vo) {
		return getSqlSession().selectOne("rcvfvrSvc.selectFrmeSet", vo);
	}

	public List<RcvfvrSvcVo> selectMemorRegLsInfo(RcvfvrSvcVo vo) {
		return getSqlSession().selectList("rcvfvrSvc.selectMemorRegLsInfo", vo);
	}
	
	public List<RcvfvrSvcVo> selectAdmrulInfo(RcvfvrSvcVo vo) {
		return getSqlSession().selectList("rcvfvrSvc.selectAdmrulInfo", vo);
	}
	
	public List<RcvfvrSvcVo> selectAmllInfo(RcvfvrSvcVo vo) {
		return getSqlSession().selectList("rcvfvrSvc.selectAmllInfo", vo);
	}
	
	public List<RcvfvrSvcVo> selectLsInfo(RcvfvrSvcVo vo) {
		return getSqlSession().selectList("rcvfvrSvc.selectLsInfo", vo);
	}
	
	public void insertVwCnt(String index) {
		getSqlSession().insert("rcvfvrSvc.insertVwCnt", index);
	}
	
	public int selectVwCnt(String index){
		return getSqlSession().selectOne("rcvfvrSvc.selectVwCnt", index);
	}
	
	public void updateVwCnt(String index){
		getSqlSession().update("rcvfvrSvc.updateVwCnt", index);
	}
	
	public void insertRcvfvrSvcStsfdgEvl(RcvfvrSvcVo vo){
		getSqlSession().insert("rcvfvrSvc.insertRcvfvrSvcStsfdgEvl", vo);
	}
	
	public int selectRcvfvrSvcStsfdgEvl (RcvfvrSvcVo vo) throws Exception{
		return getSqlSession().selectOne("rcvfvrSvc.selectRcvfvrSvcStsfdgEvl", vo);
	}
	
	public void updateEventStsfdgEvl(RcvfvrSvcVo vo){
		getSqlSession().update("rcvfvrSvc.updateEventStsfdgEvl", vo);
	}
	
	public List<RcvfvrSvcVo> selectSvcRefrncList(RcvfvrSvcVo vo){
		return getSqlSession().selectList("rcvfvrSvc.selectSvcRefrncList", vo);
	}
}
