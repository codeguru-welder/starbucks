package kr.go.portal.rcvfvrSvc.search.service;

public class CheckQualificationRegExr {

	public String[][] QUALIFICATION_REGEXR = null;
	
	public CheckQualificationRegExr() {
		QUALIFICATION_REGEXR = new String[][]{
			{
				/*qualif name*/              "나이관련자격(년수)"
				/*qualif regExr*/            ,"(\\d+)[\\s]?[세살]"
				/*qualif QUALF_ATT_CLS_CD*/  ,"GA0301"
			}
			,
			{
				/*qualif name*/              "나이관련자격(개월)"
				/*qualif regExr*/            ,"(\\d+)[\\s]?개월"
				/*qualif QUALF_ATT_CLS_CD*/  ,"GA0303"
			}
		};
	}
}
