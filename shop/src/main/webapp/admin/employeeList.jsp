<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="service.*"%>
<%@ page import="vo.*"%>
<%
	request.setCharacterEncoding("utf-8");

	if (session.getAttribute("loginEmployee") == null && session.getAttribute("active").equals("Y")) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		System.out.println("없음");
		return;
	}	

	// 페이징값
	int currentPage = 1;
	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10;
	
	EmployeeService employeeService = new EmployeeService();
	List<Employee> list = new ArrayList<Employee>();
	list = employeeService.getEmployeeList(ROW_PER_PAGE, currentPage);
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
			<h3>EMPLOYEE</h3>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>EMPLOYEEID</th>
					<th>EMPLOYEENAME</th>
					<th>CREATEDATE</th>
					<th>EMPLOYEEACTIVE</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(Employee e : list) {
			%>
					<tr>
						<td><%=e.getEmployeeId()%></td>
						<td><%=e.getEmployeeName()%></td>
						<td><%=e.getCreateDate()%></td>
						<td>
							<form action="<%=request.getContextPath()%>/admin/updateEmployeeActiveAction.jsp" method="post">
								<input type="hidden" name="employeeId" value="<%=e.getEmployeeId()%>">
								<select name="active">
									<%
										if(e.getActive().equals("N")) {
									%>
											<option value="Y">Y</option>
											<option value="N" selected="selected">N</option>
									<%
										} else {
									%>
											<option value="Y" selected="selected">Y</option>
											<option value="N">N</option>
									<%
										}
									%>
								</select>
							<button type="submit" class="btn btn-dark">권한변경</button>
							</form>
						</td>
					</tr>
			<%	
				}
			%>
		</table>
	</div>
	<!--  페이징 -->
	<%-- <div>
		<ul class="pagination pagination-sm">
			<!-- 이전 -->
			<%					

					if(currentPage > 1) {
			%>			
					<li class="page-item"><a class="page-link"
							href="./boardList.jsp?currentPage=<%=currentPage - 1%>">이전</a></li>
			<%
					}

			%>
			
			<!-- 페이지 번호 -->
			<%	
			 	int pageCount = 10;
				int startPage = ((currentPage - 1) / pageCount) * pageCount + 1;
		    	int endPage = (((currentPage - 1) / pageCount) + 1) * pageCount;
		    	if (lastPage < endPage) {
       				endPage = lastPage;
   				}
		    	
		    	if(currentPage < lastPage) {
					%>								
  					<li class="page-item"><a class="page-link"
  							href="./boardList.jsp?currentPage=<%=i%>"><%=i%></a></li>
  				<%
  					}
			%>
		</ul>
	</div> --%>

</body>
</html>