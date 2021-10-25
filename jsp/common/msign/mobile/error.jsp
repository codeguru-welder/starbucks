<%@ page language="java" contentType="text/html; charset=MS949" pageEncoding="MS949"%>
<!DOCTYPE html>
<html>
<head>
<title>요청 내역 확인</title>
  <meta http-equiv="Content-Type" content="text/html; charset=MS949" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/common/GPKIWeb/msign/mobile/css/qr_rq_mobile.css"/>
  <script type="text/javascript" src="/common/GPKIWeb/msign/mobile/js/AuthMobile.js"></script>
</head>
<body>
  <div class="rq_wrap">
    <div class="rd_ed_header">
      <span>전자정부 모바일 인증서</span> 
    </div>
    
    
    <div class="rq_ed_content1">
      <span>죄송합니다. <br/>아래와 같은 사유로 오류가 발생하였습니다.</span> 
    </div>
    
    <div class="rq_content_wrap">
     
     <div class="rq_content_img">
       <img src="/common/GPKIWeb/msign/mobile/images/error.png" alt="QR코드스캔 이미지"  style="width:50%; height:auto; max-width:1200px;">
     </div>
     
     <div class="rq_content1">
       
     <div class="rq_ed_content1">해당 전자 서명 요청은 이미 처리되었습니다.</div>
     <div class="btn_wrap">
       <ul>
           <li><button class="btn_blue" onclick="ConfirmApp();">닫기</button></li>
       </ul>
     </div>
     </div>
  </div>
</body>
</html>