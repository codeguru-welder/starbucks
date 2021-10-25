/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.go.portal.onlnreqst.vo.Cpttr;
import kr.go.portal.onlnreqst.vo.CvplRequstVo;
import kr.go.portal.rcvfvrSvc.common.util.ComUtil;
import kr.go.portal.rcvfvrSvc.common.util.Logs;
import kr.go.portal.rcvfvrSvc.common.util.XmlUtil;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.RcvfvrGuidanceCvplRequstDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.TnCpttrAgremanageDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.TnLnkRequstItmInfoDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.TnQualfInfoLnkInfoDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.TnQualfInfoRequstRsltDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.dao.TnQualfReciptInfoRequstDao;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.RcvfvrGuidanceCvplRequstVo;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnCpttrAgremanageVo;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnLnkRequstItmInfoVo;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnQualfInfoLnkInfoVo;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnQualfInfoRequstRsltVo;
import kr.go.portal.rcvfvrSvc.lnkSvc.vo.TnQualfReciptInfoRequstVo;
import kr.go.portal.rcvfvrSvc.mySvc.dao.MySvcOracleDao;
import kr.go.portal.rcvfvrSvc.mySvc.vo.MySvcVo;
import mospa.common.constants.Code;

/**
 * @author jjh
 * 2020. 7. 24. 오전 10:00:12
 * mospa.sd1.rcvfvrSvcGuidance.service.RcvfvrGuidanceMainService
 * Desc :
 */
//@Transactional(rollbackFor = Exception.class) //, value = "oracleTransactionManager"

@Service
public class RcvfvrGuidanceMainService {

	@Autowired
	private RcvfvrGuidanceCvplRequstDao rcvfvrGuidanceCvplRequstDao;

	@Autowired
	private TnLnkRequstItmInfoDao tnLnkRequstItmInfoDao;

	@Autowired
	private TnQualfInfoLnkInfoDao tnQualfInfoLnkInfoDao;

	@Autowired
	private TnQualfReciptInfoRequstDao tnQualfReciptInfoRequstDao;

	@Autowired
	private TnQualfInfoRequstRsltDao tnQualfInfoRequstRsltDao;

	@Autowired
	private TnCpttrAgremanageDao tnCpttrAgremanageDao;

	@Autowired
	private MySvcOracleDao mySvcOracleDao;
	
	/**
     * sha256 password encoder
     */
    @Autowired
    private ShaPasswordEncoder shaPasswordEncoder;

    /**
     * 연계 url
     */
    @Value("#{resourceProperties['link2020.svr.url']}")
    private String callUrl;

	/**
     * AES 암복호화 Key
     */
    @Value("#{resourceProperties['sdbapi.conf.file.path']}")
    private String sdbapiConfFilePath;

	int sleepTime = 1000;  // 1초 씩
    int sleepCount = 70; // 40번 sleep  21.01.28

	String is14underChildHave = "N";
	String isImParent = "N";
	
	// 검증용 미연계.
  	public String procNoLnk(RcvfvrGuidanceCvplRequstVo cvplRequstVoRcv) {
  		String rtn = "SUCC";

		// 프로시져 호출.
		HashMap paramMap = new HashMap();
		paramMap.put("cvplRequstGuidanceNo", this.selectCvplRequst(cvplRequstVoRcv).getCvplRequstGuidanceNo());
		rcvfvrGuidanceCvplRequstDao.callSpQualfReciptMapng(paramMap);

		rtn = (String) paramMap.get("psMsg");

  		return rtn;
  	}

  	public String procLnkFake(RcvfvrGuidanceCvplRequstVo cvplRequstVoRcv) {
  		String rtn = "SUCC";

		// 프로시져 호출.
		HashMap paramMap = new HashMap();
		paramMap.put("cvplRequstGuidanceNo", this.selectCvplRequst(cvplRequstVoRcv).getCvplRequstGuidanceNo());
		rcvfvrGuidanceCvplRequstDao.callSpQualfReciptMapng(paramMap);

		rtn = (String) paramMap.get("psMsg");

  		return rtn;
  	}

