package kr.go.portal.rcvfvrSvc.mySvc.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.page.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lg.g4c.capp.lib.entity.Entity;

import kr.go.portal.rcvfvrSvc.mySvc.dao.MySvcDao;
import kr.go.portal.rcvfvrSvc.mySvc.dao.MySvcOracleDao;
import kr.go.portal.rcvfvrSvc.mySvc.vo.MySvcVo;
import mospa.common.constants.Code;
import net.sf.json.JSONObject;

@Service
@Transactional(rollbackFor = Exception.class)
public class MySvcService {

	@Autowired
	private MySvcDao mySvcDao;

	@Autowired
	private MySvcOracleDao mySvcOracleDao;

	///////////////////////////////////////////// 나의 맞춤혜택

	/**
     * AES 암복호화 Key
     */
    @Value("#{resourceProperties['sdbapi.conf.file.path']}")
    private String sdbapiConfFilePath;

	/**
	 * 동의 여부 조회
	 *
	 * @param vo
	 * @return String
	 * @throws Exception
	 */
	public MySvcVo getAgreYn(MySvcVo vo) throws Exception {
		return mySvcOracleDao.selectAgreYn(vo);
	}

	/**
	 * 정보 조회
	 *
	 * @param vo
	 * @return MySvcVo
	 * @throws Exception
	 */
	public MySvcVo getUserInfo(String usrId) throws Exception {
		return mySvcDao.selectUserInfo(usrId);
	}

	/**
	 * 민원요청 번호 생성
	 *
	 * @param String
	 * @return String
	 * @throws Exception
	 */
	public String setMaxGuidanceNo() throws Exception {
		return mySvcDao.selectMaxGuidanceNo();
	}

	/**
	 * 민원요청정보 등록
	 *
	 * @param String
	 * @return String
	 * @throws Exception
	 */
	public String setRcvfvrGuidanceCvplRequst(String id, String mo) throws Exception {
		HashMap<String, String> hMap = new HashMap<String, String>();

		hMap.put("cpttrId", id);
		hMap.put("cvplRequstGuidanceNo", this.setMaxGuidanceNo());
		hMap.put("mobileYn", mo);

		// 민원 요청 등록
		mySvcDao.insertRcvfvrGuidanceCvplRequst(hMap);

		return hMap.get("cvplRequstGuidanceNo");
	}

	/**
	 * 민원요청정보 등록(검증용)
	 *
	 * @param String
	 * @return String
	 * @throws Exception
	 */
	public void setRcvfvrGuidanceCvplVrifyRequst(String nm, String rrn1, String rrn2, String no) throws Exception {
		MySvcVo mVo = new MySvcVo();
		HashMap<String, String> hMap = new HashMap<String, String>();

    	ShaPasswordEncoder enc = new ShaPasswordEncoder(256);
    	enc.setEncodeHashAsBase64(true);
    	String rrn = enc.encodePassword(rrn1+rrn2, null);

    	mVo.setIhidnumSimplx(rrn);
    	String cpttrSeq = mySvcDao.selectCpttrSeqVw(mVo);

    	if("".equals(cpttrSeq) || cpttrSeq == null) {
    		mVo.setCpttrNm(nm);
    		cpttrSeq = mySvcDao.selectCpttrSeqPrdtVw();
    		mVo.setCpttrSeq(cpttrSeq);

            if (rrn2.startsWith("9") || rrn2.startsWith("0")) {
            	mVo.setCpttrBrthdy("18" + rrn1);
            } else if (rrn2.startsWith("1") || rrn2.startsWith("2")
                    || rrn2.startsWith("5") || rrn2.startsWith("6")) {
            	mVo.setCpttrBrthdy("19" + rrn1);
            } else if (rrn2.startsWith("3") || rrn2.startsWith("4")
                    || rrn2.startsWith("7") || rrn2.startsWith("8")) {
            	mVo.setCpttrBrthdy("20" + rrn1);
            }

            if (Integer.parseInt(rrn2.substring(0, 1)) % 2 == 1) {
                mVo.setCpttrSexCd(Code.성별.남자);
            } else {
            	mVo.setCpttrSexCd(Code.성별.여자);
            }

            mVo.setIhidnumBdrcl(rrn1+rrn2);

            mySvcDao.insertCpttrInfoSav(mVo);
    	}

		hMap.put("cpttrSeq", cpttrSeq);
		hMap.put("IhidnumSimplx", rrn);
		hMap.put("cvplRequstGuidanceNo", no);

		// 민원 요청 등록
		mySvcDao.insertRcvfvrGuidanceCvplVrifyRequst(hMap);
	}

