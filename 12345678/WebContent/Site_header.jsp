<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function SNS() {
		location.href = "/12345678/gta?action=getall";
	}
	function Join() {
		location.href = "Site_Login.jsp";
	}
</script>
<header>
	<div class="Site-header">
		<h1 class="Site-logo">
			<a href="javascript:SNS()" id="SNS_icon"></a> <a href="submain.jsp"
				class="Site-logo_link"> <span class="Site-logo_text">주말+</span>
			</a>

			<c:choose>
				<c:when test="${uid==null }">
					<a href="javascript:Join()" id="Login_icon">
					</a>
				</c:when>
				<c:otherwise>
					<a href="user_control.jsp?action=logout&action1=login1" id="logout">
						<span class="Site_logout">로그아웃</span>
					</a>
				</c:otherwise>
			</c:choose>
		</h1>
	</div>
</header>
