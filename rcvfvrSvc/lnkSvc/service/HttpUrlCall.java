/**
 *
 */
package kr.go.portal.rcvfvrSvc.lnkSvc.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.util.FileCopyUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import kr.go.portal.rcvfvrSvc.common.util.Logs;

/**
 * @author jjh
 * 2020. 7. 23. 오후 3:17:04
 * mospa.sd1.rcvfvrSvcGuidance.util.HttpUrlCall
 * Desc :  2020 0904  신규 연계
 */
public class HttpUrlCall {

	// 연계 보내기
	public String send(String urlstr,HashMap data){
		String rtn="";

		String xmlStr = makeXml(data);

		Logs.debug("xmlStr=="+xmlStr);
		//CommonLogFactory.APP_LOGGER.debug("xmlStr=="+xmlStr);
		//CommonLoggerFactory.APP_LOGGER.debug("xmlStr=="+xmlStr);

		rtn = httpConnection(urlstr,xmlStr);

		return rtn;
	}

	// 연계 데이터 xml 만들기
	private String makeXml(HashMap data){
		String rtnXml = "";

		Logs.objDebug(data);

		String sendTxid = (String) data.get("sendTxid");
		String cpttrNm = (String) data.get("cpttrNm");
		String ihidnumBdrcl = (String) data.get("ihidnumBdrcl");
		// 리스트
		ArrayList datas = (ArrayList) data.get("datas");


		StringWriter sw = new StringWriter();

		try {

			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

			//root
			Document doc = (Document) docBuilder.newDocument();

			Element elmt_root = doc.createElement("INDIGO");
			doc.appendChild(elmt_root);

			Element elmt_header = doc.createElement("Header");
			elmt_root.appendChild(elmt_header);

			setParentChildElement(doc,elmt_header,"IF_ID",(String) data.get("Header_IF_ID"));

			setParentChildElement(doc,elmt_header,"TX_ID",(String) data.get("Header_TX_ID"));

			setParentChildElement(doc,elmt_header,"ResponseType",(String) data.get("Header_ResponseType"));

			setParentChildElement(doc,elmt_header,"ShareYN",(String) data.get("Header_ShareYN"));
			setParentChildElement(doc,elmt_header,"TestYN",(String) data.get("Header_TestYN"));

			String ifLists="";

			Set s=null;
			Iterator it = null;

			String key="";
			Object value=null;

			// 반복문...
			for (int i = 0; i < datas.size(); i++) {
				HashMap rowMap = (HashMap) datas.get(i);
				String ifList = (String)rowMap.get("IF_LIST");
				ifLists += (i==0?"":",")+ifList;

				//Logs.debug("ifList=="+ifList);

				Element rowEle = createElement(doc,ifList);

				s = rowMap.keySet();
				it = s.iterator();

				while(it.hasNext()){
					key = (String)it.next();
					key = key.trim();
					value = rowMap.get(key);
					if(!"IF_LIST".equals(key)){
						setParentChildElement(doc,rowEle,key,(String)value);
					}
				}

				elmt_root.appendChild(rowEle);
			}

			Logs.debug("datas.size()=="+datas.size());
			Logs.debug("ifLists=="+ifLists);

			setParentChildElement(doc,elmt_header,"IF_LIST",ifLists);

			// xml 문자열
			TransformerFactory trFct = TransformerFactory.newInstance();



			Properties output = new Properties();
			output.setProperty(OutputKeys.INDENT, "yes");

			Transformer transformer = trFct.newTransformer();

			transformer.transform(new DOMSource(doc), new StreamResult(sw));

			rtnXml = sw.getBuffer().toString();

		} catch (TransformerException e) {
			Logs.error(e);
		} catch (ParserConfigurationException e) {
			Logs.error(e);
		} catch (Exception e) {
			Logs.error(e);
		}finally {
			if(sw!=null){
				try {
					sw.close();
				} catch (IOException e) {

				}

			}
		}

		return rtnXml;
	}

