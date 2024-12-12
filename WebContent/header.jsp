<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@ page import="com.shashi.service.impl.*, com.shashi.service.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Tiêu đề đăng xuất</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: #E6F9E6;">
	<!--Company Header Starting  -->
	<div class="container-fluid text-center"
		style="margin-top: 45px; background-color: #33cc33; color: white; padding: 5px;">
		<h2>Khang Xuân Watch</h2>
	
		<form class="form-inline" action="index.jsp" method="get">
			<div class="input-group">
				<input type="text" class="form-control" size="50" name="search"
					placeholder="Search Items" required>
				<div class="input-group-btn">
					<input type="submit" class="btn btn-danger" value="Search" />
				</div>
			</div>
		</form>
		<p align="center"
			style="color: blue; font-weight: bold; margin-top: 5px; margin-bottom: 5px;"
			id="message"></p>
	</div>
	<!-- Company Header Ending -->

	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>

	<!-- Starting Navigation Bar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Khang Xuân Watch</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login.jsp">Đăng nhập</a></li>
					<li><a href="register.jsp">Đăng ký </a></li>
					<li><a href="index.jsp">Sản phẩm</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Thể loại <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="index.jsp?type=mobile">Mechanical Watch</a></li>
							<li><a href="index.jsp?type=tv">Sports Watch</a></li>
							<li><a href="index.jsp?type=laptop">Smart Watch</a></li>
							<li><a href="index.jsp?type=camera">Fashion Watch</a></li>
						</ul></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	<nav class="navbar navbar-default navbar-fixed-top">

		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="userHome.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Khang Xuân Watch</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userHome.jsp"><span
							class="glyphicon glyphicon-home">Sản phẩm</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Thể loại <span class="caret"></span>
					</a>
						
						<ul class="dropdown-menu">
							<li><a href="userHome.jsp?type=mobile">Mechanical Watch</a></li>
							<li><a href="userHome.jsp?type=tv">Sports Watch</a></li>
							<li><a href="userHome.jsp?type=laptop">Sports Watch</a></li>
							<li><a href="userHome.jsp?type=camera"></a>Fashion Watch</li>
							
						</ul></li>
					<%
					if (notf == 0) {
					%>
					<li><a href="cartDetails.jsp"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Giỏ hàng
					</a></li>

					<%
					} else {
					%>
					<li><a href="cartDetails.jsp"
						style="margin: 0px; padding: 0px;" id="mycart"><i
							data-count="<%=notf%>"
							class="fa fa-shopping-cart fa-3x icon-white badge"
							style="background-color: #333; margin: 0px; padding: 0px; padding-bottom: 0px; padding-top: 5px;">
						</i></a></li>
					<%
					}
					%>
					<li><a href="orderDetails.jsp">Đơn hàng</a></li>
					<li><a href="userProfile.jsp">Tài khoản</a></li>
					<li><a href="./LogoutSrv">Đăng xuất</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	
	else { //ADMIN HEADER
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="adminViewProduct.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>Khang Xuân Watch</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminViewProduct.jsp">Sản phẩm</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Thể loại <span class="caret"></span>
					</a>
					
						<ul class="dropdown-menu">
							<li><a href="adminViewProduct.jsp?type=mobile">Mechanical Watch</a></li>
							<li><a href="adminViewProduct.jsp?type=tv">Sports Watch</a></li>
							<li><a href="adminViewProduct.jsp?type=laptop">Smart Watch</a></li>
							<li><a href="adminViewProduct.jsp?type=camera">Fashion Watch</a></li>
							
						</ul></li>
					<li><a href="adminStock.jsp">Hàng tồn</a></li>
					<li><a href="shippedItems.jsp">Vận chuyển</a></li>
					<li><a href="unshippedItems.jsp">Đơn hàng</a></li>
					<!-- <li><a href=""> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Cart</a></li> -->
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Cập nhật sản phẩm <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="addProduct.jsp">Thêm sản phẩm</a></li>
							<li><a href="removeProduct.jsp">Xóa sản phẩm</a></li>
							<li><a href="updateProductById.jsp">Cập nhật sản phẩm</a></li>
						</ul></li>
					<li><a href="./LogoutSrv">Đăng xuất</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>
	<!-- End of Navigation Bar -->
</body>
</html>