package kr.go.portal.rcvfvrSvc.mySvc.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.page.Page;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDao;
import kr.go.portal.rcvfvrSvc.mySvc.vo.MySvcVo;

public interface MySvcDao extends GenericPageDao<MySvcVo> {

	/**
	 * 정보조회
	 *
	 * @param vo
	 * @return MySvcVo
	 */
	public MySvcVo selectUserInfo(String usrId) throws Exception;

	/**
	 * 민원요청번호
	 *
	 * @return String
	 */
	public String selectMaxGuidanceNo() throws Exception;

	/**
	 * 민원 요청 등록
	 *
	 * @param vo
	 * @return int
	 */
	public int insertRcvfvrGuidanceCvplRequst(HashMap hMap) throws Exception;

	/**
	 * 민원 요청 등록(검증용)
	 *
	 * @param vo
	 * @return int
	 */
	public int insertRcvfvrGuidanceCvplVrifyRequst(HashMap hMap) throws Exception;

	/**
	 * 수혜 서비스 결과 조회
	 *
	 * @param vo
	 * @return List<vo>
	 */
	public MySvcVo selectRcvfvrSvcRsltVw1(MySvcVo vo) throws Exception;

	/**
	 * 수혜 서비스 결과 조회
	 *
	 * @param vo
	 * @return List<vo>
	 */
	public List<MySvcVo> selectRcvfvrSvcRsltVw2(MySvcVo vo) throws Exception;

	/**
	 * 민원인 일련번호 조회
	 *
	 * @param vo
	 * @return String
	 */
	public String selectCpttrSeqVw(MySvcVo vo) throws Exception;

	/**
	 * 민원인 일련번호 생성 조회
	 *
	 * @param vo
	 * @return String
	 */
	public String selectCpttrSeqPrdtVw() throws Exception;

	/**
	 * 민원인 정보 저장
	 *
	 * @param vo
	 * @return int
	 */
	public int insertCpttrInfoSav(MySvcVo vo) throws Exception;

	/**
	 * 민원인 정보 수정
	 *
	 * @param vo
	 * @return int
	 */
	public int updateCpttrInfoSav(MySvcVo vo) throws Exception;
	
	/**
	 * 연계 상태 확인
	 * @return
	 * @throws Exception
	 */
	public MySvcVo selectLnkSttus(String ntcClsCd) throws Exception;
	
	/**
	 * 요청번호 별 연계 장애 안내
	 * @param cvplRequstNo
	 * @return
	 * @throws Exception
	 */
	public MySvcVo selectErrList(String cvplRequstNo) throws Exception;
	
	/**
	 * 보조금24 화면 접속 이력 등록
	 *
	 * @param vo
	 * @return int
	 */
	public int insertUrl(MySvcVo vo) throws Exception;
	
	/**
	 * 접속제어 최대 건수 조회
	 *
	 * @param vo
	 * @return MySvcVo
	 */
	public MySvcVo selectRemoteMaxCnt(MySvcVo vo) throws Exception;
	
	/**
	 * 맞춤혜택 서비스 305종
	 * @param mySvcVo
	 * @return
	 * @throws Exception
	 */
	public Page<MySvcVo> selectFixesSvc(MySvcVo mySvcVo) throws Exception;
	
	/**
	 * 온라인 신청
	 * @param mySvcVo
	 * @return
	 * @throws Exception
	 */
	public Page<MySvcVo> selectReqstSvc(MySvcVo mySvcVo) throws Exception;
}
