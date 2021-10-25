package kr.go.portal.rcvfvrSvc.mySvc.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.page.Page;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDaoSupport;
import kr.go.portal.rcvfvrSvc.mySvc.dao.MySvcDao;
import kr.go.portal.rcvfvrSvc.mySvc.vo.MySvcVo;

@Repository
public class MySvcDaoImpl extends GenericPageDaoSupport<MySvcVo> implements MySvcDao {

	@Autowired
	@Qualifier("newSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public MySvcVo selectUserInfo(String usrId) {
		return getSqlSession().selectOne("mySvc.selectUserInfo", usrId);
	}

	public String selectMaxGuidanceNo() {
		return getSqlSession().selectOne("mySvc.selectMaxGuidanceNo");
	}

	public int insertRcvfvrGuidanceCvplRequst(HashMap hMap) {
		return getSqlSession().insert("mySvc.insertRcvfvrGuidanceCvplRequst", hMap);
	}

	public int insertRcvfvrGuidanceCvplVrifyRequst(HashMap hMap) {
		return getSqlSession().insert("mySvc.insertRcvfvrGuidanceCvplVrifyRequst", hMap);
	}

	public MySvcVo selectRcvfvrSvcRsltVw1(MySvcVo vo) {
		return getSqlSession().selectOne("mySvc.selectRcvfvrSvcRsltVw1", vo);
	}

	public List<MySvcVo> selectRcvfvrSvcRsltVw2(MySvcVo vo) {
		return getSqlSession().selectList("mySvc.selectRcvfvrSvcRsltVw2", vo);
	}

	public String selectCpttrSeqVw(MySvcVo vo) {
		return getSqlSession().selectOne("mySvc.selectCpttrSeqVw", vo);
	}

	public String selectCpttrSeqPrdtVw() {
		return getSqlSession().selectOne("mySvc.selectCpttrSeqPrdtVw");
	}

	public int insertCpttrInfoSav(MySvcVo vo) {
		return getSqlSession().insert("mySvc.insertCpttrInfoSav", vo);
	}

	public int updateCpttrInfoSav(MySvcVo vo) {
		return getSqlSession().insert("mySvc.updateCpttrInfoSav", vo);
	}

	public MySvcVo selectLnkSttus(String ntcClsCd){
		return getSqlSession().selectOne("mySvc.selectLnkSttus", ntcClsCd);
	}
	
	public MySvcVo selectErrList(String cvplRequstNo){
		return getSqlSession().selectOne("mySvc.selectErrList", cvplRequstNo);
	}
	
	public int insertUrl(MySvcVo vo) {
		return getSqlSession().insert("mySvc.insertUrl", vo);
	}
	
	public MySvcVo selectRemoteMaxCnt(MySvcVo vo) {
		return getSqlSession().selectOne("mySvc.selectRemoteMaxCnt", vo);
	}
	
	public Page<MySvcVo> selectFixesSvc(MySvcVo mySvcVo){
		return getSqlSession().selectPage("mySvc.selectFixesSvc", mySvcVo);
	}
	
	public Page<MySvcVo> selectReqstSvc(MySvcVo mySvcVo){
		return getSqlSession().selectPage("mySvc.selectReqstSvc", mySvcVo);
	}
}
