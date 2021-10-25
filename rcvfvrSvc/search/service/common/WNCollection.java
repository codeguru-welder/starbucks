/*==============================================================================
 *   DESC  : 검색엔진 컬렉션 정의
 *------------------------------------------------------------------------------
 *     변경이력
 *------------------------------------------------------------------------------
 *   DATE       AUTHOR                      DESCRIPTION;
 * -----------  ------  --------------------------------------------------------
 * 2016. 9. 21.    kangtaewook     최초 생성
 *------------------------------------------------------------------------------
=================================================================================*/

package kr.go.portal.rcvfvrSvc.search.service.common;

public class WNCollection {
    /**
     * subject: 검색 환경 설정 페이지
     **/
    // final public static int CONNECTION_TIMEOUT = 20000;
    final public static String CHARSET = "UTF-8";
    final public static int REALTIME_COUNT = 100;
    final public static int PAGE_SCALE = 10; // view page list count

    final public static int CONNECTION_KEEP = 0; // recevive mode
    final public static int CONNECTION_REUSE = 2;
    final public static int CONNECTION_CLOSE = 3;

    final public static int ASC = 0; // order
    final public static int DESC = 1; // order

    final public static int USE_KMA_OFFOFF = 0; // synonym, morpheme
    final public static int USE_KMA_ONON = 1;
    final public static int USE_KMA_ONOFF = 2;

    final public static int USE_RESULT_STRING = 0; // result data type
    final public static int USE_RESULT_XML = 1;
    final public static int USE_RESULT_JSON = 2;
    final public static int USE_RESULT_DUPLICATE_STRING = 3; // uid result data type
    final public static int USE_RESULT_DUPLICATE_XML = 4;
    final public static int USE_RESULT_DUPLICATE_JSON = 5;

    final public static int IS_CASE_ON = 1; // case on, off
    final public static int IS_CASE_OFF = 0;

    final public static int HI_SUM_OFFOFF = 0; // summarizing, highlighting
    final public static int HI_SUM_OFFON = 1;
    final public static int HI_SUM_ONOFF = 2;
    final public static int HI_SUM_ONON = 3;

    final public static int COMMON_OR_WHEN_NORESULT_OFF = 0;
    final public static int COMMON_OR_WHEN_NORESULT_ON = 1;

    final public static int INDEX_NAME = 0;
    final public static int COLLECTION_NAME = 1;
    final public static int PAGE_INFO = 2;
    final public static int ANALYZER = 3;
    final public static int SORT_FIELD = 4;
    final public static int RANKING_OPTION = 5;
    final public static int SEARCH_FIELD = 6;
    final public static int RESULT_FIELD = 7;
    final public static int DATE_RANGE = 8;
    final public static int RANK_RANGE = 9;
    final public static int EXQUERY_FIELD = 10;
    final public static int COLLECTION_QUERY = 11;
    final public static int BOOST_QUERY = 12;
    final public static int FILTER_OPERATION = 13;
    final public static int GROUP_BY = 14;
    final public static int GROUP_SORT_FIELD = 15;
    final public static int CATEGORY_BOOST = 16;
    final public static int CATEGORY_GROUPBY = 17;
    final public static int CATEGORY_QUERY = 18;
    final public static int PROPERTY_GROUP = 19;
    final public static int PREFIX_FIELD = 20;
    final public static int FAST_ACCESS = 21;
    final public static int MULTI_GROUP_BY = 22;
    final public static int AUTH_QUERY = 23;
    final public static int DEDUP_SORT_FIELD = 24;
    final public static int COLLECTION_KOR = 25;

    final public static int MERGE_COLLECTION_NAME = 0;
    final public static int MERGE_MAPPING_COLLECTION_NAME = 1;
    final public static int MERGE_PAGE_INFO = 2;
    final public static int MERGE_RESULT_FIELD = 3;
    final public static int MERGE_MAPPING_RESULT_FIELD = 4;
    final public static int MERGE_MULTI_GROUP_BY_FIELD = 5;
    final public static int MERGE_MAPPING_MULTI_GROUP_BY_FIELD = 6;
    final public static int MERGE_CATEGORY_GROUPBY_FIELD = 7;
    final public static int MERGE_MAPPING_CATEGORY_GROUPBY_FIELD = 8;

