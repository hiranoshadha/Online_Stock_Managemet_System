package stock.Customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stock.Payment.AddCardDetailsDBUtil;

@WebServlet("/InsertCustomerServlet")
public class InsertCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Assign values separately to variables
		String cName = request.getParameter("name");
		String cUsername = request.getParameter("username");
		String cEmail = request.getParameter("email");
		String cAddress = request.getParameter("address");
		String cDateofbirth = request.getParameter("dateofbirth");
		String cPhone = request.getParameter("phone");
		String cPostalcode = request.getParameter("zippostalcode");
		String cGender = request.getParameter("gender");
		String cPassword = request.getParameter("psw");
		
		
		//call DBUtil class and store return value
		boolean isTrue = InsertCustomerDBUtil.InsertCustomer(cName,cUsername, cEmail, cAddress, cDateofbirth, cPhone, cPostalcode, cGender, cPassword);
		
		if(isTrue==true) {
			//If request details successfully insert to table , run this
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
			
		} else {
			//If request details not successfully insert to table , run this
			RequestDispatcher dis2 = request.getRequestDispatcher("Register.jsp");
			dis2.forward(request, response);
		}
		
	}
}
