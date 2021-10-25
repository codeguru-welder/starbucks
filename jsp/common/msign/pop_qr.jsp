<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% 
// final String webPluginsPath = sga.framework.Constants.JSP_PATH
  final String webPluginsPath = "/common/GPKIWeb/msign";
%>


    <!--팝업-->
  <div id="popup1" class="modal-box">
  <div class="pop_wrap">
    <div class="pop_header">
      <span>전자정부 모바일 인증서</span> 
      <span style="float:right;"><a href="#" ><img src= "<%= webPluginsPath%>/images/btn_close.png" onmouseover="this.src='<%= webPluginsPath%>/images/btn_close_ov.png'" onmouseout="this.src='<%= webPluginsPath%>/images/btn_close.png'" alt="닫음" onclick='closePopup();'></a></span>
    </div>
    
    <div id="pop_content_wrap">
    <div id="pop_content">
     <div class="pop_content1">
       <ul>
         <li class="text_center">전자정부 모바일 인증서 앱 실행</li>
         <li class="text_s">안드로이드 : 구글플레이 스토어에서 “전자정부 모바일 인증서” 를 검색하여 앱을 다운로드 후 실행</li>
         <li class="text_s">아이폰 : 앱 스토어에서 “전자정부 모바일 인증서” 를 검색하여 앱을 다운로드 후 실행</li>
       </ul>
     </div>
     <div class="pop_content2">
       
       <span class="pop_content2_left">
        <ul>
         <li style="margin-bottom:10px;">QR코드 스캔</li>
         <li><div id="qrCodeUrlDiv"></div></li>
         <li class="txt_red">
            <span class="countTimeMinute">3</span>분
            <span class="countTimeSecond">00</span>초
         </li>
        </ul>
       </span>
       
       <span class="pop_content2_right">
        <ul>
         <li><img src="<%= webPluginsPath%>/images/qr_rq_guide_img.png" alt="전자정부 모바일 인증서 앱으로 좌측의 QR코드를 스캔하세요 이미지"></li>
         <li style="margin-bottom:10px; font-size:12px;">전자정부 모바일 인증서 앱으로 좌측의 QR코드를 스캔하세요.</li>
        </ul>
       </span>
       
     </div>
     <div class="pop_content3">
       <ul>
         <li class="text_center">인증서 선택 및 인증서 암호 입력</li>
       </ul>
     </div>
     <div>
       <ul>
         <li class="text_s_center">전자정부 모바일 인증서 앱에서 인증 완료 후<br><span class="txt_blue">확인</span> 버튼을 눌러야 인증이 완료됩니다.</li>
         <li class="btn"><a href="#"><img id= "MobileSignConfirm" src="<%= webPluginsPath%>/images/btn_ok.png" onmouseover="this.src='<%= webPluginsPath%>/images/btn_ok_ov.png'" onmouseout="this.src='<%= webPluginsPath%>/images/btn_ok.png'" alt="확인" ></a></li>
       </ul>
     </div>
    </div>
    
    </div>
    <div class="pop_footer">
      <a href="#" onclick='openGuide();'>이용가이드</a> 
    </div>
    
    
  </div>
 </div>    
  <!--//팝업-->

    <form id='reqCertifyCertForm' name='reqCertifyCertForm'>    
        <input type="hidden"  id="qrCodeId" name="qrCodeId"/>
        <input type="hidden"  id="certname" name="certname"/>
        <input type="hidden"  id="challenge" name="challenge"/>
        <input type="hidden"  id="callbackfn" name="callbackfn" value= ""/> 
    </form>
    
  <script type="text/javascript">
    var qrCodeTimer;
            function reqAuthMobileQR(signTxt) {
                
                if(gpki$('#qrCodeId').val() != '') {
                    statusDelete();
                }
                gpki$.ajax({
                    type:"POST",
                    data:"signTxt="+escape(encodeURIComponent(signTxt))+"&procType=insert",
                    dataType : "JSON",
                    url:"/nlogin/msign/dbConnect",
                    contentType : 'application/x-www-form-urlencoded;charst=UTF-8',
                    success:function (data) {
                    },
                    error : function(xhr, status, error) {
                    },
                   complete : function(data) {
                      var result = data['responseText'];
                      var resultArr = result.split("||");
                      gpki$('#qrCodeId').val(resultArr[1]);
                      gpki$('#qrCodeUrlDiv').html("<img style='margin-top : -10px;  width:140px;height:140px;' alt='QR코드' src='data:image/png;base64,"+resultArr[2]+"'/>");
                   }       
                });
                
            }
            
            function checkMobileSign(type, callbackfn){
                var result = false;
                gpki$.ajax({
                    type:"POST",
                    data: 'qrCodeId='+gpki$('#qrCodeId').val()+"&procType=select",
                    dataType : "JSON",
                    url:"/nlogin/msign/dbConnect",
                    success:function (data) {
                    },
                    error : function(xhr, status, error) {
                   },
                   complete : function(data) {
                        var result = data['responseText'];
                        var resultArr = result.split("||");
                        if(resultArr[1] == '1') result = true;
                        if(result == true && type == false && resultArr[5] == gpki$('#qrCodeId').val()){	
                            if(resultArr[3] != '0') {
                                oldDataDelete();
                            }
                            statusDelete();
                            var selectField = decodeURIComponent(resultArr[2]);
                            var vidMsg = decodeURIComponent(resultArr[4]);
                            callbackfn(0, {encMsg: selectField, vidRandom: vidMsg});
                        }else{
                            if(type != true) alert('모바일에서 서명 진행 후 다시 확인해 주세요');
                            else statusDelete();
                        }
                   }       
                });     
            }
            
            function oldDataDelete() {
                gpki$.ajax({
                    type:"POST",
                    data: 'qrCodeId='+gpki$('#qrCodeId').val()+"&procType=odelete",
                    dataType : "JSON",
                    url:"/nlogin/msign/dbConnect",
                    success:function (data) {
                    },
                    error : function(xhr, status, error) {
                   },
                   complete : function(data) {
                   }       
                });     
            }
            
            function statusDelete() {
                if(gpki$('#qrCodeId').val() == '') return false;
                gpki$.ajax({
                    type:"POST",
                    data: 'qrCodeId='+gpki$('#qrCodeId').val()+"&procType=delete",
                    dataType : "JSON",
                    url:"/nlogin/msign/dbConnect",
                    success:function (data) {
                    },
                    error : function(xhr, status, error) {
                   },
                   complete : function(data) {
                   }       
                });     
            }
            
            function closePopup() {
                checkMobileSign(true);
                clearInterval(qrCodeTimer); /* 타이머 종료 */
                gpki$(".modal-box, .modal-overlay").fadeOut(500, function() {
                    gpki$(".modal-overlay").remove();
                });
            }
            
            function checkStartTimer() {
                //초기값
                var minute = 3;
                var second = 0;
                
                // 초기화
                gpki$(".countTimeMinute").html(minute);
                gpki$(".countTimeSecond").html(second);
                
                qrCodeTimer = setInterval(function () {
                        // 설정
                        gpki$(".countTimeMinute").html(minute);
                        gpki$(".countTimeSecond").html(second);
                        
                        if(second == 0 && minute == 0){
                            closePopup();
                        }else{
                            second--;
                            
                            // 분처리
                            if(second < 0){
                                minute--;
                                second = 59;
                            }
                        }
                    }, 1000); /* millisecond 단위의 인터벌 */
            }
         
         function openGuide() {
                  var name = '_blank';
                  var specs = 'width=660,height=580,menubar=no,status=no,toolbar=no';
                  var url = '/nlogin/pop/msign/guide';
                  var newWindow = window.open(url, name, specs);
                  newWindow.focus();
          }
         
         gpki$(function(){
                gpki$('a[data-modal-id]').click(function(e) {
                    var signTxt = gpki$('#signData').val();
                    if(signTxt != '') {
                        gpki$("body").append("<div class='modal-overlay js-modal-close'></div>");
                        gpki$(".modal-overlay").fadeTo(500, 0.7);
                        var modalBox = gpki$(this).attr('data-modal-id');
                        gpki$('#'+modalBox).fadeIn(gpki$(this).data());
                        reqAuthMobileQR();
                        checkStartTimer();
                    }
                    else alert("서명원문을 입력하세요.");
                });  
               
                gpki$(window).resize(function() {
                    gpki$(".modal-box").css({
                        top: (gpki$(window).height() - gpki$(".modal-box").outerHeight()) / 2,
                        left: (gpki$(window).width() - gpki$(".modal-box").outerWidth()) / 2
                    });
                });
                 
                gpki$(window).resize();
          });
          
        </script>   