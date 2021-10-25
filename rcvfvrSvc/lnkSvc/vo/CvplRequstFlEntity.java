/*==============================================================================
 * 파일명 : $URL:  $
 * 파일용도 : 민원 요청 첨부 파일 Vo
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

import javax.validation.constraints.NotNull;

import org.apache.ibatis.page.PageParameter;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 민원 요청 첨부 파일 Entity Vo
 *
 * @author 김경환
 * @since 2016.10.13
 * @version 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
public class CvplRequstFlEntity extends PageParameter implements Serializable {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -8844399696915380493L;

    /**
     * 파일 일련번호
     */
    @NotNull
    private int cvplRequstAtchFlSeq;

    /**
     * 민원 요청 일시
     */
    private String cvplRequstDh;

    /**
     * 민원인 일련번호
     */
    private int cpttrSeq;

}
