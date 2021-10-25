<%@ page language="java" contentType="text/html; charset=MS949" pageEncoding="MS949"%>
<%   
final String webPluginsPath = "/common/GPKIWeb/msign";
response.setHeader("cache-control","no-store"); // http 1.1   
response.setHeader("Pragma","no-cache"); // http 1.0   
response.setDateHeader("Expires",0); // proxy server �� cache����.   
%> 
<% String authCode = request.getParameter("authCode");
	  if (authCode != null)
	      authCode = authCode.replaceAll("<", "");
	  
	request.setAttribute("authCode", authCode);	  
%>
<!DOCTYPE html>
<html>
<head>
<title>��û ���� Ȯ��</title>
  <meta http-equiv="Content-Type" content="text/html; charset=MS949" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<%= webPluginsPath%>/mobile/css/qr_rq_mobile.css"/>
  <script type="text/javascript" src="<%= webPluginsPath%>/js/jquery-1.9.1.js"></script>
  <script type="text/javascript" src="<%= webPluginsPath%>/mobile/js/AuthMobile.js"></script>
  <script type="text/javascript">
  
  	function setView() {
  		var d = new Date();
  		$('#timeSpan').html(d.getFullYear()+'.'+(d.getMonth() + 1)+'.'+d.getDate()+' '+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds());
  		$('#pathSpan').html('������������');
  	}
	$(document).ready(function() {
		setView();
	});
  </script>
</head>
<body>
   <div class="rq_wrap">
    <div class="rd_ed_header">
      <span>�������� ����� ������</span> 
    </div>
    
    
    <div class="rq_ed_content1">
      <span>���� ��û �����Դϴ�.</span> 
    </div>
    
    <div class="rq_content_wrap">
     
     <div class="rq_content_img">
       <img src="<%= webPluginsPath%>/mobile/images/d_qr_fn02.png" alt="QR�ڵ彺ĵ �̹���"  style="width:50%; height:auto; max-width:1200px;">
     </div>
     
     <div class="rq_content1">
       <table class="rq_td">
         <tr>
           <td class="td_title">��û�ð�</td>
           <td><span id="timeSpan">2016.08.05 13:00:00</span></td>
         </tr>
         <tr>
           <td class="td_title">��û����Ʈ</td>
           <td><span id="pathSpan">DREAM BANK</span></td>
         </tr>
       </table>
    <div class="rq_ed_content1">��û������ �����ø� <span class="txt_blue">"����"</span>�� ����<br>������ ��� ������ �ֽʽÿ�.</div>
     <div class="rq_content2">
       <ul>
           <li><button class="btn_grey" onClick="ExitApp();">���</button></li>
           <li><button class="btn_blue" onClick="setStartSignData();">����</button></li>
       </ul>
     </div>
    </div>
    	
        <input type="hidden" name='ssn' id='ssn' value="" />  
		<input type="hidden" name='acd' id='acd' value='<c:out value="${authCode}"/>' /> 
  </div> 
</body>
</html>