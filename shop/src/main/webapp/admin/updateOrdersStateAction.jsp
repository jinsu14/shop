<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="service.*" %>
<%
	request.setCharacterEncoding("utf-8");

	int ordersNo = Integer.parseInt(request.getParameter("ordersNo"));
	String ordersState = request.getParameter("ordersState");
	
	System.out.println(ordersNo);
	System.out.println(ordersState);
	
	Orders orders = new Orders();
	OrdersService ordersService = new OrdersService();
	
	orders.setOrdersNo(ordersNo);
	orders.setOrdersState(ordersState);
	
	boolean result = ordersService.modifyOrdersState(orders);
	
	if(result) {
		response.sendRedirect(request.getContextPath() + "/admin/adminOrdersList.jsp");
		System.out.println("성공");
	} else {
		response.sendRedirect(request.getContextPath() + "/admin/adminOrdersList.jsp");
		System.out.println("실패");
	}
%>