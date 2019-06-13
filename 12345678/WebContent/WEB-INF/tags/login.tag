<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form name="loginform" method="post" action="user_control.jsp"
	id="form1">
	<li style="position: relative; right: 13%;"><a
		href="/12345678/gta?action=getall">전체글보기</a></li>
	<c:choose>
		<c:when test="${uid != null}">

			<li><a href="/12345678/gta?action=getall&suid=${uid}">${uid}님
					글 모아보기</a></li>

		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>
</form>