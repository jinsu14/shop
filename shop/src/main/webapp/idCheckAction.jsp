<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<%
	String path = null;
	String ckId = null;
	if(request.getParameter("customerckId") != null) {
		ckId = request.getParameter("customerckId");
		path = "/addCustomer.jsp";
	} else if(request.getParameter("employeeckId") != null) {
		ckId = request.getParameter("employeeckId");
		path = "/addEmployee.jsp";
	}
	
	SignService idCheck = new SignService();
	boolean result = idCheck.idCheck(ckId);
	
	if(result) {// service -> true
		response.sendRedirect(request.getContextPath()+path+"?ckId="+ckId);	
	} else {// service -> false
		response.sendRedirect(request.getContextPath()+path+"?errorMsg=badId");
	}	


%> --%>