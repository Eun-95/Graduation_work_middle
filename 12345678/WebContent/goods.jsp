<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mysns.sns.MessageDAO" %>
<%@ page import="mysns.sns.Goods" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
MessageDAO M=new MessageDAO();
int num=Integer.parseInt(request.getParameter("ww"));

ArrayList<Goods> g=M.showfavor(num);
out.println("<h1>좋아요 누른 사람들</h1>");
for(int i=0; i<g.size();  i++){
	out.println("<p><h1>"+g.get(i).getUid()+"<h1></p>");
}
%>

</body>
</html>