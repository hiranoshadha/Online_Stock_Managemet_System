package stock.Payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stock.Payment.CardDetails;
import stock.Payment.GetCardDetailsDBUtil;

@WebServlet("/GetCardDetailsServlet")
public class GetCardDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//get ReservationID and Name from FORM
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Assign values separately to variables
		String resID = request.getParameter("uid");
		
		try {
		//call validate method store return values	
		List<CardDetails> resDetails =  GetCardDetailsDBUtil.validate(resID);
		request.setAttribute("resDetails", resDetails);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("ReservationDetails.jsp");
		dis.forward(request, response);
	}

}
