package stock.Payment;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import stock.DBConnect.*;

import java.sql.DriverManager;

public class UpdateCardDetailsDBUtil {
	
	private static boolean isUpdated;
	
	//for database connection purpose
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet result = null;
	
	//get Details of which want to update 
	public static boolean updateCardDetails(String id, String cardName, String cardHolderName, String cardNumber, String validThru, String cVV) {
		
		try {
			
			con  = DBConnect.getConnection();
			stmt = con.createStatement();
			//find row and update
			String sql = "UPDATE carddetails SET cardName = '"+cardName+"',cardHolderName = '"+cardHolderName+"',cardNumber = '"+cardNumber+"',validThru = '"+validThru+"',cVV = '"+cVV+"'"
					      + "WHERE id = '"+id+"'";
			int res = stmt.executeUpdate(sql);
			
			if(res > 0) {
				
				isUpdated = true;
				
			}else {
				
				isUpdated = false;
			}
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		//return to Servlet that update is success or not
		return isUpdated;
	}

}