  	public String procLnk(RcvfvrGuidanceCvplRequstVo cvplRequstVoRcv) {
  		String rtn = "";

		// 동의자 use_yn  N 처리용.
		ArrayList agrees = new ArrayList();
		
  		try {

			RcvfvrGuidanceCvplRequstVo cvplRequstVo = this.selectCvplRequst(cvplRequstVoRcv);
			cvplRequstVo.setIhidnum1(cvplRequstVo.getIhidnum().substring(0, 6));
			cvplRequstVo.setIhidnum2(cvplRequstVo.getIhidnum().substring(6));
			setCpttr(cvplRequstVo);

			// 전송일련번호
			String sendTxid = cvplRequstVo.getCvplRequstGuidanceNo() + "10";

			TnQualfReciptInfoRequstVo infoReqVo = new TnQualfReciptInfoRequstVo();
			infoReqVo.setCvplRequstGuidanceNo(cvplRequstVo.getCvplRequstGuidanceNo());
			infoReqVo.setCpttrSeq(cvplRequstVo.getCpttrSeq() + "");
			infoReqVo.setLnkRequstNo(sendTxid);

			// #######################################################
			// 연계 보내기
			HashMap sendDataMap = new HashMap();
			HashMap sendPersonF = new HashMap();
			
			sendPersonF.put("personName",  cvplRequstVo.getCpttrNm());
			sendPersonF.put("juminNo", cvplRequstVo.getIhidnumBdrcl());
			sendPersonF.put("boninGubun", "1");
			sendPersonF.put("sendTxid", sendTxid);
			sendPersonF.put("rowIdx",0);		
			
			// 데이터 리스트
			ArrayList datasF = new ArrayList();			
			List<TnQualfInfoLnkInfoVo> qualfLnksF = null;

			sendDataMap.put("Header_ResponseType", "DB");
			sendDataMap.put("sendTxid", sendTxid);
			sendDataMap.put("Header_TX_ID", sendTxid);
			sendDataMap.put("callUrl", callUrl);
			sendDataMap.put("Header_ShareYN", "Y");
			sendDataMap.put("Header_IF_ID", "IF_P01_GOV_ALL");
			sendDataMap.put("Header_TestYN", "N");
			sendDataMap.put("cpttrNm", cvplRequstVo.getCpttrNm());
			sendDataMap.put("ihidnumBdrcl", cvplRequstVo.getIhidnumBdrcl());

			infoReqVo.setLnkRequstNo(sendTxid);
			infoReqVo.setCpttrSeq(cvplRequstVo.getCpttrSeq()+"");
			infoReqVo.setAgreusrSeq("");
			infoReqVo.setUsrSexCd(cvplRequstVo.getCpttrSexCd());
			String[] lnkIds = new String[]{"I-IF-SCOURT-001","I-IF-MOIS-007"}; // 가족관계등록부, 주민등록등본정보
			infoReqVo.setLinkId(lnkIds);
			
			tnQualfReciptInfoRequstDao.insertTnQualfReciptInfoRequstSelect(infoReqVo);
			
			for (int i = 0; i < lnkIds.length; i++) {
				infoReqVo.setLnkId(lnkIds[i]);
				
				// 연계 보내야될 항목
				TnLnkRequstItmInfoVo sendParamsParam = new TnLnkRequstItmInfoVo();
				sendParamsParam.setLnkId(lnkIds[i]);
				List<TnLnkRequstItmInfoVo> sendParams30 = tnLnkRequstItmInfoDao.selectList(sendParamsParam);
				//Logs.debug("sendParams.size==" + sendParams30.size());

				// 사람 데이터 연계인터페이스 정보
				HashMap person3 = new HashMap();
				person3.put("IF_LIST", infoReqVo.getLnkId());

				// 연계 항목만큼
				for (int j = 0; j < sendParams30.size(); j++) {
					TnLnkRequstItmInfoVo rowSendParam = sendParams30.get(j);
					personPut(rowSendParam, person3, cvplRequstVo.getIhidnumBdrcl(), cvplRequstVo.getCpttrNm(), sendPersonF);
				}

				datasF.add(person3);
			}
			
			// data 에 리스트 담기
			sendDataMap.put("datas", datasF);

			Logs.debug("callUrl==" + callUrl);

			String sendRtnF = "";
			// 연계 전송.
			HttpUrlCall httpCallF = new HttpUrlCall();
			sendRtnF = httpCallF.send(callUrl, sendDataMap);

			Logs.debug("sendRtn==" + sendRtnF);
			
			// 연계 결과 update
			if (sendRtnF.indexOf("False") != -1) {
				infoReqVo.setRequstSuccYn("N");
				infoReqVo.setRequstErrCdCts(sendRtnF);
				tnQualfReciptInfoRequstDao.update(infoReqVo);
				
				Logs.debug("errSendRtn == " + sendRtnF);
				return "False";
			}else if(sendRtnF.startsWith("ERR")){
				infoReqVo.setRequstSuccYn("N");
				infoReqVo.setRequstErrCdCts(sendRtnF);
				tnQualfReciptInfoRequstDao.update(infoReqVo);
				
				Logs.debug("errSendRtn == " + sendRtnF);
				return sendRtnF;
			}else {
				infoReqVo.setRequstSuccYn("Y");
				tnQualfReciptInfoRequstDao.update(infoReqVo);
			}

			infoReqVo.setLinkId(null);

			// 데이터 리스트
			ArrayList datas = new ArrayList();

			List<TnQualfInfoLnkInfoVo> qualfLnks = null;			
			
			// 3번째 연계 보내야될 리스트
			LinkedList<HashMap> sendPersons = new LinkedList<HashMap>();
			
			// 동의 여부 조회
			MySvcVo mSVo = new MySvcVo();
			mSVo.setUserId(cvplRequstVoRcv.getCpttrId());
			mSVo = mySvcOracleDao.selectAgreYn(mSVo);
			
			cvplRequstVo.setSendTxid(sendTxid);
			cvplRequstVo.setAgreeSttusCd(mSVo.getAgreeSttusCd());
			
			Logs.debug("********cvplRequstVo.getAgreeSttusCd():"+cvplRequstVo.getAgreeSttusCd());
			Logs.debug("********cvplRequstVo.getSendTxid():"+cvplRequstVo.getSendTxid());
			Logs.debug("********cvplRequstVo.getIhidnum():"+cvplRequstVo.getIhidnum());
			
			// 연계 결과 갯수 체크 
			String lnkSttus = "";
			
			int cnt=0;
			int maxCount = 70;
			while(true){
				cnt++;
				
				lnkSttus = this.rcvfvrGuidanceCvplRequstDao.selectCntLnkId(cvplRequstVo);

				Logs.debug("********lnkCnt("+cnt+"):"+lnkSttus);

				if("A".equals(lnkSttus) || maxCount == cnt){
					Logs.debug("********break");
					break;
				}
				try {
					Logs.debug(" sleep ... "+cnt);
					Thread.sleep(sleepTime);
				} catch (Exception e) {

				}
			}
			Logs.debug("********LNK_STTUS = " + lnkSttus);
			
			// 연계 정상
			if("A".equals(lnkSttus)){
				List<RcvfvrGuidanceCvplRequstVo> list = null;
				list = this.rcvfvrGuidanceCvplRequstDao.selectSendPersonsList(cvplRequstVo);
				Logs.debug("********list.size() : "+list.size());
				
				if(list != null && list.size() > 0){
					for (int p = 0; p < list.size(); p++) {
						Logs.debug("********list.getPersonName()("+p+"):"+list.get(p).getPersonName());
						Logs.debug("********list.getJuminNo()("+p+"):"+list.get(p).getJuminNo());
						Logs.debug("********list.getHangkikcd()("+p+"):"+list.get(p).getHangkikcd());
						Logs.debug("********list.getBoninGubun()("+p+"):"+list.get(p).getBoninGubun());
					 
						HashMap sendPerson = new HashMap();
						sendPerson.put("personName", (String) list.get(p).getPersonName());
						sendPerson.put("juminNo", (String) list.get(p).getJuminNo());
						sendPerson.put("hangkikcd", (String) list.get(p).getHangkikcd());
						sendPerson.put("boninGubun", (String) list.get(p).getBoninGubun()); // 13 자녀
		
						sendPersons.add(sendPerson);
					}
				}else{
					HashMap sendPerson = new HashMap();
					sendPerson.put("personName",  cvplRequstVo.getCpttrNm());
					sendPerson.put("juminNo", cvplRequstVo.getIhidnumBdrcl());
					sendPerson.put("hangkikcd", "");
					sendPerson.put("boninGubun", "1");
					
					sendPersons.add(sendPerson);
				}
			}else if("B".equals(lnkSttus)){ // 가족연계오류 시 가족연계오류 메시지 표출
				
				// 결과 코드 ZZ2704, 연계 요청 삭제, 주민번호 삭제 UPDATE 
				cvplRequstVo.setErrType("B");
				cvplRequstVo.setRsltCd("ZZ2704");
				rcvfvrGuidanceCvplRequstDao.updateCvplRequstClsCd(cvplRequstVo);
				rcvfvrGuidanceCvplRequstDao.deleteReciptInfoRequstRslt(cvplRequstVo); //주민등록등본 연계 결과 delete 
				rcvfvrGuidanceCvplRequstDao.updateReciptInfoRequst(cvplRequstVo); //가족연계오류 연계 요청 N
				
				return "lnkErrB";
			}else{ // 연계 오류 , 주민등록등본 오류 시 등본오류 메시지 표출

				// 결과 코드 ZZ2704, 연계 요청 삭제, 주민번호 삭제 UPDATE 
				cvplRequstVo.setErrType("C");
				cvplRequstVo.setRsltCd("ZZ2704");
				rcvfvrGuidanceCvplRequstDao.updateCvplRequstClsCd(cvplRequstVo);
				rcvfvrGuidanceCvplRequstDao.deleteReciptInfoRequstRslt(cvplRequstVo); //주민등록등본 연계 결과 delete 
				rcvfvrGuidanceCvplRequstDao.updateReciptInfoRequst(cvplRequstVo); //가족연계오류 연계 요청 N
				
				return "lnkErrC";
			}
			
			Logs.debug("********sendPersons.size()"+sendPersons.size());
			
			// sendPersons 중복 제거
			HashSet<HashMap> listSet = new HashSet<HashMap>(sendPersons);
			sendPersons = new LinkedList<HashMap>(listSet);

			Logs.debug("sendPersons.size()==" + sendPersons.size());
			Logs.debug("sendPersons.>>> ===" + sendPersons.toString());
			sendDataMap.put("Header_ResponseType", "DB");

			// 연계먼저 다 보낸후
			String sendRtn = "";

			// 연계보내는 사람의 정보. sendTxid 담아서
			LinkedList<HashMap> sendPsersonsSends = new LinkedList<HashMap>();

			// async 로 처리. 이후 쿼리로 갯수를 체크...
			TnQualfInfoRequstRsltVo cntVo = new TnQualfInfoRequstRsltVo();

			ArrayList<String> sendLnkRequstNos=new ArrayList<String>();

			// 연계 보내야 되는 사람수만큼...
			for (int k = 0; k < sendPersons.size(); k++) {

				Logs.debug(" send person " + k + " start ~!! ");

				datas = new ArrayList();

				HashMap sendPersonRow = (HashMap) sendPersons.get(k);
				String sendPersonName = (String) sendPersonRow.get("personName");
				String sendPersonJuminNo = (String) sendPersonRow.get("juminNo");
				String sendPersonBoninGubun = (String) sendPersonRow.get("boninGubun");

				sendTxid = cvplRequstVo.getCvplRequstGuidanceNo() + "3" + k;

				sendPersonRow.put("sendTxid", sendTxid);
				sendPersonRow.put("rowIdx",k);
				sendPsersonsSends.add(sendPersonRow);
				sendLnkRequstNos.add(sendTxid);

				sendDataMap.put("sendTxid", sendTxid);
				sendDataMap.put("Header_TX_ID", sendTxid);
				infoReqVo.setLnkRequstNo(sendTxid);

				sendDataMap.put("cpttrNm", sendPersonName);
				sendDataMap.put("ihidnumBdrcl", sendPersonJuminNo);

				RcvfvrGuidanceCvplRequstVo sendPersonCvpl = new RcvfvrGuidanceCvplRequstVo();
				sendPersonCvpl.setIhidnum1(sendPersonJuminNo.substring(0, 6));
				sendPersonCvpl.setIhidnum2(sendPersonJuminNo.substring(6));
				setCpttr(sendPersonCvpl);

				TnCpttrAgremanageVo selAgreChild = new TnCpttrAgremanageVo();

				// 자녀 이면 민원인 동의 조회.
				if ("13".equals(sendPersonBoninGubun)) {
					TnCpttrAgremanageVo cpttrChild = new TnCpttrAgremanageVo();
					cpttrChild.setCpttrSeq(cvplRequstVo.getCpttrSeq());
					cpttrChild.setUseYn("Y");
					cpttrChild.setAgreusrNm(sendPersonName);
					cpttrChild.setIhidnum(sendPersonJuminNo);
					cpttrChild.setAgreusrBrthdy(ComUtil.getJuminBirth(sendPersonJuminNo));
					cpttrChild.setAgreusrSexCd(sendPersonCvpl.getCpttrSexCd());
					setEncryptIhidnum(cpttrChild);

					selAgreChild = tnCpttrAgremanageDao.selectOne(cpttrChild);
					if (selAgreChild == null) {
						selAgreChild = new TnCpttrAgremanageVo();
						tnCpttrAgremanageDao.insert(cpttrChild);
						Logs.objDebug(cpttrChild);
						selAgreChild.setAgreusrSeq(cpttrChild.getAgreusrSeq());
					}else{
						selAgreChild.setUseYn("Y");
						tnCpttrAgremanageDao.update(selAgreChild);
						
						agrees.add(selAgreChild.getAgreusrSeq());
					}
				}

				// 자격 정보 연계 정보 TN_QUALF_INFO_LNK_INFO 개수만큼...
				TnQualfInfoLnkInfoVo qualfLnkParam = new TnQualfInfoLnkInfoVo();

				// 성별코드
				qualfLnkParam.setUsrSexCd(sendPersonCvpl.getCpttrSexCd());
				// 생년월일
				qualfLnkParam.setCpttrBrthdy(sendPersonCvpl.getCpttrBrthdy());

				qualfLnks = tnQualfInfoLnkInfoDao.selectList(qualfLnkParam);

				// 자녀이면 동의 seq
				if ("13".equals(sendPersonBoninGubun)) {
					//부모꺼 없앰.
					infoReqVo.setCpttrSeq("");
					infoReqVo.setAgreusrSeq(selAgreChild.getAgreusrSeq() + "");
				} else {
					//본인꺼
					infoReqVo.setCpttrSeq(cvplRequstVo.getCpttrSeq()+"");
					infoReqVo.setAgreusrSeq("");
				}

				// select insert 로 수정.
				// 성별코드
				infoReqVo.setUsrSexCd(sendPersonCvpl.getCpttrSexCd());
				// 생년월일
				infoReqVo.setCpttrBrthdy(sendPersonCvpl.getCpttrBrthdy());
				tnQualfReciptInfoRequstDao.insertTnQualfReciptInfoRequstSelect(infoReqVo);


				Logs.debug("qualfLnks.size==" + qualfLnks.size());
				for (int i = 0; i < qualfLnks.size(); i++) {
					TnQualfInfoLnkInfoVo rowQualfLnk = qualfLnks.get(i);
					infoReqVo.setLnkId(rowQualfLnk.getLnkId());

					//Logs.debug("infoReqVo.getLnkId()==" + infoReqVo.getLnkId());
					//tnQualfReciptInfoRequstDao.insert(infoReqVo);

					// 연계 보내야될 개수만큼

					// 연계 보내야될 항목
					TnLnkRequstItmInfoVo sendParamsParam = new TnLnkRequstItmInfoVo();
					sendParamsParam.setLnkId(rowQualfLnk.getLnkId());
					List<TnLnkRequstItmInfoVo> sendParams30 = tnLnkRequstItmInfoDao.selectList(sendParamsParam);
					//Logs.debug("sendParams.size==" + sendParams30.size());

					// 사람 데이터 연계인터페이스 정보
					HashMap person3 = new HashMap();
					person3.put("IF_LIST", infoReqVo.getLnkId());

					// 연계 항목만큼
					for (int j = 0; j < sendParams30.size(); j++) {
						TnLnkRequstItmInfoVo rowSendParam = sendParams30.get(j);
						personPut(rowSendParam, person3, sendPersonJuminNo, sendPersonName,sendPersonRow);
					}

					// Logs.objDebug(person3);

					// 리스트에 담고
					datas.add(person3);

				}

				// data 에 리스트 담기
				sendDataMap.put("datas", datas);

				Logs.debug("callUrl==" + callUrl);

				// 연계 전송.
				HttpUrlCall httpCall = new HttpUrlCall();
				sendRtn = httpCall.send(callUrl, sendDataMap);

				Logs.debug("sendRtn==" + sendRtn);
				// #######################################################

				// 연계 결과 update
				if (sendRtn.indexOf("False") != -1) {
					infoReqVo.setRequstSuccYn("N");
					infoReqVo.setRequstErrCdCts(sendRtn);
					tnQualfReciptInfoRequstDao.update(infoReqVo);
					
					Logs.debug("errSendRtn == " + sendRtn);
					return "False";
				}else if(sendRtn.startsWith("ERR")){
					infoReqVo.setRequstSuccYn("N");
					infoReqVo.setRequstErrCdCts(sendRtn);
					tnQualfReciptInfoRequstDao.update(infoReqVo);
					
					Logs.debug("errSendRtn == " + sendRtn);
					return sendRtn;
				}else {
					infoReqVo.setRequstSuccYn("Y");
					tnQualfReciptInfoRequstDao.update(infoReqVo);
				}
			}
			// 우선 연계 호출.
			cntVo.setCvplRequstGuidanceNo(cvplRequstVo.getCvplRequstGuidanceNo());
			cntVo.setLnkRequstNos(sendLnkRequstNos);

			//2020 1201 14:13 최영환 부장님 지시 . 다 받을때 까지 대기.
			int cnt2=0;
			while(true){
				cnt2++;
				int procCnt = tnQualfInfoRequstRsltDao.selectTnQualfReciptInfoRequstRsltSumCnt(cntVo);

				Logs.debug("procCnt=="+procCnt);

				if(procCnt==0 || sleepCount == cnt2){
					break;
				}

				try {
					Logs.debug(" sleep ... "+cnt2);
					Thread.sleep(sleepTime);
				} catch (Exception e) {

				}
			}


			//보훈처 전송여부
			boolean isBhSend=false;

			for (int k = 0; k < sendPersons.size(); k++) {

				HashMap sendPersonRow = (HashMap) sendPersons.get(k);
				String sendPersonName = (String) sendPersonRow.get("personName");
				String sendPersonJuminNo = (String) sendPersonRow.get("juminNo");
				String sendPersonBoninGubun = (String) sendPersonRow.get("boninGubun");

				// 연계 결과 조회 I-IF-MPVA-002 인거 있으면....
				TnQualfInfoRequstRsltVo rsltParam = new TnQualfInfoRequstRsltVo();
				String sendTxid005 = cvplRequstVo.getCvplRequstGuidanceNo() + "4" + k;

				rsltParam.setLnkRequstNo(sendTxid);
				rsltParam.setSendPersonName(sendPersonName);
				List<TnQualfInfoRequstRsltVo> rsltLists = tnQualfInfoRequstRsltDao.selectList(rsltParam);
				Logs.debug("rsltLists.size()==" + rsltLists.size());
				if (rsltLists.size() > 0) {

					isBhSend=true;

					// I-IF-MPVA-005 연계 다시 전송.
					Logs.debug("I-IF-MPVA-005 re send start~");

					// I-IF-MPVA-005-01
					// I-IF-MPVA-005-02
					sendDataMap.put("Header_TX_ID", sendTxid005);

					infoReqVo.setLnkRequstNo(sendTxid005);

					datas = new ArrayList();

					// I-IF-MPVA-002 개수만큼
					for (int i = 0; i < rsltLists.size(); i++) {
						TnQualfInfoRequstRsltVo rowRsltVo = rsltLists.get(i); // 통합보훈번호
																				// 들
						// private String resIvNunber ;
						// private String subjKbnCd ;

						infoReqVo.setLnkId("I-IF-MPVA-005" + "-" + getTwoLenStr(i + 1, "0"));
						tnQualfReciptInfoRequstDao.insert(infoReqVo);

						// 사람 데이터 연계인터페이스 정보
						HashMap person1 = new HashMap();
						person1.put("IF_LIST", infoReqVo.getLnkId());

						// 이름
						person1.put("reg_name", cvplRequstVo.getCpttrNm());
						// 주민등록번호 암호화 풀린거. 현재 암호화 안됨. 암호되면 복호화 로직...
						person1.put("reg_num", cvplRequstVo.getIhidnumBdrcl());
						// 통합보훈번호
						person1.put("res_IV_nunber", rowRsltVo.getResIvNunber());
						// 국가유공자 대상구분 코드
						person1.put("subjKbnCd", rowRsltVo.getSubjKbnCd());

						// 리스트에 담고
						datas.add(person1);

					}

					// data 에 리스트 담기
					sendDataMap.put("datas", datas);

					// 전송...
					HttpUrlCall httpCall = new HttpUrlCall();
					sendRtn = httpCall.send(callUrl, sendDataMap);
					Logs.debug("sendRtn005==" + sendRtn);

					// 연계 결과 update
					if (sendRtn.startsWith("ERR")) {
						infoReqVo.setRequstSuccYn("N");
						infoReqVo.setRequstErrCdCts(sendRtn);
					} else {
						infoReqVo.setRequstSuccYn("Y");
					}
					infoReqVo.setLnkRequstNo(sendTxid005);
					tnQualfReciptInfoRequstDao.update(infoReqVo);

				}
			}

			Logs.debug("isBhSend=="+isBhSend);

			//보훈 보낸거 있으면...
			if(isBhSend){
				// 보훈 연계 결과 건수
				//cntVo.setLnkRequstNo(sendTxid005);
				//for (int cnt = 0; cnt < sleepCount; cnt++) {
				int bsCnt=0;
				while(true){
					bsCnt++;
					int procBhCnt = tnQualfInfoRequstRsltDao.selectTnQualfReciptInfoRequstRsltBhSumCnt(cntVo);

					Logs.debug("procBhCnt=="+procBhCnt);

					if(procBhCnt==0 || sleepCount == bsCnt){
						break;
					}

					try {
						Logs.debug(" Bh sleep ... "+bsCnt);
						Thread.sleep(sleepTime);
					} catch (Exception e) {

					}
				}
			}

			// 프로시져 호출.
			HashMap paramMap = new HashMap();
			paramMap.put("cvplRequstGuidanceNo", cvplRequstVo.getCvplRequstGuidanceNo());
			this.callSpQualfReciptMapng(paramMap);

			Logs.debug("paramMap==" + paramMap);
			Logs.objDebugNotNull(paramMap);

			String psMsg = "";
			psMsg = (String) paramMap.get("psMsg");

			rtn = psMsg;
			
		} catch (SQLException e) {
			Logs.error(e);
			rtn = "ERR";
			cvplRequstVoRcv.setRsltCd("ZZ2705");
			rcvfvrGuidanceCvplRequstDao.updateCvplRequstClsCd(cvplRequstVoRcv);
		} catch (Exception e) {
			Logs.error(e);
			rtn = "ERR";
			cvplRequstVoRcv.setRsltCd("ZZ2705");
			rcvfvrGuidanceCvplRequstDao.updateCvplRequstClsCd(cvplRequstVoRcv);
		}finally{
			// 동의자가 있는경우 use_yn  N 으로
			if(agrees.size()>0){
				for (int i = 0; i < agrees.size(); i++) {
					TnCpttrAgremanageVo agre = new TnCpttrAgremanageVo();
					agre.setUseYn("N");
					agre.setAgreusrSeq((Integer)agrees.get(i));
					tnCpttrAgremanageDao.update(agre);
				}
			}
			
			//주민번호 삭제
			rcvfvrGuidanceCvplRequstDao.updateCvplIhidnum(cvplRequstVoRcv);
		}

  		return rtn;
  	}

