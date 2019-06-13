<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="sns"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주말+</title>
<meta name="viewport"
	content="width=device-width,initial-scale=0.5,minimum-scale=0.5,maximum-scale=0.8">
<!-- user-scalable=yes -->
<link rel="stylesheet" href="css/styles.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="css/SNS_Menu.css" />
<link rel="stylesheet" href="css/jquery-ui.css" />
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="//developers.band.us/js/share/band-button.js?v=07022019"></script>
<script type="text/javascript"
	src="//static.naver.net/blog/share/blog_sharebutton.js?v={0}"></script>
<script type='text/javascript'>
	$(function() {
		$("#accordion").accordion({
			heightStyle : "content",
			active : parseInt("${curmsg == null ? 0:curmsg}")
		});
	});
	function kkk(a) {
		window.open("goods.jsp?ww=" + a, "kkk",
				"location=no,resizeable=no,menubar=no,width=200,height=300");
	}
</script>
<script>
	$(function() {

		$(".heart").on("click", function() {
			$(this).toggleClass("heart-blast");
		});
	});
</script>
<script type='text/javascript'>
	$(document)
			.ready(
					function() {
						var trigger = $('.hamburger'), overlay = $('.overlay'), isClosed = false;

						trigger.click(function() {
							hamburger_cross();
						});

						function hamburger_cross() {

							if (isClosed == true) {
								overlay.hide();
								trigger.removeClass('is-open');
								trigger.addClass('is-closed');
								isClosed = false;
							} else {
								overlay.show();
								trigger.removeClass('is-closed');
								trigger.addClass('is-open');
								isClosed = true;
							}
						}

						$('[data-toggle="offcanvas"]').click(function() {
							$('#wrapper').toggleClass('toggled');
						});
					});
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('49bbefdec55f169fc3e4f0fa9d24f2e3');

	function sendLink() {
		Kakao.Link
				.sendDefault({
					objectType : 'location',
					address : '서울특별시 노원구 동일로 214길 32',
					addressTitle : '한국성서대학교',
					content : {
						title : '주말플러스',
						description: '#여행 #욜로 #주말 뭐하지? #휴식',
						imageUrl : 'https://cdn.pixabay.com/photo/2016/01/09/18/27/old-1130731_960_720.jpg',
						link : {
							mobileWebUrl : 'http://210.123.254.63:8080/12345678/submain.jsp'

						}
					},

					buttons : [ {
						title : '모바일 웹으로 보기',
						link : {
							mobileWebUrl : 'http://210.123.254.63:8080/12345678/submain.jsp'

						}
					} ]
				});
	}
	//]]>

	function shareFB()

	{

		window
				.open('http://www.facebook.com/sharer/sharer.php?u=http://210.123.254.63:8080/12345678/submain.jsp');

	}
</script>

</head>

