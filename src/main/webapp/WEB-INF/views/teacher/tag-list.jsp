<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    	<base href="<%=basePath%>">
    
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>知识点管理</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
	</head>
	<body>
		<header>
			<div class="container">
				<div class="row">
					<div class="col-xs-5">
						<div class="logo">
							<h1><a href="#">网站管理系统</a></h1>
							<div class="hmeta">
								专注互联网在线考试解决方案
							</div>
						</div>
					</div>
					<div class="col-xs-7" id="login-info">
						<c:choose>
							<c:when test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
								<div id="login-info-user">
									
									<a href="user-detail/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" id="system-info-account" target="_blank">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</a>
									<span>|</span>
									<a href="j_spring_security_logout"><i class="fa fa-sign-out"></i> 退出</a>
								</div>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary" href="user-register">用户注册</a>
								<a class="btn btn-success" href="user-login-page">登录</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</header>
		<!-- Navigation bar starts -->

		<div class="navbar bs-docs-nav" role="banner">
			<div class="container">
				<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
					<ul class="nav navbar-nav">
						<li>
							<a href="#"><i class="fa fa-home"></i>网站首页</a>
						</li>
						<li>
							<a href="admin/question-list"><i class="fa fa-edit"></i>试题管理</a>
						</li>

						<li>
							<a href="admin/exampaper-list"><i class="fa fa-file-text-o"></i>试卷管理</a>
						</li>
						<li>
							<a href="admin/user-list"><i class="fa fa-user"></i>会员管理</a>
						</li>
						<li class="active">
							<a><i class="fa fa-cloud"></i>题库管理</a>
						</li>
						<li>
							<a href="admin/sys-backup"><i class="fa fa-cogs"></i>网站设置</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- Navigation bar ends -->

		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
					<div class="col-xs-3">
						<ul class="nav default-sidenav">
							
							<li>
								<a href="admin/field-list-1"> <i class="fa fa-book"></i> 题库列表 </a>
							</li>
							
							<li>
								<a href="admin/add-field"> <i class="fa fa-qrcode"></i> 添加题库 </a>
							</li>
							
							<li>
								<a href="admin/point-list-1-1"> <i class="fa fa-sitemap"></i> 知识点列表 </a>
							</li>
							
							<li>
								<a href="admin/add-point"> <i class="fa fa-pencil"></i> 添加知识点 </a>
							</li>
							
							<li class="active">
								<a> <i class="fa fa-tag"></i> 标签列表 </a>
							</li>
							
							<li>
								<a href="teacher/add-tag"> <i class="fa fa-plus"></i> 添加标签 </a>
							</li>
						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1> <i class="fa fa-bar-chart-o"></i> 知识点管理 </h1>
						</div>
						<div class="page-content row">
							<div id="question-filter">
								<dl id="question-filter-field">
									<dt>
										题库：
									</dt>
									<dd>	
										<c:choose>
											<c:when test="${fieldId == 0 }">
												<span data-id="0" class="label label-info">全部</span>
											</c:when>
											<c:otherwise>
												<span data-id="0">全部</span>
											</c:otherwise>
										</c:choose>
										
										
										<c:forEach items="${fieldList }" var="item">
										
											<c:choose>
												<c:when test="${fieldId == item.fieldId }">
													<span data-id="${item.fieldId}" class="label label-info">${item.fieldName}</span>
												</c:when>
												<c:otherwise>
													<span data-id="${item.fieldId }">${item.fieldName }</span>
												</c:otherwise>
											</c:choose>
											
										</c:forEach>
									</dd>
								</dl>
								<div class="page-link-content">
									<ul class="pagination pagination-sm">${pageStr}</ul>
								</div>
							</div>
							
							
							<div id="field-list">
								<table class="table-striped table">
									<thead>
										<tr>
											<td></td>
											<td>ID</td>
											<td>标签名</td>
											<td>描述</td>
											<td>创建时间</td>
											<td>创建人</td>
											<td>私有</td>
											<td>操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${tagList }" var="item">
											<tr>
												<td>
													<%-- <c:if test="${item.removeable }">
														<input type="checkbox" value="${item.tagId }">
													</c:if> --%>
												</td>
												<td>${item.tagId }</td>
												<td>${item.tagName }</td>
												<td>${item.memo }</td>
												<td>${item.createTime }</td>
												<td>${item.creator }</td>
												<td>${item.privatee }</td>
												<td>
													<%-- <c:if test="${item.removeable }">
														<button class="delete-btn" data-id="${item.pointId }">删除</button>
													</c:if> --%>
												</td>
											</tr>
										</c:forEach>
										
									</tbody><tfoot></tfoot>
								</table>
							</div>
							<div id="page-link-content">
								<ul class="pagination pagination-sm">${pageStr}</ul>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<footer>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="copy">
							<p>
								Exam++ Copyright © <a href="http://www.exam.wangcl.xyz/" target="_blank">Exam++</a> - <a href="." target="_blank">主页</a> | <a href="http://www.exam.wangcl.xyz/" target="_blank">关于我们</a> | <a href="http://www.exam.wangcl.xyz/" target="_blank">FAQ</a> | <a href="http://www.exam.wangcl.xyz/" target="_blank">联系我们</a>
							</p>
						</div>
					</div>
				</div>

			</div>

		</footer>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		<script type="text/javascript" src="resources/js/point-list.js"></script>
		
	</body>
</html>