package kr.go.portal.rcvfvrSvc.mySvc.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.opensns.hanta.common.genericmvc.GenericPageDao;
import kr.go.portal.rcvfvrSvc.mySvc.vo.MySvcVo;

public interface MySvcOracleDao extends GenericPageDao<MySvcVo> {

	/**
	 * 동의 여부 조회
	 *
	 * @param vo
	 * @return String
	 */
	public MySvcVo selectAgreYn(MySvcVo vo) throws Exception;

	/**
	 * 신청 현황
	 *
	 * @param vo
	 * @return List<vo>
	 */
	public List<MySvcVo> selectReqstSttus(MySvcVo vo) throws Exception;

	/**
	 * 신청 내역
	 *
	 * @param vo
	 * @return List<vo>
	 */
	public List<MySvcVo> selectReqstDtls(MySvcVo vo) throws Exception;

	/**
	 * 맞춤서비스 동의 취소
	 *
	 * @param String
	 * @return int
	 */
	public int updateFixessvcAgreCancl(String userId) throws Exception;

	/**
	 * 맞춤서비스 동의 조회
	 *
	 * @param String
	 * @return int
	 */
	public int selectFixessvcAgre(String userId) throws Exception;

	/**
	 * 맞춤서비스 동의 수정
	 *
	 * @param String
	 * @return int
	 */
	public int updateFixessvcAgre(HashMap hMap) throws Exception;

	/**
	 * 맞춤서비스 동의 저장
	 *
	 * @param String
	 * @return int
	 */
	public int insertFixessvcAgre(HashMap hMap) throws Exception;

	/**
	 * 데이터 복호화
	 *
	 * @param String
	 * @return String
	 */
	public String selectDataDec(String data) throws Exception;

}
