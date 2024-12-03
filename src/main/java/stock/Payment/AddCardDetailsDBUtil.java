 package stock.Payment;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import stock.DBConnect.*;

public class AddCardDetailsDBUtil {
	
	//for database connection purpose
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet result = null;
	
	//get Cancelation Details from Servlet
	public static boolean InsertAddCardDetails(String cardName, String cardHolderName, String cardNumber, String validThru, String cVV) {

		boolean isSuccess = false;
		
	
		try {

                con = DBConnect.getConnection();
                stmt = con.createStatement(); 
                //Insert Cancelation Request Details to Table
				String sql = "INSERT INTO carddetails VALUES(0,'"+cardName+"','"+cardHolderName+"','"+cardNumber+"','"+validThru+"','"+cVV+"')";
				int result = stmt.executeUpdate(sql);
				
				if(result > 0) {
					isSuccess = true;
				}else {
					isSuccess = false;
				}
					
					
				} catch(Exception e) {
					
					e.printStackTrace();
					
				}		
		//return to Servlet that insertion is success or not 
		return isSuccess;
	
	}
	
	
}
