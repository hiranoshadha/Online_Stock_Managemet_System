package stock.Payment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stock.Payment.UpdateCardDetailsDBUtil;

@WebServlet("/UpdateCardDetailsServlet")
public class UpdateCardDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//get Reservation details from FORM
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("id");
		String cName = request.getParameter("cardName");
		String cHname = request.getParameter("cardHolderName");
		String cNumber = request.getParameter("cardNumber");
		String vThru = request.getParameter("validThru");
		String cv = request.getParameter("cVV");
		
		
		boolean Updated;
		//call method for update details
		Updated = UpdateCardDetailsDBUtil.updateCardDetails(id, cName,cHname, cNumber, vThru, cv);
		
		if(Updated == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("SuccessfullyUpdated.jsp");
			dis.forward(request, response);
	    }
		else {
			RequestDispatcher dis = request.getRequestDispatcher("UnsuccessRequest.jsp");
			dis.forward(request, response);

		}
	}
}