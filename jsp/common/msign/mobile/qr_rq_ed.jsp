<%@ page language="java" contentType="text/html; charset=MS949" pageEncoding="MS949"%>
<%   
final String webPluginsPath = "/common/GPKIWeb/msign";
response.setHeader("cache-control","no-store"); // http 1.1   
response.setHeader("Pragma","no-cache"); // http 1.0   
response.setDateHeader("Expires",0); // proxy server 에 cache방지.   
%> 
<!DOCTYPE html>
<html>
<head>
<title>요청 내역 확인</title>
  <meta http-equiv="Content-Type" content="text/html; charset=MS949" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<%= webPluginsPath%>/mobile/css/qr_rq_mobile.css"/>
  <script type="text/javascript" src="<%= webPluginsPath%>/mobile/js/AuthMobile.js"></script>
</head>
<body>
  <div class="rq_ed_wrap">
  
    <div class="rd_ed_header">
      <span>전자정부 모바일 인증서</span> 
    </div>
     
    <div class="rq_ed_content1">
      <span>인증이 완료되었습니다.<br>PC화면 상의<span class="txt_blue">"확인"</span>을 클릭하십시오.</span> 
    </div>
    
    <div class="rq_content_wrap">
     
     <div class="rq_content_img">
       <img src="<%= webPluginsPath%>/mobile/images/d_qr_fn01.png" alt="QR코드스캔 이미지"  style="width:100%; height:auto; max-width:1200px;">
     </div>
      
     <div class="rq_content3">
        <ul>
           <li><button class="btn_blue" onClick="ConfirmApp();">완료</button></li>
        </ul>
     </div>
    </div>
  </div>  
</body>
</html>