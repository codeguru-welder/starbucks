/**
 *
 */
package kr.go.portal.rcvfvrSvc.common.util;

import java.text.SimpleDateFormat;
import java.text.StringCharacterIterator;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;


/**
 * @author jjh
 * 2020. 6. 26. 오후 1:51:54
 * mospa.sd1.common.util.ComUtil
 * Desc : null 여부 체크등.   StringUtil  과  Utility  에 없는것들 추가.
 */
public class ComUtil {

	// getDttm
	public static String getDttm(){
		return getDate("yyyyMMddHHmmss");
	}
	public static String getDt_tm(){
		return getDate("yyyyMMdd_HHmmss");
	}

	public static String getShowDttm(){
		return getDate("yyyy-MM-dd HH:mm:ss");
	}
	public static String getShowDttmSSS(){
		return getDate("yyyy-MM-dd HH:mm:ss.SSS");
	}

	public static String getDtm(){
		return getDate("yyyyMMdd");
	}
	// gettmSSS
	public static String getTmSSS() {
		return getDate("HH:mm:ss.SSS");
	}

	// yyyyMMddHHmmssSSS
	public static String getDate(String pattern){
		String rtn="";

		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		rtn=sdf.format(new Date());

		return rtn;
	}

	// is null
	public static boolean isNull(Object obj){
		boolean retB = false;

		if(obj==null  ||  "null".equals(obj)){
			retB = true;
		}

		return retB;
	}


	// 주민등록 번호로 생년월일 가져오기   8010221  =>   19801022
	public static String getJuminBirth(String jumin){
		String rtn=jumin;

		// 8010221
		if(jumin!=null  &&  jumin.length()>6){

			// 7번째가  1,2    이면    19 를 붙임
			// 5,6  1900년생 외국인
			String sevenStr = jumin.substring(6, 7);
			String birthStr = jumin.substring(0, 6);
			if("1".equals(sevenStr) || "2".equals(sevenStr)
					|| "5".equals(sevenStr)
					|| "6".equals(sevenStr)
					){
				rtn = "19"+birthStr;
			}else{
				rtn = "20"+birthStr;
			}
		}

		return rtn;
	}


	// 만 개월수 가져오기
	public static int getAgeMonth(String birthStr){
		int rtn = 0;

		if(birthStr!=null && birthStr.length()>7){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date nowDate = new Date();

			// 생년월일로 만나이 만개월수 구하기
			//String birthStr= "20190518";
			String nowStr = sdf.format(nowDate);



			// 무식하게 구하기....
			int birthYear = Integer.parseInt(birthStr.substring(0,4));
			int nowYear = Integer.parseInt(nowStr.substring(0,4));

			int birthMonth = Integer.parseInt(birthStr.substring(4,6));
			int nowMonth = Integer.parseInt(nowStr.substring(4,6));

			int birthDay = Integer.parseInt(birthStr.substring(6,8));
			int nowDay = Integer.parseInt(nowStr.substring(6,8));

			// sum
			int sumMonth=0;

			//현재일 2020 06 15
			// 생일  2019 07 24

			// 오늘 일자가 생일 일자보다 작은지 확인.
			if(nowDay<birthDay){
				sumMonth += -1;
			}

			// now 6월....  생일 10월
			rtn = ( (nowYear-birthYear-1)*12 ) + (12 - birthMonth + nowMonth ) + sumMonth;
		}

		return rtn;
	}

	// 만나이 가져오기
	public static int getAgeYear(String birthStr){
		int rtn = 0;

		int ageMonth = getAgeMonth(birthStr);

		// 구한 month 에서 12 나누기... 버림.
		rtn = (int) Math.floor(ageMonth/12);

		return rtn;
	}

	public static String toHtmlTagBlank(String srcString){
		if(srcString == null || srcString.length() <= 0)
            return "";
        StringBuffer result = new StringBuffer();
        srcString = srcString.replaceAll("&nbsp;", " ");
        StringCharacterIterator iterator = new StringCharacterIterator(srcString);
        for(char character = iterator.current(); character != '\uFFFF'; character = iterator.next())
        {
            if(character == '<')
            {
                result.append("&lt;");
                continue;
            }
            if(character == '>')
            {
                result.append("&gt;");
                continue;
            }
            if(character == '"')
            {
                result.append("&quot;");
                continue;
            }
            if(character == '\'')
            {
                result.append("&#039;");
                continue;
            }
            if(character == '\\')
            {
                result.append("&#092;");
                continue;
            }
            if(character == '&')
            {
                result.append("&amp;");
                continue;
            }
            if(character == '\n')
            {
                result.append("<br/>");
                continue;
            }
            if(character == ' '){
                result.append(" ");
                continue;
            }

            result.append(character);
        }

        return result.toString().replaceAll("&amp;#", "&#");
	}

	//param makes get for paging
	public static String getParamStr(HttpServletRequest request,boolean isAll){  // isAll true  all paran.... false  value not null param
		String rtn="";
		Enumeration<String> reqParamNames = request.getParameterNames();

		int cnt=0;
        // try {
        while (reqParamNames.hasMoreElements()) {
            String reqParamName = reqParamNames.nextElement();
            if(!"pageIndex".equals(reqParamName)){
            	String value=request.getParameter(reqParamName);
                if(isAll){
                	rtn += (cnt==0?"?":"&")+reqParamName+"="+value;
                	cnt++;
                }else{
                	if(value!=null && !"".equals(value)){
                		rtn += (cnt==0?"?":"&")+reqParamName+"="+value;
                		cnt++;
                	}
                }
            }
        }
        return rtn;
	}


}