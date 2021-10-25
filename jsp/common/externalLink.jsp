<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>External link</title>
</head>
<body>

<script type="text/javascript">

var mCode = ${Mcode} ;

switch (mCode) {
case 10329 : 
	/* 국가정책연구 */
	window.location = "http://nkis.re.kr"; 
    break;
case 10330 : 
	/* 정책브리핑 */
	if(${mobileYn eq 'Y'}){
		window.location = "http://m.korea.kr/index.jsp"; 
	}else{
		window.location = "http://www.korea.kr/main.do"; 
	}
    break;
case 10331 : 
	/* 정책연구관리 */
	window.location = "http://prism.go.kr"; 
    break;
case 10332 : 
	/* 공공데이터 */
	window.location = "http://data.go.kr"; 
    break;
case 10333 : 
	/* 기록 */
	window.location = "http://archives.go.kr"; 
    break;
case 10334 : /* 법령 */
	window.location = "http://law.go.kr"; 
    break;
case 10335 : 
	/* 통계 */
	if(${mobileYn eq 'Y'}){
		window.location = "http://m.kosis.kr"; 
	}else{
		window.location = "http://kosis.kr"; 
	}
    break;
case 10336 : 
	/* 기상 */
	if(${mobileYn eq 'Y'}){
		window.location = "http://www.weather.go.kr/weather/main.jsp"; 
	}else{
		window.location = "http://www.weather.go.kr/weather/main.jsp"; 
	} 
    break;
case 10337 : 
	/* 재난안전 */
	window.location = "http://data.mpss.go.kr"; 
    break;
    
case 10338 : 
	/* 정책정보 중간배너1 */
	window.location = "https://fall.visitkorea.or.kr/index.do"; 
    break;
    
case 10339 : 
	/* 정책정보 중간배너1 */
	window.location = "http://www.durunubi.kr/eventPage.do"; 
    break;
default : 
	window.location = "/portal/main";
    break;
}


</script>
</body>
</html>