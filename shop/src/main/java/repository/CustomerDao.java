package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import vo.Customer;

public class CustomerDao {
	
	// 가입
	// CustomerService.addCustomer 가 호출
	public int insertCustomer(Connection conn, Customer paraCustomer) throws SQLException {
		int row = 0;
		String sql = "INSERT INTO customer (customer_id, customer_pass, customer_name, customer_address, customer_telephone, update_date, create_date) VALUES (?, PASSWORD(?), ?, ?, PASSWORD(?), now(), now())";
		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paraCustomer.getCustomerId());
			stmt.setString(2, paraCustomer.getCustomerPass());
			stmt.setString(3, paraCustomer.getCustomerName());
			stmt.setString(4, paraCustomer.getCustomerAddress());
			stmt.setString(5, paraCustomer.getCustomerTelephone());
			
			row = stmt.executeUpdate();
		}finally {
			if(stmt!=null) {
				stmt.close();
			}
		}
		return row;
	}
	
	// 탈퇴
	// CustomerService.removeCustomer 가 호출
	public int deleteCustomer(Connection conn, Customer paraCustomer) throws SQLException { // 동일한 Connection 사용
		// 동일한 conn 사용하므로 conn.close() X
		int row = 0;
		String sql = "DELETE FROM customer WHERE customer_id = ? AND customer_pass = PASSWORD(?)";
		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, paraCustomer.getCustomerId());
			stmt.setString(2, paraCustomer.getCustomerPass());
			row = stmt.executeUpdate();
		}finally {
			if(stmt!=null) {
				stmt.close();
			}
		}
		return row;
	}
	
	// 로그인
	// CustomerService.getCustomerByIdAndPw 가 호출
	public Customer selectCustomerByIdAndPw(Connection conn, Customer login) throws SQLException{
		Customer customer = null;
		
		String sql = "SELECT customer_id customerId, customer_name customerName FROM customer WHERE customer_id = ? AND customer_pass = PASSWORD(?)";
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, login.getCustomerId());
			stmt.setString(2, login.getCustomerPass());
			rs = stmt.executeQuery();
			if(rs.next()) {
				customer = new Customer();
				customer.setCustomerId(rs.getString("customerId"));
				customer.setCustomerName(rs.getString("customerName"));
			}
		}finally {
			if(rs!=null)   {
				rs.close();
			}
			if(stmt!=null) {
				stmt.close();
			}
		}		
		return customer;	
	}
}
