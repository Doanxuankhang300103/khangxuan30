<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page
	import="com.shashi.service.impl.*, com.shashi.service.*,com.shashi.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Cập nhật sản phẩm</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #E6F9E6;">
	<%
	/* Checking the user credentials */
	String utype = (String) session.getAttribute("usertype");
	String uname = (String) session.getAttribute("username");
	String pwd = (String) session.getAttribute("password");
	String prodid = request.getParameter("prodid");
	ProductBean product = new ProductServiceImpl().getProductDetails(prodid);
	if (prodid == null || product == null) {
		response.sendRedirect("updateProductById.jsp?message=Please Enter a valid product Id");
		return;
	} else if (utype == null || !utype.equals("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");
		return;
	} else if (uname == null || pwd == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
		return;
	}
	%>

	<jsp:include page="header.jsp" />

	<%
	String message = request.getParameter("message");
	%>
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px;">
			<form action="./UpdateProductSrv" method="post"
				class="col-md-6 col-md-offset-3"
				style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;">
				<div style="font-weight: bold;" class="text-center">
					<div class="form-group">
						<img src="./ShowImage?pid=<%=product.getProdId()%>"
							alt="Product Image" height="100px" />
						<h2 style="color: green;">Mẫu cập nhật sản phẩm</h2>
					</div>

					<%
					if (message != null) {
					%>
					<p style="color: blue;">
						<%=message%>
					</p>
					<%
					}
					%>
				</div>
				<div class="row">
					<input type="hidden" name="pid" class="form-control"
						value="<%=product.getProdId()%>" id="last_name" required>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Tên sản phẩm</label> <input type="text"
							placeholder="Enter Product Name" name="name" class="form-control"
							value="<%=product.getProdName()%>" id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<%
						String ptype = product.getProdType();
						%>
						
						<label for="producttype">Loại sản phẩm</label> <select name="type"
							id="producttype" class="form-control" required>
							<option value="mobile"
								<%="mobile".equalsIgnoreCase(ptype) ? "selected" : ""%>>Mechanical Watch</option>
							<option value="tv"
								<%="tv".equalsIgnoreCase(ptype) ? "selected" : ""%>>Sports Watch</option>
							<option value="camera"
								<%="camera".equalsIgnoreCase(ptype) ? "selected" : ""%>>Smart Watch</option>
							<option value="laptop"
								<%="laptop".equalsIgnoreCase(ptype) ? "selected" : ""%>>Fashion Watch</option>
							<option value="tablet"
								
								<%="other".equalsIgnoreCase(ptype) ? "selected" : ""%>>Một số loại khác</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="last_name">Mô tả sản phẩm</label>
					<textarea name="info" class="form-control text-align-left"
						id="last_name" required><%=product.getProdInfo()%></textarea>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Giá</label> <input type="number"
							value="<%=product.getProdPrice()%>"
							placeholder="Nhập giá" name="price" class="form-control"
							id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Số lượng tồn</label> <input type="number"
							value="<%=product.getProdQuantity()%>"
							placeholder="Số lượng tồn" class="form-control"
							id="last_name" name="quantity" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-4" style="margin-bottom: 2px;">
						<button formaction="adminViewProduct.jsp" class="btn btn-danger">Hủy</button>
					</div>
					<div class="col-md-4">
						<button type="submit" class="btn btn-success">Cập nhật sản phẩm</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="footer.html"%>
</body>
</html>