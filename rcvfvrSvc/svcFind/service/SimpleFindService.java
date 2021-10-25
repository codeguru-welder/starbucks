package kr.go.portal.rcvfvrSvc.svcFind.service;


import org.apache.ibatis.page.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.go.portal.rcvfvrSvc.svcFind.dao.SimpleFindDao;
import kr.go.portal.rcvfvrSvc.svcFind.vo.SimpleFindVo;
import net.sf.json.JSONObject;

/**
 * @author NS-SG-03
 * @since 2020. 9. 2.
 * @version 1.0
 */

@Service
@Transactional(rollbackFor = Exception.class)
public class SimpleFindService {
	
	@Autowired
	private SimpleFindDao simpleFindDao;
	
	/**
	 * 간편찾기 결과 리스트
	 * @param SimpleFindVo
	 * @return
	 */
	public Page<SimpleFindVo> selectSimpleFindList(SimpleFindVo simpleFindVo) {
        return simpleFindDao.selectSimpleFindList(simpleFindVo);
    }
	
	/**
	 * 간편찾기 결과 insert
	 * @param vo
	 */
	public String insertSimpleFindResult(SimpleFindVo vo){
		
		JSONObject jObj = new JSONObject();
		String result = "";
		try{
			String cd = vo.getHshldChartr() + "," + vo.getJob() + "," +  vo.getIncomeInfo();
			String[] cdArr = new String[]{};
			cdArr = cd.split(",");
			
			vo.setSqBnefVwSeq(simpleFindDao.selectBnefVwSeq());
			
			for(String chartrCd : cdArr){
				vo.setChartrCd(chartrCd);
				simpleFindDao.insertSimpleFindResult(vo);
			}
			
			result = "SUCC";
		}catch (Exception e) {
			result = "FAIL";
		}
		
		jObj.put("result", result);
		return jObj.toString();
	}
}