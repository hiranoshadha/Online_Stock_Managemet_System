package stock.Payment;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stock.Payment.AddCardDetailsDBUtil;


@WebServlet("/AddCardDetailsServlet")
public class AddCardDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    //get Cancellation details from FORM
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//Assign values separately to variables
		String cName = request.getParameter("cardName");
		String cHname = request.getParameter("cardHolderName");
		String cNumber = request.getParameter("cardNumber");
		String vThru = request.getParameter("validThru");
		String cv = request.getParameter("cVV");
		
		//call DBUtil class and store return value
		boolean isTrue = AddCardDetailsDBUtil.InsertAddCardDetails(cName,cHname, cNumber, vThru, cv);
		
		if(isTrue==true) {
			//If request details successfully insert to table , run this
			RequestDispatcher dis = request.getRequestDispatcher("SuccessRequest.jsp");
			dis.forward(request, response);
			
		} else {
			//If request details not successfully insert to table , run this
			RequestDispatcher dis2 = request.getRequestDispatcher("UnsuccessRequest.jsp");
			dis2.forward(request, response);
		}
		
	}


}
