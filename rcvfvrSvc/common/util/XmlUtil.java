/**
 *
 */
package kr.go.portal.rcvfvrSvc.common.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 * @author jjh
 * 2020. 9. 14. 오후 1:39:25
 * mospa.sd1.rcvfvrSvcGuidance.util.XmlUtil
 * Desc :
 */
public class XmlUtil {
	
	public static Document xmlParsigDoc(String xmlStr){
		Document doc = null;
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			
			try{
				doc = dBuilder.parse(new InputSource(new ByteArrayInputStream(xmlStr.getBytes("UTF-8"))));
			}catch (SAXException e3){
				Logs.debug("utf8 parse error");
				try {
					doc = dBuilder.parse(new InputSource(new ByteArrayInputStream(xmlStr.getBytes("EUC-KR"))));
				} catch (SAXException e2){
					Logs.error(e2);
				}catch (Exception e2) {
					Logs.error(e2);
				}
			}catch (Exception e) {
				Logs.debug("utf8 parse error");
				try {
					doc = dBuilder.parse(new InputSource(new ByteArrayInputStream(xmlStr.getBytes("EUC-KR"))));
				} catch (SAXException e2){
					Logs.error(e2);
				}catch (Exception e2) {
					Logs.error(e2);
				}
			}
			
		} catch (ParserConfigurationException e) {
			Logs.error(e);
		}
		catch (Exception e) {
			Logs.error(e);
		}
		return doc;
	}
	
	// xpath parse
	public static NodeList xpathList(Document doc,String expression){
		XPathFactory xpathFactory = XPathFactory.newInstance();
		XPath xpath = xpathFactory.newXPath();
		NodeList rtnNodeList = null;
		try {
			XPathExpression expr = xpath.compile(expression);
			
			rtnNodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
		} catch (XPathExpressionException e) {
			Logs.error(e);
		}
		
		return rtnNodeList;
	}
    
    public static Map<String, Object> xmlToMap(String xml) throws Exception{

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();

		ByteArrayInputStream bs = null;
		Document doc = null;
		

		try {
			bs = new ByteArrayInputStream(xml.getBytes("EUC-KR"));
            doc = builder.parse(bs);
		}catch(SAXException e){
			Logs.error(e);
		}catch(IOException e){
			Logs.error(e);
		}
		catch(Exception e){
			Logs.error(e);
		}
		finally {
			if (bs != null) {bs.close();}
		}

		return xmlToMap(doc.getDocumentElement(), new HashMap<String, Object>());
	}

    public static Map<String, Object> xmlToMap(Element element, Map<String, Object> map){

		if(element.getChildNodes().getLength() > 1){

			Map<String, Object> newMap = new HashMap<String, Object>();
			NodeList nodeList = element.getChildNodes();

			for(int i = 0 ; i < nodeList.getLength() ; i++){

				Node node = nodeList.item(i);

				if(element.getElementsByTagName(node.getNodeName()).getLength() > 1){

					if(!((Map<String, Object>) map.get(element.getTagName())).containsKey(node.getNodeName())){
						((Map<String, Object>) map.get(element.getTagName())).put(node.getNodeName(), new ArrayList<Map<String, Object>>());
					}

					List<Map<String, Object>> list = (List<Map<String, Object>>) ((Map<String, Object>) map.get(element.getTagName())).get(node.getNodeName());

					list.add(xmlToMap((Element) node, new HashMap<String, Object>()));

				}else{
					if(node.getNodeType() == Node.ELEMENT_NODE){
						map.put(element.getTagName(), xmlToMap((Element) node, newMap));
					}
				}
			}
		}else{
//			map.put(element.getTagName(), element.getTextContent());
		}

		return map;
	}
	
}
