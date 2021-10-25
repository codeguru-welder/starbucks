package kr.go.portal.rcvfvrSvc.search.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.go.common.log.CommonLoggerFactory;
import kr.go.portal.rcvfvrSvc.search.service.common.WNUtils;

/**
 * 통합검색 Service
 * @author 강태욱
 * @since 2016. 11. 23. 오후 5:46:44
 * @version 1.0
 */
@Service
public class RcvfvrSvcSearchService {
    
	private static final Logger log = LoggerFactory.getLogger("applicationLogger");
	
    /**
     * 검색엔진 서버IP
     */
    @Value("#{resourceProperties['wisenut.sf1.search.server.ip']}")
    private String searchIp ;//= "10.47.68.53";

    /**
     * 검색엔진 IP와 동일
     */
    @Value("#{resourceProperties['wisenut.sf1.search.server.ip']}")
    private String textAnalyzerIp;
    
    private String dmPort = "17300";
    
    /**
     * 검색엔진 관리도구 URL
     */
    @Value("#{resourceProperties['wisenut.sf1.manager.server.url']}")
    private String managerUrl;
    
    @Autowired
    HttpServletRequest request;
    
	/**
	 * 2020-10-19 append
	 * 인기검색어 collection을 통한 호출 추가 (수혜서비스:RCV_FVR_SVC)
	 * @param collection
	 * @param range
	 * @return
	 */
	public String getPopwordJsonString(String collection, String range) {
		collection = WNUtils.checkReqXSS(collection, "_ALL_");
		range = WNUtils.checkReqXSS(range, "W");
		
		// 인기검색어 결과 가져오기!!!!!!
        StringBuffer urlSb = new StringBuffer();
        
        String target = "popword";
        //String collection ="TOTAL_GOV";
        //String range = "week";
        String dataType= "json";
        String charset = "utf-8";

        urlSb.append(managerUrl);
        urlSb.append("/WNRun.do?");

        urlSb.append("target=").append(target); 
        urlSb.append("&range=").append(range);
        urlSb.append("&collection=").append(collection);
        urlSb.append("&datatype=").append(dataType);
        urlSb.append("&charset=").append(charset);

        String requestUrl = urlSb.toString();

        CommonLoggerFactory.APP_LOGGER.debug("[POPWORD URL]인기검색어(추천태그) URL : " + requestUrl);

        return getHtmls(requestUrl, 1000, dataType, charset);
	}
	
    /**
     * 인기검색어 결과 가져오기
     *
     * @param  
     * @return
     * @throws Exception
     */   
	public String getPopwordJsonString() {
		// 인기검색어 결과 가져오기!!!!!!
        StringBuffer urlSb = new StringBuffer();
        
        String target = "popword";
        String collection ="TOTAL_GOV";
        String range = "week";
        String dataType= "json";
        String charset = "utf-8";

        urlSb.append(managerUrl);
        urlSb.append("/WNRun.do?");

        urlSb.append("target=").append(target); 
        urlSb.append("&range=").append(range);
        urlSb.append("&collection=").append(collection);
        urlSb.append("&datatype=").append(dataType);
        urlSb.append("&charset=").append(charset);

        String requestUrl = urlSb.toString();

        CommonLoggerFactory.APP_LOGGER.debug("[POPWORD URL]인기검색어(추천태그) URL : " + requestUrl);

        return getHtmls(requestUrl, 1000, dataType, charset);
        
        
	}
	

