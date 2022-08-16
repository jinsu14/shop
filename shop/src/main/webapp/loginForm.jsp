<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
%>
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
		<div class="jumbotron">
			<h3>LOGIN</h3>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<form action="<%=request.getContextPath()%>/customerloginAction.jsp" method="post" id="customerForm" class="form">					
					<div class="container text-center">
						<h4>CUSTOMER</h4>
						<%
							if(request.getParameter("errorMsg1") != null) {
						%>
								<span style="color:red"><%=request.getParameter("errorMsg1")%></span>
						<%
							}
						%>
					</div>
					<table class="table table-secondary">
						<tr>
							<td>ID</td>
							<td><input type="text" name="customerId" id="customerId" class="form-control"></td>
						</tr>
						<tr>
							<td>PW</td>
							<td><input type="password" name="customerPass" id="customerPass" class="form-control"></td>
						</tr>
					</table>
					<div class="container text-center">
						<button type="button" id="customerBtn" class="btn btn-dark">Login</button>
						<a href="<%=request.getContextPath()%>/addCustomer.jsp" type="button" class="btn btn-dark">Sign-Up</a>
					</div>
				</form>
			</div>
			<div class="col-sm-6">
				<form action="<%=request.getContextPath()%>/employeeloginAction.jsp" method="post" id="employeeForm" class="form">
					<div class="container text-center">
						<h4>EMPLOYEE</h4>
						<%
							if(request.getParameter("errorMsg2") != null) {
						%>
								<span style="color:red"><%=request.getParameter("errorMsg2")%></span>
						<%
							}
						%>
					</div>
					<table class="table table-secondary">
						<tr>
							<td>ID</td>
							<td><input type="text" name="employeeId" id="employeeId" class="form-control"></td>
						</tr>
						<tr>
							<td>PW</td>
							<td><input type="password" name="employeePass" id="employeePass" class="form-control"></td>
						</tr>
					</table>
					<div class="container text-center">
						<button type="button" id="employeeBtn" class="btn btn-dark">Login</button>
						<a href="<%=request.getContextPath()%>/addEmployee.jsp" type="button" class="btn btn-dark">Sign-Up</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$('#customerBtn').click(function() {
		if($('#customerId').val() == '') {
			alert('고객아이디를 입력하세요');
		} else if($('#customerPass').val() == '') {
			alert('고객비밀번호를 입력하세요');
		} else {
			customerForm.submit();
		}
	});
	$('#employeeBtn').click(function() {
		if($('#employeeId').val() == '') {
			alert('스텝아이디를 입력하세요');
		} else if($('#employeePass').val() == '') {
			alert('스텝비밀번호를 입력하세요');
		} else {
			employeeForm.submit();
		}
	});
</script>
</html>