    // 가상 통합 컬렉션을 사용하지 않을 경우 아래와 같이MERGE_COLLECTIONS에 정의한다.
    public String[] mergeCollections = new String[] {""};

    // 가상 통합 컬렉션을 사용할 경우 아래와 같이MERGE_COLLECTIONS에 정의한다.
    // public String[] MERGE_COLLECTIONS = new String[]{"merge_sample_bbs"};
    /*
     * public class WNCollection {
     *
     * public String[][] MERGE_COLLECTION_INFO = null;
     *
     * WNCollection(){
     *
     * //가상 통합 컬렉션을 사용할 경우, mapping되는 collection들의 정보를 정의한다. MERGE_COLLECTION_INFO = new String[][]
     * { { "merge_sample_bbs", // set merge collection name "sample_bbs/sample_edu", // set
     * collection name, delimiter: / "0,3", // set merge collection pageinfo (start,count)
     * "DOCID,TITLE,WRITER,CONTENT",// set merge document field
     * "DOCID,TITLE,WRITER,CONTENT/DOCID,TITLE,WRITER,CONTENT", // set document field, delimiter: /
     * "", // set merge collection multi-group-by field "", // set merge collection multi-group-by
     * field, delimiter: / "", // set merge collection category-group-by field "" // set collection
     * multi-group-by field, delimiter: / } };
     */

    public String[] collections = new String[] {"RCV_FVR_SVC","RCV_FVR_SVC_POP"};

    public String[][] mergeCollectionInfo = null;
    public String[][] collectionInfo = null;

