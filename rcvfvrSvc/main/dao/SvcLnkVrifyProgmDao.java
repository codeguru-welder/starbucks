package kr.go.portal.rcvfvrSvc.main.dao;

import java.util.List;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDao;
import kr.go.portal.rcvfvrSvc.main.vo.SvcLnkVrifyProgmVo;

/**
 * @author NS-SG-03
 * @since 2020. 10. 13.
 * @version 1.0
 */


public interface SvcLnkVrifyProgmDao extends GenericPageDao<SvcLnkVrifyProgmVo> {
	
	/**
	 * 서비스 연계 리스트
	 * @param svcLnkVrifyProgmVo
	 * @return
	 */
	List<SvcLnkVrifyProgmVo> selectSvcLnkVrifyProgmList(SvcLnkVrifyProgmVo svcLnkVrifyProgmVo);
}
