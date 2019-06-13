<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ attribute name="mid"%>
<%@ attribute name="auid"%>
<%@ attribute name="curmsg"%>
<c:if test="${uid == auid}">
	<a
		href="/12345678/gta?action=delmsg&mid=${mid}&curmsg=${curmsg}&cnt=${cnt}&suid=${suid}" class="delete"><i class="fa fa-trash-o fa-2x" aria-hidden="true" style="position: relative;
    top: -10px;"></i></a>
</c:if>
<a
	href="/12345678/gta?action=fav&mid=${mid}&curmsg=${curmsg}&cnt=${cnt}&suid=${suid}&uid=${uid}"><svg
		class="heart"></svg></a>