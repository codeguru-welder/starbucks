<%   
final String webPluginsPath = "/common/GPKIWeb/msign";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>요청 내역 확인</title>
  <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/common/GPKIWeb/msign/guide/css/qr_rq_guide.css"/>
</head>
<body style="background:#dedede;">
  <div class="guide_wrap">
    <div class="guide_header">
      <span>전자정부 인증 모바일 이용가이드</span> 
      <span style="float:right;"><a href="javascript:window.open('', '_self').close();"><img src="<%= webPluginsPath%>/guide/images/btn_close.png" onmouseover="this.src='<%= webPluginsPath%>/guide/images/btn_close_ov.png'" onmouseout="this.src='<%= webPluginsPath%>/guide/images/btn_close.png'" alt="닫음"></a></span>
    </div>
    <div class="guide_content_wrap">
     <div class="guide_content1">
       <ul>
         <li>스마트폰에서 전자정부 인증 모바일 앱을 실행해 주십시오.</li>
         <li class="txt_normal">(반드시<span class="txt_blue">“전자정부 인증 모바일”</span> 앱이 설치되어 있어야 서비스 이용이 가능합니다.)</li>
         <li class="txt_normal">*안드로이드 : 구글 플레이스토어 실행 후<span class="txt_blue">“전자정부 인증 모바일”</span> 검색</li>
         <li class="txt_normal">* iOS : 앱스토어 실행 후<span class="txt_blue">“전자정부 인증 모바일”</span> 검색</li>
       </ul>
     </div>
     <div class="guide_content2">
       <ul>
         <li class="guide_img"><img src="<%= webPluginsPath%>/guide/images/qr_rq_guide_img.png" alt="QR코드 스캐너가 실행 이미지"></li>
         <li>스마트폰에서 전자정부 인증 모바일 앱을 실행하면 바로 QR코드 스캐너가 실행되며, 앞서 발급된 QR코드를 스캔 하시기 바랍니다.</li>
       </ul>
     </div>
     <div class="guide_content3">
       <ul>
         <li>QR코드 스캔 후 스마트폰에서 사용할 수 있는 인증서 목록을 볼 수 있으며, 해당 인증서를 이용하여 인증을 진행하시면 됩니다.</li>
         <li class="txt_normal">만약, 스마트폰에 저장된 인증서가 없다면, PC에서 가져오기 기능을 통해 PC에 저장된 인증서를 스마트폰에 가져올 수 있습니다.</li>
       </ul>
     </div>
     <div>
       <ul>
         <li class="text_size11">※ 콘텐츠 제작 주최 정의 필요 (www.gpki.go.kr/qrcodeAuthn)</li>
       </ul>
     </div>
    </div>
  </div>
</body>
</html>