  	public NodeList getNodeList(String rtn10) {
		Document doc10 = XmlUtil.xmlParsigDoc(rtn10);
		doc10.getDocumentElement().normalize();

		NodeList list10 = XmlUtil.xpathList(doc10, "/Envelope/Body/getResiRegCertInfoResponse/Body");

		Logs.debug("list.getLength()==" + list10.getLength());

		return list10;
  	}

  	// 14세이하 자녀여부 확인
  	public ArrayList checkChildren(RcvfvrGuidanceCvplRequstVo cvplRequstVo, String rtn10) {
		ArrayList under14Childs = new ArrayList();

		NodeList list10 = getNodeList(rtn10);

		// 세대주가 본인   이거나   sedaejuId.equals(cvplRequstVo.getIhidnumBdrcl()
		// 배우자 이면서   본인이 inputId  이면 부모...   "배우자".equals(sedaejuKwan) && inputId.equals(cvplRequstVo.getIhidnumBdrcl())
		
		if (list10.getLength() > 1) {

			// 본인이 세대주인지... 확인...
			for (int i = 0; i < list10.getLength(); i++) {

				// inputId
				NodeList body10s = list10.item(i).getChildNodes();

				String sedaejuKwan = "";
				String inputId = "";
				String sedaejuId = "";

				for (int j = 0; j < body10s.getLength(); j++) {
					Node body001Row = body10s.item(j);

					if ("sedaejuKwan".equals(body001Row.getNodeName())) {
						sedaejuKwan = body001Row.getTextContent();
					}
					if ("inputId".equals(body001Row.getNodeName())) {
						inputId = body001Row.getTextContent();
					}
					if ("sedaejuId".equals(body001Row.getNodeName())) {
						sedaejuId = body001Row.getTextContent();
					}
				}

				// 주민등록번호랑 세대주번호랑 같은 자녀.
				if (sedaejuId.equals(cvplRequstVo.getIhidnumBdrcl())){
					isImParent = "Y";
				}
			}

			for (int i = 0; i < list10.getLength(); i++) {

				// inputId
				NodeList body10s = list10.item(i).getChildNodes();

				String sedaejuKwan = "";
				String inputId = "";
				String inputName = "";
				String sedaejuId = "";
				String hangkikcd = "";

				for (int j = 0; j < body10s.getLength(); j++) {
					Node body001Row = body10s.item(j);

					if ("sedaejuKwan".equals(body001Row.getNodeName())) {
						sedaejuKwan = body001Row.getTextContent();
					}
					if ("inputId".equals(body001Row.getNodeName())) {
						inputId = body001Row.getTextContent();
					}
					if ("inputName".equals(body001Row.getNodeName())) {
						inputName = body001Row.getTextContent();
					}
					if ("sedaejuId".equals(body001Row.getNodeName())) {
						sedaejuId = body001Row.getTextContent();
					}
					if ("hangkikcd".equals(body001Row.getNodeName())) {
						hangkikcd = body001Row.getTextContent();
					}

				}

				//세대주 && 자녀
				if("Y".equals(isImParent)){
					if ("자녀".equals(sedaejuKwan)){
						// 만나이
						int manAge = ComUtil.getAgeYear(ComUtil.getJuminBirth(inputId));

						if (manAge < 14) {
							is14underChildHave = "Y";
							
							HashMap under14Map = new HashMap();
							under14Map.put("inputId", inputId);
							under14Map.put("sedaejuKwan", sedaejuKwan);
							under14Map.put("inputName", inputName.replaceAll(" ", ""));
							under14Map.put("sedaejuId", sedaejuId);
							under14Map.put("hangkikcd", hangkikcd);

							under14Childs.add(under14Map);
						}
					}
				}else{
					// 만나이
					int manAge = ComUtil.getAgeYear(ComUtil.getJuminBirth(inputId));

					if (manAge < 14) {
						is14underChildHave = "Y";
						
						HashMap under14Map = new HashMap();
						under14Map.put("inputId", inputId);
						under14Map.put("sedaejuKwan", sedaejuKwan);
						under14Map.put("inputName", inputName.replaceAll(" ", ""));
						under14Map.put("sedaejuId", sedaejuId);
						under14Map.put("hangkikcd", hangkikcd);

						under14Childs.add(under14Map);
					}
				}	
			}
		}

  		return under14Childs;
  	}

