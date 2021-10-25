package kr.go.portal.rcvfvrSvc.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.go.portal.rcvfvrSvc.main.dao.SvcLnkVrifyProgmDao;
import kr.go.portal.rcvfvrSvc.main.vo.SvcLnkVrifyProgmVo;
import kr.go.portal.rcvfvrSvc.main.vo.SvcLnkVrifyVo;

/**
 * @author NS-SG-03
 * @since 2020. 10. 13.
 * @version 1.0
 */

@Service
@Transactional(rollbackFor = Exception.class)
public class SvcLnkVrifyProgmService {

	@Autowired
	private SvcLnkVrifyProgmDao svcLnkVrifyProgmDao;

	/**
	 * 서비스 연계 리스트
	 * @param SvcLnkVrifyProgmVo
	 * @return
	 */
	public List<SvcLnkVrifyProgmVo> selectSvcLnkVrifyProgmList(SvcLnkVrifyProgmVo svcLnkVrifyProgmVo) {
        return svcLnkVrifyProgmDao.selectSvcLnkVrifyProgmList(svcLnkVrifyProgmVo);
    }

	/**
	 * 서비스 연계 리스트 등록
	 * @param SvcLnkVrifyProgmVo
	 * @return
	 */
	public void insertSvcLnkVrifyProgmList(SvcLnkVrifyVo svcLnkVrifyVo){
    	for (SvcLnkVrifyProgmVo svcLnkVrifyProgmVo : svcLnkVrifyVo.getVoList()) {
    		svcLnkVrifyProgmVo.setGuidanceNo(svcLnkVrifyVo.getGuidanceNo());
    		svcLnkVrifyProgmDao.insert(svcLnkVrifyProgmVo);
    	}
	}

}