	private void setParentChildElement(Document doc,Element parent , String childName , String childVal){
		Element elmt_child = createElement(doc,childName);
		elmt_child.appendChild(doc.createTextNode(childVal));
		parent.appendChild(elmt_child);
	}

	private Element createElement(Document doc,String elementName){
		Element newElement = doc.createElement(elementName);
		return newElement;
	}

	//2020 0904   post body
	private String httpConnection(String urls,String xmlData){


		String char_set = "EUC-KR"; // 문자 인코딩셋 EUC-KR  UTF-8   개발자분 로컬은 UTF-8   이후 개발은 EUC-KR

		HttpClient httpclient = null;


		HttpURLConnection conn=null;

		String sessionid = "";

		String rtn="";

		URL url = null;
		//HttpURLConnection conn = null;

		BufferedReader br=null;

		String readLine="";

		StringBuffer sb = null;

		OutputStream os = null;

		try {
			url = new URL(urls);

			conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setConnectTimeout( 1000 * 2);
			conn.setReadTimeout(1000 * 60); //socketTimeout = 1000 * 20;

			conn.setDefaultUseCaches(true);
			conn.setUseCaches(true);
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setInstanceFollowRedirects(false);

			os = conn.getOutputStream();
			os.write(xmlData.getBytes());

			br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));

			sb = new StringBuffer();

			while( (readLine=br.readLine())!=null  ){
				sb.append(readLine+"\r\n");
			}

			rtn = sb.toString();


		} catch (IOException e) {
			Logs.error(e);
			rtn = "ERR "+ e.getMessage();
		} catch (Exception e) {
			Logs.error(e);
			rtn = "ERR "+ e.getMessage();
		}
		finally {
			if(br!=null){
				try {
					br.close();
				} catch (Exception e2) {
					Logs.error(e2);
				}
			}
			if(os!=null){
				try {
					os.close();
				} catch (Exception e2) {
					Logs.error(e2);
				}
			}

		}

		return rtn;
	}

	//세대구성원 xml
	public String makeFamilyXml(HashMap data){
		String rtnXml = "";

		StringWriter sw=null;
		try {

			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

			//root
			Document doc = (Document) docBuilder.newDocument();

			Element elmt_root = doc.createElement((String)data.get("SERVICE_ID"));
			doc.appendChild(elmt_root);

			setParentChildElement(doc,elmt_root,"serviceCode","36");
			setParentChildElement(doc,elmt_root,"orgCode","1174000001");
			setParentChildElement(doc,elmt_root,"id",(String)data.get("id"));
			setParentChildElement(doc,elmt_root,"name",(String)data.get("name"));

			// xml 문자열
			TransformerFactory trFct = TransformerFactory.newInstance();

			sw = new StringWriter();

			Properties output = new Properties();
			output.setProperty(OutputKeys.INDENT, "yes");

			Transformer transformer = trFct.newTransformer();

			transformer.transform(new DOMSource(doc), new StreamResult(sw));

			rtnXml = sw.getBuffer().toString();

		} catch (TransformerException e) {
			Logs.error(e);
		} catch (ParserConfigurationException e) {
			Logs.error(e);
		} catch (Exception e){
			Logs.error(e);
		}finally {
			try {
				sw.close();
			} catch (Exception e2) {

			}
		}


		return rtnXml;
	}

	//세대구성원 연계
	public String execute(String serviceUrl, String requestXml) throws Exception{
		String responseXml = null; // XML 수신

		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost post = new HttpPost(serviceUrl);
		RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10*1000).setConnectTimeout(10*1000).setConnectionRequestTimeout(10*1000).build();

		post.addHeader("content-type", "application/xml;charset=UTF-8");
		post.setConfig(requestConfig);
		//post.setEntity(new ByteArrayEntity(requestXml.getBytes()));
		post.setEntity(new StringEntity(requestXml, "UTF-8"));
		CloseableHttpResponse response = httpClient.execute(post);

		responseXml = new String(FileCopyUtils.copyToByteArray(response.getEntity().getContent()), "UTF-8");

		return responseXml;
	}



}