    // 연계 각각 보내기
    public String procLnkRow(HashMap sendDataMap){

    	HttpUrlCall httpCall = new HttpUrlCall();
    	String rtnStr = "";

    	//이름,
    	String personName=(String) sendDataMap.get("personName");
    	//주민번호
    	String juminNo=(String) sendDataMap.get("juminNo");

    	String callUrl = (String) sendDataMap.get("callUrl");
    	// sendTxid
    	String sendTxid =(String) sendDataMap.get("sendTxid");  //  cvplRequstVo.getCvplRequstGuidanceNo()+"10";
    	// LnkId
    	String LnkId =(String) sendDataMap.get("LnkId");

    	// 연계 보내야될 항목
    	TnLnkRequstItmInfoVo sendParamsParam = new TnLnkRequstItmInfoVo();
    	sendParamsParam.setLnkId(LnkId);
    	List<TnLnkRequstItmInfoVo> requstItmInfo =  tnLnkRequstItmInfoDao.selectList(sendParamsParam);

    	// 데이터 리스트
    	ArrayList datas = new ArrayList();

    	// 사람 데이터 연계인터페이스 정보
    	HashMap person = new HashMap();
    	person.put("IF_LIST", LnkId);

    	// 연계 항목만큼
    	for (int j = 0; j < requstItmInfo.size(); j++) {
    		TnLnkRequstItmInfoVo rowSendParam = requstItmInfo.get(j);
    		personPut(rowSendParam,person,juminNo,personName,sendDataMap);
		}

    	// 리스트에 담고
    	datas.add(person);

    	// data 에 리스트 담기
    	sendDataMap.put("datas", datas);


    	Logs.debug("callUrl=="+callUrl);

    	// 전송...
    	rtnStr = httpCall.send(callUrl,sendDataMap);

    	return rtnStr;
    }

