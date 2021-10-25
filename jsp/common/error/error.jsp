<!DOCTYPE html>
<html lang="ko">
<head>
<%
response.setStatus(200);
%>
<title>요청하신 페이지에 오류가 발생 하였습니다.</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta property="og:image" content="/images/etc/og_image_600.png"/>
    
<link rel="apple-touch-icon" href="/images/etc/icon.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/etc/icon72.png" />
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/etc/icon144.png" />
<link rel="shortcut icon" type="image/png" href="/images/etc/favicon.png" />
<link rel="shortcut icon" type="image/png" href="/images/etc/favicon1.png" />

<!--<link type="text/css" rel="stylesheet" href="../2017/lib/css/default.css"/> -->
<style type="text/css">
html { font-size:10px;}
@media screen and (min-width:1025px) {
	html { font-size:10px;}
}
@media screen and (max-width:1024px) {
	html { font-size:10px;}
}
@media screen and (max-width:768px) {
	html { font-size:9px;}
	.errorWrap .header, 
	.errorWrap .contents {		
		padding:1.5rem 2.0rem;
	}
}
@media screen and (max-width:480px) {
	html { font-size:8px;}
}

.errorWrap {
	width:100%;
	color:#ccc;
	font-size:1.6rem;
}
.errorWrap .header, 
.errorWrap .contents {
	display:block;
	position:relative;	
	text-align:center;
	overflow:hidden;
	padding:3.0rem 4.0rem;
	text-align:left;
}

.errorWrap .header{
	border-bottom: 1px solid #ccc;
	height: 67px;
}
.errorWrap .header .inner,
.errorWrap .contents .inner {
	display:block;
	position:relative;
    margin: 0 auto;
    width: 100%;
    max-width: 1024px;
}
.errorWrap .header .logo {
    display: inline-block;
	overflow:hidden;
	width: 200px;
	max-width:100%;
    height: 67px;
    line-height: 67px;
	background: url("/images/error-header-logo.png") no-repeat 0 50%;
	background-size:100% auto;
	text-indent:99999999999999999999px;
}  

.errorWrap h2{
	display:block;
	margin:5.5rem 0 8.5rem 0;
	text-align:left;
	font-family:"NanumSquare";
	font-weight:bold;
	color:#275da7;font-size:3.5rem;
}
.erroWrap .contents .inner h2 strong { display:block;font-size:4.5rem;}
.errorWrap .error-desc { color:#666;font-size:1.6rem;line-height:150%;}
.errorWrap .error-desc p { padding-bottom:3.0rem;}
.errorWrap .btn-go { display:inline-block;max-width:100%;height:50px;border:3px solid #555555;border-radius:4px;padding:0 32px;box-sizing:border-box;font-size:16px;line-height:44px;vertical-align:middle;color:#333;text-decoration:none;}
.errorWrap .btn-go span {display:inline-block;padding-right:36px;background:url("/images/arw-right.png") no-repeat 100% 50%;}
@media screen and (min-width:1025px) {
	.errorWrap .contents .inner {	padding-left:14.0rem;padding-right:14.0rem;box-sizing:border-box;;	}
}
@media screen and (max-width:768px) {
	.errorWrap .header, 
	.errorWrap .contents {	padding:1.5rem 2.0rem;	}
	.errorWrap h2{	margin:2.5rem 0 4.5rem 0;	}
	.errorWrap .error-desc p { padding-bottom:1.5rem;}
	.errorWrap .btn-go {padding:0 10px;}
}
@media screen and (max-width:320px) {
	.errorWrap .btn-go {height:auto;padding:10px;}
	.errorWrap .btn-go span { background:none;padding-right:0;line-height:120%;}
}
</style>

</head>
<body>
	<div class="errorWrap">
		<header class="header">
			<div class="inner">
				<a href="/portal/main" class="logo"><span>정부24</span></a>
			</div>
		</header>
		<main class="contents">
			<div class="inner">
					<h2><strong>죄송합니다. </strong><br>요청하신 페이지를 찾을 수 없습니다.</h2>
					<div class="error-desc">
						<p>방문하려는 페이지의 주소가 잘못 입력되었거나,<br>
						페이지 변경, 삭제 등으로 인하여 요청하신 페이지를 찾을 수 없습니다.</p>
						<p>입력하신 주소가 정확한지 다시 한 번 확인해 주시기 바랍니다.</p>
						<p>감사합니다.</p>
					</div>
					<a href="/" class="btn-go"><span>정부24 메인으로 가기</span></a>
			</div>
		</main>
	</div>
</body>
</html>