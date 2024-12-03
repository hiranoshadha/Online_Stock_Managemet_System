package stock.Customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stock.Customer.Customer;
import stock.Customer.CustomerDBUtil;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("uid");
		String password = request.getParameter("pass");
		boolean isTrue = false;
		boolean isTrue2 = false;
		
		isTrue = CustomerDBUtil.validatecustomer(username, password);
		isTrue2 = CustomerDBUtil.validateadmin(username, password);
		if(isTrue == true) {
				try {
					List<Customer> cusDetails = CustomerDBUtil.validate(username, password);
					request.setAttribute("cusDetails", cusDetails);
				} catch (Exception e) {
					e.printStackTrace();
				}
				RequestDispatcher dis = request.getRequestDispatcher("/useraccount.jsp");
				dis.forward(request, response);
				}
		
		else if(isTrue2 == true) {
			try {
				List<Customer> adDetails = CustomerDBUtil.validateAdmin(username, password);
				request.setAttribute("adDetails", adDetails);
			} catch (Exception e) {
				e.printStackTrace();
			}
			RequestDispatcher dis = request.getRequestDispatcher("/AdminDashboard.jsp");
			dis.forward(request, response);
			}
		else {
			RequestDispatcher dis = request.getRequestDispatcher("/login.jsp");
			dis.forward(request, response);
		}
		}
		

}