    /**
     * 민원 요청 상세 조회 - 오프라인 신청
     *
     * @param cvplRequstVo {@link CvplRequstVo} 민원 요청 VO
     * @return CvplRequstVo 조회 결과
     */
    public RcvfvrGuidanceCvplRequstVo selectCvplRequst(RcvfvrGuidanceCvplRequstVo cvplRequstVo) {
        cvplRequstVo = rcvfvrGuidanceCvplRequstDao.selectOne(cvplRequstVo);

        Logs.objDebugNotNull(cvplRequstVo);
        try {
        	cvplRequstVo.setIhidnum(cvplRequstVo.getIhidnumBdrcl());

		} catch (Exception e) {
			// TODO: handle exception
		}

        return cvplRequstVo;
    }

 // 연계 항목만큼 담기
	public void personPut(TnLnkRequstItmInfoVo rowSendParam, HashMap person, String juminNo, String personName,HashMap sendPersonRow) {
 		/* REQUST_CLS_CD 요청 구분 코드
		 * 	ZZ2401	ZZ24	요청기관코드
			ZZ2402	ZZ24	요청시스템
			ZZ2403	ZZ24	주민번호
			ZZ2404	ZZ24	성명
			ZZ2405	ZZ24	통합보훈번호
			ZZ2406	ZZ24	국가유공자 대상구분 코드
			ZZ2413	ZZ24	생년월일
 		 */
		if ("ZZ2403".equals(rowSendParam.getRequstClsCd())) {
			person.put(rowSendParam.getRequstItmNm(), juminNo);
		} else if ("ZZ2404".equals(rowSendParam.getRequstClsCd())) {
 			person.put(rowSendParam.getRequstItmNm(), personName);
 		} else if ("ZZ2405".equals(rowSendParam.getRequstClsCd()) || "ZZ2406".equals(rowSendParam.getRequstClsCd())) {

 		} else if("ZZ2413".equals(rowSendParam.getRequstClsCd())){
 			String birth = "";
 			String jumin1 = juminNo.substring(0, 6);
 			String jumin2 = juminNo.substring(6, 8);
 			if (jumin2.startsWith("9") || jumin2.startsWith("0")) {
 				birth = ("18" + jumin1);
 	        } else if (jumin2.startsWith("1") || jumin2.startsWith("2")
 	                || jumin2.startsWith("5") || jumin2.startsWith("6")) {
 	        	birth = ("19" + jumin1);
 	        } else if (jumin2.startsWith("3") || jumin2.startsWith("4")
 	                || jumin2.startsWith("7") || jumin2.startsWith("8")) {
 	        	birth = ("20" + jumin1);
 	        }
 			person.put(rowSendParam.getRequstItmNm(), birth);
 		}
 		//ZZ2416 행정동....
 		else if ("ZZ2416".equals(rowSendParam.getRequstClsCd())) {
 			person.put(rowSendParam.getRequstItmNm(), getAdministDongCd((String) sendPersonRow.get("hangkikcd")));
 		}
 		else {
 			if (rowSendParam.getRequstItmVal() == null || "".equals(rowSendParam.getRequstItmVal())) {
 				person.put(rowSendParam.getRequstItmNm().trim(), " ");
 			} else {
 				person.put(rowSendParam.getRequstItmNm().trim(), rowSendParam.getRequstItmVal());
 			}
 		}
 	}

