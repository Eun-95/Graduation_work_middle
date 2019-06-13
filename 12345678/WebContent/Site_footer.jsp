<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="//developers.band.us/js/share/band-button.js?v=07022019"></script>
<script type="text/javascript"
	src="//static.naver.net/blog/share/blog_sharebutton.js?v={0}"></script>
<script type='text/javascript'>
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
						description : '#여행 #욜로 #주말 뭐하지? #휴식',
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


<div class="Site-footer">
	<a id="kakao-link-btn" href="javascript:sendLink()"> <img
		src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png"
		height=40, width=40 />
	</a> <a href="javascript:shareFB();" class="fb" title="facebook 공유"><img
		src="css/images/Facebook.png" height=40, width=40> </a> <span>
		<script type="text/javascript">
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