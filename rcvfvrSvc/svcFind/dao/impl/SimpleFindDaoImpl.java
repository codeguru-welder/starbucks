package kr.go.portal.rcvfvrSvc.svcFind.dao.impl;

import org.apache.ibatis.page.Page;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDaoSupport;
import kr.go.portal.rcvfvrSvc.svcFind.dao.SimpleFindDao;
import kr.go.portal.rcvfvrSvc.svcFind.vo.SimpleFindVo;

/** 
 * @author NS-SG-03
 * @since 2020. 9. 2.
 * @version 1.0
 */

@Repository
public class SimpleFindDaoImpl extends GenericPageDaoSupport<SimpleFindVo> implements SimpleFindDao {
	@Autowired
	@Qualifier("newSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	/**
	 * 간편찾기 결과 리스트
	 * @param simpleFindVo
	 * @return
	 */
	public Page<SimpleFindVo> selectSimpleFindList(SimpleFindVo simpleFindVo) {
		return getSqlSession().selectPage("svcFind.selectSimpleFindList", simpleFindVo);
	}
	
	public void insertSimpleFindResult(SimpleFindVo vo){
		getSqlSession().insert("svcFind.insertSimpleFindResult", vo);
	}
	
	public int selectBnefVwSeq(){
		return getSqlSession().selectOne("svcFind.selectBnefVwSeq");
	}
}