    /**
     * 생년월일 남녀코드 설정
     *
     * @param cvplRequstVo {@link CvplRequstVo}
     */
    private void setCpttr(RcvfvrGuidanceCvplRequstVo cvplRequstVo) {
        cvplRequstVo.setIhidnum(cvplRequstVo.getIhidnum1() + cvplRequstVo.getIhidnum2());
        cvplRequstVo.setBizrno(cvplRequstVo.getBizrno1() + cvplRequstVo.getBizrno2() + cvplRequstVo.getBizrno3());

        // 9 : 1800 ~ 1899년에 태어난 남성
        // 0 : 1800 ~ 1899년에 태어난 여성
        // 1 : 1900 ~ 1999년에 태어난 남성
        // 2 : 1900 ~ 1999년에 태어난 여성
        // 3 : 2000 ~ 2099년에 태어난 남성
        // 4 : 2000 ~ 2099년에 태어난 여성
        // 5 : 1900 ~ 1999년에 태어난 외국인 남성
        // 6 : 1900 ~ 1999년에 태어난 외국인 여성
        // 7 : 2000 ~ 2099년에 태어난 외국인 남성
        // 8 : 2000 ~ 2099년에 태어난 외국인 여성

        if (cvplRequstVo.getIhidnum2().startsWith("9") || cvplRequstVo.getIhidnum2().startsWith("0")) {
            cvplRequstVo.setCpttrBrthdy("18" + cvplRequstVo.getIhidnum1());
        } else if (cvplRequstVo.getIhidnum2().startsWith("1") || cvplRequstVo.getIhidnum2().startsWith("2")
                || cvplRequstVo.getIhidnum2().startsWith("5") || cvplRequstVo.getIhidnum2().startsWith("6")) {
            cvplRequstVo.setCpttrBrthdy("19" + cvplRequstVo.getIhidnum1());
        } else if (cvplRequstVo.getIhidnum2().startsWith("3") || cvplRequstVo.getIhidnum2().startsWith("4")
                || cvplRequstVo.getIhidnum2().startsWith("7") || cvplRequstVo.getIhidnum2().startsWith("8")) {
            cvplRequstVo.setCpttrBrthdy("20" + cvplRequstVo.getIhidnum1());
        }

        if (Integer.parseInt(cvplRequstVo.getIhidnum2().substring(0, 1)) % 2 == 1) {
            cvplRequstVo.setCpttrSexCd(Code.성별.남자);
        } else {
            cvplRequstVo.setCpttrSexCd(Code.성별.여자);
        }
    }

