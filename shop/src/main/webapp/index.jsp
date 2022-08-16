<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.Customer" %>
<%	
	if (session.getAttribute("loginCustomer") == null && session.getAttribute("loginEmployee") == null) {
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp");
		System.out.println("없음");
		return;
	}
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
		<div class="jumbotron text-center">
			<h3><%=session.getAttribute("user")%> - <%=session.getAttribute("name")%>님 반갑습니다.</h3>
		</div>
		<form class="w-20 border p-3 bg-white shadow rounded align-self-center">
			<div style="height: 280px">
				<div class="d-inline-flex">
					<h3 style="margin-bottom: 50px;">ID : <%=session.getAttribute("id")%></h3>   <!-- 로그인 아이디 -->
				</div>
				<div>
					<table class="table">
						<tr>
							<td>Infomation</td>
							<td><a href="<%=request.getContextPath()%>/CustomerOne.jsp" class="btn btn-dark" >Click</a></td>
						</tr>
						<%
						if(session.getAttribute("active")!=null && session.getAttribute("active").equals("Y")) {
						%>
							<tr>
								<td>Admin</td>
								<td><a href="<%=request.getContextPath()%>/admin/adminIndex.jsp" class="btn btn-dark">Click</a></td>
							</tr>
						<%
						}
						%>
					</table>
				</div>
				<div style="margin-bottom: 20px; position: relative; left: 250px;">
					<a href="<%=request.getContextPath()%>/logout.jsp" class="btn btn-dark" style="left: 250px;">Logout</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>