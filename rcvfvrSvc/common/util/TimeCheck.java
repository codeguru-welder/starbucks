/**
 *
 */
package kr.go.portal.rcvfvrSvc.common.util;

/**
 * @author jjh
 * 2020. 11. 18. 오후 1:46:41
 * mospa.sd1.rcvfvrSvcGuidance.util.TimeCheck
 * Desc :
 */
public class TimeCheck {
	//걸린시간 계산용

	//시작시간
	private static long startMillSecond;
	private static long startMillLastSecond;

	/**
	 *
	 */
	public TimeCheck() {
		setStartTime("");
	}

	private void setStartTime(){
		setStartTime("");
	}
	private void setStartTime(String str){
		String logTag = Logs.getLogTagStr("");
		Logs.debugL(logTag, str+"  "+ComUtil.getShowDttmSSS()+" start");

		startMillSecond = System.currentTimeMillis();
		startMillLastSecond=0L;
	}

	public void getTimeGap(){
		getTimeGap("");
	}

	public void getTimeGap(String str){
		String printStr="";
		long timeGap=System.currentTimeMillis()-startMillSecond;

		printStr=ComUtil.getShowDttmSSS()+" ##"+( (float)(timeGap/1000.0))+"초 소요";

		if(startMillLastSecond>0L){
			long timeGapLast=System.currentTimeMillis()-startMillLastSecond;
			printStr+="\n    ## "+( (float)(timeGapLast/1000.0) ) +" 초";
		}

		String logTag = Logs.getLogTagStr("");
		Logs.debugL(logTag, printStr);

		startMillLastSecond=System.currentTimeMillis();
	}
}