    /**
     * 검색엔진 관리도구에 요청하는 Method
     *
     * @param receiverURL
     * @param timeout
     * @param datatype
     * @param charset
     * @return
     */
    public String getHtmls(String receiverURL, int timeout, String datatype, String charset) {
        StringBuffer receiveMsg = new StringBuffer();
        int errorCode = 0;
        HttpURLConnection uc = null;
         BufferedReader in = null;
        try {

            // -- receive servlet connect
            URL servletUrl = new URL(receiverURL);
            uc = (HttpURLConnection) servletUrl.openConnection();
            uc.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
            uc.setReadTimeout(timeout);
            uc.setRequestMethod("GET");
            uc.setDoOutput(true);
            uc.setDoInput(true);
            uc.setUseCaches(false);
            uc.setConnectTimeout(timeout);
            uc.setReadTimeout(timeout);
            uc.connect();
            // init
            errorCode = 0;
            
            CommonLoggerFactory.APP_LOGGER.debug("[SearchManager URLConnection Response Code] 검색엔진 관리도구 요청 " + uc.getResponseCode());
            
            // -- Network error check
            if (uc.getResponseCode() == HttpURLConnection.HTTP_OK) {
                String currLine = "";
                // UTF-8인 경우
                in = new BufferedReader(new InputStreamReader(uc.getInputStream(), "UTF-8"));
                // BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));
                while ((currLine = in.readLine()) != null) {
                    receiveMsg.append(currLine).append("\r\n");
                }
            } else {
                /*
                 * errorCode = uc.getResponseCode(); return receiveMsg.toString();
                 */
                errorCode = uc.getResponseCode();
                receiveMsg.setLength(0);
                if (datatype.toLowerCase().equals("xml")) {
                    receiveMsg.append("<?xml version=\"1.0\" encoding=\"" + charset + "\"?>").append("\r\n");
                    receiveMsg.append("<Data>").append("\r\n");
                    receiveMsg.append("<MakeTime>error:" + errorCode + "</MakeTime>").append("\r\n");
                    receiveMsg.append("</Data>").append("\r\n");
                } else if (datatype.toLowerCase().equals("json")) {
                    receiveMsg.append("{\"Data\":{\"MakeTime\":\"error\",\"Query\":[{}],\"Type\":{\"content\":\""
                            + errorCode + "\"},\"Label\":{\"content\":\"" + errorCode + "\"}}}");
                }
            }

        } catch (IOException ex) {
            receiveMsg.setLength(0);
            if (datatype.toLowerCase().equals("xml")) {
                receiveMsg.append("<?xml version=\"1.0\" encoding=\"" + charset + "\"?>").append("\r\n");
                receiveMsg.append("<Data>").append("\r\n");
                receiveMsg.append("<MakeTime>error</MakeTime>").append("\r\n");
                receiveMsg.append("</Data>").append("\r\n");
            } else if (datatype.toLowerCase().equals("json")) {
                receiveMsg.append("{\"Data\":{\"MakeTime\":\"error\",\"Query\":[{}],\"Type\":{\"content\":\"" + ex
                        + "\"},\"Label\":{\"content\":\"" + ex + "\"}}}");
            }
        }finally{
        	if(in !=null)
				try {
					in.close();
				} catch (IOException ex) {
					receiveMsg.setLength(0);
		            if (datatype.toLowerCase().equals("xml")) {
		                receiveMsg.append("<?xml version=\"1.0\" encoding=\"" + charset + "\"?>").append("\r\n");
		                receiveMsg.append("<Data>").append("\r\n");
		                receiveMsg.append("<MakeTime>error</MakeTime>").append("\r\n");
		                receiveMsg.append("</Data>").append("\r\n");
		            } else if (datatype.toLowerCase().equals("json")) {
		                receiveMsg.append("{\"Data\":{\"MakeTime\":\"error\",\"Query\":[{}],\"Type\":{\"content\":\"" + ex
		                        + "\"},\"Label\":{\"content\":\"" + ex + "\"}}}");
		            }
				}
        	if(uc !=null) uc.disconnect();
        }
        return receiveMsg.toString();
    }

    
//  String textAnalyzerIp = "10.47.62.224"; //개발IP
//  String dmPort = "17300";
    
