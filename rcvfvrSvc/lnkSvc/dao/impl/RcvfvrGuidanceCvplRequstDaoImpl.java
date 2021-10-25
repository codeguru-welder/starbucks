/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDaoSupport;
import kr.go.portal.onlnreqst.vo.CvplRequstVo;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.RcvfvrGuidanceCvplRequstDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.RcvfvrGuidanceCvplRequstVo;

/**
 * @author jjh
 * 2020. 8. 3. 오후 1:37:13
 * mospa.sd1.rcvfvrSvcGuidance.dao.impl.RcvfvrGuidanceCvplRequstDaoImpl
 * Desc :
 */
@Repository
public class RcvfvrGuidanceCvplRequstDaoImpl  extends GenericPageDaoSupport<RcvfvrGuidanceCvplRequstVo> implements RcvfvrGuidanceCvplRequstDao {

	@Autowired
	@Qualifier("newSqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public String selectMaxGuidanceNo() {
		return getSqlSession().selectOne("rcvfvrGuidanceCvplRequst.selectMaxGuidanceNo");
	}

	@Override
	public HashMap callSpQualfReciptMapng(HashMap vo){
		return getSqlSession().selectOne("rcvfvrGuidanceCvplRequst.callSpQualfReciptMapng", vo);
	}

	@Override
	public HashMap callSpQualfReciptMapngVrify(HashMap vo){
		return getSqlSession().selectOne("rcvfvrGuidanceCvplRequst.callSpQualfReciptMapngVrify", vo);
	}


	/**
     * 진행 중인 민원 요청 건수 조회
     *
     * @param cvplRequstVo {@link CvplRequstVo}
     * @return 진행 중인 민원 요청 건수
     */
    @Override
    public int selectOpenCvplRequstCnt(RcvfvrGuidanceCvplRequstVo vo){
    	return getSqlSession().selectOne("rcvfvrGuidanceCvplRequst.selectOpenCvplRequstCnt",vo);
    }

    /**
     * 민원 요청 상태 변경
     *
     * @param cvplRequstVo {@link RcvfvrGuidanceCvplRequstVo}
     */
    @Override
    public void updateCvplRequstSttusCd(RcvfvrGuidanceCvplRequstVo vo){
    	getSqlSession().update("rcvfvrGuidanceCvplRequst.updateCvplRequstSttusCd", vo);
    }
    
    @Override
	public List<RcvfvrGuidanceCvplRequstVo> selectSendPersonsList(RcvfvrGuidanceCvplRequstVo cvplRequstVo) {
        return getSqlSession().selectList("rcvfvrGuidanceCvplRequst.selectSendPersonsList", cvplRequstVo);
	}
    
    @Override
    public String selectCntLnkId(RcvfvrGuidanceCvplRequstVo cvplRequstVo) {
    	return getSqlSession().selectOne("rcvfvrGuidanceCvplRequst.selectCntLnkId", cvplRequstVo);
   	}
    
    @Override
	public List<RcvfvrGuidanceCvplRequstVo> selectSendPersonsListMois(RcvfvrGuidanceCvplRequstVo cvplRequstVo) {
        return getSqlSession().selectList("rcvfvrGuidanceCvplRequst.selectSendPersonsListMois", cvplRequstVo);
	}
    
    @Override
   	public void updateCvplRequstClsCd(RcvfvrGuidanceCvplRequstVo cvplRequstVo) {
    	getSqlSession().update("rcvfvrGuidanceCvplRequst.updateCvplRequstClsCd", cvplRequstVo);
   	}
    
    @Override
    public void updateCvplIhidnum(RcvfvrGuidanceCvplRequstVo vo){
    	getSqlSession().update("rcvfvrGuidanceCvplRequst.updateCvplIhidnum", vo);
    }
    
    @Override
    public void deleteReciptInfoRequstRslt(RcvfvrGuidanceCvplRequstVo vo){
    	getSqlSession().delete("rcvfvrGuidanceCvplRequst.deleteReciptInfoRequstRslt", vo);
    }
    
    @Override
    public void updateReciptInfoRequst(RcvfvrGuidanceCvplRequstVo vo){
    	getSqlSession().delete("rcvfvrGuidanceCvplRequst.updateReciptInfoRequst", vo);
    }
}
