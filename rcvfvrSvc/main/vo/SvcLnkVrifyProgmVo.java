package kr.go.portal.rcvfvrSvc.main.vo;

import java.io.Serializable;

import org.apache.ibatis.page.PageParameter;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * @author NS-SG-03
 * @since 2020. 10. 13.
 * @version 1.0
 */

@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)

public class SvcLnkVrifyProgmVo extends PageParameter implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * 연계id
	 */
	private String lnkId;
	
	/**
	 * 기관명
	 */
	private String orgNm;
	
	/**
	 * 연계 인터페이스명
	 */
	private String lnkNm;
	
	/**
	 * 세부 연계 항목명
	 */
	private String itmNm;
	
	/**
	 * 서비스명
	 */
	private String svcId;
		
	/**
	 * 자격 연계 항목
	 */
	private String qualfAstCd;
	
	/**
	 * 시퀀스
	 */
	private int vrifySeq;
	
	/**
	 * 안내번호
	 */
	private String guidanceNo;

	/**
	 * remark
	 */
	private String remark;
	
}