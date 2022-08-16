<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container text-center">
		<div class="jumbotron text-center">
			<h3>회원정보</h3>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<form action="<%=request.getContextPath()%>/removeCustomer.jsp" method="post">
					<span>PW : <input type="password" name="customerPass"></span>
					<input type="hidden" name="customerId" value="<%=session.getAttribute("id")%>">
					<button type="submit" class="btn btn-dark">Resign Membership</button>
				</form>
			</div>
			<div class="col-sm-6">
				<form action="<%=request.getContextPath()%>/removeEmployee.jsp" method="post">
					<span>PW : <input type="password" name="employeePass"></span>
					<input type="hidden" name="employeeId" value="<%=session.getAttribute("id")%>">
					<button type="submit" class="btn btn-dark">Resign Membership</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>