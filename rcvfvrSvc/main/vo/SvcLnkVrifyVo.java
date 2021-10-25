package kr.go.portal.rcvfvrSvc.main.vo;

import java.io.Serializable;
import java.util.List;

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

public class SvcLnkVrifyVo extends PageParameter implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 안내번호
	 */
	private String guidanceNo;

    /**
     * 이름
     */
	private String name;

	/**
     * 주민번호 앞
     */
	private String jumin1;

	/**
     * 주민번호 뒤
     */
	private String jumin2;

    /**
     * 체크 리스트
     */
    private List<SvcLnkVrifyProgmVo> voList;

}