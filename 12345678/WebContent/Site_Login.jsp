<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=0.5,minimum-scale=0.5,maximum-scale=0.8">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="css/Weekend_login.css" />
<title>로그인 | 주말+</title>
</head>
	<section class="Site-login">
		<form class="Site-login_container" action="user_control.jsp">
			<div class="logo_title">
				<strong class="logo">
				<a href="submain.jsp">주말+</a></strong>
			</div>
			<div>
				<a id="kakao-login-btn"> </a>
			</div>
			<script type='text/javascript'>
				//<![CDATA[
				// 사용할 앱의 JavaScript 키를 설정해 주세요.
				Kakao.init('49bbefdec55f169fc3e4f0fa9d24f2e3');

				// 카카오 로그인 버튼을 생성합니다.
				Kakao.Auth.createLoginButton({
					container : '#kakao-login-btn',
					success : function(authObj) {

						// 로그인 성공시, API를 호출합니다.
						Kakao.API.request({
							url : '/v2/user/me',
							success : function(res) {
								console.log(res);

								var userID = res.id; //유저의 카카오톡 고유 id
								//var userEmail = res.kaccount_email; //유저의 이메일
								//var userName = res.properties.nickname; //유저가 등록한 별명(이름)
								//var birthday = res.kaccout_birthday;

								alert("주말 플러스에 오신것을 환영합니다!");
								
								location.href="user_control.jsp?action=login&uid="+userID+"&site=kakao";
							},
							fail : function(error) {
								alert(JSON.stringify(error));
							}
						});
					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
				});
				//]]>
			</script>
			<script type='text/javascript'>
				var checkLoginStatus = function(response) {
					console.log(response);

					if (response.status === 'connected') {
						document.querySelector('#facebook').value = 'Logout';
						FB
								.api(
										'/me',
										function(resp) {
											document.querySelector('#name').innerHTML = resp.name;
										});
					} else {
						document.querySelector('#facebook').value = 'Login';
						document.querySelector('#name').innerHTML = '';
					}
				}
				window.fbAsyncInit = function() {
					FB.init({ //초기화
						appId : '2252341781752984',
						cookie : true, // enable cookies to allow the server to access 
						// the session
						xfbml : true, // parse social plugins on this page
						version : 'v3.2' // The Graph API version to use for the call
					});

					// Now that we've initialized the JavaScript SDK, we call 
					// FB.getLoginStatus().  This function gets the state of the
					// person visiting this page and can return one of three states to
					// the callback you provide.  They can be:
					//
					// 1. Logged into your app ('connected')
					// 2. Logged into Facebook, but not your app ('not_authorized')
					// 3. Not logged into Facebook and can't tell if they are logged into
					//    your app or not.
					//
					// These three cases are handled in the callback function.
					FB.getLoginStatus(checkLoginStatus);
				};
				// Load the SDK asynchronously
				(function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (d.getElementById(id))
						return;
					js = d.createElement(s);
					js.id = id;
					js.src = "https://connect.facebook.net/en_US/sdk.js";
					fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script>
			<div>
				<a id="facebook" href="#" role="button"
					onclick="
	  if(this.value == 'Login'){
		  //now logout
		  FB.login(function(res){
			  console.log('login =>', res);
		  });
	  }else{
		  // now login
       FB.login(function(res){
			  console.log('logout =>', res);
		  });
	  }
	
	">

					<img src="css/images/login_btn_facebook.png" alt="페이스북 로그인">
				</a>
			</div>
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<div>
				<a id="naver_id_login"> </a>
			</div>
			<!-- (3) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
			<script>
				var naver_id_login = new naver_id_login("Moripd5gWWLMNbfMfano",
						"http://210.123.254.63:8080/12345678/submain.jsp");
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("green", 3);
				naver_id_login
						.setDomain("http://210.123.254.63:8080/12345678/Site_Login.jsp");
				naver_id_login.setState(state);
				naver_id_login.setPopup();
				naver_id_login.init_naver_id_login();
			</script>
			<p class="Login_space">
				<span>Kim</span>
			</p>
		</form>
	</section>
	<%request.setCharacterEncoding("utf-8"); %>
</body>
</html>