/**
 *
 */
package kr.go.portal.rcvfvrSvc.common.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author jjh
 * 2020. 6. 26. 오후 1:51:11
 * mospa.sd1.common.util.Logs
 * Desc : Class 와  map 같은 내용 찍을 용도.
 * Class명 과 함수명 , 라인 , Thread length , Thread id
 */
public class Logs {
	
	static int logTraceDepth = -1;
	
	// log grep 용 문구.
	static final String forGrepStr = " #### 2020nsSvc";
	
	static final Logger Logger = LoggerFactory.getLogger(Logs.class.getSimpleName());
	
	
	
	
	public static void debug(Object str){
		String logTagStr = getLogTagStr(str);
		
		Logger.debug(logTagStr);
	}
	
	public static void info(Object str){
		String logTagStr = getLogTagStr(str);
		
		Logger.info(logTagStr);
	}
	
	public static void error(Object str){
		String logTagStr = getLogTagStr(str);
		
		Logger.error(logTagStr);
	}
	
	public static void debugL(String logTag,Object str){
		Logger.debug(logTag+""+str);
	}
	
	//map debug
	public static void objDebug(Map params){
		String logTag=getLogTagStr("");
		objDebug(params,logTag,true);
	}
	
	// null이 아닌거 출력. 값이 있는거.
	public static void objDebugNotNull(Map params){
		String logTag=getLogTagStr("");
		objDebug(params,logTag,false);
	}
	
	
	//map debug
	public static void objDebug(Map params,String logTag , boolean nullDebug){
		if(params!=null){
			
			debugL(logTag,":: Map values");
			
			Set s=null;
			Iterator it = null;
			
			String key="";
			Object value=null;
			
			s = params.keySet();
			it = s.iterator();
			
			int rowCount=1;
			
			String dbgStr="";
			
			while(it.hasNext()){
				key = (String)it.next();
				value = params.get(key);
				dbgStr="    "+key+"==["+value+"]";
				
				//nullDebug   true  debug   false  no debug
				if( nullDebug  ){		
					debugL(logTag, dbgStr);
					
				}else{
					if( !ComUtil.isNull(value) && !"".equals(value)  ){
						
						// value 값이 긴거는 제외....
						if( (value+"").length()>300){
							dbgStr="    "+key+"==[long str..."+(value+"").substring(0, 100)+".... len=="+(value+"").length()+"]";
							debugL(logTag, dbgStr);
						}else{
							debugL(logTag, dbgStr);								
						}
						
					}
				}
				
				
			}
		}
	}
	
	
	// Object Class deubg
	public static void objDebug(Object obj){
		String logTag = getLogTagStr("");
		objDebug(obj,logTag,true);
	}
	
	// Object Class deubgNotNull
	public static void objDebugNotNull(Object obj){
		String logTag = getLogTagStr("");
		objDebug(obj,logTag,false);
	}
	
	// null is debug    true  debug   false  no debug
	public static void objDebug(Object obj,String logTag,boolean nullDebug){
		if(obj!=null){
			String className = obj.getClass().getSimpleName();
			debugL(logTag, " ==== "+className+" values");
			
			objDebugClass(obj.getClass(),obj,logTag,nullDebug);
			objDebugClass(((Class)(obj.getClass().getGenericSuperclass())),obj,logTag,nullDebug);
		}
	}
	
	public static void objDebugClass(Class clazz,Object obj,String logTag,boolean nullDebug){
		Field[] fields = clazz.getDeclaredFields();
		for (int i = 0; i < fields.length; i++) {
			Field fld = fields[i];
			String name = fld.getName();
			
			Object val = null;
			
			
			String firstUpperName = name.substring(0,1).toUpperCase()+name.substring(1);
			Method method=null;
			try {
				method = clazz.getDeclaredMethod("get"+firstUpperName);
			} catch (NoSuchMethodException | SecurityException e) {
				
			}
			
			try {
				if(method!=null){
					val=method.invoke(obj);
				}
			} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				
			}
			
			// List.....
			if(val instanceof List){
				String arrayStrs= "instanceof List ";
				ArrayList valList = (ArrayList)val;
				for (int j = 0; j < valList.size(); j++) {
					arrayStrs+=  (j==0?"":",")+ valList.get(j);
				}
				val=arrayStrs;
			}
			else if(val  instanceof Object[]) {
				String arrayStrs= "instanceof Object[] ";
				Object[] arrays = (Object[])val;
				for (int j = 0; j < arrays.length; j++) {
					arrayStrs+=  (j==0?"":",")+ arrays[j];
				}
				val=arrayStrs;
			}
			
			String dbgStr = "    "+name+"==["+val+"]";
			
			//nullDebug   true  debug   false  no debug
			if( nullDebug  ){											
				debugL(logTag, dbgStr);
			}
			else{
				
				if( !ComUtil.isNull(val) && !"".equals(val)  ){
					debugL(logTag, dbgStr);
				}
			}
		}
		
	}
	
	
	// called class method 
	public static String getLogTagStr(Object obj){
		String logStr="";
		
		StackTraceElement ste = null;
		StackTraceElement[] stes = Thread.currentThread().getStackTrace();
		
		if(logTraceDepth<=0){
			
			for (int i = 0; i < stes.length; i++) {
				
				StackTraceElement chk = stes[i];
				
				if(Logs.class.getName().equals(chk.getClassName())){
					
					//Logs 호출한 상위
					if(stes.length>=(i+2+1)){
						logTraceDepth=i+2;
						ste = stes[i+2];
						break;
					}else if(stes.length>=(i+1+1)){
						logTraceDepth=i+1;
						ste = stes[i+1];
						break;
					}
				}
			}
		}
		//구한 depth 가 있으면
		else{
			ste=stes[logTraceDepth];
		}
		
		
		if(ste==null){
			ste=Thread.currentThread().getStackTrace()[3];
		}
		
		
		String className = ste.getClassName();
		String logTag = className.substring( className.lastIndexOf(".")+1 );
		
		String methodName = ste.getMethodName();
		
		logStr = logTag+":"+methodName+"()"+ste.getLineNumber()
		+"["+Thread.currentThread().getStackTrace().length+":"+Thread.currentThread().getId()+"]"
		+forGrepStr+" "+obj;
		
		return logStr;
	}
	
	
}
