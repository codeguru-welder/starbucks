package kr.go.portal.rcvfvrSvc.rcvfvrSvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.go.portal.rcvfvrSvc.rcvfvrSvc.dao.RcvfvrSvcDao;
import kr.go.portal.rcvfvrSvc.rcvfvrSvc.vo.RcvfvrSvcVo;

@Service
@Transactional(rollbackFor = Exception.class)
public class RcvfvrSvcService {

	@Autowired
	private RcvfvrSvcDao rcvfvrSvcDao;

	/**
	 * 서비스 조회
	 *
	 * @param vo
	 * @return vo
	 * @throws Exception
	 */
	public RcvfvrSvcVo getRcvfvrSvc(RcvfvrSvcVo vo) throws Exception {
		return rcvfvrSvcDao.selectRcvfvrSvc(vo);
	}

	/**
	 *
	 *
	 *
	 * @param vo
	 * @return vo
	 * @throws Exception
	 */
	public RcvfvrSvcVo getFrmeSet(RcvfvrSvcVo vo) throws Exception {
		return rcvfvrSvcDao.selectFrmeSet(vo);
	}

	/**
	 * 관련 수기등록 법령 조회
	 *
	 * @param vo
	 * @return List<vo>
	 * @throws Exception
	 */
	public List<RcvfvrSvcVo> selectMemorRegLsInfo(RcvfvrSvcVo vo) throws Exception {
		return rcvfvrSvcDao.selectMemorRegLsInfo(vo);
	}
	
	/**
	 * 관련 행정규칙 조회
	 *
	 * @param vo
	 * @return List<vo>
	 * @throws Exception
	 */
	public List<RcvfvrSvcVo> selectAdmrulInfo(RcvfvrSvcVo vo) throws Exception {
		return rcvfvrSvcDao.selectAdmrulInfo(vo);
	}
	
	/**
	 * 관련 자치법규 조회
	 *
	 * @param vo
	 * @return List<vo>
	 * @throws Exception
	 */
	public List<RcvfvrSvcVo> selectAmllInfo(RcvfvrSvcVo vo) throws Exception {
		return rcvfvrSvcDao.selectAmllInfo(vo);
	}
	
	/**
	 * 관련 법령 조회
	 *
	 * @param vo
	 * @return List<vo>
	 * @throws Exception
	 */
	public List<RcvfvrSvcVo> selectLsInfo(RcvfvrSvcVo vo) throws Exception {
		return rcvfvrSvcDao.selectLsInfo(vo);
	}
	
	
	/**
	 * 서비스 조회수 select
	 * @param index
	 * @return
	 * @throws Exception
	 */
	public void selectVwCnt(String index) throws Exception{
		int cnt = rcvfvrSvcDao.selectVwCnt(index);
		if(cnt == -1){
			rcvfvrSvcDao.insertVwCnt(index);
		}else{
			rcvfvrSvcDao.updateVwCnt(index);
		}		
	}
	
	/**
	 * 만족도 평가 insert
	 * @param vo
	 * @throws Exception
	 */
	public void insertRcvfvrSvcStsfdgEvl(RcvfvrSvcVo vo) throws Exception {
		rcvfvrSvcDao.insertRcvfvrSvcStsfdgEvl(vo);
	}
	
	/**
	 * 만족도 평가 select
	 * @param vo
	 * @return
	 * @throws Exception 
	 */
	public int selectRcvfvrSvcStsfdgEvl(RcvfvrSvcVo vo) throws Exception{
		return rcvfvrSvcDao.selectRcvfvrSvcStsfdgEvl(vo);
	}

	/**
	 * 이벤트 응모 update
	 * @param vo
	 * @throws Exception
	 */
	public void updateEventStsfdgEvl(RcvfvrSvcVo vo) throws Exception{
		rcvfvrSvcDao.updateEventStsfdgEvl(vo);
	}
	
	/**
     * 서비스 문의처 목록 조회
     *
     * @param svcRefrncVo {@link SvcRefrncVo} 서비스 문의처 VO
     * @return SvcRefrncVo 조회 결과
     */
	public List<RcvfvrSvcVo> selectSvcRefrncList(RcvfvrSvcVo svcRefrncVo) {
		return rcvfvrSvcDao.selectSvcRefrncList(svcRefrncVo);
	}
}