	/**
	 * 수혜서비스 결과 조회 1
	 *
	 * @param vo
	 * @return HashMap
	 * @throws Exception
	 */
	public MySvcVo getRcvfvrSvcRsltVw1(MySvcVo vo) throws Exception {
		return mySvcDao.selectRcvfvrSvcRsltVw1(vo);
	}

	/**
	 * 수혜서비스 결과 조회 2
	 *
	 * @param vo
	 * @return HashMap
	 * @throws Exception
	 */
	public List<MySvcVo> getRcvfvrSvcRsltVw2(MySvcVo vo) throws Exception {
		return mySvcDao.selectRcvfvrSvcRsltVw2(vo);
	}

	/*
	 * 맞춤서비스 동의 취소
	 *
	 * @param vo
	 * @return HashMap
	 * @throws Exception
	 */
	public String setFixessvcAgreCancl(String userId) throws Exception {
		String result = "FAIL";

		int cnt = mySvcOracleDao.updateFixessvcAgreCancl(userId);

		if(cnt > 0) result = "SUCCESS";
		return result;
	}

	/**
	 * 맞춤서비스 동의
	 *
	 * @param vo
	 * @return HashMap
	 * @throws Exception
	 */
	public String setFixessvcAgre(Entity userInfo, String agreeSttusCd) throws Exception {
		String result = "FAIL";

		String userId = this.getEntityInfo(userInfo, "USER_ID");

		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("userId", userId);
		hMap.put("nsUnder14AgreeYn", agreeSttusCd);
		
		int uCnt = mySvcOracleDao.updateFixessvcAgre(hMap);
		if(uCnt > 0) result = "SUCCESS";

		return result;
	}

	public String getEntityInfo(Entity info, String key) {
		String result = "";

		if(info.get(key) != null){
			result = info.get(key).toString();
		}

		return result;
	}

	/**
	 * 단방향 암호화
	 *
	 * @param String
	 * @return void
	 * @throws Exception
	 */
	public String setSimplxEncpt(String data) {
		ShaPasswordEncoder enc = new ShaPasswordEncoder(256);
    	enc.setEncodeHashAsBase64(true);

    	return enc.encodePassword(data, null);
	}

	/**
	 * 민원인 조회
	 *
	 * @param vo
	 * @return String
	 * @throws Exception
	 */
	public String getCpttrSeqVw(MySvcVo mVo) throws Exception {
		return mySvcDao.selectCpttrSeqVw(mVo);
	}


