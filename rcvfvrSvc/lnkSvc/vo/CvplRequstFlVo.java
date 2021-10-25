/*==============================================================================
 * 파일명 : $URL:  $
 * 파일용도 : 게시물 파일 Vo
 * 마지막변경일자 : $Date: $
 * 마지막변경자 : $Author: $
 * 최종버전 : $Revision: $
 * 변경이력
 *------------------------------------------------------------------------------
 *   DATE       AUTHOR                      DESCRIPTION;
 * -----------  ------  --------------------------------------------------------
 * 2016.10.13   김경환       최초 생성
 *------------------------------------------------------------------------------
=================================================================================*/
package kr.go.portal.rcvfvrSvc.lnkSvc.vo;

import java.io.Serializable;

import kr.co.opensns.utils.StringUtils;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 민원요청 결과목록 파일 Vo
 *
 * @author 김경환
 * @since 2016.10.13
 * @version 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
public class CvplRequstFlVo extends CvplRequstFlEntity implements Serializable {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 3263277689504157133L;

    /**
     * uuid
     */
    private String phyFlNm;

    /**
     * 논리명
     */
    private String logicFlNm;

    /**
     * 파일 확장자 명
     */
    private String flExt;

    /**
     * 파일 전체경로(물리 파일명 포함)
     */
    private String flPth;
    /**
     * 파일 존재 유무
     */
    private String isFl;

    /**
     * Constructor of CvplRequstFlVo.java class
     * @param i
     * @param string
     */
    public CvplRequstFlVo() {

    }

    /**
     * Constructor of CvplRequstFlVo.java class
     */
    public CvplRequstFlVo(String cvplRequstDh, int cpttrSeq) {
        super.setCvplRequstDh(cvplRequstDh);
        super.setCpttrSeq(cpttrSeq);
    }

    /**
     * 파일 물리 명의 CRC
     *
     * @return crc
     */
    public String getCrc() {
        return StringUtils.crc(this.phyFlNm);
    }

}
