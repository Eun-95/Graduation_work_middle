<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="rid" %>
<%@ attribute name="ruid" %>
<%@ attribute name="muid" %>
<%@ attribute name="curmsg" %>

<c:choose>
<c:when test="${uid == ruid}">
<a href="/12345678/gta?action=delreply&rid=${rid}&curmsg=${curmsg}&cnt=${cnt}&suid=${suid}"><i class="fa fa-times fa-2x" aria-hidden="true"></i></a>
</c:when>
<c:when test="${uid == muid}">
<a href="/12345678/gta?action=delreply&rid=${rid}&curmsg=${curmsg}&cnt=${cnt}&suid=${suid}"><i class="fa fa-times fa-2x" aria-hidden="true"></i></a>
</c:when>
<c:otherwise>

</c:otherwise>
</c:choose>