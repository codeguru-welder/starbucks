<%@ page import="java.sql.*,java.util.*"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="kr.go.portal.code.vo.CodeVo"%><% 	
JSONObject json = new JSONObject(); 	
List<CodeVo> applist = (List<CodeVo>)request.getAttribute("applist"); 

if (applist != null) { 
	for(CodeVo appVo : applist ) {  
		json.put(appVo.getCdNm()		, appVo.getCdValStr() ); 
	}
} else {  
	System.out.println("cl code list is null"); 
} %><%=json.toString()%>
