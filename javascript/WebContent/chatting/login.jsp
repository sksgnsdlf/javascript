<?xml version="1.0" encoding="euc-kr" ?>
<%@ page contentType = "text/xml; charset=euc-kr" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("user"); //(Member)session.getAttribute("user");
%>
<result>
	<code>success</code>
	<nickName><%= id %></nickName>
</result>