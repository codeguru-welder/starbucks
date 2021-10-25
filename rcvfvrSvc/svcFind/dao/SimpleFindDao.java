package kr.go.portal.rcvfvrSvc.svcFind.dao;

import org.apache.ibatis.page.Page;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDao;
import kr.go.portal.rcvfvrSvc.svcFind.vo.SimpleFindVo;

/** 
 * @author NS-SG-03
 * @since 2020. 9. 2.
 * @version 1.0
 */

public interface SimpleFindDao extends GenericPageDao<SimpleFindVo> {
	
	/**
	 * 간편찾기 결과 리스트
	 * @param simpleFindVo
	 * @return
	 */
	Page<SimpleFindVo> selectSimpleFindList(SimpleFindVo simpleFindVo);
	
	/**
	 * 간편찾기 결과 insert
	 * @param vo
	 */
	void insertSimpleFindResult(SimpleFindVo vo);
	
	int selectBnefVwSeq();
}
