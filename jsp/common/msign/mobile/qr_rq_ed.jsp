<%@ page language="java" contentType="text/html; charset=MS949" pageEncoding="MS949"%>
<%   
final String webPluginsPath = "/common/GPKIWeb/msign";
response.setHeader("cache-control","no-store"); // http 1.1   
response.setHeader("Pragma","no-cache"); // http 1.0   
response.setDateHeader("Expires",0); // proxy server �� cache����.   
%> 
<!DOCTYPE html>
<html>
<head>
<title>��û ���� Ȯ��</title>
  <meta http-equiv="Content-Type" content="text/html; charset=MS949" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<%= webPluginsPath%>/mobile/css/qr_rq_mobile.css"/>
  <script type="text/javascript" src="<%= webPluginsPath%>/mobile/js/AuthMobile.js"></script>
</head>
<body>
  <div class="rq_ed_wrap">
  
    <div class="rd_ed_header">
      <span>�������� ����� ������</span> 
    </div>
     
    <div class="rq_ed_content1">
      <span>������ �Ϸ�Ǿ����ϴ�.<br>PCȭ�� ����<span class="txt_blue">"Ȯ��"</span>�� Ŭ���Ͻʽÿ�.</span> 
    </div>
    
    <div class="rq_content_wrap">
     
     <div class="rq_content_img">
       <img src="<%= webPluginsPath%>/mobile/images/d_qr_fn01.png" alt="QR�ڵ彺ĵ �̹���"  style="width:100%; height:auto; max-width:1200px;">
     </div>
      
     <div class="rq_content3">
        <ul>
           <li><button class="btn_blue" onClick="ConfirmApp();">�Ϸ�</button></li>
        </ul>
     </div>
    </div>
  </div>  
</body>
</html>