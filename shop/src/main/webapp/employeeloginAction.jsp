<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%@ page import="vo.*"%>
<%
request.setCharacterEncoding("utf-8");
	
	String employeeId = request.getParameter("employeeId");
	String employeePass = request.getParameter("employeePass");
	System.out.println(employeeId + " <-- id");
	System.out.println(employeePass + " <-- pw");
	
	Employee login = new Employee();
	EmployeeService employeeService = new EmployeeService();
	login.setEmployeeId(employeeId);
	login.setEmployeePass(employeePass);
	
	Employee employeeLogin = new Employee();
	employeeLogin = employeeService.getEmployeeByIdAndPw(login);
	
	session.setAttribute("loginEmployee", employeeLogin);
	
	if(session.getAttribute("loginEmployee") == null) {
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp?errorMsg2=fail");
	} else {
		if(employeeLogin.getActive().equals("Y")) {
			session.setAttribute("user", "관리자");
		} else {
			session.setAttribute("user", "직원");
		}
		session.setAttribute("id", employeeLogin.getEmployeeId());
		session.setAttribute("name", employeeLogin.getEmployeeName());
		session.setAttribute("active", employeeLogin.getActive());
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>