    /**
     * 주민번호 암호화
     *
     * @param cpttr cpttr
     */
    private void setEncryptIhidnum(Cpttr cpttr) {

    	Logs.debug("shaPasswordEncoder.encodePassword(cpttr.getIhidnum(), null=="+shaPasswordEncoder.encodePassword(cpttr.getIhidnum(), null));

    	ShaPasswordEncoder shaPasswordEncoder256 = new ShaPasswordEncoder(256);

    	shaPasswordEncoder256.setEncodeHashAsBase64(true);

		Logs.debug("shaPasswordEncoder256.encodePassword(cpttr.getIhidnum(), null)=="+shaPasswordEncoder256.encodePassword(cpttr.getIhidnum(), null));

        cpttr.setIhidnumSimplx(shaPasswordEncoder.encodePassword(cpttr.getIhidnum(), null));

        cpttr.setIhidnumBdrcl(cpttr.getIhidnum());
    }

    // 두자리로 만들기   1=>01
    public String getTwoLenStr(int count ,String lpadStr){
    	if(count<10){
    		return lpadStr+count;
    	}
    	else{
    		return count+"";
    	}
    }

    /**
     * 프로시져 호출
     */
	public HashMap callSpQualfReciptMapng(HashMap cvplRequstMap) {
		rcvfvrGuidanceCvplRequstDao.callSpQualfReciptMapng(cvplRequstMap);

		return cvplRequstMap;
	}

