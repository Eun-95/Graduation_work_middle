<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=0.5,minimum-scale=0.5,maximum-scale=0.8, user-scalable=no">
<link rel="stylesheet" href="css/Weekend.css" />
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<title>주말+</title>
<meta property="og:type" content="website" />
<meta property="og:url"
	content="http://210.123.254.63:8080/12345678/submain.jsp"/>
<meta property="og:description"
	content="일상을 여행으로
                                         여행을 일상으로" />
<meta property="og:image"
	content="https://cdn.pixabay.com/photo/2016/01/09/18/27/old-1130731_960_720.jpg" />
</head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var userID = new naver_id_login("Moripd5gWWLMNbfMfano",
				"http://210.123.254.63:8080/12345678/submain.jsp");
		// 접근 토큰 값 출력
		//alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		userID.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {

			/*
			alert(naver_id_login.getProfileData('email'));
			alert(naver_id_login.getProfileData('nickname'));
			alert(naver_id_login.getProfileData('age'));
			alert(naver_id_login.getProfileData('birthday'));
			 */

			/*console.log(userID.getProfileData('nickname'));
			/*console.log(userID.getProfileData('email'));*/
			console.log(userID.getProfileData('id'));
			/*console.log(userID.getProfileData('name'));
			console.log(userID.getProfileData('birthday'));
			//console.log(userID.getProfileData('age'));
			console.log(userID.getProfileData('gender'));*/
			//console.log(userID.getProfileData('profile_image'));
			alert("주말 플러스에 오신것을 환영합니다!");

			location.href = "user_control.jsp?action=login&uid="
					+ userID.getProfileData('id') + "&site=naver";

		}
	</script>
	<script>
		$(document).ready(function() {
			$(".Msg").hide();
			$(".Chatopen").show();

			$(".Chatclose").click(function() {
				$(".Msg").hide('2000');
				$(".Chatopen").show();
			});
			$(".Chatopen").click(function() {
				$(".Msg").show('2000');
				$(".Chatopen").hide('2000');
			});
		});
	</script>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String pagefile = request.getParameter("pagefile");
		String uid = request.getParameter("");
		if (uid != null) {
			session.setAttribute("uid", uid);
		}
	%>
	<!-- header 시작  -->
	<%
		if (pagefile.contains("/board/")) {
	%>
	<jsp:include page="gacipan.jsp" />
	<%
		} else {
			System.out.print("2");
	%>
	<jsp:include page="Site_header.jsp" />
	<%
		}
	%>



	<!-- header 끝  -->
	<!--  content 시작  -->
	<jsp:include page='<%=pagefile + ".jsp"%>' />
	<!--  content 끝  -->
	<%
		if (pagefile.contains("/board")) {

		} else {
	%>
	<c:choose>
		<c:when test="${uid==null }">

		</c:when>
		<c:otherwise>
			<div class="Msg">
				<button class="Chatclose">
					<i class="fa fa-times-circle fa-lg" aria-hidden="true"
						style="float: right;"></i>
				</button>
				<div class="site notes">
					<textarea id="messageTextArea" readonly="readonly" rows="10"
						cols="45" class="message"></textarea>
				</div>
				<br />
				<!-- 송신 메시지 텍스트박스 -->
				<div class="Sendmessage">
					<input type="text" id="messageText" size="50" />
					<!-- 송신 버튼 -->
					<input type="button" value="Send" onclick="sendMessage()" />
				</div>
			</div>
			<button class="Chatopen">
				<i class="fa fa-angle-double-right fa-3x" aria-hidden="true"></i>
			</button>

			<script type="text/javascript">
				//웹소켓 초기화
				var webSocket = new WebSocket(
						"ws://210.123.254.63:8080/12345678/broadsocket");
				var messageTextArea = document
						.getElementById("messageTextArea");
				//메시지가 오면 messageTextArea요소에 메시지를 추가한다.
				webSocket.onmessage = function processMessge(message) {
					//Json 풀기
					var jsonData = JSON.parse(message.data);
					if (jsonData.message != null) {
						messageTextArea.value += jsonData.message + "\n"
					}
					;
				}
				//메시지 보내기
				function sendMessage() {
					var messageText = document.getElementById("messageText");

					webSocket.send("${uid}:" + messageText.value);
					messageText.value = "";
				}
			</script>
		</c:otherwise>
	</c:choose>
	<%
		}
	%>


	<!--  footer 시작   -->
	<jsp:include page="Site_footer.jsp" />

	<!--  footer 끝  -->
</body>
</html>