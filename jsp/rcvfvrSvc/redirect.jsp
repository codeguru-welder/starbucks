<%
	String redirect = (String)request.getAttribute("redirect");

	if ( redirect == "loginMyReqststtus")
	{
%>
		<script>
			alert("로그인이 필요한 서비스 입니다.");
			location.href = "/nlogin/?curr_url=/portal/rcvfvrSvc/mySvc/myRcvfvrsvc";
		</script>
<%
	}else if(redirect == "simpleFindResult"){
%>
	<script>
		alert("처음부터 다시 선택해주세요.");
		location.href = "/portal/rcvfvrSvc/svcFind/simpleFindStepOne";
	</script>
<%
	}else if(redirect == "agreeSttusCdErr"){
%>
	<script>
		alert("국가보조금 맞춤형서비스(보조금24) 이용 동의가 필요합니다.");
		location.href = "/portal/rcvfvrSvc/main";
	</script>
<%
	}else{
%>
	<script>
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "/nlogin/?curr_url=/portal/rcvfvrSvc/main";
	</script>
<%
	}
%>