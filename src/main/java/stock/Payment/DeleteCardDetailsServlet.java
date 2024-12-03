package stock.Payment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stock.Payment.DeleteCardDetailsDBUtil;

@WebServlet("/DeleteCardDetailsServlet")
public class DeleteCardDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//get ReservationID from FORM
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cID = request.getParameter("id");
		
		boolean Deleted;
		//call delete reservation method and store return value
		Deleted = DeleteCardDetailsDBUtil.DeleteCardDetails(cID);
		
        if(Deleted == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("SuccessfullyDeleted.jsp");
			dis.forward(request, response);
			
	    }
		else {
			RequestDispatcher dis = request.getRequestDispatcher("UnsuccessRequest.jsp");
			dis.forward(request, response);

		}
		
	}

}