    /**
     * 2020-07-24 국가보조금 맞춤형 수혜서비스 의미기반검색(질의형) 
     * 
     */
    public String getTextAnalyzerEntity(String query) throws NullPointerException{
    	String rt ="";
    	String projectId = "";
    	String sessionKey = "";

    	CommonLoggerFactory.APP_LOGGER.debug("[info] [textAnalyzer-v2.0] textAnalyzerIp Check-!! >>> "+textAnalyzerIp+" dmPort Check-!! >>> "+dmPort);
    	
    	JSONObject obj1 = new JSONObject();
    	obj1.put("projectName", "정부24 국가보조금");
    	obj1.put("pageNum", "1");
    	obj1.put("countPerPage", 10);
    	projectId = getProjectId(obj1);
    	obj1.clear();
    	
    	JSONObject obj2 = new JSONObject();
    	obj2.put("pageNum", "1");
    	obj2.put("countPerPage", 5);
    	sessionKey = getSessionKey();
    	obj2.clear();
    	
    	JSONObject obj3 = new JSONObject();
    	obj3.put("projectId", projectId);
    	obj3.put("sessionKey", sessionKey);
    	obj3.put("isDebug", true);
    	obj3.put("query", query);
    	JSONArray featureList = getFeatureList(obj3);
    	obj3.clear();
    	
    	JSONObject obj4 = new JSONObject();
    	obj4.put("sessionKey", sessionKey);
    	sessionTermination(obj4);
    	obj4.clear();
    	
    	JSONObject obj5 = new JSONObject();
    	obj5.put("projectId", projectId);
    	obj5.put("query", query);
    	JSONArray morphAnalysis = getMorphAnalysis(obj5);
    	obj5.clear();
		
    	for(int i=0; i<morphAnalysis.size(); i++){
			rt += (i==0?"|(":" ")+morphAnalysis.get(i).toString()+(i==morphAnalysis.size()-1?")":""); 		// "|" OR검색
		}
		
		//ArrayList<String> arrlist = new ArrayList<>();
		for(int i=0;i<featureList.size(); i++){
			//arrlist.add(featureList.get(i).toString());
			rt += "|("+featureList.get(i).toString()+")"; 		// "|" OR검색
		}
		/*
		for(String arr : arrlist){
			rt += "|("+arr+")"; 		// "|" OR검색
		}
		*/
		
    	return rt;
    }
    
    public String getSessionKey(){
    	String apiUrl = "/api/v1/common/sessionRequest";
		JSONObject jsonRt = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			jsonRt = (JSONObject) parser.parse(RestCall(textAnalyzerIp, dmPort, apiUrl, new JSONObject()));
		} catch (ParseException e) {
			log.debug("[error] ParseException : [apiUrl:"+apiUrl+"] " + e.getMessage());
		}
		