    WNCollection() {
        collectionInfo = new String[][] {
	       	{
			"RCV_FVR_SVC", // set index name
			"RCV_FVR_SVC", // set collection name
			"0,24",  // set pageinfo (start,count)
			"1,0,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
			"RANK/DESC,VW_CNT/DESC",  // set sort field (field,order) multi sort '/'
			//"basic,rpmk,1000",  // set sort field (field,order) multi sort '/'
			"keyword,ID5,1000",  // set sort field (field,order) multi sort '/'
			"TTL/55,TTL_CHO,CONT/2,SVC_QUALF/43,RANGE1_QUALF_ATT_CLS_CD,RANGE2_QUALF_ATT_CLS_CD,RANGE3_QUALF_ATT_CLS_CD",// set search field
			"DOCID,DATE,TTL,CONT/100,DEPT_INC_CD,MOD_DH,DVS_ID,DPT_ALL_NM,SVC_ID,ONLN_REQST_SITE_URL,REFRNC_SITE_URL,CD_NMS,VW_CNT,SORT_TTL,LRG_AST_CD,MDM_AST_CD,SMALL_AST_CD,CORPOR_CD,LFE_CYCLE_CD,TG_CHARTR_NM_CD,SPORT_FR_NM_CD,TTL_CHO,ALIAS,SVC_QUALF,QUALF_GRP,TC_CD,REQST_MEAN_CD,LINK,SHARE_LINK,REQST_TMLMT_ETC,ATT_ITM_CD,SVC_SEQ,SVC_CTS,QUALF_UNIT,RANGE1_QUALF_ATT_CLS_CD,RANGE1_START,RANGE1_END,RANGE2_QUALF_ATT_CLS_CD,RANGE2_START,RANGE2_END,RANGE3_QUALF_ATT_CLS_CD,RANGE3_START,RANGE3_END,SVC_ALL_GRP01,SVC_ALL_GRP02,SVC_ALL_GRP03,SVC_ALL_GRP04,SVC_ALL_GRP05,RCV_ORG_NM,REFRNC_TEL_NO,REFRNC_NM,EPRSS_RNK",// set document field
			"", // set date range
			"", // set rank range
			"", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
			"", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
			"", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
			"", // set filter operation (<fieldname:operator:value>)
			"", // set groupby field(field, count)
			"", // set sort field group(field/order,field/order,...)
			"", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
			"", // set categoryGroupBy (fieldname:value)
			"", // set categoryQuery (fieldname:value)
			"", // set property group (fieldname,min,max, groupcount)
			"DEPT_INC_CD,PROC_TP_NM,ALIAS,SVC_GRP_ID,TC_CD,REQST_MEAN_CD,ATT_ITM_CD,QUALF_UNIT,SVC_ALL_GRP01,SVC_ALL_GRP02,SVC_ALL_GRP03,SVC_ALL_GRP04,SVC_ALL_GRP05", // use check prefix query filed
			"VW_CNT,SORT_TTL,RANGE1_START,RANGE1_END,RANGE2_START,RANGE2_END,RANGE3_START,RANGE3_END,EPRSS_RNK", // set use check fast access field
			"", // set multigroupby field
			"", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
			"", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
			"수혜서비스" // collection display name
			}
	       ,
	       {
    	   "RCV_FVR_SVC_POP", // set index name
    	   "RCV_FVR_SVC_POP", // set collection name
    	   "0,10",  // set pageinfo (start,count)
    	   "1,0,1,1,0", // set query analyzer (useKMA,isCase,useOriginal,useSynonym, duplcated detection)
    	   "RANK/DESC,DATE/DESC",  // set sort field (field,order) multi sort '/'
    	   "basic,rpmk,1000",  // set sort field (field,order) multi sort '/'
    	   "TTL/23,CONT/2,SVC_CTS/75",// set search field
    	   "DOCID,DATE,TTL,CONT/100,IDENTITY_CD,IDENTITY_NM,DEPT_INC_CD,MOD_DH,DVS_ID,DPT_ALL_NM,SVC_ID,ONLN_REQST_SITE_URL,REFRNC_SITE_URL,CD_NMS,VW_CNT,SORT_TTL,PC_MOBILE,DOCUMENT_ID,LRG_AST_CD,MDM_AST_CD,SMALL_AST_CD,APPLY_DEL_YN,CORPOR_CD,LFE_CYCLE_CD,TG_CHARTR_NM_CD,SPORT_FR_NM_CD,TTL_CHO,PROC_TP_NM,PROC_TP_SEQ,ALIAS,SVC_CTS,SVC_GRP_ID,TC_CD,REQST_MEAN_CD,LINK,SHARE_LINK",// set document field
    	   "", // set date range
    	   "", // set rank range
    	   "", // set prefix query, example: <fieldname:contains:value1>|<fieldname:contains:value2>/1,  (fieldname:contains:value) and ' ', or '|', not '!' / operator (AND:1, OR:0)
    	   "", // set collection query (<fieldname:contains:value^weight | value^weight>/option...) and ' ', or '|'
    	   "", // set boost query (<fieldname:contains:value> | <field3:contains:value>...) and ' ', or '|'
    	   "", // set filter operation (<fieldname:operator:value>)
    	   "", // set groupby field(field, count)
    	   "", // set sort field group(field/order,field/order,...)
    	   "", // set categoryBoost(fieldname,matchType,boostID,boostKeyword)
    	   "", // set categoryGroupBy (fieldname:value)
    	   "", // set categoryQuery (fieldname:value)
    	   "", // set property group (fieldname,min,max, groupcount)
    	   "DEPT_INC_CD,PROC_TP_NM,ALIAS,SVC_GRP_ID,TC_CD,REQST_MEAN_CD", // use check prefix query filed
    	   "VW_CNT,SORT_TTL", // set use check fast access field
    	   "", // set multigroupby field
    	   "", // set auth query (Auth Target Field, Auth Collection, Auth Reference Field, Authority Query)
    	   "", // set Duplicate Detection Criterion Field, RANK/DESC,DATE/DESC
    	   "수혜서비스_인기검색어용" // collection display name
	       }
        };
    }
}
