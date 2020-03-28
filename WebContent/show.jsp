<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="web.sample.ShohinMap" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
	<title>商品一覧表</title>
	<style type="text/css" media="all">
		body { padding-top: 0px; color: #666; }
		th { padding: 10px;0px; color: tomato; }
		td { padding: 10px;0px; color: #333; }
		.center { text-align: center;}
		input.wd { width: 300px; }
	</style>
</head>
<body>
<% List<ShohinMap> list = (List<ShohinMap>) request.getAttribute("reqlist"); %>
<nav class="navbar navbar-expand-lg bg-dark navbar-fixed-top">
	<div class="container">
	<a class="navbar-brand" href="Control">商品リスト管理</a>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link" href="#">ホーム</a>
			</li>
			<li class="nav-item">
				<a class="nav-link disabled">商品追加</a>
			</li>
			<li class="nav-item">
				<a class="nav-link disabled">商品削除</a>
			</li>
		</ul>
	</div>
	</div>
</nav>
<br />
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<p class="h2 text-center">商品一覧表</p><br />
		<p class="text-center">Hibernate + サーブレット + SQLServerで読み書きするサンプル。</p><br />
		<table class="table table-sm table-dark">
			<tr class="table-primary">
				<th>商品ID</th>
				<th>商品番号</th>
				<th>商品名</th>
				<th>編集日付</th>
				<th>編集時刻</th>
				<th>備考</th>
				<th>--</th>
			</tr>
			<% for (ShohinMap bean : list) { %>
			<tr class="table-light">
				<td><%= bean.getNumId() %></td>
				<td><%= bean.getShohinCode() %></td>
				<td><%= bean.getShohinName() %></td>
				<td><%= bean.getEditDate() %></td>
				<td><%= bean.getEditTime() %></td>
				<td><%= bean.getNote() %></td>
				<td><a href="Control?id=<%= bean.getNumId() %>">更新</a></td>
			</tr>
			<% } %>
		</table>
		<br />
		<form action="Control" method="post">
			<div class="form-group">
			<label for="inputsm">HQL:</label>
			<input type="text" name="jhql" class="form-control form-control-sm" value="from web.sample.ShohinMap" />
			<input class="btn btn-primary" type="submit" value="検索" /><br />
			</div>
		</form>
		<form action="Insert" method="post">
			<div class="form-row">
			<!-- <div class="form-group col-md-1">
			<label>IDキー</label>
			<input type="text" name="jid" class="form-control form-control-sm" placeholder="" /><br />
			</div> -->
			<div class="form-group col-md-2">
			<label>商品番号</label>
			<input type="text" name="jnum" class="form-control form-control-sm" placeholder="" /><br />
			</div>
			<div class="form-group col-md-4">
			<label>商品名</label>
			<input type="text" name="jname" class="form-control form-control-sm" placeholder="" /><br />
			</div>
			</div>
			<div class="form-row">
			<div class="form-group col-md-2">
			<label>編集日付</label>
			<input type="text" name="jdate" class="form-control form-control-sm" placeholder="" /><br />
			</div>
			<div class="form-group col-md-2">
			<label>編集時刻</label>
			<input type="text" name="jtime" class="form-control form-control-sm" placeholder="" /><br />
			</div>
			<div class="form-group col-md-6">
			<label>備考</label>
			<input type="text" name="jnote" class="form-control form-control-sm" placeholder="" /><br />
			</div>
			</div>
		<input class="btn btn-primary" type="submit" value="商品登録">
		</form>
	</div>
	<div class="col-md-2"></div>
</div>
<br />
<footer class="footer mt-auto py-3" style=" background-color: navy;">
	<div class="container">
		<span class="text-muted">2019 - Hibernate Servlet Sample</span>
	</div>
</footer>
</body>
</html>