	/**
	 * 민원인 정보 업데이트
	 *
	 * @param vo
	 * @return String
	 * @throws Exception
	 */
	public void setCpttrInfo(Entity userInfo) throws Exception {

		String rrn = mySvcOracleDao.selectDataDec(this.getEntityInfo(userInfo, "ENC_RRN"));

		MySvcVo mVo = new MySvcVo();
		// 주민등록번호 단방향
		mVo.setIhidnumSimplx(this.setSimplxEncpt(rrn));

		// 주민등록번호 양방향
        mVo.setIhidnumBdrcl(rrn);

		String cpttrSeq = this.getCpttrSeqVw(mVo);

		// 이름
		mVo.setCpttrNm(this.getEntityInfo(userInfo, "USER_NM"));

		// 아이디
		mVo.setCpttrId(this.getEntityInfo(userInfo, "USER_ID"));

		// 사업자번호
		mVo.setBizrno(this.getEntityInfo(userInfo, "BIZNO"));

		// 민원인 상세주소
		mVo.setCpttrDtlAddr(this.getEntityInfo(userInfo, "ADDR1")+" "+this.getEntityInfo(userInfo, "ADDR2"));

		// 휴대폰 번호
		mVo.setMobileNo(this.getEntityInfo(userInfo, "MOBL_TEL"));

		// 이메일
		mVo.setEmail(this.getEntityInfo(userInfo, "EMAIL"));

		// 전화번호
		mVo.setTelNo(this.getEntityInfo(userInfo, "HOME_TELNO_DDD") + this.getEntityInfo(userInfo, "HOME_TELNO_KUK") + this.getEntityInfo(userInfo, "HOME_TELNO_NO"));
		if("".equals(cpttrSeq) || cpttrSeq == null) { // TN_CPTTR INSERT

			// 민원인 일련번호
			cpttrSeq = mySvcDao.selectCpttrSeqPrdtVw();
    		mVo.setCpttrSeq(cpttrSeq);

    		// 생년월일
    		String rrn1 = rrn.substring(0, 6);
    		String rrn2 = rrn.substring(6, 13);

            if (rrn2.startsWith("9") || rrn2.startsWith("0")) {
            	mVo.setCpttrBrthdy("18" + rrn1);
            } else if (rrn2.startsWith("1") || rrn2.startsWith("2")
                    || rrn2.startsWith("5") || rrn2.startsWith("6")) {
            	mVo.setCpttrBrthdy("19" + rrn1);
            } else if (rrn2.startsWith("3") || rrn2.startsWith("4")
                    || rrn2.startsWith("7") || rrn2.startsWith("8")) {
            	mVo.setCpttrBrthdy("20" + rrn1);
            }

            // 성별코드
            if (Integer.parseInt(rrn2.substring(0, 1)) % 2 == 1) {
                mVo.setCpttrSexCd(Code.성별.남자);
            } else {
            	mVo.setCpttrSexCd(Code.성별.여자);
            }

            // 주민등록번호 양방향
            mVo.setIhidnumBdrcl(rrn1+rrn2);

            mySvcDao.insertCpttrInfoSav(mVo);
		} else { // TN_CPTTR UPDATE
			mVo.setCpttrSeq(cpttrSeq);

			mySvcDao.updateCpttrInfoSav(mVo);
		}
	}

	/**
	 * 임시 사용자 체크
	 *
	 * @param vo
	 * @return HashMap
	 * @throws Exception
	 */
	public int getUserCheck(Entity userInfo) throws Exception {
		String userId = this.getEntityInfo(userInfo, "USER_ID");

		return mySvcOracleDao.selectFixessvcAgre(userId);
	}
	
	/**
	 * 연계 상태 확인
	 * @return
	 * @throws Exception
	 */
	public String selectLnkSttus(String ntcClsCd) throws Exception{
		
		MySvcVo mysvcVo = new MySvcVo();
		mysvcVo = mySvcDao.selectLnkSttus(ntcClsCd);
		String result = "";
		JSONObject jObj = new JSONObject();
		
		if(mysvcVo != null){
			result = "Y";
			jObj.put("troblGuidanceCts", mysvcVo.getTroblGuidanceCts());
			jObj.put("stdh", mysvcVo.getEprssStDh());
			jObj.put("eddh", mysvcVo.getEprssEdDh());
		}else{
			result = "N";
		}
		jObj.put("result", result);
		
		return jObj.toString();
	}
	
	/**
	 * 요청번호 별 연계 장애 안내
	 * @param cvplRequstNo
	 * @return
	 * @throws Exception
	 */
	public MySvcVo selectErrList(String cvplRequstNo) throws Exception{
		return mySvcDao.selectErrList(cvplRequstNo);
	}
	
	/**
	 * 보조금24 화면 접속 이력 등록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertUrl(MySvcVo vo) throws Exception{
		return mySvcDao.insertUrl(vo);
	}
	
	/**
	 * 접속제어 최대 건수 조회
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MySvcVo selectRemoteMaxCnt(MySvcVo vo) throws Exception {
		return mySvcDao.selectRemoteMaxCnt(vo);
	}
	
	/**
	 * 맞춤혜택 서비스 305종
	 * @param mySvcVo
	 * @return
	 * @throws Exception
	 */
	public Page<MySvcVo> selectFixesSvc(MySvcVo mySvcVo) throws Exception{
		return mySvcDao.selectFixesSvc(mySvcVo);
	}
	
	/**
	 * 온라인신청
	 * @param mySvcVo
	 * @return
	 * @throws Exception
	 */
	public Page<MySvcVo> selectReqstSvc(MySvcVo mySvcVo) throws Exception{
		return mySvcDao.selectReqstSvc(mySvcVo);
	}
}
