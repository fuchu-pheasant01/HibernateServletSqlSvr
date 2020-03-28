<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.lang.String" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>エラーメッセージ</title>
</head>
<body>
<% String message = (String)request.getAttribute("msg"); %>
<h2>エラーが発生しました。</h2>
<%= message %>
</body>
</html>