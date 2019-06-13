<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<!--[if lte IE 9]>
<link rel="stylesheet" type="text/css" href="css/main_ie.css" />
<![endif]-->
<script type="text/javascript" src="js/modernizr.custom.48669.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<!--script type="text/javascript" src="js/swipe.js"></script-->
<script type="text/javascript" src="js/jquery.mobile.custom.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/respond.src.js"></script>
</head>
<body>
<header id="firstheader">
	<div id="skip"><a href="#">본문바로가기</a></div> 
	<h1><a href="#"><img src="images/1.jpg" alt="" /></a></h1>
	<form name="sform" action="#" method="get" id="sform">
		
	</form>		
		<ul class="util">
			<li><a href="#">Home</a></li>
			<li><a href="#">About us</a></li>
			<li><a href="#">News</a></li>
			<li><a href="#">Contact</a></li>
		</ul>		
	<nav id="gnb">
	<h1 class="skip" >메인메뉴</h1> 
	<ul class="gnblist">
		<li class="m m1"><a class="mm" href="#">대학교소개</a>
			<ul>
				<li><a href="#">학과소개</a></li>
				<li><a href="#">교수님소개</a></li>						
			</ul>
		</li>
		<li class="m m2"><a class="mm" href="#">장소</a>
			<ul>
				<li><a href="#">장소위치</a></li>
				
			</ul>
		</li>
		<li class="m m3"><a class="mm" href="#">대학생활</a>
			<ul>
				<li><a href="#">학사</a></li>
				<li><a href="#">장학</a></li>
				<li><a href="#">복학</a></li>
				<li><a href="#">휴학</a></li>
			</ul>				
		</li>
		<li class="m m4"><a class="mm" href="#">전공</a>
			<ul>
				<li><a href="#">컴퓨터소프트웨어학과</a></li>
				<li><a href="#">실용음악학과</a></li>						
			</ul>				
		</li>				
	</ul>
	<div class="allmenu_view"><a href="#">전체메뉴</a></div>
	</nav> 
	<nav id="allMenu_box">
	<h1 class="skip">전체메뉴</h1>		
		<ul>
			
			<li><a href="#">김재훈대학교 소개</a>
				<ul>
					<li><a href="#">비전</a></li>
					<li><a href="#">목록</a></li>
				</ul>
			</li>
			<li><a href="#">게시판</a>
				<ul>
					<li><a href="#">게시판</a></li>
					
				</ul>
			</li>
			
			<li class="last"><a href="#">자료실</a>
				<ul>
					<li><a href="#">기타자료실</a></li>						
				</ul>				
			</li>				
		</ul>
		<a  class="all_close" href="#">전체메뉴닫기</a>
	</nav> 
</header> 
<hr />
<section id="recomm_book">	
	<h1 class="skip">신간추천</h1>
		<div id="book_frame">	
			<div id="book_content1" class=" bookcon">			
				<h2><img src="images/3.jpg" alt="" /></h2>
				<ul>
					<li class="pic"><img src="images/2.jpg" alt="" /></li>
					<li class="smr"><img src="images/4.jpg" alt="" /></li>
					<li class="detail"><a href="http://www.susansijang.co.kr/nsis/miw/intro"><img src="images/detile_view.gif" alt="" /></a></li>
				</ul>
			</div>
			<div id="book_content2"  class=" bookcon">			
				<h2><a href="https://map.naver.com/index.nhn?pinTitle=%EC%84%9C%EC%9A%B8%EC%9D%80%ED%8F%89%EC%B4%88%EB%93%B1%ED%95%99%EA%B5%90&pinType=site&pinId=1160453226&mapMode=0"><img src="images/6.jpg" alt="" /></a></h2>
				<ul>
					<li class="pic"><img src="images/5.jpg" alt="" /></li>
					<li class="smr"><img src="images/7.jpg" alt="" /></li>
					
				</ul>
			</div>
		</div>
	<div id="arrow">
		<a class="prev" href="#" onclick="return false"><img src="images/btn_prev.gif" alt="이전" /></a>
		<a class="next" href="#" onclick="return false"><img src="images/btn_next.gif" alt="다음" /></a>		
	</div>
	<ul id="book_roll">
		<li><img class="firstactive" src="images/state_over.png" alt="안드로이드로 용돈벌기 활성화 상태" /></li>
		<li><img class="secondactive" src="images/state_out.png" alt="아이폰으로 용돈벌기 비활성화 상태" /></li>
	</ul>
</section>

<hr class="gubun"/>	

<div id="content">		
	<div id="login-banner">		
		<div id="login-area">
			<h2><img src="images/userlogin.gif" alt="user login" /></h2>
			<form action="NewFile2.jsp" method="post" class="iform">
				<fieldset>
					<legend class="skip">로그인</legend>

<c:choose>
<c:when test="${uid != null}">

	${uid }님 환영합니다!!
	
	
</c:when>
<c:otherwise>
	
</c:otherwise>
</c:choose>	
	
					
					
				</fieldset>
			</form>
		</div>
	
	</div>

	<div id="newbooks-news">		
		<section>
			<h2 class="tit  t1"><a href="#" onclick="return false"><img src="" alt="" /></a></h2>				
				<div class="items item1">
					<a href="#" class="rss">
					
					</a>
				</div><!-- items item1 -->
		</section>
		<h2 class="tit t2"><a href="#" onclick="return false"><img src="images/tit_news.gif" alt="새로나온 소식" /></a></h2>
		<div  class="items item2">
			<div id="news_list">
				<ul>
					<li><a href="#">쇼미더머니777...</a><span>2018-08-24</span></li>
					<li><a href="#">김재훈 만만세!!! ...</a><span>2018-07-28</span></li>
					<li><a href="#">나플라 쇼미더머니777우승 ...</a><span>2018-06-15</span></li>
					<li><a href="#">암어 허슬러!!!...</a><span>2012-05-24</span></li>
					<li><a href="#">김재훈 동문의밤 렙영상 ...</a><span>2018-04-09</span></li>
					<li><a href="#">자바와 c#프로젝트 모아둔것들 ...</a><span>2018-03-18</span></li>
					<li><a href="#">집에서 직장을 겸하는 재택근무...</a><span>2018-02-08</span></li>
					<li><a href="#">새로운 기획에 확실한 기회가  ...</a><span>2018-01-05</span></li>
				</ul>
			</div>
		</div>
	</div><!-- newbooks-news -->
	<div id="down-author">
		
		<article id="author_column">
						
			<ul>
			<li>
			<h2>쇼미더머니 777</h2>	
			<img  src="images/8.jpg">
			</li>
				<li>
				<h2>11학번 나플라 학생의 활약</h2>	
					 <video width="248" height="152" controls="controls" poster="video/column.jpg">
						<source src="images/1234.mp4" type="video/mp4" />
							
						<object type="application/x-shockwave-flash" data="video/column.swf" width="248" height="152">
												
						<a href="video/column.avi"><img src="video/column.jpg" /></a>
						</object>						
					</video>
									
				</li>
				<li class="nscreen"><a href="#"><span>힙합의 시대란?</span>최근 엠넷 쇼미더머니에 나가서 좀더 멋있게 활약하고 돈도 많이 버는 힙합가수직업이 있습니다!!</a></li>
			</ul>
		</article>
	</div>
</div>	
<hr /> 
<footer id="realfooter"> 
	<div class="foot">
		<div>
			<p>(주)김재훈 회사</p>
			<p>대표이사:김재훈 사업자 등록번호:010-5579-8249</p>
			<small class="copy">Copyright 김재훈</small>
		</div>
		
	</div> 
</footer>
</body>
</html>