		String sessionKey = jsonRt.get("sessionKey").toString();
		jsonRt.clear();
		return sessionKey;
    }
    
    public String getProjectId(JSONObject jsonObject){
    	String apiUrl = "/api/v1/project/search";
		JSONObject jsonRt = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			jsonRt = (JSONObject) parser.parse(RestCall(textAnalyzerIp, dmPort, apiUrl, jsonObject));
		} catch (ParseException e) {
			log.debug("[error] ParseException : [apiUrl:"+apiUrl+"] " + e.getMessage());
		}
		
		JSONArray jsonArr = (JSONArray) jsonRt.get("projectList");
		jsonRt = (JSONObject) jsonArr.get(0);
		String projectId = jsonRt.get("projectId").toString();
		jsonRt.clear();
		return projectId;
    }
    
    public JSONArray getFeatureList(JSONObject jsonObject){
    	String apiUrl = "/api/v1/common/wiseIChatResponse";
		JSONObject jsonRt = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			jsonRt = (JSONObject) parser.parse(RestCall(textAnalyzerIp, dmPort, apiUrl, jsonObject));
		} catch (ParseException e) {
			log.debug("[error] ParseException : [apiUrl:"+apiUrl+"] " + e.getMessage());
		}
		
		JSONObject resp = new JSONObject();
		resp = (JSONObject) jsonRt.get("response");
		JSONArray jsonArr = (JSONArray) resp.get("featureList");
		
		jsonRt.clear();
		return jsonArr;
    }
    
    public String sessionTermination(JSONObject jsonObject){
    	String apiUrl = "/api/v1/common/sessionTermination";
		JSONObject jsonRt = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			jsonRt = (JSONObject) parser.parse(RestCall(textAnalyzerIp, dmPort, apiUrl, jsonObject));
		} catch (ParseException e) {
			log.debug("[error] ParseException : [apiUrl:"+apiUrl+"] " + e.getMessage());
		}
		
		return jsonRt.toJSONString();
    }
    
    public JSONArray getMorphAnalysis(JSONObject jsonObject){
    	String apiUrl = "/api/v1/demo/simulation";
		JSONObject jsonRt = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			jsonRt = (JSONObject) parser.parse(RestCall(textAnalyzerIp, dmPort, apiUrl, jsonObject));
		} catch (ParseException e) {
			log.debug("[error] ParseException : [apiUrl:"+apiUrl+"] " + e.getMessage());
		}
		
		JSONObject resp = new JSONObject();
		resp = (JSONObject) jsonRt.get("response");
		String[] jsonStr = resp.get("morphAnalysis").toString().split(" ");
		
		JSONArray jsonArr = new JSONArray();
		for(String str : jsonStr){
			if( str.length() >0 ){
				jsonArr.add( str.substring(0, str.indexOf("/")) );
			}
		}
		
		return jsonArr;
    }
    

    /**
     * REST API 호출
     *  
     * @param paramUrl
     * @param jsonObject void
     */
    public String RestCall(String textAnalyzerIp, String dmPort, String apiUrl, JSONObject jsonObject){
    	String paramUrl = "http://"+textAnalyzerIp+":"+dmPort+apiUrl;
    	JSONObject jsonObj = new JSONObject();
    	String rt = "";
    	try {
            URL url = new URL(paramUrl);
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("POST");
            //conn.setRequestProperty("X-Auth-Token", API_KEY);            
            conn.setRequestProperty("X-Data-Type", "application/json");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream(),"UTF-8");
            osw.write(jsonObject.toString());
            osw.flush();
            osw.close();
            
            JSONParser jsonParser = new JSONParser();
            jsonObj = (JSONObject)jsonParser.parse(new InputStreamReader(conn.getInputStream(),"UTF-8"));
            rt = jsonObj.toJSONString();
            //CommonLoggerFactory.APP_LOGGER.debug("[textAnalyzer-v2.0] jsonObj.toJSONString() >>> "+jsonObj.toJSONString());
            
            if (conn.getResponseCode() != 200) {
            	log.debug("Failed: HTTP error code : " + conn.getResponseCode());
            	throw new RuntimeException("Failed: HTTP error code : " + conn.getResponseCode());
            }
            conn.disconnect();
        } catch (IOException e) {
        	log.debug("RestCall Fail : [IOException] " + e.toString());
        } catch (ParseException e) {
        	log.debug("RestCall Fail : [ParseException] " + e.toString());
		}finally{
			if(jsonObj != null){
				jsonObj.clear();
			}
		}
    	return rt;
    }
    
    public HashMap<String,String> queryCheckAgeRegExr(String query){
    	CheckQualificationRegExr checkRegExr = new CheckQualificationRegExr();
    	HashMap<String, String> result = new HashMap<>();
    	
    	for(String[] qDatas : checkRegExr.QUALIFICATION_REGEXR){
//    		String qName = qDatas[0];
    		String regExr = qDatas[1];
    		
    		Pattern pattern = Pattern.compile(regExr);
    		Matcher matcher = pattern.matcher(query);
    		
    		while(matcher.find()){
    			result.put("attClsCd", qDatas[2]);
    			result.put("ageNum", matcher.group(1));
    			
    			if(matcher.group(1) == null) break;
    		}
    	}
    	CommonLoggerFactory.APP_LOGGER.debug("[queryCheckRegExr] >>> "+result.toString());
    	return result;
    }
    
    /**
     * label 선택을 통한 추천검색어 호출
     * 
     * @param label
     * @param datatype
     * @param query
     * @return
     */
    public String getRecomendKeyword(String label, String datatype, String query) {
    	label = WNUtils.checkReqXSS(label, "");
    	datatype = WNUtils.checkReqXSS(datatype, "json");
    	query = WNUtils.checkReqXSS(query, "");
    	
        // 요청 url StringBuffer
        StringBuffer urlSb = new StringBuffer();

        urlSb.append(managerUrl);
        urlSb.append("/WNRun.do?");

        urlSb.append("target=").append("recommend");
        urlSb.append("&charset=").append("utf-8");
        urlSb.append("&label=").append(label);
        urlSb.append("&datatype=").append(datatype);
        urlSb.append("&query=").append(query);

        String requestUrl = urlSb.toString();

        CommonLoggerFactory.APP_LOGGER.debug("[Recommend URL]연관(추천)검색어 URL : " + requestUrl);

        return getHtmls(requestUrl, 1000, datatype, "utf-8");
    }
    
	
    public static String getArkHtmls(String receiverURL, String parameter, int timeout) throws Exception{
		StringBuffer receiveMsg = new StringBuffer();
		HttpURLConnection uc = null;
		BufferedReader in = null;
		
		try {
			URL servletUrl = new URL(receiverURL);
			uc = (HttpURLConnection) servletUrl.openConnection();
			uc.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
			uc.setRequestMethod("GET");
			uc.setDoOutput(true);
			uc.setDoInput(true);
			uc.setUseCaches(false);
			uc.setDefaultUseCaches(false);
			uc.setConnectTimeout(timeout);
			uc.setReadTimeout(timeout);
			DataOutputStream dos = new DataOutputStream (uc.getOutputStream());
			dos.write(parameter.getBytes());
			dos.flush();
			dos.close();
	
			if (uc.getResponseCode() == HttpURLConnection.HTTP_OK) {
				String currLine = "";
	            // UTF-8. ..
	            in = new BufferedReader(new InputStreamReader(uc.getInputStream(), "UTF-8"));
	            while ((currLine = in.readLine()) != null) {
	            	receiveMsg.append(currLine).append("\r\n");
	            }
	            in.close();
	        } else {
	              return receiveMsg.toString();
	         }
	   } catch(Exception ex) {
	        //System.out.println(ex);
	   } finally {
		   if(in != null) in.close();
	       if(uc != null) uc.disconnect();
	   }
	   return receiveMsg.toString();
	}
    
    /**
     * 자동완성 결과 가져오기
     *
     * @param  
     * @return
     * @throws Exception
     */   
	public String getArkJsonString(String query, String convert, String target, String charset, String dataType) throws Exception {
		// 자동완성 결과 가져오기!!!!!!
        StringBuffer param = new StringBuffer();
        
//        String query = "";
//    	String convert = "fw";							// 정방향, 역방향 값
//    	String target = "";								// ARK 웹서버 설정파일의 목록에 있는 추천어 서비스 대상을 지정한다.
//    	String charset = "utf-8";							// 인코딩 설정 (인코딩이 utf-8이 아닐 경우 8859_1 로 설정해야함)
//    	String dataType = "json";							// 반환받을 Data의 타입을 설정. XML 과 JSON이 가능 (xml | json)

    	query = URLEncoder.encode(query, "UTF-8"); 
    	
        String url = managerUrl + "/WNRun.do?";
        
        param.append("query=").append(query); 
        param.append("&convert=").append(convert);
        param.append("&target=").append(target);
        param.append("&charset=").append(charset);
        param.append("&dataType=").append(dataType);

        String requestParam = param.toString();

        CommonLoggerFactory.APP_LOGGER.debug("[ARK URL]자동완성 URL : " + url + requestParam);

//        return getArkHtmls(url, requestParam, 1000);
        return getHtmls(url + requestParam, 1000, "json", "UTF-8");
	}
	
    
	public String getArkSrvJsonString(String query, String convert, String target, String charset, String dataType) throws Exception {
		// 자동완성 결과 가져오기!!!!!!
        StringBuffer param = new StringBuffer();
        
//        String query = "";
//    	String convert = "fw";							// 정방향, 역방향 값
//    	String target = "";								// ARK 웹서버 설정파일의 목록에 있는 추천어 서비스 대상을 지정한다.
//    	String charset = "utf-8";							// 인코딩 설정 (인코딩이 utf-8이 아닐 경우 8859_1 로 설정해야함)
//    	String dataType = "json";							// 반환받을 Data의 타입을 설정. XML 과 JSON이 가능 (xml | json)

    	query = URLEncoder.encode(query, "UTF-8"); 
    	
        String url = managerUrl + "/WNRun.do?";
        
        param.append("query=").append(query); 
        param.append("&convert=").append(convert);
        param.append("&target=").append(target);
        param.append("&charset=").append(charset);
        param.append("&dataType=").append(dataType);

        String requestParam = param.toString();

       CommonLoggerFactory.APP_LOGGER.debug("[ARK URL]자동완성 URL : " + url + requestParam);

//        return getArkHtmls(url, requestParam, 1000);
        return getHtmls(url + requestParam, 1000, "json", "UTF-8");
	}
    
}