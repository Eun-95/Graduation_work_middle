<%@ tag body-content="scriptless" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ attribute name="type" %>

<c:if test="${uid != null}">
<c:choose> 
	<c:when test="${type == 'msg'}"><input  type="text" name="msg" maxlength="100" required><p><input type="file" name="File1"></c:when>
	<c:when test="${type == 'rmsg'}"><input  type="text" name="rmsg" maxlength="50" size="60" placeholder="댓글을 입력하세요..." required></c:when>
</c:choose>
</c:if>

<c:if test="${uid == null}">
<c:choose> 
	<c:when test="${type == 'msg'}"><input type="text" name="msg" maxlength="100" disabled="disabled"  value="작성하려면 로그인 하세요!!"></c:when>
	<c:when test="${type == 'rmsg'}"><input type="text" name="rmsg" maxlength="50" size="60" disabled="disabled" value="작성하려면 로그인 하세요!!"></c:when>
</c:choose>
</c:if>