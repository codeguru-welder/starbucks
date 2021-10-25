package kr.go.portal.rcvfvrSvc.rcvfvrSvc.dao;

import java.util.List;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDao;
import kr.go.portal.rcvfvrSvc.rcvfvrSvc.vo.RcvfvrSvcVo;

public interface RcvfvrSvcDao extends GenericPageDao<RcvfvrSvcVo> {

	/**
	 * 서비스 조회
	 *
	 * @param vo
	 * @return vo
	 */
	public RcvfvrSvcVo selectRcvfvrSvc(RcvfvrSvcVo vo) throws Exception;

	/**
	 * 프레임 설정 조회
	 *
	 * @param vo
	 * @return vo
	 */
	public RcvfvrSvcVo selectFrmeSet(RcvfvrSvcVo vo) throws Exception;

	/**
	 * 관련 수기법령 조회
	 *
	 * @param vo
	 * @return List<vo>
	 */
	public List<RcvfvrSvcVo> selectMemorRegLsInfo(RcvfvrSvcVo vo) throws Exception;
	
	/**
	 * 관련 행정규칙 조회
	 *
	 * @param vo
	 * @return List<vo>
	 */
	public List<RcvfvrSvcVo> selectAdmrulInfo(RcvfvrSvcVo vo) throws Exception;
	
	/**
	 * 관련 자치법규 조회
	 *
	 * @param vo
	 * @return List<vo>
	 */
	public List<RcvfvrSvcVo> selectAmllInfo(RcvfvrSvcVo vo) throws Exception;
	
	/**
	 * 관련 법령 조회
	 *
	 * @param vo
	 * @return List<vo>
	 */
	public List<RcvfvrSvcVo> selectLsInfo(RcvfvrSvcVo vo) throws Exception;
	
	/**
	 * 서비스 상세 조회수 추가
	 * @param index
	 * @throws Exception
	 */
	public void insertVwCnt(String index) throws Exception; 
	
	/**
	 * 서비스 상세 조회수 조회
	 * @param index
	 * @return
	 * @throws Exception
	 */
	public int selectVwCnt(String index) throws Exception;

	/**
	 * 서비스 상세 조회수 추가
	 * @param index
	 * @throws Exception
	 */
	public void updateVwCnt(String index) throws Exception;
	
	/**
	 * 만족도 평가
	 * @param vo
	 * @throws Exception
	 */
	public void insertRcvfvrSvcStsfdgEvl(RcvfvrSvcVo vo) throws Exception;

	/**
	 * 만족도 평가 select
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectRcvfvrSvcStsfdgEvl(RcvfvrSvcVo vo) throws Exception;
	
	/**
	 * 이벤트 응모 update
	 * @param vo
	 * @throws Exception
	 */
	public void updateEventStsfdgEvl(RcvfvrSvcVo vo) throws Exception;
	
	/**
	 * 문의처 select
	 * @param svcRefrncVo
	 * @return
	 */
	public List<RcvfvrSvcVo> selectSvcRefrncList(RcvfvrSvcVo svcRefrncVo);
}