<body>
	<div id="wrapper" class="float_layer">
		<div class="overlay"></div>
		<div class="Site-header">
			<h1 class="Site-logo">
				<a href="submain.jsp" class="Site-logo_link"> <span
					class="Site-logo_text">주말+</span>
				</a>
				<sns:login />
			</h1>
		</div>
		<!-- Sidebar -->
		<nav class="navbar navbar-inverse navbar-fixed-top"
			id="sidebar-wrapper" role="navigation">
			<ul class="nav sidebar-nav">
				<li class="sidebar-brand">전체메뉴</li>
				<li><a href="submain.jsp"><i class="fa fa-home fa-fw"
						aria-hidden="true" style="width: 20.58px"></i>&nbsp;Home</a></li>
				<li class="dropdown"><a href=""><i
						class="fa fa-graduation-cap" aria-hidden="true"></i>&nbsp;김재훈대학교</a></li>



				<c:choose>
					<c:when test="${uid != null}">

						<li class="dropdown"><a
							href="user_control.jsp?action=logout&action1=login1"><i
								class="fa fa-sign-out" aria-hidden="true" style="width: 20.58px"></i>&nbsp;로그아웃</a></li>


					</c:when>
					<c:otherwise>
						<li class="dropdown"><a href="Site_Login.jsp"><i
								class="fa fa-sign-in" aria-hidden="true" style="width: 20.58px"></i>&nbsp;로그인</a></li>
					</c:otherwise>
				</c:choose>


				<c:choose>
					<c:when test="${uid != null}">

						<li class="dropdown"><a href="boardList.bo"><i
								class="fa fa-pencil-square-o" aria-hidden="true"
								style="width: 20.58px"></i>&nbsp;게시판</a></li>
						<li class="dropdown"><a href="deleteUser.bo?nickname=${uid }"><i
								class="fa fa-user-times" aria-hidden="true"
								style="width: 20.58px"></i>&nbsp;회원탈퇴</a></li>

					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
				<li class="dropdown"><a href="tel:010-9899-9125"
					data-role="button"><i class="fa fa-phone" aria-hidden="true"
						style="width: 20.58px"></i>&nbsp;고객센터(전화)</a>
				<li class="dropdown"><a href="sms:010-9899-9125"
					data-role="button"><i class="fa fa-comment" aria-hidden="true"
						style="width: 20.58px"></i>&nbsp;고객센터(문자)</a>
			</ul>
		</nav>
		<!-- /#sidebar-wrapper -->
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<button type="button" class="hamburger is-closed animated fadeInLeft"
				data-toggle="offcanvas">
				<span class="hamb-top"></span> <span class="hamb-middle"></span> <span
					class="hamb-bottom"></span>
			</button>
		</div>
	</div>
	<!-- /#page-content-wrapper -->
	<!-- /#wrapper -->
	<div id="wrapper1">
		<section id="main">
			<section id="content">
				<b>내소식 업데이트</b>
				<c:choose>
					<c:when test="${uid != null}">
						<form class="m_form" method="post" action="222.jsp?action=newmsg"
							enctype="multipart/form-data">
							<input type="hidden" name="uid" value="${uid}">
							<sns:write type="msg" />
							<button class="submit" type="submit">등록</button>
						</form>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<br> <br>

				<h3>여행자들의 최신 소식</h3>
				<div id="accordion">
					<c:forEach varStatus="mcnt" var="msgs" items="${datas}">
						<c:set var="m" value="${msgs.message}" />

						<h3>
							[${m.uid}]${m.msg} :: [좋아요 ${m.favcount} | 댓글 ${m.replycount}]
						
						</h3>

						<div>
							<c:choose>
								<c:when test="${m.img=='null'}">

								</c:when>

								<c:otherwise>
									<img src="upload/${m.img }" width=523px height=400px>
								</c:otherwise>

							</c:choose>

							<p></p>
							<c:choose>
								<c:when test="${uid != null}">
									<p class="Good">
										<sns:smenu mid="${m.mid}" auid="${m.uid}"
											curmsg="${mcnt.index}" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/<a
											href="javascript:kkk(${m.mid })">좋아요 누른사람들</a> / ${m.date}에 작성된 글입니다.
									</p>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							<ul class="reply">
								<c:forEach var="r" items="${msgs.rlist}">
									<li>${r.uid }::${r.rmsg}-${r.date}<sns:rmenu
											curmsg="${mcnt.index}" muid="${m.uid }" rid="${r.rid}"
											ruid="${r.uid}" /></li>
								</c:forEach>
							</ul>

							<form action="/12345678/gta?action=newreply&cnt=${cnt}"
								method="post">
								<input type="hidden" name="mid" value="${m.mid}"> <input
									type="hidden" name="uid" value="${uid}"> <input
									type="hidden" name="suid" value="${suid}"> <input
									type="hidden" name="curmsg" value="${mcnt.index}">
								<sns:write type="rmsg" />
							</form>
						</div>

					</c:forEach>

				</div>

				<div align="center">
					<a
						href="/12345678/gta?action=getall&cnt=${cnt+5}&suid=${suid}&curmsg=${cnt}">더보기&gt;&gt;</a>
				</div>


			</section>
			<!-- end of sidebar -->
		</section>
	</div>
	<div class="Site-footer">
		<a id="kakao-link-btn" href="javascript:sendLink()"> <img
			src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png"
			height=40, width=40 />
		</a> <a href="javascript:shareFB();" class="fb" title="facebook 공유"><img
		src="css/images/Facebook.png" height=40, width=40> </a> <span> <script type="text/javascript">
			//네이버 블로그 공유버튼
			new ShareBlog.makeButton({
				"type" : "d"
			});
		</script>
		</span>
		<script type="text/javascript">
			//네이버 밴드 공유 버튼
			new ShareBand.makeButton({
				"lang" : "ko-KR",
				"type" : "d"
			});
		</script>
	</div>
</body>
</html>