	/**
	 * 행정 동 가져오기
	 */
	public String getAdministDongCd(String numCdStr){
		String rtn="";

		String numCd="";

		if(numCdStr!=null && numCdStr.length()>1){
			numCd = numCdStr.substring(0, 2);
		}

		/*
		 * {"FULL_NAME" : "서울", "SHOT_NAME" : "서울", "EDU_CODE" :    "B10"},	11
			{"FULL_NAME" : "부산", "SHOT_NAME" : "부산", "EDU_CODE" :   "C10"},	26
			{"FULL_NAME" : "대구", "SHOT_NAME" : "대구", "EDU_CODE" :   "D10"},	27
			{"FULL_NAME" : "인천", "SHOT_NAME" : "인천", "EDU_CODE" :   "E10"},	28
			{"FULL_NAME" : "광주", "SHOT_NAME" : "광주", "EDU_CODE" :   "F10"},	29
			{"FULL_NAME" : "대전", "SHOT_NAME" : "대전", "EDU_CODE" :   "G10"},	30
			{"FULL_NAME" : "울산", "SHOT_NAME" : "울산", "EDU_CODE" :   "H10"},	31
			{"FULL_NAME" : "세종", "SHOT_NAME" : "세종", "EDU_CODE" :   "I10"},	36
			{"FULL_NAME" : "경기도", "SHOT_NAME" : "경기", "EDU_CODE" :  "J10"},	41
			{"FULL_NAME" : "강원도", "SHOT_NAME" : "강원", "EDU_CODE" :  "K10"},	42
			{"FULL_NAME" : "충청북도", "SHOT_NAME" : "충북", "EDU_CODE" : "M10"},	43
			{"FULL_NAME" : "충청남도", "SHOT_NAME" : "충남", "EDU_CODE" : "N10"},	44
			{"FULL_NAME" : "전라북도", "SHOT_NAME" : "전북", "EDU_CODE" : "P10"},	45
			{"FULL_NAME" : "전라남도", "SHOT_NAME" : "전남", "EDU_CODE" : "Q10"},	46
			{"FULL_NAME" : "경상북도", "SHOT_NAME" : "경북", "EDU_CODE" : "R10"},	47
			{"FULL_NAME" : "경상남도", "SHOT_NAME" : "경남", "EDU_CODE" : "S10"},	48
			{"FULL_NAME" : "제주", "SHOT_NAME" : "제주", "EDU_CODE" :   "T10"},	50

		00	0000000000	전국
		11	1100000000	서울특별시
		26	2600000000	부산광역시
		27	2700000000	대구광역시
		28	2800000000	인천광역시
		29	2900000000	광주광역시
		30	3000000000	대전광역시
		31	3100000000	울산광역시
		36	3600000000	세종특별자치시
		41	4100000000	경기도
		42	4200000000	강원도
		43	4300000000	충청북도
		44	4400000000	충청남도
		45	4500000000	전라북도
		46	4600000000	전라남도
		47	4700000000	경상북도
		48	4800000000	경상남도
		50	5000000000	제주특별자치도
		 */

		if ("11".equals(numCd)) {
			rtn = "B10";
		} else if ("26".equals(numCd)) {
			rtn = "C10";
		} else if ("27".equals(numCd)) {
			rtn = "D10";
		} else if ("28".equals(numCd)) {
			rtn = "E10";
		} else if ("29".equals(numCd)) {
			rtn = "F10";
		} else if ("30".equals(numCd)) {
			rtn = "G10";
		} else if ("31".equals(numCd)) {
			rtn = "H10";
		} else if ("36".equals(numCd)) {
			rtn = "I10";
		} else if ("41".equals(numCd)) {
			rtn = "J10";
		} else if ("42".equals(numCd)) {
			rtn = "K10";
		} else if ("43".equals(numCd)) {
			rtn = "M10";
		} else if ("44".equals(numCd)) {
			rtn = "N10";
		} else if ("45".equals(numCd)) {
			rtn = "P10";
		} else if ("46".equals(numCd)) {
			rtn = "Q10";
		} else if ("47".equals(numCd)) {
			rtn = "R10";
		} else if ("48".equals(numCd)) {
			rtn = "S10";
		} else if ("50".equals(numCd)) {
			rtn = "T10";
		}
		else{
			rtn="";
		}

		return rtn;
	}

}
