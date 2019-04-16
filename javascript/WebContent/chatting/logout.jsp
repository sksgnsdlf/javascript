<?xml version="1.0" encoding="euc-kr" ?>
<%@page import="model.Member"%>
<%@ page contentType = "text/xml; charset=euc-kr" %>
<%
	request.setCharacterEncoding("utf-8");
	Member user = (Member)session.getAttribute("user");
	String id = user.getId();
%>
<result>
	<code>success</code>
	<nickName><%= id %></nickName>
</result>